package alpha.home
import alpha.gestioneAnnunci.Annuncio
import grails.converters.JSON
import grails.plugins.springsecurity.Secured


class AnnuncioController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def saveAnnuncio() {
		println params
		params.telefono = params.telefono.replaceAll(" ","").replaceAll("/+39", "")
		def violated = Annuncio.findByTelefonoAndPrezzo(params.telefono,params.prezzo.toInteger())
		if(violated)
		session.rientroId = violated.id
		else
		session.rientroId = null
		def utente = alphaService.getUtente()
		def Annuncio nuova = new Annuncio()
		nuova.properties=params
		nuova.risposta = nuova.tipoRisposta."${params.risposta}"
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
	def getRientroAnnuncio() {
		def html=[:]
		if(session.rientroId){
			def Annuncio annuncio = Annuncio.get(session.rientroId)
			html.html="""
			<h4>Annuncio gi&agrave; presente</h4>
			<p>
			<strong>Telefono: </strong>${annuncio.telefono}<br>
			<strong>Prezzo: </strong>${annuncio.prezzo}<br>
			<strong>Risposta: </strong>${annuncio.risposta}<br>
			<strong>Zona: </strong>${annuncio.zona}<br>
			</p>
			<p>
			Per far rientrare l'annuncio clicca sul bottone 
			<em>Rientro Annuncio</em>.
			</p>
			"""
			html.gormError = false
			html.rientro = """
			<button class="btn btn-warning" id="rientroAnnuncio" 
			value="${annuncio.id}">Rientro Annuncio</button>
			"""
		}
		else {
			html.html = """
			<p>
			Non &agrave; stato possibile effettuare il salvataggio,<br>
			chiudi la scheda e prova nuovamente ad inserire l'annuncio.
			</p>
			"""
			html.gormError = true
		}
		render html as JSON
	}
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def rientroAnnuncio(){
		def ret = [error:false]
		try {
			Annuncio ann = Annuncio.get(params.id)
			if(ann){
			ann.dataUltimoInserimento = new Date()
			ann.utente = alphaService.getUtente()
			ann.save(flush:true)	
			}
		}
		catch (Exception e){
			ret.error=true
			}
		render ret as JSON
		}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def polling () {
		def annunci =  Annuncio.withCriteria{
			order ("dataInserimento","desc")
			maxResults 10
		}
		
		def htmlAnn =""
		htmlAnn+= g.render(template:"/annuncio/annuncioTemplate", collection:annunci)
	
		render htmlAnn
		}
}
