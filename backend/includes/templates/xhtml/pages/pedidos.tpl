<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idPedido" name="idPedido" value="0" />
	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Pedidos</td></tr>
	<tr><td style="height:5px"></td></tr>
	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Datos de la Persona</td></tr>
	<tr>
		<td valign='top'>
			<table cellpadding='0' cellspacing='5' width='100%' class='TablePermits'>
			<tr>
				<td width='140' align="left">(*)Nombre:</td>
				<td width='140' align="left">(*)Apellido:</td>
				<td width='140' align="left">(*)Telefono/Celular:</td>
				<td width='140' align="left">(*)E-mail:</td>
			</tr>	
				<td align="left"><input type='text' name='sNombre' id='sNombre' style='width:120px;'/></td>		
				<td align="left"><input type='text' name='sApellido' id='sApellido' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sTelefono' id='sTelefono' style='width:120px;'/></td>
				<td align="left"><input type='text' name='sMail' id='sMail' style='width:120px;'/></td>
			</tr>
			</table>
		</td>
	</tr>	
	</table>
	<div style="height:10px"></div>
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Datos del Vehiculo</td></tr>
	<tr>
		<td valign="top">	
			<table cellpadding='0' cellspacing='5' class='TablePermits' border="0" width="100%" style='text-align:left'>
			<tr>
				<td width='140' align="left">(*)Tipo:</td>
				<td width='140' align="left">(*)Vehiculo:</td>
				<td width='140' align="left">(*)Marca:</td>
				<td width='140' align="left">(*)Modelo:</td>
			</tr>
			<tr>
				<td align="left"><select name='idTipoUso' id='idTipoUso' style='width:120px;'>
						{OPCIONES_TIPOVEHICULOS}
					</select>
				</td>
				<td><select name='idTipoVehiculo' id='idTipoVehiculo' style='width:120px;'>
						{OPCIONES_VEHICULOS}
					</select>
				</td>				
				<td><select name='idMarca' id='idMarca' style='width:120px;'>
						{OPCIONES_MARCAS}
					</select>
				</td>
				<td><select name='idModelo' id='idModelo' style='width:120px;'>
						{SCRIPT_MODELOS}
					</select>
				</td>
			</tr>
			<tr>
				<td width='140'>(*)A&ntilde;o:</td>
				<td>(*)Precio:</td>
				<td>(*)Puertas:</td>
				<td>(*)Color:</td>				
			</tr>
			<tr>
				<td><input type='text' name='iAnio' id='iAnio' style='width:120px;'/></td>
				<td><input type='text' name='fPrecio' id='fPrecio' style='width:120px;'/></td>
				<td><input type='text' name='iPuertas' id='iPuertas' style='width:120px;'/></td>
				<td><select name='idColor' id='idColor' style='width:120px;'>
						{OPCIONES_COLORES}
					</select></td>
			</tr>	
			</table>
		</td>
	</tr>
	</table>	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr><td  align='left' style='height:20px;padding-left:5px'>Descripcion:</td></tr>
	<tr>
		<td valign="top" align="left" style="padding-left:5px"><textarea id="sDescripcion" rows="5" cols="55"></textarea></td>	
	</tr>
	<tr><td style="height:5px"></td></tr>
	<tr>
		<td align="left" style="padding-left:5px"><input type='button' name='cmd_submit' id='cmd_submit' onclick="sendForm(this);" value='Enviar'>&nbsp;&nbsp;<input type='button' name='cmd_borrar' id='cmd_borrar' onclick="javascript:form.reset();" value='Borrar'>
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
			if (sTelefono.value == ""){
				errores += "- El Telefono es requerido.\n";
			}
			if (sMail.value == ""){
				errores += "- El E-mail es requerido.\n";
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