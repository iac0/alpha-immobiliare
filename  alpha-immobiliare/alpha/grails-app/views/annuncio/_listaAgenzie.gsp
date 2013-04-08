<%@ page import="alpha.security.User" %>
<tr class="Agenzia" id="elimina${agenzia.id}">
    <td>
        <div class="btn-group open">
            <g:remoteLink class="btn btn-primary" controller="agenzia" action="elimina" params="['telefono':agenzia.telefono]" onSuccess="rimuovi('#elimina${agenzia.id}')"><i class="icon-trash"></i> Elimina</g:remoteLink>

        </div>
    </td>
    <td>${agenzia.utente.username}</td>
    <td>${agenzia.telefono}</td>


    <td>
        <g:formatDate date="${agenzia.dataInserimento}" type="date" style="short" />

    </td>
    <td>${agenzia.nome}</td>
    <td>${agenzia.note}</td>

</tr>

