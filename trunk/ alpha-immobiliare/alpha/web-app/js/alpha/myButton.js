$(document).ready(function(){
	$("#ricercaStart").click(function(){
		startRicerca();
		$("#mieiUltimi").hide("slide",function(){
			$("#divRicerca").hide("slide");
			$("#risultatiRicerca").show("slide");
			
		});
	});
	
	$("#ricercaOk").click(function(){
		$("#mieiUltimi").show("slide",function(){
			$("#divRicerca").show("slide");
			$("#risultatiRicerca").hide("slide");
			$("#risultatoRicerca").html("");
		});
	});
});