package alpha.gestioneAnnunci

class Scheda {
	String proprietario
	Boolean incarico
	Boolean libero
	Integer piano
	Integer metriQuadriEsterni
	Boolean soffitta
	Boolean box
	Boolean postoAuto
	String tipoRiscaldamento
	Boolean ascensore
	Appuntamento appuntamento
	String noteScheda
	
    static constraints = {
		proprietario nullable:true
		incarico nullable:true
		libero nullable:true
		piano nullable:true
		metriQuadriEsterni nullable:true
		soffitta nullable:true
		box nullable:true
		postoAuto nullable:true
		tipoRiscaldamento nullable:true
		ascensore nullable:true
		appuntamento nullable:true
		noteScheda nullable:true, maxSize:10000
		
    }
}
