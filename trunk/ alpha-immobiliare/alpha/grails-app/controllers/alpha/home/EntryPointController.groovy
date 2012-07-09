package alpha.home
import grails.plugins.springsecurity.Secured
import alpha.gestioneAnnunci.Annuncio

class EntryPointController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def index() {
		def utente =  alphaService.getUtente()
		
		[utente:utente]
		
		
		
		 }
}
