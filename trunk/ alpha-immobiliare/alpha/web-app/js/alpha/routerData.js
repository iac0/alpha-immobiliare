function caricaUltimiAnnunci(ultimoCaricato) {
    $.post("/alpha/annuncio/polling",
        function (data) {
            $("#ultimiAnnunci").prepend(data);
            $("#ultimiAnnunci").find(".edit_area").editable('/alpha/annuncio/editMe', {
                type: 'textarea',
                cancel: 'Cancella',
                submit: 'Salva',
                indicator: '<img src="../images/spinner.gif">',
                tooltip: 'Clicca per editare' ,
                callback : function(value, settings) {
                   $(this).text(value);
                }
            });
        });

    (function poll() {
        setTimeout(function () {
            $.ajax({
                url: "/alpha/annuncio/polling",
                success: function (data) {
                    $("#ultimiAnnunci").html(data);
                    $("#ultimiAnnunci").find(".edit_area").editable('/alpha/annuncio/editMe', {
                        type: 'textarea',
                        cancel: 'Cancella',
                        submit: 'Salva',
                        indicator: '<img src="../images/spinner.gif">',
                        tooltip: 'Clicca per editare'  ,
                        callback : function(value, settings) {
                            $(this).text(value);
                        }
                    });
                    poll();
                }
            });
        }, 30000);
    })();


};

function startRicerca() {
    $.post("/alpha/annuncio/ricerca",
        {
            telefono: $("#telefonoRicerca").val(),
            zona: $("#zonaRicerca").val(),
            prezzo: $("#prezzoRicerca").val(),
            dataDa: $("#dataDa").val(),
            dataA: $("#dataA").val(),
            idAnn: $("#idAnnRicerca").val(),
            utente: $("#utenteRicerca").val(),
            mq: $("#metriQuadriRicerca").val(),
            schedaPresente: $("#schedaPresenteRicerca").val()
        },
        function (data) {
            $("#risultatoRicerca").html(data);
            $("#risultatoRicerca").find(".edit_area").editable('/alpha/annuncio/editMe', {
                type: 'textarea',
                cancel: 'Cancella',
                submit: 'Salva',
                indicator: '<img src="../images/spinner.gif">',
                tooltip: 'Clicca per editare' ,
                callback : function(value, settings) {
                    $(this).text(value);
                }
            });
            funzionalitaMenuTendina();
        });

};

function pollingMiei() {
    $.ajax({
        url: "/alpha/annuncio/pollingMiei",
        success: function (data) {
            $("#mieiUltimiData").html(data);
            funzionalitaMenuTendina();
        }
    });
}