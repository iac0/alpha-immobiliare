package alpha.home
import grails.plugins.springsecurity.Secured
import alpha.gestioneAnnunci.Annuncio

class EntryPointController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def index() {
		def utente =  alphaService.getUtente()
		def idStart=0
		idStart= Annuncio.listOrderById(max:10, order:"desc")
		idStart = idStart.get(idStart.size() -1)?.id
		
		[utente:utente,startId:idStart]
		}
}
