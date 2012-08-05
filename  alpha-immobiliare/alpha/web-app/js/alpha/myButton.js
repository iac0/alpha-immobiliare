
$(document).ready(function(){
	$("#invioEmail").click(function(){
		$.post("/alpha/agenzia/avvisa",
				{
					ident:$("#mailIdent").val(),
					messaggio:$("#messaggioEmail").val()
				},
				function(data){
					$("#InviaMessaggioUtente").modal("hide");
				});
	});		
	$("#cancellaTuttiFiltri").click(function(){
		$("#divRicerca :input").val("");
		
	});
	$("#chiudiModalAnnuncio").click(function(){
		multiplo = false;
	});
	$("#attivaInserimentoMultiplo").click(function(){
		if($(this).hasClass("btn-danger"))
			{
			multiplo=true;
			$(this).removeClass("btn-danger").addClass("btn-success").text("Disattiva inserimento Multiplo")
			}
		else 
		{
			multiplo = false;
			$(this).addClass("btn-danger").removeClass("btn-success").text("Attiva inserimento Multiplo")
		}
		
	});
	
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
		multiplo = false;
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
	
		$("#eliminaAnnuncioQ").click(function(){
			$.post("/alpha/annuncio/elimina",
					{
					ident: $(this).attr("idAnnuncio")
					},
					function(data){
						if(data.success){
						 operazioneOk("#EliminaAnnuncio div.span12");
						pollingMiei();
						}
					});
		});
		$("#segnaComeAgenziaQ").click(function(){
			$.post("/alpha/annuncio/segnaComeAgenzia",
					{
					ident: $(this).attr("idAnnuncio")
					},
					function(data){
						if(data.success){
						operazioneOk("#SegnaComeAgenzia div.span12");
						pollingMiei();
						}
					});
		});
		$("#cancellaInputRicercaNumeroAgenzia").click(function(){
			$("#ricercaNumeroAgenzia").val("");
			
		});
		$("#cancellaRicercaNomeUtente").click(function(){
			$("#ricercaNomeUtente").val("");
			
		});
		$("#cancellaAssegnaNomeUtente").click(function(){
			$("#assegnaNomeUtente").val("");
			
		});
		$("#eliminaNumeroAgenzia").click(function(){
			var valore = $("#ricercaNumeroAgenzia").val();
			$.post("/alpha/agenzia/elimina",{telefono:valore},function(data){
				if(data.success)
					showMessage(true,
							'Agenzia eliminata con successo',
							'#InserisciNumeroAgenzia');
				else 
					showMessage(false,
							'Si &egrave; verificato un errore, verifica che il numero inserito sia corretto',
							'#InserisciNumeroAgenzia');
				
			});
		});
		$("#eliminaRicercaNomeUtente").click(function(){
			var valore = $("#ricercaNomeUtente").val();
			var assegnaUtente= $("#assegnaNomeUtente").val();
			if( (valore && assegnaUtente) && (valore!=assegnaUtente)){
			$.post("/alpha/user/elimina",{username:valore,assegna:assegnaUtente},function(data){
				if(data.success)
					showMessage(true,
							'Utente eliminata con successo',
							'#InserisciNuovoUtente');
				else 
					showMessage(false,
							'Si &egrave; verificato un errore, verifica che il nome inserito sia corretto',
							'#InserisciNuovoUtente');
				
			});
			}else {
				alert('Valorizza sia l\'utente da eliminare che l\'utente a cui assegnare gli annunci! Inoltre tali valori devono essere diversi!');
			}
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