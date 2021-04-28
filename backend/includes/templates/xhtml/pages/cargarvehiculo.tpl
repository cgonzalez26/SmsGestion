<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idVehi" name="idVehi" value="{ID_VEHICULO}" />
	<input type="hidden" id="sImagen" name="sImagen" value="" />		

	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
	<tr>
		<td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;' colspan="3">Cargar Vehiculo</td>
	</tr>
	<tr><td style="height:5px"></td></tr>	
	<tr>
		<td valign='top'>
		<table cellpadding='2' cellspacing='2' width='100%' class='TablePermits'>
		<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="4">Datos del Vehiculo</td>
			</tr>
		<tr>
			<td width='100'>(*)Vehiculo:</td>
			<td width='100'>(*)Tipo:</td>
			<td width='100'>(*)Marca:</td>
			<td>(*)Modelo:</td>
		</tr>
		<tr>
			<td><select name='idVehiculo' id='idVehiculo' style='width:150px;'>
					{OPCIONES_VEHICULOS}
				</select>
			</td>
			<td><select name='idTipoVehiculo' id='idTipoVehiculo' style='width:150px;'>
					{OPCIONES_TIPOVEHICULOS}
				</select>
			</td>
			<td><select name='idMarca' id='idMarca' style='width:150px;'>
					{OPCIONES_MARCAS}
				</select>
			</td>
			<td><select name='idModelo' id='idModelo' style='width:150px;'>
					{SCRIPT_MODELOS}
				</select>
			</td>
		</tr>
		<tr>
			<td>(*)Puertas:</td>
			<td>(*)A&ntilde;o:</td>
			<td>(*)Precio:</td>
			<td>(*)Color:</td>
		</tr>
		<tr>
			<td><input type='text' name='iPuertas' id='iPuertas' style='width:150px;'/></td>
			<td><input type='text' name='iAnio' id='iAnio' style='width:150px;'/></td>
			<td><input type='text' name='fPrecio' id='fPrecio' style='width:150px;'/></td>
			<td><select name='idColor' id='idColor' style='width:150px;'>
					{OPCIONES_COLORES}
				</select></td>
		</tr>	
			
		<tr>
			<td>(*)Combustible:</td>
			<td width='100'>Direcci&oacute;n:</td>
			<td>Transmisi&oacute;n:</td>
			<td>Kms:</td>
		</tr>
		<tr>
			<td><select name='idCombustible' id='idCombustible' style='width:150px;'>
						{OPCIONES_COMBUSTIBLES}
				</select></td>
			<td><select name='idDireccion' id='idDireccion' style='width:150px;'>
						{OPCIONES_DIRECCIONES}
				</select></td>
			<td><select name='idTransmision' id='idTransmision' style='width:150px;'>
					{OPCIONES_TRANSMISIONES}
				</select>
			</td>
			<td><input type='text' name='iKms' id='iKms' style='width:150px;'/></td>
		</tr>
		<tr>
			<td>Vendedor:</td>
		</tr>
		<tr>
			
			<td><select name='idAgencia' id='idAgencia' style='width:150px;'>
					{OPCIONES_AGENCIAS}
				</select></td>
		</tr>	
		</table>
		<!--<td valign="top">
			<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
		
		
			</table>
		</td>
		<td>
			<table cellpadding='0' cellspacing='0' style="width:100%;height:160px"  border='0' class='TablePermits'>					
				<tr>
			    	<th align="left"> Imagen: </th>  				
				</tr>    
				<tr>
					<td style="border:1px solid #000" align="center">
						<img id='imgVehiculo' name='imgVehiculo' src="../includes/images/internas/no_image.gif" alt="" style="border:0px;width:220px;height:120px" />
					</td>
				</tr>
				<tr>
					<td>
						<input type='button' name='cmd_Upload' value='Subir Imagen' onclick="uploadImagen('sImagen','vehiculos');" />
					</td>
				</tr>				
		    </table>
		</td>-->
	</tr>
	<tr>
		<td colspan="3">
			<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' style='font-size:9px'>
			<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="3">Confort</td>
			</tr>
			<tr>
				<td width="33%"><input type="checkbox" id="confort_1" name="confort_1" value="1"/>Aire acondicionado</td>
				<td width="33%"><input type="checkbox" id="confort_2" name="confort_2" value="1"/>Alarma de luces encendidas </td>
				<td><input type="checkbox" id="confort_3" name="confort_3" value="1"/>Apertura remota de ba&uacute;l</td>
			</tr>	
			<tr>
				<td width="33%"><input type="checkbox" id="confort_4" name="confort_4" value="1"/>Asiento conductor regulable en altura</td>
				<td><input type="checkbox" id="confort_5" name="confort_5" value="1"/>Asiento trasero rebatible</td>
				<td><input type="checkbox" id="confort_6" name="confort_6" value="1"/>Asientos el&eacute;ctricos</td>
			</tr>	
			<tr>
				<td width="33%"><input type="checkbox" id="confort_7" name="confort_7" value="1"/>Cierre centralizado de puertas</td>
				<td><input type="checkbox" id="confort_8" name="confort_8" value="1"/>Climatizador autom&aacute;tico</td>
				<td><input type="checkbox" id="confort_9" name="confort_9" value="1"/>Computadora de abordo</td>
			</tr>	
			<tr>
				<td width="33%"><input type="checkbox" id="confort_10" name="confort_10" value="10"/>Control de velocidad de crucero</td>
				<td><input type="checkbox" id="confort_11" name="confort_11" value="11"/>Cristales el&eacute;ctricos</td>
				<td><input type="checkbox" id="confort_12" name="confort_12" value="1"/>Espejos el&eacute;ctricos</td>
			</tr>	
			<tr>
				<td width="33%"><input type="checkbox" id="confort_13" name="confort_13" value="13"/>Faros regulables desde el interior</td>
				<td><input type="checkbox" id="confort_14" name="confort_14" value="14"/>GPS</td>
				<td><input type="checkbox" id="confort_15" name="confort_15" value="1"/>Sensor de estacionamiento</td>
			</tr>	
			<tr>
				<td><input type="checkbox" id="confort_16" name="confort_16" value="1"/>Sensor de lluvia</td>
				<td><input type="checkbox" id="confort_17" name="confort_17" value="1"/>Sensor de luz</td>
				<td><input type="checkbox" id="confort_18" name="confort_18" value="1"/>Tapizado de cuero</td>
			</tr>	
			<tr>					
				<td><input type="checkbox" id="confort_19" name="confort_19" value="1"/>Techo corredizo</td>
				<td></td>
				<td></td>		
			</tr>				
		</table>	
	   </td>
	</tr>
	<tr>
		<td colspan="3">
		<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' style='font-size:9px'>				<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="3">Seguridad</td>
		</tr>
		<tr>
			<td width="33%"><input type="checkbox" id="seg_1" name="seg_1" value="1"/>Airbag conductor</td>
			<td width="33%"><input type="checkbox" id="seg_2" name="seg_2" value="2"/>Airbag de cortina</td>
			<td><input type="checkbox" id="seg_3" name="seg_3" value="3"/>Airbag laterales</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="seg_4" name="seg_4" value="1"/>Airbag pasajero</td>
			<td><input type="checkbox" id="seg_5" name="seg_5" value="2"/>Alarma</td>
			<td><input type="checkbox" id="seg_6" name="seg_6" value="3"/>Apoya cabeza en asientos traseros</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="seg_7" name="seg_7" value="1"/>Blindado</td>
			<td><input type="checkbox" id="seg_8" name="seg_8" value="1"/>Control de estabilidad</td>
			<td><input type="checkbox" id="seg_9" name="seg_9" value="1"/>Control de tracci&oacute;n</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="seg_10" name="seg_10" value="1"/>Doble tracci&oacute;n</td>
			<td><input type="checkbox" id="seg_11" name="seg_11" value="1"/>Faros antinieblas delanteros</td>
			<td><input type="checkbox" id="seg_12" name="seg_12" value="1"/>Faros antinieblas traseros</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="seg_13" name="seg_13" value="1"/>Frenos ABS</td>
			<td><input type="checkbox" id="seg_14" name="seg_14" value="1"/>Inmovilizador de motor</td>
			<td><input type="checkbox" id="seg_15" name="seg_15" value="1"/>Isofix</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="seg_16" name="seg_16" value="1"/>Repartidor electr&oacute;nico de fuerza de frenado</td>
			<td><input type="checkbox" id="seg_17" name="seg_17" value="1"/>Tercer stop</td>
			<td></td>
		</tr>			
		</table>
	</td>
	</tr>			
	<tr>
		<td colspan="3">
		<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' style='font-size:9px'>				<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="3">Exterior</td>
		</tr>
		<tr>
			<td width="33%"><input type="checkbox" id="ext_1" name="ext_1" value="1"/>Paragolpes pintados</td>
			<td width="33%"><input type="checkbox" id="ext_2" name="ext_2" value="1"/>Vidrios polarizados</td>
			<td></td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>
		<td colspan="3">
		<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' style='font-size:9px'>				
		<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="3">Sonido</td>
		</tr>
		<tr>
			<td width="33%"><input type="checkbox" id="sonido_1" name="sonido_1" value="1"/>Radio AM/FM</td>
			<td width="33%"><input type="checkbox" id="sonido_2" name="sonido_2" value="1"/>Cargador de CD</td>
			<td><input type="checkbox" id="sonido_3" name="sonido_3" value="1"/>Comando satelital de stereo</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="sonido_4" name="sonido_4" value="1"/>DVD</td>
			<td><input type="checkbox" id="sonido_5" name="sonido_5" value="1"/>Entrada auxiliar</td>
			<td><input type="checkbox" id="sonido_6" name="sonido_6" value="1"/>Entrada USB</td>
		</tr>
		<tr>
			<td><input type="checkbox" id="sonido_7" name="sonido_7" value="1"/>MP3</td>
			<td><input type="checkbox" id="sonido_8" name="sonido_8" value="1"/>Pasacassette</td>
			<td><input type="checkbox" id="sonido_9" name="sonido_9" value="1"/>Tarjeta SD</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr><td style='height:5px'></td></tr>		
	<tr>
		<td>
		<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits'>
		<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:20px" colspan="4">Cargar Fotos</td>
		<tr>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 1<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file1">
			</td>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 2<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file2">
			</td>
		</tr>
		<tr>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 3<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file3">
			</td>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 4<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file4">
			</td>
		</tr>
		<tr>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 5<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file5">
			</td>
			<td><img width="90" src="/backend/includes/images/sitio/noDisponible.jpg"></td>
			<td class="txtar1">Foto 6<br>
				<input type="file" size="25" style="font-family: tahoma,verdana; background-color: rgb(204, 204, 204);" name="file6">
			</td>
		</tr>
		</table>
		</td>
	</tr>
	<tr>						
		<td align='left' style="height:30px">
			<input type='hidden' name='id' id='id' value='{id}'>
			<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' style="width:80px" onclick="sendForm(this);" />
			<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
		</td>
	</tr>	
	</table>		
</form>	
<script>
function validarDatosForm(form){
		var errores = "";
		var Formu = document.forms['form'];
		with (Formu){
			if (idVehiculo.value == "0"){
				errores += "- El campo Vehiculo es requerido.\n";
			}	
			if (idTipoVehiculo.value == "0"){
				errores += "- El campo Tipo es requerido.\n";
			}	
			if (idMarca.value == "0"){
				errores += "- El campo Marca es requerido.\n";
			}
			if (idModelo.value == "0"){
				errores += "- El campo Modelo es requerido.\n";
			}
			if (iPuertas.value == ""){
				errores += "- El campo Puertas es requerido.\n";
			}        
			if (iAnio.value == ""){
				errores += "- El campo Año es requerido.\n";
			} 
			if (fPrecio.value == ""){
				errores += "- El campo Precio es requerido.\n";
			} 
			/*if (idAgencia.value == "0"){
				errores += "- El campo Vendedor es requerido.\n";
			} */
			if (idColor.value == "0"){
				errores += "- El campo Color es requerido.\n";
			} 
			if (idCombustible.value == "0"){
				errores += "- El campo Combustible es requerido.\n";
			} 
			
		}
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}
	
	function sendForm(form){
		if(!validarDatosForm(form))
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');		
		//alert('paso');
		xajax_updateDatosVehiculo(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xmlVehiculos.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idVehi.value = 0;
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
	    //document.getElementById("imgVehiculo").src = "../includes/images/internas/no_image.gif";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
</script>