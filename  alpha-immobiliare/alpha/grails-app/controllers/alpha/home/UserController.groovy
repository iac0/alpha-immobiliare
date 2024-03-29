package alpha.home

import alpha.anagrafica.Agenzia
import alpha.gestioneAnnunci.Annuncio
import alpha.gestioneAnnunci.Notifica
import alpha.security.Role
import alpha.security.User
import alpha.security.UserRole
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class UserController {
    def alphaService
	@Secured (["ROLE_ADMIN"])
    def nuovoUtente() {
		println params
		def resp = [:] 
		resp.gormError = false
		User nuovoUtente = new User(params)
		nuovoUtente.enabled = true
			if(!nuovoUtente.save(flush:true)){
				resp.gormError = true
			}
		def role = 	Role.findByAuthority(params.ruolo)
		UserRole.create(nuovoUtente, role, true)
		
		render resp as JSON
		
		}
	@Secured (["ROLE_ADMIN"])
	def elimina(){
		def map = [:]
		map.success = false
		User elimina = User.findByUsername(params.username)
		User assegna = User.findByUsername(params.assegna)
		if(elimina && assegna){
            Notifica.executeUpdate("Delete from Notifica n where n.to = ? or n.from = ?",[elimina,elimina])
			Annuncio.executeUpdate("Update Annuncio a " +
                     "set a.utente = ? where a.utente = ?",
                     [assegna, elimina])
			Agenzia.executeUpdate("Update Agenzia a " +
                     "set a.utente = ? where a.utente = ?",
                     [assegna, elimina])

		def auth = elimina.getAuthorities()
		auth.each { Role rol ->
			UserRole.remove(elimina,rol,true)
		}
		elimina.delete(flush:true)
		map.success = true
		}
		render map as JSON
	}
	@Secured (["ROLE_ADMIN","ROLE_USER"])
	def autocomplete(){
		def map = User.findAllByUsernameIlike("%${params.username}%").collect{
			[name:it.username]
		}
		render map as JSON
	}

    @Secured (["ROLE_ADMIN","ROLE_USER"])
    def changePwd(){
       def utente =  alphaService.getUtente()
        utente.password = params.password
        utente.save(flush: true)
        response.sendError(200,"ok")

    }
}
