<tr >
<td>


</td>
<td>${annuncio.telefono}</td>
<td> <g:formatNumber number="${annuncio.prezzo}" type="currency" maxFractionDigits="0" /></td>
<td>${annuncio.zona}</td>
<td><g:formatDate date="${annuncio.dataInserimento}" type="date" style="short" /></td>
<td>
${annuncio.id}
</td>
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
</tr>       
         


       