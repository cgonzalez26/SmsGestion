<center>
<form action='OperationsUser.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6'>
<tr>
	<th>Login *</th>
	<td><input type='text' name='sLogin' id='sLogin' value='{sLogin}' size='40' onblur='esValido();'></td>	
	<th>Password *</th>
	<td><input type='password' name='sPassword' id='sPassword' value='' size='40'></td>		
</tr>
<tr>
	<th>&nbsp;</th>
	<td><div id='LoginValid'></div></td>	
	<th>Repita *</th>
	<td><input type='password' name='sPasswordTwo' id='sPasswordTwo' value='' size='40'></td>		
</tr>
<tr>
	<th>Sucursal</th>
	<td><select name='idSucursal' id='idSucursal'><option value='0'>[-Seleccionar-]</value>{OptionsSucursales}</select></td>	
	<th>Oficina</th>
	<td><div id='tdOficina'><select name='idOficina' id='idOficina'><option value='0'>[-Seleccionar-]</value>{OptionsOficinas}</select></div></td>	
</tr>
<tr>
	<th>Nombre</th>
	<td><input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='40'></td>	
	<th>Apellido</th>
	<td><input type='text' name='sApellido' id='sApellido' value='{sApellido}' size='40'></td>		
</tr>
<tr>
	<th>Direccion</th>
	<td><input type='text' name='sDireccion' id='sDireccion' value='{sDireccion}' size='40'></td>		
	<th>Email</th>
	<td><input type='text' name='sMail' id='sMail' value='{sMail}' size='40'></td>			
</tr>
<tr>
	<th>Movil</th>
	<td><input type='text' name='sMovil' id='sMovil' value='{sMovil}' size='40'></td>	
	<th>Estado</th>
	<td><select name='sEstado'><option value='AUTORIZADO'>Autorizado</option><option value='DENEGADO'>Denegado</option></select></td>		
</tr>
<tr>
	<th valign="top" style='border-top:0px solid #000;'>Permisos</th>
	<td colspan='3' style='border-top:1px solid #CCC;'>{TipoUsuario}</td>
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operation' id='Operation' value='New'>
		<input type='hidden' name='id' id='id' value='{id}'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'><input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosUser();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:document.location.href='Usuarios.php'"></td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">

	var Sucursal = document.getElementById('idSucursal');
	var LoginPermitido = false;
	Sucursal.onchange = function (){
		xajax_getTagSelectOficinas(document.forms['form'].idSucursal.value);
	}
	
	function esValido(){
		var Formu = document.forms['form'];
		xajax_Validate(Formu.sLogin.value);
	}
	
	
	function estaLogin(booleano){
		if(booleano == 1){
			LoginPermitido = false;
		}else{
			LoginPermitido = true;
		}
	}
	
	{JAVASCRIPT_ADICIONAL}
	
</script>

