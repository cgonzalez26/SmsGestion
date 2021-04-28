
<input type="hidden" name="idDestino" value="{DATOS[idDestino]}" />
<input type="hidden" name="Tipo" value="{DATOS[Tipo]}" />
<input type="hidden" name="FechaSalida" value="{DATOS[FechaSalida]}" />
<input type="hidden" name="FechaLlegada" value="{DATOS[FechaLlegada]}" />
<input type="hidden" name="idTipoEstadoViaje" value="{DATOS[idTipoEstadoViaje]}" />
<input type="hidden" name="FechaVencimiento" value="{DATOS[FechaVencimiento]}" />
<input type="hidden" name="Monto" value="{DATOS[Monto]}" />
<input type="hidden" name="idTipoPagoViaje" value="{DATOS[idTipoPagoViaje]}" />
<input type="hidden" name="Adelantado" value="{DATOS[Adelantado]}" />
<input type="hidden" name="Observaciones" value="{DATOS[Observaciones]}" />
<input type='hidden' name='idCliente' value='{DATOS[idCliente]}' />


<!-- BLOCK DATOS -->
	<!-- ARRAY Pasajeros -->
				
		<!-- DEFINE HIDDENS array('DATA' => {@*}, 'NAME_PREFIX' => 'Pasajeros[{_INDEX_}]' ) -->
		<!-- INCLUDE formsInputs/hiddenArray HIDDENS -->

	<!-- END -->
<!-- END -->	


<input type='hidden' name='terceraParte' value='1' />
<input type='hidden' name='primeraParte' value='0' />

<span class='title'> Vehículos </span>
<fieldset class='border' style='text-align: center'>


	<table class='titles'>
	
		<tr>
			<th class='check' onclick="checksInvertChecked(form, 'Vehiculos');"> * </th>
			<th style='width: 50px;'> Interno </th>
			<th style='width: 200px;'> Marca - Modelo </th>
			<th style='width: 50px;'> Año </th>
			<th> Tipo </th>
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_VEHICULOS -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='checkbox' name='Vehiculos[]' value='{idVehiculo}' id='Vehiculos_{idVehiculo}' onchange="this.parentNode.parentNode.className = this.checked ? 'checked' : '{_INDEX_PARITY_}';" /> </th>
	 			<td style='width: 50px' onclick="checkSelect('Vehiculos_{idVehiculo}')"> {Interno} </td>
	 			<td style='width: 200px;' onclick="checkSelect('Vehiculos_{idVehiculo}')"> {Marca} - {Modelo} </td>
	 			<td style='width: 50px;' onclick="checkSelect('Vehiculos_{idVehiculo}')"> {ModeloAnio} </td>
	 			<td onclick="checkSelect('Vehiculos_{idVehiculo}')"> {Tipo} </td>
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>

</fieldset>




<span class='title'> Choferes </span>
<fieldset class='border' style='text-align: center'>

	<table class='titles'>
	
		<tr>
			<th class='check' onclick="checksInvertChecked(form, 'Choferes');"> * </th>
			<th style='width: 200px;'> Nombre </th>
			<th style='width: 100px;'> Capacidad </th>
			<th> CUIL </th>
			
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_CHOFERES -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='checkbox' name='Choferes[]' value='{idPersona}' id='Choferes_{idPersona}' onchange="this.parentNode.parentNode.className = this.checked ? 'checked' : '{_INDEX_PARITY_}';" /> </th>
	 			<td style='width: 200px' onclick="checkSelect('Choferes_{idPersona}')"> {Apellido}, {Nombre} </td>
	 			<td style='width: 100px;' onclick="checkSelect('Choferes_{idPersona}')"> {Capacidad} </td>
	 			<td onclick="checkSelect('Choferes_{idPersona}')"> {CUIL} </td>
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>

</fieldset>




<span class='title'> Asistentes </span>
<fieldset class='border' style='text-align: center'>

	<table class='titles'>
	
		<tr>
			<th class='check' onclick="checksInvertChecked(form, 'Asistentes');"> * </th>
			<th style='width: 150px'> Nombre </th>
			<th style='width: 90px'> Funciones </th>
			<th style='width: 80px;'> Arancel </th>
			<th> Idiomas </th>
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_ASISTENTES -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='checkbox' name='Asistentes[]' value='{idPersona}' id='Asistentes_{idPersona}' onchange="this.parentNode.parentNode.className = this.checked ? 'checked' : '{_INDEX_PARITY_}';" /> </th>
	 			<td style='width: 150px' onclick="checkSelect('Asistentes_{idPersona}')"> {Apellido}, {Nombre} </td>
	 			<td style='width: 90px' onclick="checkSelect('Asistentes_{idPersona}')"> <ul class='simple'> {TiposAsistente} </ul> </td>
	 			<td style='width: 70px; padding-right: 10px' onclick="checkSelect('Asistentes_{idPersona}')" class='numerico'> $ {Arancel} </td>
	 			<td onclick="checkSelect('Asistentes_{idPersona}')"> <ul class='simple'> {Idiomas} </ul> </td>
	 			
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>

</fieldset>


<script type='text/javascript'>

	<!-- BLOCK DATOS --> 
		
		checksSetChecked(form, 'Asistentes', [{!Asistentes}] );
		checksSetChecked(form, 'Choferes', [{!Choferes}] );
		checksSetChecked(form, 'Vehiculos', [{!Vehiculos}] );
	
	<!-- END --> <!-- END -->
	
	
				
</script>