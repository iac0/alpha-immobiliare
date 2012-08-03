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
		map.idAnn=annuncio.id
		map.utente= annuncio.utente.username
		}
		else 
		map.annuncio = false
		render map as JSON
		}
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def avvisa (){
		def utente = alphaService.getUtente()
		Annuncio annuncio = Annuncio.get(params.ident)
		def destinatario = annuncio.utente
		def corpo = """
			Ciao ${destinatario.username}, l'utente <b>${utente.username}</b> vuole maggiori informazioni <br>
			sull'annuncio:<br>
			Telefono:${annuncio.telefono}
			Zona:${annuncio.zona}
			Risposta:${annuncio.risposta}
			<br><br>
			${params.messaggio!=''?'Inoltre ti ha inviato il seguente messaggio:<br>'+params.messaggio:''}
			
		"""
		Thread.start{
			sendMail {
			to destinatario.email
			from utente.email
//			cc "marge@g2one.com", "ed@g2one.com"
//			bcc "joe@g2one.com"
			subject "Informazioni Annuncio"
			html corpo
		 }
		}
		response.sendError(200,"0k")
	}
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def autocomplete() {
		def map = Agenzia.findAllByTelefonoIlike("%${params.query}%").collect{
			[name:it.telefono]
		}
		render map as JSON
	}
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def elimina () {
		def map = [:]
		map.success  = false
		Agenzia agenzia = Agenzia.findByTelefono(params.telefono)
		if(agenzia){
			agenzia.delete(flush:true)
			map.success = true
			
		}
		render map as JSON
	}
}
