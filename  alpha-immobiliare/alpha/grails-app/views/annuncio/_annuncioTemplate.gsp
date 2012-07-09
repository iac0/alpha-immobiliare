<%@ page import="alpha.security.User" %>          
          <tr class="Annuncio" id="${annuncio?.id}">
            <td>${annuncio.utente.username }</td>
            <td>${annuncio.telefono}</td>
            <td>${annuncio.prezzo}</td>
            <td>${annuncio.risposta}</td>
            <td>${annuncio.zona}</td>
          </tr>
         
        