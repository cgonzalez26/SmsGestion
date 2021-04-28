<center>
<form action='Operationsoffice.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6'>

<tr>
	<th>Sucursal</th>
	<td><select name='idSucursal' id='idSucursal'><option value='0'>[-Seleccionar-]</value>{OptionsSucursales}</select></td>	
	<th>Oficina</th>
	<td><input type='text' name='sApodo' id='sApodo' value='{sApodo}' size='40'></td>	
</tr>
<tr>
	<th>Nombre</th>
	<td><input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='40'></td>	
	<th>Apellido</th>
	<td><input type='text' name='sApellido' id='sApellido' value='{sApellido}' size='40'></td>		
</tr>
<tr>
	<th>Documento</th>
	<td><input type='text' name='sDocumento' id='sDocumento' value='{sDocumento}' size='40'><span class='LetraChica'>Ej.: 29586067 (9 Digitos)</span></td>		
	<th>Inicio Act.</th>
	<td><input type='text' name='dFechaInicio' id='dFechaInicio' value='{dFechaInicio}' size='40'><span class='LetraChica'>Ej.: 05/12/2009</span></td>			
</tr>
<tr>
	<th>Direccion</th>
	<td><input type='text' name='sDireccion' id='sDireccion' value='{sDireccion}' size='40'></td>			
	<th>Comision</th>
	<td><input type='text' name='fComision' id='fComision' value='{fComision}' size='40'><span class='LetraChica'>Ej.: 0.25 = 25%</span></td>		
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operation' id='Operation' value='New'>
		<input type='hidden' name='id' id='id' value='{id}'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'><input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosOffice();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:document.location.href='Oficinas.php'"></td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">
	
	{JAVASCRIPT_ADICIONAL}
	
</script>

