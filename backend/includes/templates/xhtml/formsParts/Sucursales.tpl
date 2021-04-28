<center>
<form action='OperationsSucursal.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6'>
<tr>
<th align='right'>Provincia</th>
<td align='left'>&nbsp;
	<select name='idProvincia' id='idProvincia' style='width:150px;'>
		<option value='0'>[-Seleccionar-]</option>
		{OptionsProvincias}
	</select>
</td>
<th align='right'>Localidad</th>
<td align='left' id='tdLocalidad'>&nbsp;
	<select name='idLocalidad' id='idLocalidad' style='width:150px;'>
		<option value='0'>[-Seleccionar-]</option>
		{OptionsLocalidades}
	</select>
</td>			
</tr>	
<tr>
	<th width='150'>Sucursal</th>
	<td colspan='3'><input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='80'></td>	
</tr>
<tr>
	<th width='150'>Direccion</th>
	<td colspan='3'><input type='text' name='sDireccion' id='sDireccion' value='{sDireccion}' size='80'></td>	
</tr>
<tr>
	<th>Codigo Postal</th>
	<td><input type='text' name='sCodigoPostal' id='sCodigoPostal' value='{sCodigoPostal}' size='40'><span class='LetraChica'>Ej.: 4400</span></td>		
	<th>Telefono</th>
	<td><input type='text' name='sTelefono' id='sTelefono' value='{sTelefono}' size='40'><span class='LetraChica'>Ej.: 4251256</span></td>			
</tr>
<tr>
	<th>Fax</th>
	<td><input type='text' name='sFax' id='sFax' value='{sFax}' size='40'></td>			
	<th>Celular</th>
	<td><input type='text' name='sCelular' id='sCelular' value='{sCelular}' size='40'></td>		
</tr>
<tr>
	<th>Email</th>
	<td><input type='text' name='sMail' id='sMail' value='{sMail}' size='40'><span class='LetraChica'>Ej.: PagueRap@midominio.com</span></td>			
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operation' id='Operation' value='New'>
		<input type='hidden' name='id' id='id' value='{id}'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosSucursales();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:document.location.href='Sucursales.php'">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">
	var Provincia = document.getElementById('idProvincia');
	
	Provincia.onchange = function (){
		xajax_tagSelectLocalidades(document.forms['form'].idProvincia.value);
	}

	document.forms['form'].idProvincia.value = '{idProvincia}';
	document.forms['form'].idLocalidad.value = '{idLocalidad}';
		
	{JAVASCRIPT_ADICIONAL}
	
</script>

   