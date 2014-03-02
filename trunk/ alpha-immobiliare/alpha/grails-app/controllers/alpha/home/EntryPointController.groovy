package alpha.home

import alpha.gestioneAnnunci.Annuncio
import grails.plugins.springsecurity.Secured

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
