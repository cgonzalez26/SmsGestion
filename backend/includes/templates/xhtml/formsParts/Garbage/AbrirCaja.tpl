<center>
<form action='Cajas.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td style='border-bottom:1px solid #ccc;' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Abrir Caja Diaria</span>
</td>
</tr>
<tr>
	<th>Fecha</th>
	<td>
		<input type='text' name='sNombre' id='sNombre' value='{FECHA}' size='25' readonly>
		&nbsp;&nbsp;
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript:checkDatosCaja();">
	</td>	
	<th></th>
	<td></td>		
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operations' id='Operations' value='Create'>		
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">	

	{JAVASCRIPT_ADICIONAL}
	
</script>