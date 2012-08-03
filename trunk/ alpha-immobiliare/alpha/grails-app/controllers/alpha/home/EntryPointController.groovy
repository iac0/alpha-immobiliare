package alpha.home
import grails.plugins.springsecurity.Secured
import alpha.gestioneAnnunci.Annuncio

class EntryPointController {
def alphaService
	@Secured (['ROLE_USER','ROLE_ADMIN'])
    def index() {
		def utente =  alphaService.getUtente()
		def annunci =  Annuncio.withCriteria{
			eq ("utente",utente)
			order ("dataInserimento","desc")
			maxResults 6
		}
		[utente:utente,mieiUltimi:g.render(template:"/annuncio/ultimiMieiAnnunci",collection:annunci)]
		}
}
