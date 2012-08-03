	<div class="modal fade" id="InserisciNumeroAgenzia" style="display: none;">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>Inserisci Numero Agenzia</h3>
		</div>
		<div class="modal-body">
		<ul class="nav nav-tabs" id="myTab">
  		<li class="active"><a href="#inserisciAgenzia" data-toggle="tab">Inserisci</a></li>
 		<li><a href="#eliminaAgenzia" data-toggle="tab">Elimina</a></li>
 		</ul>
 		<div class="tab-content">
 		<div class="tab-pane active" id="inserisciAgenzia">
		<form class="well control-group" id="saveAgenziaForm">
		<label><strong>Telefono:</strong></label>
		<input type="text" class="span3" id="telefono" placeholder="3295858688...">
		<span class="help-inline myRed">Il campo è obbligatorio</span>
		<label><strong>Nome Agenzia:</strong></label>
		<input type="text" class="span3" id="nome" placeholder="Alpha immobiliare...">
		<span class="help-inline myGreen">Il campo non è obbligatorio</span>
		
		<label><strong>Note:</strong></label>
		<input type="text" class="span3" id="note" placeholder="Note di riferimento...">
		<span class="help-inline myGreen">Il campo non è obbligatorio</span>
		
		
		</form>
		</div>
		<div class="tab-pane" id="eliminaAgenzia">
		<form class="well control-group form-horizontal">
		<div class="control-group">
            <label class="control-label" for="ricercaNumeroAgenzia">Ricerca Numero</label>
            <div class="controls">
              <div class="input-prepend input-append">
                <button class="btn" type="button" id="cancellaInputRicercaNumeroAgenzia"><i class="icon icon-remove"></i></button><input class="span2" id="ricercaNumeroAgenzia" size="16" type="text"><button id="eliminaNumeroAgenzia" class="btn btn-danger" type="button">Elimina</button>
              </div>
            </div>
          </div>
		</form>
		</div>
		
		</div>
		</div>
		<div class="modal-footer">
		  <a href="#" class="btn" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="saveAgenzia" class="btn btn-primary">Salva Informazioni</a>
		</div>
	  </div>