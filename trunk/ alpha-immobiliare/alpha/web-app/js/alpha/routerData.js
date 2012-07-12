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
		  }, 60000);
		})();
};

function startRicerca(){
	$.post("/alpha/annuncio/ricerca",
			{
				telefono:$("#telefonoRicerca").val(),
				zona:$("#zonaRicerca").val(),
				prezzo:$("#prezzoRicerca").val(),
				dataDa:$("#dataDa").val(),
				dataA:$("#dataA").val()
			},
			function(data){
				$("#risultatoRicerca").html(data);
			});
	
};