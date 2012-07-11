$(document).ready(function(){
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
$("#dp3").datepicker();
});
