package alpha.home
import alpha.gestioneAnnunci.*
import alpha.anagrafica.Agenzia
import alpha.security.User
import grails.converters.JSON
import grails.plugins.springsecurity.Secured


class AnnuncioController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def saveAnnuncio() {
		println params
		params.telefono = params.telefono.replaceAll(" ","").replaceAll("/+39", "")
		def violated = Annuncio.findByTelefono(params.telefono)
		if(violated)
		session.rientroId = violated.id
		else
		session.rientroId = null
		def utente = alphaService.getUtente()
		def Annuncio nuova
		if(!params.update){
		nuova = new Annuncio()
		
		}
		else nuova = Annuncio.get(params.update)
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
				def map = [id:nuova.id]
				render map as JSON 
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
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def pollingMiei(){
		def utente =  alphaService.getUtente()
		def annunci =  Annuncio.withCriteria{
			eq ("utente",utente)
			order ("dataInserimento","desc")
			maxResults 6
		}
		render g.render(template:"/annuncio/ultimiMieiAnnunci",collection:annunci)
	}
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def getAnnuncio(){
		def annuncio = Annuncio.get(params.id)
		render annuncio as JSON
	}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def getScheda(){
		println "questo è "+params.id
		def annuncio = Annuncio.get(params.id)
		if(!annuncio.schedaAssociata)
		annuncio.schedaAssociata = new Scheda().save(flush:true)
		if(!annuncio.schedaAssociata.appuntamento)
		annuncio.schedaAssociata.appuntamento = new Appuntamento().save(flush:true)
		render g.render(template:"/annuncio/schedaAnnuncio",collection:annuncio)
	}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def saveScheda(){
		println params
		if (params.giorno)
		params.giorno = new Date().parse("dd-mm-yyyy", params.giorno)
		Annuncio annuncio = Annuncio.get(params.idents)
		annuncio.composizione = params.composizione
		
		annuncio.schedaAssociata.properties = params
		annuncio.schedaAssociata.noteScheda = params.noteScheda
		annuncio.schedaAssociata.appuntamento.properties = params 
		if(!annuncio.save(flush:true))
		{
			annuncio.errors.each{
				println it
			}
		}
		response.sendError(200,"ok")
		
	}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def ricerca () {
		User utente = alphaService.getUtente()
		def annunci =  Annuncio.withCriteria{
			and{
			if(params.idAnn)
			eq("id",params.idAnn.toLong())
			if(params.prezzo)
			eq("prezzo",params.prezzo.replaceAll("\\.","").replaceAll(" ", "").toInteger())
			if(params.telefono)
			eq("telefono",params.telefono.replaceAll(" ",""))
			if(params.zona)
			eq("zona",params.zona)
			if(params.dataDa || params.dataA){
			and{
			if(params.dataDa)
			gt("dataInserimento",new Date().parse("dd-MM-yyyy", params.dataDa))
			if(params.dataA)
			lt("dataInserimento",new Date().parse("dd-MM-yyyy", params.dataA))
			}
			}
			if( params.utente){
			User ricercaU = User.findByUsername(params.utente)
			eq ("utente",ricercaU)
			}
			order ("dataInserimento","desc")
			}
			
		}
		
		def htmlAnn =""
		htmlAnn+= g.render(template:"/annuncio/risultatiRicerca", collection:annunci)
	
		render htmlAnn
		}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def elimina(){
		def result = [:]
		result.success = false
		Annuncio elimina = Annuncio.get(params.ident)
		if(elimina)
		{
			elimina.delete(flush:true)
			result.success = true
		}
		render result as JSON
	}
	
	@Secured (['ROLE_USER','ROLE_ADMIN'])
	def segnaComeAgenzia(){
		def result = [:]
		result.success = true
		Annuncio elimina = Annuncio.get(params.ident)
		if (elimina){
			Agenzia agenzia  = new Agenzia()
			agenzia.telefono = elimina.telefono
			agenzia.utente= alphaService.getUtente()
			if(!agenzia.save(flush:true)){
				
				result.success = false
				
			}
			elimina.delete(flush:true)
			
			
		}
		render result as JSON
		
	}
}
