<table cellpadding='0' cellspacing='0' border="0" width="100%">								
<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Contactos</td></tr>
<tr>					
	<td colspan='2'>
		<div style='margin-left:30px'>													
			
		<form action="contactos.php" name='FormEmail' id='FormEmail' style='display:inline;' method='POST'>
		
		<table cellpadding='2' cellspacing='2' class='TableEmail' border="0" style="text-align:left">
		<tr>
			<td colspan="2"><div id='mensajeError' style='height:20px;margin-left:20px;padding-top:5px'>{EmailError}</div></td>
		</tr>
		<tr><td colspan="2" style="height:10px"></td></tr>
		<tr>
			<td class='Bold' style="width:120px">(*)Nombre:</td>
			<td><input type='text' name='sNombre' id='sNombre' value='' size='30'></td>
		</tr>
		<tr>
			<td class='Bold'>(*)Apellido:</td>
			<td><input type='text' name='sApellido' id='sApellido' value='' size='30'></td>
		</tr>
		<tr>
			<td class='Bold'>(*)E-Mail :</td>
			<td><input type='text' name='sEmail' id='sEmail' value='' size='30'></td>
		</tr>
		<tr>
			<td class='Bold'>Telefono o Celular :</td>
			<td><input type='text' name='sTelefono' id='sTelefono' value='' size='30'></td>
		</tr>
		<tr>
			<td class='Bold' colspan="2" align="left">(*)Mensaje :</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name='sDescripcion' id='sDescripcion' rows='4' cols='50'></textarea></td>
		</tr>								
		<tr>
			<td colspan="2">
				<input type='hidden' name='sendMail' id='sendMail' value='1'>
			</td>
		</tr>								
		<tr>
			<td colspan="2" align="left">
				<input type='submit' name='cmd_submit' id='cmd_submit' onclick="javascript:return checkFormEmail();" value='Enviar'>
			</td>
		</tr>								
		<tr>
			<td style='color:#A4A4A4;' colspan="2">(*) Campos Obligatorios</td>
		</tr>								
		</table>
		</form>
			
		</div>		
		<div style='height:10px;'></div>									
	</td>
</tr>
</table>
<script type='text/javascript'>
	function checkFormEmail(){
		var Formu = document.forms['FormEmail'];
		var ERROR = 'Por falta de datos en el formulario no se puede enviar su consulta. Por favor verifique: \n';
		var smsError = '';		
		if(Formu.sNombre.value == ''){
			smsError += '- El Nombre es requerido \n';
		}
		if(Formu.sApellido.value == ''){
			smsError += '- El Apellido es requerido \n';
		}		
		if(Formu.sEmail.value == ''){
			smsError += '- El E-Mail es requerido \n';
		}
		if(Formu.sDescripcion.value == ''){
			smsError += '- El Mensaje es requerido \n';
		}
		
		if(smsError != ''){
			alert(ERROR + smsError);
			return false;
		}else{
			return true;
		}		
	}
</script>