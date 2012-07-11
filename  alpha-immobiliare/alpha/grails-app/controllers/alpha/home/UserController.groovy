package alpha.home
import alpha.security.*
import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class UserController {

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
}
