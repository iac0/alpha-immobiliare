<%@ page import="alpha.security.User" %>          
          <tr class="Annuncio">
          <td></td>
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
            <g:set var="userOk"><sec:username/></g:set>
            <g:set var="userOk2" value="${annuncio.utente.username}"></g:set>
           	
            <g:if test="${userOk2 == ''+userOk}">
           
            <td>
			<div class="btn-group">
	          <button idAnnuncio="${annuncio.id}" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-pencil icon-white"></i> Azioni <span class="caret"></span></button>
	          <ul class="dropdown-menu">
	             <li class="eliminaAnnuncio"><a><i class="icon-trash"></i> Elimina</a></li>
            <li class="modificaAnnuncio"><a><i class="icon-wrench"></i> Modifica</a></li>
            <li class="divider"></li>
            <li class="segnaAgenziaAnnuncio"><a><i class="icon-briefcase"></i> Segna come Agenzia</a></li>
	          </ul>
			</div>
			</td>
            </g:if>
            <g:else><td></td></g:else>
            
          </tr>
         
        