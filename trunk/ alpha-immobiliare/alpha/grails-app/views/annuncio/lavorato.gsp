<%@ page import="alpha.anagrafica.Agenzia; alpha.gestioneAnnunci.Annuncio" %>
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
    <link href="${resource(dir: 'css',file:'bootstrap-responsive.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css',file:'demo_page.css')}" rel="stylesheet">
    <link href="${resource(dir: 'css',file:'demo_table.css')}" rel="stylesheet">

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
    <div class="input-append date mtop10 spacer2 " id="dp" data-date="<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/>" data-date-format="dd-mm-yyyy">
        <label for="dataDa">Filtra lavorato dal giorno:</label>
        <span class="add-on"><i class="icon-th"></i></span><input class="span2" size="16" type="text" id="dataDa" value="">

    </div>
    <div class="input-append date mtop10 spacer2 " id="dp2" data-date="<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/>" data-date-format="dd-mm-yyyy">
        <label for="dataDa">al giorno:</label>
        <span class="add-on"><i class="icon-th"></i></span><input class="span2" size="16" type="text" id="dataA" value=""><button class="btn btn-info" id="filtra"> Filtra</button>
    </div>
    <div class="row-fluid " id="container">




    </div><!--/row-->

    <hr>

    <footer>
        <p>&copy; Alpha Immobiliare 2012</p>

    </footer>

</div><!--/.fluid-container-->

<script src="${resource(dir: 'js',file:'jquery.js')}"></script>
<script src="${resource(dir: 'js',file:'bootstrap-datepicker.js')}"></script>
<script src="${resource(dir: 'js',file:'highcharts.js')}"></script>
<script src="${resource(dir: 'js',file:'exporting.js')}"></script>





</body>


<script type="text/javascript">
    var chart;

    $(document).ready(function () {
        $("#dp,#dp2").datepicker();
        // Build the chart
        $('#container').highcharts({
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false
            },
            title: {
                text: 'Lavorato totale per Utente, Alpha Immobiliare'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.y}</b> pari al {point.percentage}%</b>',
                percentageDecimals: 1
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: false
                    },
                    showInLegend: true
                }
            },
            series: [{
                type: 'pie',
                name: 'Annunci inseriti',
                data: ${serie}
            }]
        });
        chart = Highcharts.charts[0];
        serie = chart.series[0] ;
        $("#filtra").click(function(){
            $.post('<g:createLink controller="annuncio" action="filtraSerie"></g:createLink>',
                    {dataIni:$("#dataDa").val(),dataFin:$("#dataA").val()},
                    function(data){
                      serie.setData(data);
                        serie.redraw();
            },'json');
        });
    });


</script>

</html>
