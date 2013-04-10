<g:each in="${notifiche}" var="notifica">
<g:if test="${notifica.annuncio}">
    <div id="notifica${notifica.id}">
       <p>
           ${notifica.messaggio}
       </p>    <br>
    <div class="btn-group">
        <button class="btn btn-info dropdown-toggle" data-toggle="dropdown"><i class="icon-pencil icon-white"></i> Gestione <span class="caret"></span></button>
        <ul class="dropdown-menu">
            <li><g:remoteLink action="accettaGestione" params="[id:notifica.id,accetta:true]" onSuccess="\$('#notifica${notifica.id}').remove()" onFailure="alert('Si è verificato un errore, riprova.')"> Accetta</g:remoteLink></li>
            <li><g:remoteLink action="accettaGestione" params="[id:notifica.id,accetta:false]" onSuccess="\$('#notifica${notifica.id}').remove()" onFailure="alert('Si è verificato un errore, riprova.')">  Rifiuta</g:remoteLink></li>
        </ul>
    </div>
    </div>
    <hr/>
</g:if> <g:else>
    <div id="notifica${notifica.id}">
      <p>
          ${notifica.messaggio}
      </p>        <br>
        <g:remoteLink action="eliminaNotifica" params="[id:notifica.id]" onSuccess="\$('#notifica${notifica.id}').remove()" onFailure="alert('Si è verificato un errore, riprova.')" class="btn btn-success" ><i class="icon-trash icon-white"></i> Elimina </g:remoteLink>
    </div>   <hr/>
</g:else>
</g:each>