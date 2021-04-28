<body style="background-color:#FFFFFF">

	<form action="" enctype="multipart/form-data" name="formFinalizarPlan" id="formFinalizarPlan" method="POST">
	<fieldset>
	<legend></legend>
	<input type="hidden" name="hdnCodigo" id="hdnCodigo" value="{CODIGO}" />	
	<input type="hidden" name="hdnNroCliente" id="hdnNroCliente" value="{NRO_CLIENTE}" />	
	<input type="hidden" name="hdnTotal" id="hdnTotal" value="{TOTAL_PROFORMA}" />		
	<input type="hidden" value="1" name="ok">

	<table style="font-family:Tahoma;font-size:10pt;">
	<tr>
		<th style="width:80px" align="right">Codigo Proforma:</th>
		<td><input type="text" name="sCodigo" id="sCodigo" style="width:150px;" value="{CODIGO}" readonly ></td>
	</tr>
	<tr>
		<th style="width:80px" align="right">Precio Proforma:</th>
		<td><input type="text" name="sPrecioProforma" id="sPrecioProforma" style="width:150px;" value="{TOTAL_PROFORMA_CONSIGNO}" readonly ></td>
	</tr>
	<tr>
		<th style="width:160px" align="right">(*)Fecha de Fin:</th>
		<td>
			<input type="text" id="dFechaFin" name="dFechaFin" value="" style="width:150px;" />	
		</td>
	</tr>
	<tr>
		<th align="right">(*)Monto Final:</th>
		<td><input type="text" name="fMontoFin" id="fMontoFin" style="width:150px;" ></td>
	</tr>
	<tr>
		<th align="right">(*)Tipo de Cliente:</th>
		<td>
			<select id="idTipoCliente" name="idTipoCliente" style="width:150px;">		
			{OPCIONES_TIPOSCLIENTES}
			</select>
		</td>
	</tr>
	<tr>
		<th align="right" valign="top">Observacion:</th>
		<td><textarea id="sObservacion" name="sObservacion" cols="30" rows="3"></textarea></td>
	</tr>
	</table>	
	<button type="button" onclick="javascript:enviar(this.form.id)" style="margin-top:5px;">Aceptar</button>	<button type="button" onclick="javascript:cerrarVentana()" style="margin-top:5px;">Cancelar</button>
	</fieldset>

	</form>
	
	<script language="javascript">
	function enviar(id)
	{
		var formu=document.forms[id];
		var mensaje='';
	    if(formu.dFechaFin.value == '') mensaje +='El campo Fecha de Fin es requerido.\n';
	    if(formu.fMontoFin.value == '') mensaje +='El campo Monto Final es requerido.\n';
	    if(formu.idTipoCliente.value == '0') mensaje +='El campo Tipo de Cliente es requerido.';
	    
		if (mensaje=='') 
			xajax_finalizarPlanManual(xajax.getFormValues('formFinalizarPlan'));
	    else alert(mensaje);
	}
	
	function cerrarVentana(){
		parent.Windows.close(parent.Windows.focusedWindow.getId());
		parent.resetListado();
	}
	
	function resetDatosForm(){
		cerrarVentana();
	}
	
	function updateCobranza(idEstadoCobranza){
    	xajax_updateCobranza(xajax.getFormValues('formDeuda'),idEstadoCobranza);
    }
    
    
	/*function InputMask(id,sFormato){
		jQuery(function($){
	        $("#"+id+"").mask(sFormato);  
		});
	}*/
	//InputMask('dFechaFin',"99/99/9999");
	</script>

