<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="utf-8">
    <title>Alpha Immobiliare</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/prettify.css" rel="stylesheet">
    <link href="../css/datepicker.css" rel="stylesheet">
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
        .customOption{
            color:#7bb33d !important;
        }
    </style>
    <link href="../css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../ico/logo_big.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>
	<input type="hidden" id="mailIdent"/>
    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#">Alpha Gestionale</a>
          <div class="btn-group pull-right">
            <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
              <i class="icon-user"></i> <sec:username/>
              <span class="caret"></span>
            </a>
            <ul class="dropdown-menu">
              <li><a href="../logout/index">Sign Out</a></li>
            </ul>
          </div>
          <g:menu attiva="0"/>
        </div>
      </div>
    </div>

    <div class="container-fluid" id="principale">
      <div class="row-fluid">
        <div class="span12">
          <div class="">
  			 <h2>Ultimi Annunci Inseriti: <small>Ordinati per data</small></h2>
  			 <i class="icon-list-alt"></i> 
  			 <div id="ultimiInseriti" >
  			 <g:render template="/Menu/tabellaAnnunci" />
  			  </div>
  		  </div>	
  <hr/>

        </div><!--/span-->
      </div><!--/row-->
<div class="row-fluid">
    <div class="span6 well prettyprint linenums" id="mieiUltimi" style="margin-bottom: 18px; height:405px;">
	<i class="icon-user"></i>
	<span class="spacer"><strong>I tuoi ultimi annunci</strong></span>
	<hr/>
	<table class="table">
	<thead>
          <tr>
            <th>#</th>
            <th>Telefono</th>
            <th>Prezzo</th>
            
            <th>Zona</th>
            <th>Data</th>
            <th>N&deg; scheda</th>
            <th></th>
          </tr>
        </thead>
         <tbody id="mieiUltimiData">
         	${mieiUltimi}
          </tbody>
     </table>

    </div>
    <div class="span11 well prettyprint linenums" id="risultatiRicerca" style="margin-bottom: 18px; display:none;">
	<i class="icon-user"></i>
	<span class="spacer "><strong>Risutati della ricerca </strong><span class="btn btn-success floatr" id="ricercaOk"><i class="icon-arrow-left icon-white"></i> Torna ai miei Annunci</span></span>
	<hr/>
	<table class="table">
	<thead>
          <tr>
            <th>#</th>
            <th>Utente</th>
            <th>Telefono</th>
            <th>Prezzo</th>
            <th>N&deg; scheda</th>
            <th>Scheda Presente?</th>
            %{--<th>Risposta</th>--}%
            <th>Zona</th>
              <th>Data inserimento</th>
              <th>Data ultima modifica</th>
              <th>Note</th>
              <th>Descrizione</th>
              <th>Propietario</th>
            <th></th>
          </tr>
        </thead>
         <tbody id="risultatoRicerca">
         	
          </tbody>
     </table>

    </div>
    
    <div class="span6 well prettyprint linenums" style="margin-bottom: 18px; min-height:285px;" id="divRicerca">
	<i class="icon-search"></i>
	<span class="spacer"><strong>Ricerca annunci</strong></span>
	<span class="floatr"><button class="btn btn-primary" id="cancellaTuttiFiltri">Cancella Filtri</button></span>
	<hr/>
	<div class="form-vertical" >
	<div class="input-append date mtop10 spacer2" id="dp" data-date="<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/>" data-date-format="dd-mm-yyyy">
			<label for="dataDa">Da data inserimento:</label>
			 <span class="add-on"><i class="icon-th"></i></span>
		  	<input class="span6" size="16" type="text" id="dataDa" value="">
		 	
		</div>
		<div class="input-append date mtop10 spacer2" id="dp2" data-date="<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/>" data-date-format="dd-mm-yyyy">
			<label for="dataDa">a data inserimento:</label>
			<span class="add-on"><i class="icon-th"></i></span>
		  	<input class="span6" size="16" type="text" id="dataA" value="">
		 	
		</div>
		<div class="input-append mtop10 spacer2">
			<label for="prezzoRicerca">Prezzo:</label>
			<span class="add-on">€</span>
		  	<input class="span6" size="10" type="text" id="prezzoRicerca" value="">
		 	 <span class="add-on">.00</span>
		</div>
		<div class="input-append mtop10 spacer2" >
			<label for="telefonoRicerca">Numero di telefono:</label>
			<span class="add-on"><i class="icon-book"></i></span>
			<input class="span6" size="16" type="text" id="telefonoRicerca" value="">
		 	 <span class="add-on"><i class="icon-signal"></i></span>
		</div>
		<div class="input-append mtop10 spacer2" >
			<label for="zonaRicerca">Zona:</label>
			<span class="add-on"><i class="icon-globe"></i></span>
	
			<select class="span6" id="zonaRicerca" value="">
<option value="" selected="selected">Seleziona se vuoi una zona</option>
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
                <option class="customOption" value="Centro Storico">Centro Storico</option>
                <option value="Colombo - Ardeatino" >Colombo - Ardeatino</option>
                <option value="Don Bosco - Cinecitta" >Don Bosco - Cinecitta</option>
                <option value="Esquilino - San Lorenzo" >Esquilino - San Lorenzo</option>
                <option value="Eur" >Eur</option>
                <option value="Flaminio Vigna - Clara" >Flaminio Vigna - Clara</option>
                <option value="Gregorio VII - B. Ubaldi" >Gregorio VII - B. Ubaldi</option>
                <option value="Laurentino - Montagnola" >Laurentino - Montagnola</option>
                <option value="Marconi - Ostiense" >Marconi - Ostiense</option>
                <option value="Montesacro - Talenti" >Montesacro - Talenti</option>
                <option class="customOption" value="Monteverde - Gianicolense" >Monteverde - Gianicolense</option>
                <option value="Ostia - Fiumicino" >Ostia - Fiumicino</option>
                <option value="Palocco - Acilia" >Palocco - Acilia</option>
                <option class="customOption" value="Parioli - Pinciano" >Parioli - Pinciano</option>
                <option value="Portuense - Magliana" >Portuense - Magliana</option>
                <option class="customOption" value="Prati - Clodio" >Prati - Clodio</option>
                <option value="Prati Fiscali - Nuovo Salario" >Prati Fiscali - Nuovo Salario</option>
                <option class="customOption" value="Salario - Trieste" >Salario - Trieste</option>
                <option value="San Giovanni - Appia Nuova" >San Giovanni - Appia Nuova</option>
                <option value="Tiburtino - Collatino" >Tiburtino - Collatino</option>
                <option value="Torre Vecchia - Sacchetti" >Torre Vecchia - Sacchetti</option>
                <option class="customOption"  value="Trastevere - Borgo" >Trastevere - Borgo</option>
                <option value="Trionfale" >Trionfale</option>
                <option value="Tuscolano" >Tuscolano</option>
            </select>
		 	 
		</div>
				<div class="input-append mtop10 spacer2" >
			<label for="idAnnRicerca">Numero Scheda:</label>
			<span class="add-on">N&deg;</span>
			<input class="span6" size="16" type="text" id="idAnnRicerca" value="">
		 	
		</div>
        <div class="input-append mtop10 spacer2" >
            <label for="metriQuadriRicerca">Metri Quadri:</label>

            <input class="span6" size="16" type="text" id="metriQuadriRicerca" value="">

        </div>
        <div class="input-append mtop10 spacer2" >
            <label for="schedaPresenteRicerca">Scheda Presente:</label>
            <select class="span6" id="schedaPresenteRicerca" value="">
                <option value="">Visualizza tutti gli annunci</option>
                <option value="1">Visualizza gli annunci che HANNO schede</option>
                <option value="0">Visualizza gli annunci che NON hanno schede</option>
                </select>
        </div>
		<div class="input-append mtop10 spacer2" >
			<label for="utenteRicerca">Utente:</label>
			<span class="add-on"><i class="icon-user"></i></span>
			<input class="span6" size="16" type="text" id="utenteRicerca" value="">
			<a class="btn btn-success" id="ricercaStart"><i class="icon-ok icon-white"></i> Ricerca</a>
		 	 
		</div>
    </div>    
    </div>
    
<%--    <div class="span4 well prettyprint linenums" style="margin-bottom: 18px; min-height:250px;">--%>
<%----%>
<%--    </div>--%>

 </div>
      <hr>

      <footer>
        <p>&copy; Alpha Immobiliare 2012</p>
        
      </footer>

    </div><!--/.fluid-container-->

    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/jquery.js"></script>
    <script src="../js/bootstrap-transition.js"></script>
    <script src="../js/bootstrap-alert.js"></script>
    <script src="../js/bootstrap-modal.js"></script>
    <script src="../js/bootstrap-dropdown.js"></script>
    <script src="../js/bootstrap-scrollspy.js"></script>
    <script src="../js/bootstrap-tab.js"></script>
    <script src="../js/bootstrap-tooltip.js"></script>
    <script src="../js/bootstrap-popover.js"></script>
    <script src="../js/bootstrap-button.js"></script>
    <script src="../js/bootstrap-collapse.js"></script>
    <script src="../js/bootstrap-carousel.js"></script>
    <script src="../js/bootstrap-typeahead.js"></script>
    <script src="../js/bootstrap-datepicker.js"></script>
    <script src="../js/alpha/myButton.js"></script>
    <script src="../js/alpha/menuFunction.js"></script>
    <script src="../js/alpha/routerData.js"></script>
    <script src="../js/alpha/main.js"></script>
  <script src="../js/alpha/editable.js"></script>
    <audio controls preload="auto" style="display:none;">
	<source src="${resource(dir:'sound/',file:'error.wav') }" controls/>
	</audio>
	
  </body>
  	<g:render template="/Menu/agenzia" />
  	<g:render template="/Menu/annuncio" />
  	<g:render template="/Menu/utente" />
  	<g:render template="/Menu/eliminaAnnuncio" />
  	<g:render template="/Menu/segnaComeAgenzia" />
  	
<div class="modal fade" id="InviaMessaggioUtente" style="display:none;">
				<div class="modal-header">
				<button class="close" data-dismiss="modal">x</button>
				<h3>Invia Messaggio</h3>
		</div>
		<div class="modal-body">
		<div class="row-fluid">
		<div class="span12">
		<form class="well clearfix">
				<div class="span6">
				<label><strong>Messaggio da inviare:</strong></label>
				<textarea class="input-xlarge" id="messaggioEmail" placeholder="Scrivi il messaggio..."></textarea>

							
				</div>
		
		</form>
		</div>
		</div>
		</div>
		<div class="modal-footer">
		  <a href="#" class="btn" data-dismiss="modal">Chiudi</a>
		  <a href="#" id="invioEmail" class="btn btn-primary">Invia Messaggio</a>
		</div>
	  </div>
  
</html>
