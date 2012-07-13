package alpha.gestioneAnnunci

class Appuntamento {
	Date giorno
	String ora
	String nomePersona
	String citofono
	String via
	String interno
	String telefonoAppuntamento
    static constraints = {
		giorno nullable:true
		ora nullable:true
		nomePersona nullable:true
		interno nullable:true
		citofono nullable:true
		via nullable:true
		telefonoAppuntamento nullable:true
		
    }
}
