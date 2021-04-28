<center>
<div class='TituloFormPago'><span>Nuevo Pago</span></div>
<form action='Cobranzas.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='addMovimiento' class='addMovimiento' cellpadding='6' cellspacing='6'>
<tr>
<td align='right'>Empresa</td>
<td align='left' id='tdEmpresas'>
	<select name='idEmpresa' id='idEmpresa'>
		<option value='0'>[-Seleccionar-]</option>
		{OptionsEmpresas}
	</select>
</td>
</tr>
<tr>
<td align='right'>Tipo Pago</td>
<td align='left' id='tdTiposPagos'>
	<select name='idTipoPago' id='idTipoPago'>
		<option value='0'>[-Seleccionar-]</option>		
		{OptionsTiposPagos}
	</select>
</td>
</tr>
<tr>
<td align='right'>Importe Real</td>
<td align='left'> <strong>$</strong> <input type='text' name='fImporteReal' id='fImporteReal' value='' size='25' dir='rtl'></td>
</tr>
<tr>
<td align='right'>Importe Cobrado</td>
<td align='left'> <strong>$</strong> <input type='text' name='fImporteCobrado' id='fImporteCobrado' value='' size='25' dir='rtl'></td>
</tr>
<tr>
<td align='right'>Comprobante</td>
<td align='left'><input type='text' name='sNumeroComprobante' id='sNumeroComprobante' value='' size='35' onblur='xajax_checkNumeroComprobante(this.value);'></td>
</tr>
<tr>
<td align='center' id='tdMensajeCheckRecibo' colspan="2" align="center"></td>
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operations' id='Operations' value='New'>
	</td>
</tr>
<tr>
	<td colspan='2' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return true;">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">		
	var NumeroComprobanteValido = false;	

	function NumeroReciboCheck(booleano){
		NumeroComprobanteValido = booleano;
	}
	
	{JAVASCRIPT_ADICIONAL}	

</script>

