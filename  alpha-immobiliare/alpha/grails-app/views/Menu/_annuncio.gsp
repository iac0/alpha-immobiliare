<div class="modal fade" id="InserisciAnnuncio" style="display: none;">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>Inserisci Annuncio</h3>
		</div>
		<div class="modal-body">
		<div class="row-fluid">
		<div class="span12">
		<input type="hidden" id="annuncioIdent" value="">
		<form class="well clearfix" id="saveAnnuncioForm">
				<div class="span6">
				
				<div class="input-append">	
				
				<label><strong>Telefono:</strong></label>	
				<input type="text" class="span8" id="telefonoA" placeholder="3295858688...">
				<a class="btn btn-warning" id="verificaNumero" href="#">Verifica</a>
				</div>
				<span class="help-block myRed">Il campo è obbligatorio</span>
				<label><strong>Risposta:</strong></label>
				<select id="risposta">
				  <option value="no">NO</option>
				  <option value="si">SI</option>
				  <option value="richiama">Richiama</option>
				</select>
				<span class="help-block myRed">Il campo è obbligatorio</span>
				
				<label><strong>Composizione:</strong></label>
				<input type="text" class="" id="composizione" placeholder="Digita la composizione..">
				<span class="help-block myGreen">Il campo non è obbligatorio</span>
		
				<label><strong>Indirizzo:</strong></label>
				<input type="text" class="" id="indirizzo" placeholder="Via Leone X...">
				<span class="help-block myGreen">Il campo non è obbligatorio</span>
				
				<label><strong>Note:</strong></label>
				<textarea class="input-xlarge" id="noteA" placeholder="Scrivi le tue note..."></textarea>
				<span class="help-block myGreen">Il campo non è obbligatorio</span>
				</div>
				
				<div class="span6">
				
						<label><strong>Prezzo:</strong></label>
						<div class="input-prepend">
						<span class="add-on">€</span>
						<input type="text" class="span10" id="prezzo" placeholder="100000...">
						</div>
						<span class="help-block myRed">Il campo è obbligatorio</span>
						
						<label><strong>Zona:</strong></label>
						<select id="zona">
						  <option value="zona1">Parioli</option>
						  <option value="zona2">Trastevere</option>
						</select>
						<span class="help-block myRed">Il campo è obbligatorio</span>		
						
						<label><strong>Metri Quadrati:</strong></label>
						<input type="text" class="" id="metriQuadrati" placeholder="90..">
						<span class="help-block myGreen">Il campo non è obbligatorio</span>
						
						<label><strong>Scheda Associata:</strong></label>
						<a class="btn btn-info" href="#" id="creaScheda">Apri Scheda</a>
						
						
							
				</div>
		
		</form>
		</div>
		</div>
		</div>
		<div class="modal-footer">
		  <a href="#" class="btn" id="chiudiModalAnnuncio" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="saveAnnuncio" class="btn btn-primary">Salva Annuncio</a>
		</div>
	  </div>