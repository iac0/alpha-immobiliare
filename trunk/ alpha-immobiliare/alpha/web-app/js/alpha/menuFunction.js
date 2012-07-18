function loadInserisciAgenzia(){
	$("#saveAgenzia").click(function(){
		$salvaB = $(this);
		$salvaB.hide();
		$.post("/alpha/agenzia/saveAgenzia",
				{
				nome:$("#nome").val(),
				telefono:$("#telefono").val(),
				note:$("#note").val()
				},
				
				function(data){
					
				})
		.success(function(){
			var tooltip= '<div class="alert alert-success toClose">Agenzia salvata con successo</div>';
			$(tooltip).appendTo($("#saveAgenziaForm")).hide().show("blind",function(){
				$("#saveAgenziaForm :input").val("");
				
			});
		})
		.error(function(){
			var tooltip= '<div class="alert alert-error toClose">Si &egrave; verificato un problema,riprova</div>';
			$(tooltip).appendTo($("#saveAgenziaForm")).hide().show("blind");
		});
		
	});
	$('#InserisciNumeroAgenzia').on('hidden', function () {
		$("#saveAgenziaForm :input").val("");
		$("#saveAgenzia").show();
		$("#saveAgenzia").removeClass("disabled");
		$(".toClose").remove();
		});
};
function loadInserisciAnnuncio(){
	
	$("#telefonoA").tooltip({
		trigger:'manual',
		title:"Inserisci il numero"
		});
	
	$("#verificaNumero").tooltip({
		trigger:'manual',
		title:"Con tale numero <br>&egrave; registrata una Agenzia"
		});
	
	$('#creaScheda').popover(
			{
				title:"Apri scheda",
				content:"Puoi aprire la scheda ora o in un altro momento.<br>" +
						"Se apri la scheda le informazioni da te inserite relative all'annuncio saranno automaticamente salvate"
			});
	
	
	$("#saveAnnuncio").click(function(){
		$salvaB = $(this);
		$salvaB.hide();
		$.post("/alpha/annuncio/saveAnnuncio",
				{
				update:$("#annuncioIdent").val(),
				telefono:$("#telefonoA").val(),
				prezzo:$("#prezzo").val(),
				risposta:$("#risposta").val(),
				zona:$("#zona").val(),
				composizione:$("#composizione").val(),
				metriQuadrati:$("#metriQuadrati").val(),
				indirizzo:$("#indirizzo").val(),
				note:$("#noteA").val()
				},
				
				function(data){
					$("#annuncioIdent").val(data.id);
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
	
	$("#telefonoA").click(function () {
		if($(this).next().hasClass("btn-danger"))
		{	
			$(this).val("");
			$(this).next().removeClass("btn-danger").addClass("btn-warning");
			
		}
	   
	});
	
	$("#telefonoA").keydown(function () {
		if($(this).next().hasClass("btn-danger"))
		{	
			$(this).val("");
			$(this).next().removeClass("btn-danger").addClass("btn-warning");
			
		}
	   
	});
	
	$("#prezzo,#telefonoA").keyup(function () {
		
		if(event.keyCode == 13){
		$("#verificaNumero").trigger("click");
		}
	    this.value = this.value.replace(/[^0-9\.]/g,'');
	});
	
	$("#verificaNumero").click(function(){
		if($("#telefonoA").val()=="")
			{
			$("#telefonoA").tooltip('show');
			setTimeout("$('#telefonoA').tooltip('hide')",2000);
			return;
			}
		$(this).removeClass("btn-success btn-danger").addClass("btn-warning")
		$.post("/alpha/agenzia/verificaNumero",
				{
				numero:$("#telefonoA").val()
				},
				function(data){
					if(data.annuncio==true)
					{
					$("#annuncioIdent").val(data.ann.id);
					annuncioPresente(data.ann.utente.username);
					caricaInserisciAnnuncio();
					}
					if(data.agenzia==true){
						$("#verificaNumero").removeClass("btn-warning").addClass("btn-danger");
						$("#verificaNumero").tooltip('show');
						setTimeout("$('#verificaNumero').tooltip('hide')",2500);
					}
					else {
						if(data.agenzia==false && data.annuncio==false){
						$("#verificaNumero").removeClass("btn-warning").addClass("btn-success");
						$("#saveAnnuncioForm").find("input,label,span,a,select,textarea").show();
						}
					}
					});
	});
	
	$("#InserisciAnnuncio").on("show",function(){
		$("#saveAnnuncioForm").find("input,label,span,a,select,textarea").hide()
		$("#telefonoA").parent().find("*").show();
		$(".toClose").remove();
		
	});
	
	$("#InserisciAnnuncio").on("hidden",function(){	
		pollingMiei();
		$(".toClose").remove();
		$("#saveAnnuncio").show();
		$("#saveAnnuncioForm input").val("");
		$("#annuncioIdent").val("");
		$("#verificaNumero").removeClass("btn-success btn-danger").addClass("btn-warning");
		
	});
	funzionalitaMenuTendina();
};

function getRientroAnnuncio(){
	var string="";
	$.post("/alpha/annuncio/getRientroAnnuncio",function(data){
		if(!data.gormError){
			$("#errorAnn").attr("data-content",data.html);
			$("#errorAnn").parent().append(data.rientro);
			$("#rientroAnnuncio").click(function(){
				$.post("/alpha/annuncio/rientroAnnuncio",
						{
						id:$("#rientroAnnuncio").val()
						},
						function(data){
						if(!data.error){
						salvataggioAnnuncioOk("#saveAnnuncioForm");
						$("#rientroAnnuncio").remove();
						}
				});
				
			});
		}
		else{
			$("#errorAnn").attr("data-content",data.html);	
		}
	});
};




function loadInserisciUtente(){
	$("#password").tooltip({
		trigger:'manual',
		title:"Le password da te inserite non coincidono, riscrivile."
		});
	$("#password").click(function(){
		$(this).tooltip("hide");
		});
	$("#saveUtente").click(function(){
		$passwd = $("#password");
		$passwd2 = $("#passwordCheck");
		if($passwd.val() == $passwd2.val()){
			$.post("/alpha/user/nuovoUtente",
					{
					username: $("#username").val(),
					email: $("#email").val(),
					ruolo: $("#ruolo").val(),
					password: $("#password").val()
					},
					function(data){
						if(!data.gormError) 
							salvataggioUtenteOk("#saveUtenteForm");
						else 
							salvataggioUtenteKo("#saveUtenteForm");
					});
			
		}
		else {
			$passwd.tooltip("show");
			$passwd.val("");$passwd2.val("");
		}
		
	});	
	
	$("#InserisciNuovoUtente").on("hidden",function(){	
		$(".toClose").remove();
		$("#saveUtenteForm input").val("");
	});
};




function salvataggioAnnuncioOk(formId){
	var tooltip= '<div class="alert alert-success toClose">Annuncio salvato con successo,<br> puoi chiudere la finestra</div>';
	$(tooltip).appendTo($(formId).parent()).hide().show("blind",function(){
		$("#InserisciAnnuncio .modal-body").scrollTop(1000);
	});	
	
};


function salvataggioUtenteOk(formId){
	var tooltip= '<div class="alert alert-success toClose">Utente salvato con successo,<br> puoi chiudere la finestra</div>';
	$(tooltip).appendTo($(formId).parent()).hide().show("blind",function(){
		$("#InserisciNuovoUente .modal-body").scrollTop(1000);
	});	
	
};

function salvataggioUtenteKo(formId){
	var tooltip= '<div class="alert alert-error toClose">Si &egrave; verificato un problema,<br> puoi chiudere la finestra e rieffetua l\'operazione.</div>';
	$(tooltip).appendTo($(formId).parent()).hide().show("blind",function(){
		$("#InserisciNuovoUente .modal-body").scrollTop(1000);
	});	
	
};

function salvataggioSchedaOk(formId){
	var tooltip= '<div class="alert alert-success destroyed">Scheda modificata con successo.</div>';
	$(tooltip).appendTo($(formId)).hide().show("blind",function(){
		
	});	
	
};
function operazioneOk(formId){
	var tooltip= '<div class="alert alert-success destroyed">Operazione effettuata con successo.</div>';
	$(tooltip).appendTo($(formId)).hide().show("blind",function(){
		
	});	
	
};

function annuncioPresente(utente){
	var tooltip= '<div class="alert alert-danger destroyed">'+
		'Attenzione questo annuncio &egrave; gi&agrave; stato inserito dall\'utente <strong>'+utente+
		'</strong><br>Se la riposta dell\'annuncio &agrave; <strong>SI</strong> contatta '+utente+
		'. Se Apri la scheda o effettuiti modifiche diventerai il proprietario dell\'annunio.'+
		'</div>';
	$to = $("#saveAnnuncioForm").parent();
	$(tooltip).prependTo($to).hide().show("blind");
};

function funzionalitaMenuTendina(){
	$(".eliminaAnnuncio").click(function(){
		var myId = $(this).parent().parent().find("button").attr("idAnnuncio");
		$("#eliminaAnnuncioQ").attr("idAnnuncio",myId);
		$("#EliminaAnnuncio").modal("show");
	});
	$(".modificaAnnuncio").click(function(){
		var myId = $(this).parent().parent().find("button").attr("idAnnuncio");
		$("#annuncioIdent").val(myId);
		caricaInserisciAnnuncio();
	});
	$(".segnaAgenziaAnnuncio").click(function(){
		var myId = $(this).parent().parent().find("button").attr("idAnnuncio");
		$("#segnaComeAgenziaQ").attr("idAnnuncio",myId);
		$("#SegnaComeAgenzia").modal("show");
	});
	

};

function caricaInserisciAnnuncio(){
	$.post("/alpha/annuncio/getAnnuncio",
			{
			id: $("#annuncioIdent").val()
			},
			function(data){
			$("#telefonoA").val(data.telefono);
			$("#risposta").val(data.risposta);
			$("#composizione").val(data.composizione);
			$("#indirizzo").val(data.indirizzo);
			$("#noteA").val(data.note);
			$("#prezzo").val(data.prezzo);
			$("#zona").val(data.zona);
			$("#metriQuadrati").val(data.metriQuadrati);
			showInserisciAnnuncio();
			});
};	

function showInserisciAnnuncio(){
	$("#InserisciAnnuncio").modal("show");
	$("#verificaNumero").removeClass("btn-warning").addClass("btn-success");
	$("#saveAnnuncioForm").find("input,label,span,a,select,textarea").show();
};