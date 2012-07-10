<%@ page import="alpha.security.User" %>          
          <tr class="Annuncio" id="${annuncio?.id}">
            <td>${annuncio.utente.username }</td>
            <td>${annuncio.telefono}</td>
            <td>
            <g:formatNumber number="${annuncio.prezzo}" type="currency" currencyCode="EUR" />
            </td>
            <td>${annuncio.risposta}</td>
            <td>${annuncio.zona}</td>
            <td>
            <g:formatDate date="${annuncio.dataInserimento}" type="datetime" style="LONG" timeStyle="SHORT"/>
            
            </td>
          </tr>
         
        