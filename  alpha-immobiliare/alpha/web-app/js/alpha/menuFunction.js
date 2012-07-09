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
				title:"Creazione scheda",
				content:"Puoi creare la scheda ora o in un altro momento.<br>" +
						"Se crei la scheda ora,l'annuncio sar&agrave; automaticamente salvato"
			});
	
	$("#saveAnnuncio").click(function(){
		$salvaB = $(this);
		$salvaB.hide();
		$.post("/alpha/annuncio/saveAnnuncio",
				{
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
					
				})
		.success(function(){
			salvataggioOk("#saveAnnuncioForm");
			
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
	
	$("#prezzo,#telefonoA").keyup(function () { 
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
				function(data){})
			.success(function(){
				$("#verificaNumero").removeClass("btn-warning").addClass("btn-success");
				$("#saveAnnuncioForm").find("input,label,span,a,select,textarea").show();
			})
			.error(function(){
				$("#verificaNumero").removeClass("btn-warning").addClass("btn-danger");
				$("#verificaNumero").tooltip('show');
				setTimeout("$('#verificaNumero').tooltip('hide')",2500);
				
			});
	});
	
	$("#InserisciAnnuncio").on("show",function(){
		$("#saveAnnuncioForm").find("input,label,span,a,select,textarea").hide()
		$("#telefonoA").parent().find("*").show();
		
	});
	
	$("#InserisciAnnuncio").on("hidden",function(){	
		$(".toClose").remove();
		$("#saveAnnuncio").show();
		$("#saveAnnuncioForm input").val("");
		$("#verificaNumero").removeClass("btn-success btn-danger").addClass("btn-warning");
	});
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
						salvataggioOk("#saveAnnuncioForm");
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


function salvataggioOk(formId){
	var tooltip= '<div class="alert alert-success toClose">Annuncio salvato con successo,<br> puoi chiudere la finestra</div>';
	$(tooltip).appendTo($(formId).parent()).hide().show("blind",function(){
		$("#InserisciAnnuncio .modal-body").scrollTop(1000);
	});	
	
}