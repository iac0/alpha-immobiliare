<%@ page import="alpha.security.User" %>
<tr class="Annuncio" id="elimina${annuncio.id}">
    <td>
        <div class="btn-group open">
            <g:remoteLink class="btn btn-primary" action="elimina" params="['ident':annuncio.id]" onSuccess="rimuovi('#elimina${annuncio.id}')"><i class="icon-trash"></i> Elimina</g:remoteLink>

        </div>
    </td>
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
    <td class="edit_area" style="max-width: 150px;"id="ricercaeditNote${annuncio?.id}">${annuncio.note}</td>
    <td class="edit_area" style="max-width: 50px;" id="ricercaeditComposizione${annuncio?.id}">${annuncio.composizione}</td>
    <td class="edit_area" id="ricercaeditProprietario${annuncio?.id}">${annuncio.schedaAssociata?.proprietario}</td>



    <td>
        <g:if test="${annuncio.schedaAssociata}">
            <g:link action="visualizzaScheda" id="${annuncio.id}" class="btn btn-info" target="_blank"> Visualizza Scheda</g:link>
        </g:if>
    </td>

</tr>

