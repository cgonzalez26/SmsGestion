<!--<div class='espacio'></div>-->
<table align="center" cellpadding='0' cellspacing='5'>
<!--<tr>
<td align="left" style='border-bottom:1px solid #CCC;'><span class='titleCobranza'>Buscar Datos</span></td>
<td align="left" style='border-bottom:1px solid #CCC;'><span class='titleCobranza'>Caja Diaria</span></td>
</tr>-->
<tr><td colspan='2'>{CAJA_DIARIA}</td></tr>
<tr>
<td width="100%" align="left" valign='top' colspan='2'>
	<fieldset><legend> &nbsp; <img src="{IMAGES_DIR}/search.png" title='Buscar' border='0' align='absmiddle'><strong>Buscar</strong></legend>
		<form action="javascript:getRecord();" method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
		<table id='addMovimiento' class='searchPago' cellpadding='6' cellspacing='6' align="left">
		<tr>
		<td align='right' width='150'>Empresa</td>
		<td align='left' id='tdEmpresas'>
			<select name='idEmpresa' id='idEmpresa' style='width:250px'>
				<option value='0'>[-Seleccionar-]</option>
				{OptionsEmpresas}
			</select>
		</td>
		</tr>
		<tr>
		<td align='center' id='tdFormasCobranzas' colspan='2'></td>
		</tr>
		<!--<tr><td colspan='2'>&nbsp;</td></tr>-->
		<tr>
			<td colspan='2' align='center' style='text-align:center !important;'>
				<input type='hidden' name='Operations' id='Operations' value='New'>
				<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return true;">		
			</td>
		</tr>
		</table>
		</form>
	</fieldset>
</td>

</tr>

<!--<tr>
<td colspan='2'>&nbsp;</td>
</tr>-->

<tr>
<td id='tdFichaCobro' colspan='2' align='center' height='200'>
&nbsp;{ReciboPagueRap}
</td>
</tr>
</table>

<script language="JavaScript">		
	var Empresa = document.getElementById('idEmpresa');
	
	Empresa.onchange = function (){
		xajax_generateXHTMLFormasCobranzas(Empresa.value);
	}

	function getRecord(){
		viewMessageLoad('tdFichaCobro');
		document.getElementById('idMessage').innerHTML = '';		
		xajax_generateRecord(xajax.getFormValues('form'));		
	}	
	
	function loadPago(){
		var Formu = document.forms['formPago'];
		viewMessageLoad('tdFormPago');
		alert(Formu.Efectivo.value);
		xajax_setPagoEmpresa(xajax.getFormValues('formPago'));
		//setTimeout('writeMessage()', 1000)
		
	}	
	
	function writeMessage(){
		document.getElementById('tdFormPago').innerHTML = "<tr><td style='color:#FF0000;font-family:Tahoma;font-size:11px;' valign='top'>--------->Se registro su Pago</td></tr>";		
	}
	
	function registrarPago(){
		
		var Formu = document.forms['formPagohg'];
		viewMessageLoad('tdFichaCobro');
		document.getElementById('idMessage').innerHTML = '';
				
		xajax_registrarPago(xajax.getFormValues('formPagohg'));		
		//xajax_registrarPago(document.forms['formPago']);
	}	

	function elementForm(){		
		var Formu = document.forms['formPagohg'];
		
		
	}
	
	{JAVASCRIPT_ADICIONAL}	

</script>
