<%@ page import="alpha.gestioneAnnunci.Annuncio" %>
<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="utf-8">
    <title>Alpha Immobiliare</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Le styles -->
    <link href="${resource(dir: 'css',file:'bootstrap.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css',file:'prettify.css')}" rel="stylesheet">

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
    <link href="${resource(dir: 'css',file:'bootstrap-responsive.css')}" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="${resource(dir:'ico',file: 'logo_big.ico')}">
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

        </div>
    </div>
</div>

<div class="container-fluid" id="principale">
    <div class="row-fluid">


           <g:render template="schedaAnnuncio" model="['annuncio':Annuncio.get(params.id)]"></g:render>

    </div><!--/row-->

    <hr>

    <footer>
        <p>&copy; Alpha Immobiliare 2012</p>

    </footer>

</div><!--/.fluid-container-->

<script src="${resource(dir: 'js',file:'jquery.js')}"></script>



</body>


 <script type="text/javascript">
     $(document).ready(function(){
         $("#saveScheda,#backHome").hide()

     });
 </script>

</html>
