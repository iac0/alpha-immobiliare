function caricaUltimiAnnunci(ultimoCaricato){
	$.post("/alpha/annuncio/polling",
			function(data){
				$("#ultimiAnnunci").prepend(data);
			});
	
	(function poll(){
		   setTimeout(function(){
			      $.ajax({
			    	 url: "/alpha/annuncio/polling",
			    	   	 success: function(data){
			    		 $("#ultimiAnnunci").html(data);
			    		 poll();
			    	 }
		      });
		  }, 5000);
		})();
	
	
};

function startRicerca(){
	$.post("/alpha/annuncio/ricerca",
			{
				telefono:$("#telefonoRicerca").val(),
				zona:$("#zonaRicerca").val(),
				prezzo:$("#prezzoRicerca").val(),
				dataDa:$("#dataDa").val(),
				dataA:$("#dataA").val(),
				utente:$("#utenteRicerca").val()
			},
			function(data){
				$("#risultatoRicerca").html(data);
				funzionalitaMenuTendina();
			});
	
};

function pollingMiei(){
    $.ajax({
  	 url: "/alpha/annuncio/pollingMiei",
  	   	 success: function(data){
  	    $("#mieiUltimiData").html(data);
  		funzionalitaMenuTendina();
  	 }
});
}