<center>
<form action='Localidades.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td class='TituloFormulario' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Localidades</span>
</td>
</tr>
<tr>
	<th>Provincia</th>
	<td>
		<select name='idProvincia' id='idProvincia'>
		<option value='0'>[-Seleccionar-]</option>
		{OptionsProvincias}
		</select>
	</td>	
	<th></th>
	<td></td>		
</tr>
<tr>
	<th>Nombre</th>
	<td><input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='40'></td>	
	<th></th>
	<td></td>		
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

<script language="JavaScript">	

	function setFormGeneric(idLocalidad,nombreLocalidad,idProvincia){
		var Formu = document.forms['form'];
		Formu.sNombre.value = nombreLocalidad;		
		Formu.id.value = idLocalidad;
		Formu.idProvincia.value = idProvincia;
		Formu.Operations.value = "Edit";
		Formu.sNombre.focus();
	}
	
	function resetFormGeneric(){
		var Formu = document.forms['form'];
		Formu.sNombre.value = "";		
		Formu.id.value = 0;
		Formu.idProvincia.value = 0;
		Formu.Operations.value = "New";
		Formu.sNombre.focus();
	}
	
	{JAVASCRIPT_ADICIONAL}
	
</script>