package alpha
import alpha.security.User
class AlphaService {
	def springSecurityService

    def getUtente() {
		def userDetails = springSecurityService.principal
		def User utente = User.get(userDetails.id)
		utente

    }
}
