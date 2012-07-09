package alpha.template

class Menu {
	String labelMenu
	String role
	String classe
    static constraints = {
		labelMenu maxSize:30
		role maxSize:20
		classe maxSize:50
    }
}
