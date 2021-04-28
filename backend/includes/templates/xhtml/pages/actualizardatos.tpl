<form action="" name='form' id='form' method='POST'>
	<input type='hidden' name='idUsuario' id='idUsuario' value='{ID_USUARIO}' />	
	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Actualizar Datos Personales</td></tr>
	<tr><td style="height:10px"></td></tr>
	<tr>
			<td id='tdFormRegistrar'>
  			<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
      	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Datos Personales</td></tr>
      	<tr>
      		<td valign='top'>
      			<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
      			<tr>
      				<td width='140' align="left">(*)Nombre:</td>
      				<td width='140' align="left">(*)Apellido:</td>
      				<td width='140' align="left">Direcci&oacute;n</td>				
      			</tr>					
      			<tr>
      				<td align="left"><input type='text' name='sNombre' id='sNombre' style='width:120px;' value='{NOMBRE}'/></td>		
      				<td align="left"><input type='text' name='sApellido' id='sApellido' style='width:120px;' value='{APELLIDO}'/></td>
      				<td align="left"><input type='text' name='sDireccion' id='sDireccion' style='width:120px;' value='{DIRECCION}'/></td>
      			</tr>
      			<tr>
      				<td width='140' align="left">Telefono:</td>
      				<td width='140' align="left">Celular:</td>
      				<td width='140' align="left">E-mail:</td>
      			</tr>	
      			<tr>
      				<td align="left"><input type='text' name='sTelefono' id='sTelefono' style='width:120px;' value='{TELEFONO}'/></td>
      				<td align="left"><input type='text' name='sMovil' id='sMovil' style='width:120px;' value='{CELULAR}'/></td>
      				<td align="left"><input type='text' name='sMail' id='sMail' style='width:120px;' value='{MAIL}'/></td>
      			</tr>
      			</table>
      		</td>
      	</tr>	
      	<tr><td style="height:10px"><td></tr>
      	<tr>
      		<td align="left" style="padding-left:5px"><input type='button' name='cmd_submit' id='cmd_submit' onclick="sendForm(this);" value='Enviar'>&nbsp;&nbsp;<input type='button' name='cmd_borrar' id='cmd_borrar' onclick="javascript:form.reset();" value='Borrar'>
      		</td>
      	</tr>
  			</table>
			</td>
	</tr>		
	</table>	
</form>
	<script type='text/javascript'>
	function validarDatosForm(){
		var errores = "";
		var formu=document.forms['form'];
		with (formu){
			if (sNombre.value == ""){
				errores += "- El Nombre es requerido.\n";
			}	
			if (sApellido.value == ""){
				errores += "- El Apellido es requerido.\n";
			}				
		}
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}
	
	function sendForm(form){
		if(!validarDatosForm())
		{
			return;
		}
		xajax_updateDatosUsuario(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		//Formu.idProvincia.value = 8162;
		//Formu.idLocalidad.value = 8163;
		Formu.idPedido.value = 0;		
	}

</script>