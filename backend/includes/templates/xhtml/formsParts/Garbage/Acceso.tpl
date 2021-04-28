<center>
<form action='OperationsAccess.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6'>
<tr>
	<th>Empresa</th>
	<td><select name='idEmpresa' id='idEmpresa'><option value='0'>[-Seleccionar-]</value>{OptionsEmpresas}</select></td>	
	<th>Tipo Conexion</th>
	<td><select name='idTipoConexion' id='idTipoConexion'><option value='0'>[-Seleccionar-]</value>{OptionsTiposConexiones}</select></td>	
</tr>
<tr>
	<th>Nombre BD</th>
	<td><input type='text' name='sNombreDB' id='sNombreDB' value='{sNombreDB}' size='40'></td>	
	<th>Host</th>
	<td><input type='text' name='sHost' id='sHost' value='{sHost}' size='40'></td>		
</tr>
<tr>
	<th>Usuario</th>
	<td><input type='text' name='sUsuario' id='sUsuario' value='{sUsuario}' size='40'></td>	
	<th>Password</th>
	<td><input type='text' name='sPassword' id='sPassword' value='{sPassword}' size='40'></td>		
</tr>
<tr>
	<th>Puerto</th>
	<td><input type='text' name='sPuerto' id='sPuerto' value='{sPuerto}' size='40'></td>	
	<th>&nbsp;</th>
	<td></td>
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='type' id='type' value='NewAccess'>
		<input type='hidden' name='id' id='id' value='{id}'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return true;">&nbsp;&nbsp;
		<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:document.location.href='Accesos.php'">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">
	
	{JAVASCRIPT_ADICIONAL}
	
</script>
