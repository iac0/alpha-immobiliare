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
              <li><a href="http://10.38.76.149:8080/alpha/logout/index">Sign Out</a></li>
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
            <th>Risposta</th>
            <th>Zona</th>
            <th>Data</th>
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
			<label for="prezzo">Prezzo:</label>
			<span class="add-on">€</span>
		  	<input class="span6" size="10" type="text" id="prezzoRicerca" value="">
		 	 <span class="add-on">.00</span>
		</div>
		<div class="input-append mtop10 spacer2" >
			<label for="telefono">Numero di telefono:</label>
			<span class="add-on"><i class="icon-book"></i></span>
			<input class="span6" size="16" type="text" id="telefonoRicerca" value="">
		 	 <span class="add-on"><i class="icon-signal"></i></span>
		</div>
		<div class="input-append mtop10 spacer2" >
			<label for="telefono">Zona:</label>
			<span class="add-on"><i class="icon-globe"></i></span>
			<input class="span6" size="16" type="text" id="zonaRicerca" value="">
			
		 	 
		</div>
		<div class="input-append mtop10 spacer2" >
			<label for="telefono">Utente:</label>
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
	
  </body>
  	<g:render template="/Menu/agenzia" />
  	<g:render template="/Menu/annuncio" />
  	<g:render template="/Menu/utente" />
</html>
