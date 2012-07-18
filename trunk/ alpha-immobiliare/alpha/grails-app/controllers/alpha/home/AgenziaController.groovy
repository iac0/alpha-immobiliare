package alpha.home
import alpha.anagrafica.Agenzia
import alpha.gestioneAnnunci.Annuncio
import grails.converters.JSON
import grails.plugins.springsecurity.Secured


class AgenziaController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def saveAgenzia() { 
		println params
		def utente = alphaService.getUtente()
		def Agenzia nuova = new Agenzia()
		params.telefono = params.telefono.replaceAll(" ","").replaceAll("/+39", "")
		nuova.properties=params
		nuova.utente=utente
		if(!nuova.save(flush:true))
			{
				nuova.errors.each{
				println it
			}
				response.sendError(500,"ko") 
			} 	
			else{
				response.sendError(200,"ok") 
			}
		
	}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def verificaNumero(){
		def map = [:]
		def agenzia = Agenzia.findAllByTelefono(params.numero.replaceAll("/+39","").replaceAll(" ", ""))
		def annuncio = Annuncio.findByTelefono(params.numero.replaceAll("/+39","").replaceAll(" ", ""))
		if (agenzia)
		map.agenzia=true
		else 
		map.agenzia = false
		if(annuncio){
		map.annuncio = true
		map.idAnnuncio=annuncio.id
		}
		else 
		map.annuncio = false
		render map as JSON
		}
}
