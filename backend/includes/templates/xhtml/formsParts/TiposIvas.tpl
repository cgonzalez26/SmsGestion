<center>
<form action='TiposIvas.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td class='TituloFormularioTipoIva' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Tipo Iva</span>
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
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return verificaDatosTipoIva();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:resetFormGeneric();">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">

	function setFormGeneric(idTipoIva,nombreTipoIva){
		var Formu = document.forms['form'];
		
		Formu.sNombre.value = nombreTipoIva;		
		Formu.id.value = idTipoIva;
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