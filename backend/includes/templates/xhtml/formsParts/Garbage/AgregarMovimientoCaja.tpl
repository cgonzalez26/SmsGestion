<center>
<form action='Cajas.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='addMovimiento' class='addMovimiento' cellpadding='6' cellspacing='6'>
<tr>
<td align='right' width='60'>
	[&nbsp;E&nbsp;]ntrada 
	[&nbsp;S&nbsp;]alida&nbsp;&nbsp;&nbsp;
</td> 
<td align='left' valign='top' width='50'>
	<select name='idTipoMovimiento' id='idTipoMovimiento' style='width:50px;'>
		<option value='0'>[---]</option>		
		<option value='1'>[E]</option>
		<option value='2'>[S]</option>
	</select>
</td>

<td align='right' width='60'>Concepto</td>
<td id='tdConceptos' align='left' width='180'>
	<select name='Concepto' id='Concepto' style='width:150px;'>
		<option value='0'>[-Seleccionar-]</option>		
	</select>
</td>
</tr>

<tr>
<td align='right'>Comprobante</td>
<td align='left' colspan='3'><input type='text' name='sComprobante' id='sComprobante' value='' size='52'></td>
</tr>
<tr>
<td align='right'>Detalle</td>
<td align='left' colspan='3'><textarea name='sDetalle' id='sDetalle' rows='2' cols='32'></textarea></td>
</tr>
<tr>
<td align='right'>Importe <strong>$</strong></td>
<td align='left' colspan='3'>
	<input type='text' name='fImporte' id='fImporte' value='' size='52' dir='rtl'>	
</td>
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operations' id='Operations' value='New'>
		<!--<input type='hidden' name='id' id='id' value='{id}'>-->
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosAgregarMovimiento();">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">		
	var TiposMovimientos = document.getElementById('idTipoMovimiento');

	TiposMovimientos.onchange = function (){		
		xajax_tagSelectMovimientos(TiposMovimientos.value);
	}
</script>

