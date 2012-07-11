
<div class="modal fade" id="InserisciNuovoUtente" style="display:none;">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>Inserisci Nuovo Utente</h3>
		</div>
		<div class="modal-body">
		<div class="row-fluid">
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
		</div>
		<div class="modal-footer">
		  <a href="#" class="btn" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="saveUtente" class="btn btn-primary">Salva Utente</a>
		</div>
	  </div>