package alpha.gestioneAnnunci
import alpha.security.User

class Annuncio {
	static tipoRisposta= [si:'SI',no:'NO',richiama:'RICHIAMA']
	String telefono
	String zona
	String risposta = tipoRisposta.no
	Scheda schedaAssociata
	Integer metriQuadrati
	String indirizzo
	String composizione
	String note
	Integer prezzo
	User utente
	Date dataInserimento = new Date()
	Date dataUltimoInserimento = new Date()
	
    static constraints = {
		telefono unique:['telefono','prezzo'],maxSize:12 
		zona maxSize:100
		risposta maxSize: 8
		schedaAssociata nullable:true
		metriQuadrati nullable:true
		indirizzo maxSize:100,nullable:true
		composizione maxSize:100, nullable:true
		note maxSize:2500 ,nullable:true
		dataUltimoInserimento nullable:true
		
			
    }
	
	static mapping = {
		
	}
}
