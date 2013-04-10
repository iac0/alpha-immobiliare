<%@ page import="alpha.security.User" %>
<tr class="Annuncio" id="${annuncio?.id}">
    <td>${annuncio.utente.username}</td>
    <td>${annuncio.telefono}</td>
    <td>
        <g:formatNumber number="${annuncio.prezzo}" type="currency" maxFractionDigits="0"/>
    </td>
    <td>
        ${annuncio.id}
    </td>
    %{--<td>${annuncio.risposta}</td>--}%
    <td>${annuncio.zona}</td>
    <td>
        <g:formatDate date="${annuncio.dataInserimento}" type="date" style="short"/>

    </td>
    <td>
        <g:if test="${annuncio.dataUltimaModifica}">
            <g:formatDate date="${annuncio.dataUltimaModifica}" type="date" style="short"/>
        </g:if>

    </td>
<g:set var="userOk"><sec:username/></g:set>
<g:set var="userOk2" value="${annuncio.utente.username}"></g:set>
<g:if test="${annuncio.schedaAssociata==null || userOk2 == ''+userOk }">
    <td class="edit_area" id="editNote${annuncio?.id}">${annuncio.note}</td>
    <td class="edit_area" id="editComposizione${annuncio?.id}">${annuncio.composizione}</td>
    <td class="edit_area" id="editProprietario${annuncio?.id}">${annuncio.schedaAssociata?.proprietario}</td>
    </g:if><g:else>
    <td class="" id="editNote${annuncio?.id}">${annuncio.note}</td>
    <td class="" id="editComposizione${annuncio?.id}">${annuncio.composizione}</td>
    <td class="" id="editProprietario${annuncio?.id}">${annuncio.schedaAssociata?.proprietario}</td>
    </g:else>
</tr>
         
        