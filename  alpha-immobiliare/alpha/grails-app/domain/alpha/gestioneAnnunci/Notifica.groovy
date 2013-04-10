package alpha.gestioneAnnunci

import alpha.security.User

class Notifica {
    User from
    User to
    Annuncio annuncio
    Boolean visualizzata = false
    String messaggio
    static constraints = {
        annuncio nullable: true
        messaggio nullable: true
    }
}
