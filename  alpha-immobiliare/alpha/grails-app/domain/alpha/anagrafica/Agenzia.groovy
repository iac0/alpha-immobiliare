package alpha.anagrafica
import alpha.security.User

class Agenzia {
	User utente
	Date dataInserimento = new Date()
	String telefono
	String nome
	String note
    static constraints = {
		nome nullable: true
		note nullable: true
		telefono unique: true
    }
	
	static mapping = {
		table "anagrafica_agenzia"
		telefono : 'telefono_idx'
	}
}
