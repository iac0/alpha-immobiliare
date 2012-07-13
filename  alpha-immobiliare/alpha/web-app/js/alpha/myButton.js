
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
	
	$("#creaScheda").click(function(){
		$("#saveAnnuncio").trigger("click");
		setTimeout(
				function (){
					$.post("/alpha/annuncio/getScheda",{id:$("#annuncioIdent").val()},
							function(data){
								$("#InserisciAnnuncio").modal("hide");
								$("#principale").hide("blind",function(){
									$("#principale").parent().append(data).show("blind");
									$("#dpScheda").datepicker();
									var values = $("#schedaRiscaldamento").attr("values");
									$("#schedaRiscaldamento").val(""+values);
									saveScheda();
									
								});
								
							});
				},300);
		
	});
	

});


function saveScheda(){
	$("#saveScheda").click(function(){
		$.post("/alpha/annuncio/saveScheda",
				{
				idents: $("#tableScheda").attr("annuncioId"),
				composizione: $("#schedaComposizione").val(),
				piano:$("#schedaPiano").val(),
				proprietario:$("#schedaProprietario").val(),
				incarico:$("#schedaIncarico").is("input:checked"),
				libero:$("#schedaLibero").is("input:checked"),
				piano:$("#schedaPiano").val(),
				soffitta:$("#schedaSoffitta").is("input:checked"),
				box:$("#schedaBox").is("input:checked"),
				postoAuto:$("#schedaPostoAuto").is("input:checked"),
				tipoRiscaldamento:$("#schedaRiscaldamento").val(),
				ascensore:$("#schedaAscensore").is("input:checked"),
				giorno:$("#schedaGiorno").val(),
				ora:$("#schedaOra").val(),
				nomePersona:$("#schedaNomePersona").val(),
				citofono:$("#schedaCitofono").val(),
				via:$("#schedaVia").val(),
				interno:$("#schedaInterno").val(),
				noteScheda:$("#schedaNote").val(),
				telefonoAppuntamento: $("#schedaTelefono").val()
				},
				
				function(data){
					$("#annuncioIdent").val(data.id);
					salvataggioSchedaOk("#responseScheda");
				})
		.success(function(){
			salvataggioAnnuncioOk("#saveAnnuncioForm");
			
		})
		.error(function(){
			$("#saveAnnuncio").show();
			var tooltip= '<div class="alert alert-error toClose">Si &egrave; '+
			'verificato un problema, clicca sul bottone Visualizza Informazioni '+
			'per maggiori informazioni.<br><br>'+
			'<span class="btn btn-info" id="errorAnn"> Visualizza Informazioni</span>'+
			''+
			''+
			'</div>';
			$(tooltip).appendTo($("#saveAnnuncioForm").parent()).hide().show("blind",function(){
				$("#InserisciAnnuncio .modal-body").scrollTop(1000);
				$("#errorAnn").popover({
					title:"Informazioni Annuncio",
					content:getRientroAnnuncio(),
					placement:'top'
				});
				
			});
		});
	});	
	
	$("#backHome").click(function(){
		$(".destroyed").hide("blind",function(){
			$(".destroyed").remove();
			$("#principale").show();
			
		});
	});
	
	
	
	
};