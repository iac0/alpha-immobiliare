package alpha.home
import alpha.anagrafica.Agenzia
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
		def agenzia = Agenzia.findAllByTelefono(params.numero.replaceAll("/+39","").replaceAll(" ", ""))
		if (agenzia)
		response.sendError(500,"ko")
		else 
		response.sendError(200,"ok")
		
		}
}
