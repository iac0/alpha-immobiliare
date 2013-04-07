<%@ page import="alpha.security.User" %>          
          <tr class="Annuncio">
          <td></td>
            <td>${annuncio.utente.username }</td>
            <td>${annuncio.telefono}</td>
            <td>
            <g:formatNumber number="${annuncio.prezzo}" type="currency" maxFractionDigits="0"/>
            </td>
            <td>
            ${annuncio.id }
            </td>
            <td>
            ${annuncio.schedaAssociata?'SI':'NO' }
            </td>
            %{--<td>${annuncio.risposta}</td>--}%
            <td>${annuncio.zona}</td>
            <td>
            <g:formatDate date="${annuncio.dataInserimento}" type="date" style="short" />
            
            </td>
              <td>
                  <g:if test="${annuncio.dataUltimaModifica}">
                      <g:formatDate date="${annuncio.dataUltimaModifica}" type="date" style="short"/>
                  </g:if>

              </td>
              <g:set var="userOk"><sec:username/></g:set>
              <g:set var="userOk2" value="${annuncio.utente.username}"></g:set>
              <td class="edit_area" id="ricercaeditNote${annuncio?.id}">${annuncio.note}</td>
              <td class="edit_area" id="ricercaeditComposizione${annuncio?.id}">${annuncio.composizione}</td>
              <td class="edit_area" id="ricercaeditProprietario${annuncio?.id}">${annuncio.schedaAssociata?.proprietario}</td>

           	
            <g:if test="${userOk2 == ''+userOk}">
           
            <td>
			<div class="btn-group">
	          <button idAnnuncio="${annuncio.id}" class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-pencil icon-white"></i> Azioni <span class="caret"></span></button>
	          <ul class="dropdown-menu">
	             <li class="eliminaAnnuncio"><a><i class="icon-trash"></i> Elimina</a></li>
            <li class="modificaAnnuncio"><a><i class="icon-wrench"></i> Modifica</a></li>
                  <li class="divider"></li>

                  <li >
                      <a onclick='$("#annuncioIdent").val(${annuncio.id});$("#creaScheda").trigger("click")' params="${annuncio.id}"><i class="icon-wrench"></i> Visualizza Scheda</a>
                  </li>
                  <li class="divider"></li>
            <li class="segnaAgenziaAnnuncio"><a><i class="icon-briefcase"></i> Segna come Agenzia</a></li>
	          </ul>
			</div>
			</td>
            </g:if>
            <g:else><td>
                <g:if test="${annuncio.schedaAssociata}">
                    <g:link action="visualizzaScheda" id="${annuncio.id}" class="btn btn-info" target="_blank"> Visualizza Scheda</g:link>
                </g:if>
            </td></g:else>
            
          </tr>
         
        