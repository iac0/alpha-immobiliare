package alpha
import alpha.gestioneAnnunci.Annuncio
import alpha.template.Menu
class AlphaTemplateTagLib {
	def springSecurityService
	def grailsApplication
	def menu={ attrs ->
		def authorities = springSecurityService.principal.authorities
		def isAdmin = authorities.find{it =="ROLE_ADMIN"}
		def listMenu
		def divMenu ="""
		<div class="nav-collapse">
            <ul class="nav">"""
		if(isAdmin)
			listMenu = Menu.list()
		else
			listMenu = Menu.findAllByRole("ROLE_USER")
		listMenu.eachWithIndex(){ Menu menu,i->
			Integer index = attrs.attiva.toInteger()
			
			divMenu+="<li class='${}'><a href='#${menu.labelMenu.replaceAll(' ','')}' data-toggle='modal'>${menu.labelMenu}</a></li>"
		
        }
		divMenu +="""</ul>
          </div><!--/.nav-collapse -->
		"""
		out << divMenu
		
		}
	def modal = {
		def authorities = springSecurityService.principal.authorities
		def isAdmin = authorities.find{it =="ROLE_ADMIN"}
		def listMenu
		def divMenu =""
		if(isAdmin)
			listMenu = Menu.list()
		else
			listMenu = Menu.findAllByRole("ROLE_USER")
		listMenu.eachWithIndex(){ Menu menu,i->
			divMenu+="""
				<div class="modal fade" id="${menu.labelMenu.replaceAll(" ","")}">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>${menu.labelMenu}</h3>
		</div>
		<div class="modal-body">
		<form class="well">"""
		def cl=grailsApplication.getDomainClass("${menu.classe}")
		cl.properties.each{prop->
			divMenu+="""
		<label>${prop.name}</label>
		<input type="text" class="span3" id="${prop.name}" placeholder="digita">
		<span class="help-block">Example block-level help text here.</span>
		"""
			}
		divMenu+="""
		<button type="submit" class="btn">Submit</button>
		</form>
		</div>
		<div class="modal-footer">
		  <a href="#"  class="btn" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="saveAgenzia" class="btn btn-primary">Save changes</a>
		</div>
	  </div>

			"""
		
		}
		
		out << divMenu
		
		
	}
	
}
