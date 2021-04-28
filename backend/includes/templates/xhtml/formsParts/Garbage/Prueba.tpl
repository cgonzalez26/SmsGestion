<center>
<form action='Localidades.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td class='TituloFormulario' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Registro</span>
</td>
</tr>
<tr>
	<th>Nombre</th>
	<td>
		{nom}
	</td>	
	<th>Apellido</th>
	<td>{ape}</td>		
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operations' id='Operations' value='New'>
		<input type='hidden' name='id' id='id' value='0'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return verificaDatosLocalidad();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:void(0);">
	</td>
</tr>
</table>
</form>
</center>