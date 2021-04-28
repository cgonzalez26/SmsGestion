<center>
<div style='width:400px;text-align:right;'><a href='javascript:void(0);' onclick='javascript:resetFormGeneric();'>[Nuevo]</a></div>
<form action='Anulaciones.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<fieldset>
	<div class='espacio'></div>
	<legend>Tipo de anulacion</legend>
	<div>Nombre &nbsp;<input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='30'>&nbsp;<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosTiposAnulaciones();"></div>
		<input type='hidden' name='Operations' id='Operations' value='New'>
		<input type='hidden' name='id' id='id' value='0'>
	<div class='espacio'></div>
</fieldset>


<!--<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td class='TituloFormularioTipoIva' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Tipos Anulaciones</span>
</td>
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
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return verificaDatosTipoIva();">
	</td>
</tr>
</table>-->
</form>
</center>

<script language="JavaScript">

	function setFormGeneric(idTipoAnulacion,nombreTipoAnulacion){
		var Formu = document.forms['form'];
		
		Formu.sNombre.value = nombreTipoAnulacion;		
		Formu.id.value = idTipoAnulacion;
		Formu.Operations.value = "Edit";
		Formu.sNombre.focus();
	}
	
	function resetFormGeneric(){
		var Formu = document.forms['form'];
		
		Formu.sNombre.value = "";		
		Formu.Operations.value = "New";
		Formu.sNombre.focus();
	}
	
	{JAVASCRIPT_ADICIONAL}
	
</script>