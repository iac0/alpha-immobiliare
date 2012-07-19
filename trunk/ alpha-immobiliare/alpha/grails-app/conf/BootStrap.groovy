import alpha.security.*
import alpha.anagrafica.Zona
class BootStrap {

    def init = { servletContext ->
		
		def roleAdmin = Role.findAllByAuthority("ROLE_ADMIN")
		if (!roleAdmin)
		{
			roleAdmin = new Role(authority:"ROLE_ADMIN")
			roleAdmin.save(flush:true)
		 }
		
		def roleUser = 	Role.findAllByAuthority("ROLE_USER")
		if (!roleUser)
		{
			roleUser = new Role(authority:"ROLE_USER")
			roleUser.save(flush:true)
		 }
				
		def admin = User.findAllByUsername("luca")
		if (!admin)
		{
			admin = new User()    /*richiamo costruttore inserito precedentemente*/
			admin.username="luca"
			admin.password="forzaroma"
			admin.email='lucadigiovanni@viriglio.it'
			admin.enabled=true
			admin.save(flush:true)
			
			/*assegnazione Legame ruolo user*/
			UserRole.create(admin, roleAdmin, true)
							
		 }
		if (!Zona.findByZona("Centro Storico"))
		new Zona(zona:"Centro Storico").save(flush:true)
		if (!Zona.findByZona("Trastevere - Borgo"))
		new Zona(zona:"Trastevere - Borgo").save(flush:true)
		if (!Zona.findByZona("Aventino - San Saba"))
		new Zona(zona:"Aventino - San Saba").save(flush:true)
		if (!Zona.findByZona("Esquilino - San Lorenzo"))
		new Zona(zona:"Esquilino - San Lorenzo").save(flush:true)
		if (!Zona.findByZona("San Giovanni - Appia Nuova"))
		new Zona(zona:"San Giovanni - Appia Nuova").save(flush:true)
		if (!Zona.findByZona("Appio Latino"))
		new Zona(zona:"Appio Latino").save(flush:true)
		if (!Zona.findByZona("Appio Claudio - Appia Pignatelli"))
		new Zona(zona:"Appio Claudio Appia - Pignatelli").save(flush:true)
		if (!Zona.findByZona("Tuscolano"))
		new Zona(zona:"Tuscolano").save(flush:true)
		if (!Zona.findByZona("Don Bosco - Cinecitta"))
		new Zona(zona:"Don Bosco - Cinecitta").save(flush:true)
		if (!Zona.findByZona("Casilino - Prenestino"))
		new Zona(zona:"Casilino - Prenestino").save(flush:true)
		if (!Zona.findByZona("Tiburtino - Collatino"))
		new Zona(zona:"Tiburtino - Collatino").save(flush:true)
		if (!Zona.findByZona("Bologna - Nomentana"))
		new Zona(zona:"Bologna - Nomentana").save(flush:true)
		if (!Zona.findByZona("Montesacro - Talenti"))
		new Zona(zona:"Montesacro - Talenti").save(flush:true)
		if (!Zona.findByZona("Prati Fiscali - Nuovo Salario"))
		new Zona(zona:"Prati Fiscali - Nuovo Salario").save(flush:true)
		if (!Zona.findByZona("Salario - Trieste"))
		new Zona(zona:"Salario - Trieste").save(flush:true)
		if (!Zona.findByZona("Parioli - Pinciano"))
		new Zona(zona:"Parioli - Pinciano").save(flush:true)
		if (!Zona.findByZona("Flaminio - Vigna Clara"))
		new Zona(zona:"Flaminio Vigna - Clara").save(flush:true)
		if (!Zona.findByZona("Cassia - Olgiata"))
		new Zona(zona:"Cassia - Olgiata").save(flush:true)
		if (!Zona.findByZona("Prati - Clodio"))
		new Zona(zona:"Prati - Clodio").save(flush:true)
		if (!Zona.findByZona("Balduina - Montemario"))
		new Zona(zona:"Balduina - Montemario").save(flush:true)
		if (!Zona.findByZona("Trionfale"))
		new Zona(zona:"Trionfale").save(flush:true)
		if (!Zona.findByZona("Torre Vecchia - Sacchetti"))
		new Zona(zona:"Torre Vecchia - Sacchetti").save(flush:true)
		if (!Zona.findByZona("Gregorio VII - B. Ubaldi"))
		new Zona(zona:"Gregorio VII - B. Ubaldi").save(flush:true)
		if (!Zona.findByZona("Aurelio - Boccea"))
		new Zona(zona:"Aurelio - Boccea").save(flush:true)
		if (!Zona.findByZona("Bravetta - Casetta Mattei"))
		new Zona(zona:"Bravetta - Casetta Mattei").save(flush:true)
		if (!Zona.findByZona("Monteverde - Gianicolense"))
		new Zona(zona:"Monteverde - Gianicolense").save(flush:true)
		if (!Zona.findByZona("Portuense - Magliana"))
		new Zona(zona:"Portuense - Magliana").save(flush:true)
		if (!Zona.findByZona("Marconi - Ostiense"))
		new Zona(zona:"Marconi - Ostiense").save(flush:true)
		if (!Zona.findByZona("Colombo - Ardeatino"))
		new Zona(zona:"Colombo - Ardeatino").save(flush:true)
		if (!Zona.findByZona("Laurentino - Montagnola"))
		new Zona(zona:"Laurentino - Montagnola").save(flush:true)
		if (!Zona.findByZona("Eur"))
		new Zona(zona:"Eur").save(flush:true)
		if (!Zona.findByZona("Palocco - Acilia"))
		new Zona(zona:"Palocco - Acilia").save(flush:true)
		if (!Zona.findByZona("Ostia - Fiumicino"))
		new Zona(zona:"Ostia - Fiumicino").save(flush:true)
		if (!Zona.findByZona("Affitti"))
		new Zona(zona:"Affitti").save(flush:true)
			
    }
    def destroy = {
    }
}
