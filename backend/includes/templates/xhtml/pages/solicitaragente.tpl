<form action="solicitaragente.php" name='form' id='form' style='display:inline;' method='POST'>
	<input type='hidden' name='sendMail' id='sendMail' value='1'>	
	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Solicitud de Agente de Venta</td></tr>
	<tr><td style="height:5px"></td></tr>
	<tr>
		<td align="left"><div id='mensajeError' style='height:20px;margin-left:20px;padding-top:5px'>{EmailError}</div></td>
	</tr>

	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Datos Personales</td></tr>
	<tr>
		<td valign='top'>
			<table cellpadding='0' cellspacing='5' width='100%' class='TablePermits'>
			<tr>
				<td width='140' align="left">(*)Nombre:</td>
				<td width='140' align="left">(*)Apellido:</td>
				<td width='140' align="left">Direcci&oacute;n</td>				
			</tr>					
			<tr>
				<td align="left"><input type='text' name='sNombre' id='sNombre' style='width:120px;'/></td>		
				<td align="left"><input type='text' name='sApellido' id='sApellido' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sDireccion' id='sDireccion' style='width:120px;'/></td>
			</tr>
			<tr>
				<td width='140' align="left">Telefono:</td>
				<td width='140' align="left">Celular:</td>
				<td width='140' align="left">E-mail:</td>
			</tr>	
			<tr>
				<td align="left"><input type='text' name='sTelefono' id='sTelefono' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sCelular' id='sCelular' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sMail' id='sMail' style='width:120px;'/></td>
			</tr>
			</table>
		</td>
	</tr>	
	</table>
	<div style="height:10px"></div>
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Datos de Contacto</td></tr>
	<tr>
		<td valign="top">	
			<table cellpadding='0' cellspacing='5' class='TablePermits' border="0" width="100%" style='text-align:left'>
			<tr>
				<td width='140' align="left">Horario de Entrevista:</td>
				<td width='140' align="left">Horario de Comunic. Telf&oacute;nica:</td>
				<td width='140' align="left"></td>
			</tr>
			<tr>
				<td align="left"><input type='text' name='sHrEntrevista' id='sHrEntrevista' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sHrTel' id='sHrTel' style='width:120px;'/></td>
				<td></td>
			</tr>
			
			</table>
		</td>
	</tr>
	</table>	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td  align='left' style='height:20px;padding-left:5px'>Descripcion:</td></tr>
	<tr>
		<td valign="top" align="left" style="padding-left:5px"><textarea id="sDescripcion" name="sDescripcion" rows="5" cols="55"></textarea></td>	
	</tr>
	<tr><td style="height:5px"></td></tr>
	<tr>
		<td align="left" style="padding-left:5px"><input type='submit' name='cmd_submit' id='cmd_submit' onclick="javascript:return validarDatosForm();" value='Enviar'>&nbsp;&nbsp;<input type='button' name='cmd_borrar' id='cmd_borrar' onclick="javascript:form.reset();" value='Borrar'>
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
			/*if (sTelefono.value == ""){
				errores += "- El Telefono es requerido.\n";
			}
			if (sMail.value == ""){
				errores += "- El E-mail es requerido.\n";
			}*/			
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
		//alert('paso');
		xajax_updateDatosPedido(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		//Formu.idProvincia.value = 8162;
		//Formu.idLocalidad.value = 8163;
		Formu.idPedido.value = 0;		
	}

</script>