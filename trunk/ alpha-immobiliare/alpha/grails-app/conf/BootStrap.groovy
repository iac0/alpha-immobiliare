import alpha.security.*
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
				
		def admin = User.findAllByUsername("iaco")
		if (!admin)
		{
			admin = new User()    /*richiamo costruttore inserito precedentemente*/
			admin.username="luca"
			admin.password="forzaroma"
			admin.email='giuseppe.iacobucci@finsa.it'
			admin.enabled=true
			admin.save(flush:true)
			
			/*assegnazione Legame ruolo user*/
			UserRole.create(admin, roleAdmin, true)
							
		 }
			
    }
    def destroy = {
    }
}
