<%@ page import="alpha.anagrafica.Zona" %>   
<div class="modal fade" id="InserisciAnnuncio" style="display: none;">
				<div class="modal-header">
				<h3>Inserisci Annuncio<span class="floatr">
				<button class="btn btn-danger" id="attivaInserimentoMultiplo">Attiva inserimento Multiplo</button>
				</span></h3>
				
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
<option value="Affitti" >Affitti</option>
<option value="Appio Claudio Appia - Pignatelli" >Appio Claudio Appia - Pignatelli</option>
<option value="Appio Latino" >Appio Latino</option>
<option value="Aurelio - Boccea" >Aurelio - Boccea</option>
<option value="Aventino - San Saba" >Aventino - San Saba</option>
<option value="Balduina - Montemario" >Balduina - Montemario</option>
<option value="Bologna - Nomentana" >Bologna - Nomentana</option>
<option value="Bravetta - Casetta Mattei" >Bravetta - Casetta Mattei</option>
<option value="Casilino - Prenestino" >Casilino - Prenestino</option>
<option value="Cassia - Olgiata" >Cassia - Olgiata</option>
<option value="Centro Storico" selected="selected">Centro Storico</option>
<option value="Colombo - Ardeatino" >Colombo - Ardeatino</option>
<option value="Don Bosco - Cinecitta" >Don Bosco - Cinecitta</option>
<option value="Esquilino - San Lorenzo" >Esquilino - San Lorenzo</option>
<option value="Eur" >Eur</option>
<option value="Flaminio Vigna - Clara" >Flaminio Vigna - Clara</option>
<option value="Gregorio VII - B. Ubaldi" >Gregorio VII - B. Ubaldi</option>
<option value="Laurentino - Montagnola" >Laurentino - Montagnola</option>
<option value="Marconi - Ostiense" >Marconi - Ostiense</option>
<option value="Montesacro - Talenti" >Montesacro - Talenti</option>
<option value="Monteverde - Gianicolense" >Monteverde - Gianicolense</option>
<option value="Ostia - Fiumicino" >Ostia - Fiumicino</option>
<option value="Palocco - Acilia" >Palocco - Acilia</option>
<option value="Parioli - Pinciano" >Parioli - Pinciano</option>
<option value="Portuense - Magliana" >Portuense - Magliana</option>
<option value="Prati - Clodio" >Prati - Clodio</option>
<option value="Prati Fiscali - Nuovo Salario" >Prati Fiscali - Nuovo Salario</option>
<option value="Salario - Trieste" >Salario - Trieste</option>
<option value="San Giovanni - Appia Nuova" >San Giovanni - Appia Nuova</option>
<option value="Tiburtino - Collatino" >Tiburtino - Collatino</option>
<option value="Torre Vecchia - Sacchetti" >Torre Vecchia - Sacchetti</option>
<option value="Trastevere - Borgo" >Trastevere - Borgo</option>
<option value="Trionfale" >Trionfale</option>
<option value="Tuscolano" >Tuscolano</option>
</select>
<%----%>
<%--<g:set var="zona" value="${Zona.listOrderByZona(order:"asc")}"></g:set>--%>
<%--<g:select name="zona" id="zona" from="${zona.zona}" value="${zona.zona}" multiple="false"/>--%>
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