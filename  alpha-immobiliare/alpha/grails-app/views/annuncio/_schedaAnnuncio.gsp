<table id="tableScheda" class="table  table-bordered table-condensed destroyed" annuncioId="${annuncio.id}">

        <tbody>
          <tr>
          <td colspan="4">
          	<strong>Funzionario</strong> ${annuncio.utente.username}
          </td>
          <td colspan="4">
	          <strong>Data </strong>
	          <g:formatDate date="${annuncio.dataInserimento}" type="datetime" style="LONG" timeStyle="SHORT"/></td>
          <td colspan="4">
         	 <strong>Telefono</strong> ${annuncio.telefono}
          </td>
          </tr>
          
        <tr>
        <td colspan="12">
        <strong>Indirizzo</strong> ${annuncio.indirizzo?:"Nessun indirizzo inserito"}
        </td>
        
        </tr>
         <tr>
        <td colspan="6">
        <strong><center>Informazioni</center></strong>
        </td>
        <td colspan="6">
       <strong> <center>Note</center></strong>
        </td>
        </tr> 
       </tbody>
      </table>
      
      <div class="well span6 destroyed">
      <form class="form-horizontal">
        <fieldset>
          <div class="control-group">

           <div class="control-group">
            <label class="control-label" for="schedaComposizione">Proprietario</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaProprietario" value="${annuncio.schedaAssociata.proprietario}">
              
            </div>
            </div>
          <div class="control-group">
            <label class="control-label" for="schedaComposizione">Composizione</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaComposizione" value="${annuncio.composizione}">
              
            </div>
          </div>
              <div class="control-group">
                  <label class="control-label" for="schedaRiscaldamento">Riscaldamento</label>
                  <div class="controls">
                      <select id="schedaRiscaldamento" values="${annuncio.schedaAssociata.tipoRiscaldamento?.toLowerCase()}">
                          <option value="autonomo">Autonomo</option>
                          <option value="centralizzato">Centralizzato</option>
                      </select>
                  </div>
              </div>
          <div class="control-group">
            <label class="control-label" for="schedaPiano">Piano</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaPiano" value="${annuncio.schedaAssociata.piano}">
              
            </div>
          </div>
          <div class="control-group">
            <label class="control-label" for="schedaLibero">Libero</label>
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox" id="schedaLibero" value="${annuncio.schedaAssociata.libero}" ${annuncio.schedaAssociata.libero?'checked':''}>
              </label>
            </div>
              <label class="control-label" for="schedaSoffitta">Soffitta</label>
              <div class="controls">
                  <label class="checkbox">
                      <input type="checkbox" id="schedaSoffitta" value="${annuncio.schedaAssociata.soffitta}" ${annuncio.schedaAssociata.soffitta?'checked':''}>
                  </label>
              </div>
              <label class="control-label" for="schedaBox">Box</label>
              <div class="controls">
                  <label class="checkbox">
                      <input type="checkbox" id="schedaBox" value="${annuncio.schedaAssociata.box}" ${annuncio.schedaAssociata.box?'checked':''}>
                  </label>
              </div>
              <label class="control-label" for="schedaPostoAuto">Posto Auto</label>
              <div class="controls">
                  <label class="checkbox">
                      <input type="checkbox" id="schedaPostoAuto" value="${annuncio.schedaAssociata.postoAuto}" ${annuncio.schedaAssociata.postoAuto?'checked':''}>
                  </label>
              </div>
              <label class="control-label" for="schedaAscensore">Ascensore</label>
              <div class="controls">
                  <label class="checkbox">
                      <input type="checkbox" id="schedaAscensore" value="${annuncio.schedaAssociata.ascensore}" ${annuncio.schedaAssociata.ascensore?'checked':''}>
                  </label>
              </div>
          </div>
            <hr/>
          <h2>Appuntamento:</h2>
		     <div class="control-group input-append date" id="dpScheda" data-date="<g:formatDate format="dd-MM-yyyy" date="${new Date()}"/>" data-date-format="dd-mm-yyyy">
            <label class="control-label" for="schedaGiorno">Data Appuntamento:</label>
            <div class="controls">
              <input type="text" class="input-small" id="schedaGiorno" value=<g:formatDate date="${annuncio.schedaAssociata.appuntamento.giorno}" format="dd-MM-yyyy" />>
               <span class="add-on"><i class="icon-th"></i></span>
            </div>
            </div>
           <div class="control-group">
            <label class="control-label" for="schedaOra">Ora</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaOra" value="${annuncio.schedaAssociata.appuntamento.ora}">
              
            </div>
            </div>
          
                  <div class="control-group">
            <label class="control-label" for="schedaNomePersona">Nome Persona</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaNomePersona" value="${annuncio.schedaAssociata.appuntamento.nomePersona}">
              
            </div>
            </div>
            
            <div class="control-group">
            <label class="control-label" for="schedaCitofono">Citofono</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaCitofono" value="${annuncio.schedaAssociata.appuntamento.citofono}">
              
            </div>
            </div>
            
                    <div class="control-group">
            <label class="control-label" for="schedaVia">Via</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaVia" value="${annuncio.schedaAssociata.appuntamento.via}">
              
            </div>
            </div>
            <div class="control-group">
            <label class="control-label" for="schedaInterno">Interno</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaInterno" value="${annuncio.schedaAssociata.appuntamento.interno}">
              
            </div>
            </div>
            <div class="control-group">
            <label class="control-label" for="schedaTelefono">Telefono</label>
            <div class="controls">
              <input type="text" class="input-xlarge" id="schedaTelefono" value="${annuncio.schedaAssociata.appuntamento.telefonoAppuntamento}">
              
            </div>
            </div>
                            <div class="control-group">
            <label class="control-label" for="schedaIncarico">Incarico</label>
            <div class="controls">
              <label class="checkbox">
                <input type="checkbox" id="schedaIncarico" value="${annuncio.schedaAssociata.incarico}" ${annuncio.schedaAssociata.incarico?'checked':''}>
              </label>
            </div>
          </div>
      </div>
        </fieldset>
        <div id="responseScheda"></div>
        <center>
        <a id="saveScheda" class="btn btn-primary ">Salva Scheda</a>
        <hr/>
        <a id="backHome" class="btn btn-success ">Torna indietro</a>
       </center>
       
      </form>
      
      </div>
      <div class="well span6 destroyed">
      <div class="control-group">
            <label class="control-label" for="schedaTelefono">Note:</label>
            <div class="controls">
            	<textarea class="span6" id="schedaNote" rows="50" >${annuncio.schedaAssociata.noteScheda}</textarea>
              
              
            </div>
            </div>
      </div>