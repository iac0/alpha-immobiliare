$(document).ready(function(){
var multiplo= false;
$.ajax({
	cache:false
});
	/*
	 * Tutte le funzioni qui richiamate sono presenti nel file /web-app/js/alpha/menuFunction.js
	 * ogni load effettua il bind degli eventi relativi a ogni singola finestra modale.
	 * 
	 */
loadInserisciAgenzia();
loadInserisciAnnuncio();
loadInserisciUtente();
/*
 * Tutte le funzioni qui richiamate sono presenti nel file /web-app/js/alpha/routerData.js
 * ogni carica carica dinamicamente nella tabella iniziale gli ultimi annunci inseriti.
 * 
 */


caricaUltimiAnnunci();	
$("#dp,#dp2").datepicker();
$("#ricercaNumeroAgenzia").typeahead({
    source: function (typeahead, query) {
        return $.post('/alpha/agenzia/autocomplete', { query: query }, function (data) {
            return typeahead.process(data);
        });
    },
    property: "name",
    items: 14
});

$("#telefonoRicerca").typeahead({
    source: function (typeahead, query) {
        return $.post('/alpha/annuncio/autocomplete', { query: query }, function (data) {
            return typeahead.process(data);
        });
    },
    property: "name",
    items: 8
});

$("#ricercaNomeUtente,#assegnaNomeUtente,#utenteRicerca").typeahead({
    source: function (typeahead, query) {
        return $.post('/alpha/user/autocomplete', { username: query }, function (data) {
            return typeahead.process(data);
        });
    },
    property: "name",
    items: 8
});
$('a[data-toggle="tab"]').on('shown', function (e) {
	if($(e.target).attr("href")=="#tabEliminaUtente"){
		$("#InserisciNuovoUtente div.modal-footer a").hide();
		}
	if($(e.target).attr("href")=="#eliminaAgenzia"){
		$("#InserisciNumeroAgenzia div.modal-footer a").hide();
		}
	 if($(e.target).attr("href")=="#tabInserisciUtente"){
		  $("#InserisciNuovoUtente div.modal-footer a").show();
		 }
	  if($(e.target).attr("href")=="#inserisciAgenzia"){
			$("#InserisciNumeroAgenzia div.modal-footer a").show();
			}	
	});
});
