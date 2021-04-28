<center>
<form action='OperationsCompanies.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6'>
<tr>
	<th>Condicion Iva</th>
	<td><select name='idTipoIva' id='idTipoIva' style='width:200px;'><option value='0'>[-Seleccionar-]</value>{OptionsTiposIvas}</select></td>	
	<th>Razon Social</th>
	<td><input type='text' name='sRazonSocial' id='sRazonSocial' value='{sRazonSocial}' size='40'></td>
</tr>
<tr>
	<th>Direccion</th>
	<td colspan='3'><input type='text' name='sDireccion' id='sDireccion' value='{sDireccion}' size='60'></td>	
</tr>
<tr>
	<th>Telefono</th>
	<td colspan='3'><input type='text' name='sTelefono' id='sTelefono' value='{sTelefono}' size='40'></td>		
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='Operation' id='Operation' value='New'>
		<input type='hidden' name='id' id='id' value='{id}'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'><input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkDatosEmpresas();">&nbsp;&nbsp;<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:document.location.href='Empresas.php'"></td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">
	var nameCompanyStatus = false;
	var ERROR = 'Se han producido los siguientes errores: \n';
	
	function changeStatus(booleano){
		nameCompanyStatus = booleano;	
	}
	
	function checkDatosEmpresas(){
		var Formu = document.forms['form'];
		var sms = '';
		
		if(Formu.sRazonSocial.value == ""){
			sms += '- Nombre de Compania Invalido \n';
		}
		
		
		if(sms != ""){
			alert(ERROR + sms);
			return false;
		}else{
			return true;
		}
		
		
	}

	{JAVASCRIPT_ADICIONAL}
	
</script>

