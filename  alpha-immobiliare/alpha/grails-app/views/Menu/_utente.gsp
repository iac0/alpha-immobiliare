
<div class="modal fade" id="InserisciNuovoUtente" style="display:none;">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>Inserisci Nuovo Utente</h3>
		</div>
		<div class="modal-body">
		<ul class="nav nav-tabs" id="myTab">
  		<li class="active"><a href="#tabInserisciUtente" data-toggle="tab">Inserisci</a></li>
 		<li><a href="#tabEliminaUtente" data-toggle="tab">Elimina</a></li>
 		</ul>
 		<div class="tab-content">
		<div class="tab-pane active row-fluid" id="tabInserisciUtente">
		<div class="span12">
		<form class="well clearfix" id="saveUtenteForm">
				<div class="span6">
				<label><strong>Ruolo</strong></label>
				<select id="ruolo">
					  <option value="ROLE_ADMIN">Amministratore</option>
					  <option value="ROLE_USER">Consulente</option>
				</select>
				<span class="help-block myRed">Il campo è obbligatorio</span>	
				<label><strong>Password:</strong></label>	
				<input type="password"  id="password" placeholder="xxx...">
				<span class="help-block myRed">Il campo è obbligatorio</span>
		
				<label><strong>Email:</strong></label>	
				<input type="text"  id="email" placeholder="utente@dominio.it">
				<span class="help-block myRed">Il campo è obbligatorio</span>
				
				</div>
				
				<div class="span6">
				<label><strong>Username:</strong></label>	
				<input type="text"  id="username" placeholder="Nome utente">
				<span class="help-block myRed">Il campo è obbligatorio</span>
					
				<label><strong>Conferma password:</strong></label>	
				<input type="password"  id="passwordCheck" placeholder="xxx...">
				<span class="help-block myRed">Il campo è obbligatorio</span>		
							
				</div>
		
		</form>
		</div>
		</div>
		<div class="tab-pane" id="tabEliminaUtente">
		<div >
        <div class="alert alert-error">
        <button type="button" class="close" data-dismiss="alert">×</button>
        <strong>Attenzione!</strong> Effettuare questa operazione con cautela e assicurarsi che:<br>
        <ul>
        <li> L'utente che si vuole eliminare non sia connesso</li>
        <li> E' impossibile eliminare se stessi </li>
        <li> Tutti gli annunci che ha inserito l'utente devono essere assegnati a qualche altro utente</li>
        </ul>
      </div>

    </div>
		<form class="well control-group form-horizontal">
		<div class="control-group">
            <label class="control-label" for="ricercaNomeUtente">Ricerca Utente</label>
            <div class="controls">
              <div class="input-prepend input-append">
                <button class="btn" type="button" id="cancellaRicercaNomeUtente"><i class="icon icon-remove"></i></button><input class="span2" id="ricercaNomeUtente" size="16" type="text"><button id="eliminaRicercaNomeUtente" class="btn btn-danger" type="button">Elimina</button>
              </div>
            </div>
          </div>
        		<div class="control-group">
            <label class="control-label" for="assegnaNomeUtente">Assegna annunci a</label>
            <div class="controls">
              <div class="input-prepend input-append">
                <button class="btn" type="button" id="cancellaAssegnaNomeUtente"><i class="icon icon-remove"></i></button><input class="span2" id="assegnaNomeUtente" size="16" type="text">
              </div>
            </div>
          </div>
		</form>
		</div>
		</div>
		</div>
		<div class="modal-footer">
		  <a href="#" class="btn" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="saveUtente" class="btn btn-primary">Salva Utente</a>
		</div>
	  </div>