<tr id="${annuncio.id}">
<td>


</td>
<td>${annuncio.telefono}</td>
<td> <g:formatNumber number="${annuncio.prezzo}" type="currency" currencyCode="EUR" /></td>
<td>${annuncio.zona}</td>
<td><g:formatDate date="${annuncio.dataInserimento}" type="date" style="LONG" /></td>
<td>
<div class="btn-group">
          <button class="btn btn-primary dropdown-toggle" data-toggle="dropdown"><i class="icon-pencil icon-white"></i> Azioni <span class="caret"></span></button>
          <ul class="dropdown-menu">
            <li><a href="#"><i class="icon-trash"></i> Elimina</a></li>
            <li><a href="#"><i class="icon-wrench"></i> Modifica</a></li>
            <li class="divider"></li>
            <li><a href="#"><i class="icon-briefcase"></i> Segna come Agenzia</a></li>
          </ul>
        </div>
</td>
</tr>       
         


       