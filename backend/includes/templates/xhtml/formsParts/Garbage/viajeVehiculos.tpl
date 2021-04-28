
<span class='title'> Vehículo </span>
<fieldset class='border'>


	<table class='titles'>
	
		<tr>
			<th class='check'> * </th>
			<th style='width: 50px;'> Interno </th>
			<th style='width: 200px;'> Marca - Modelo </th>
			<th style='width: 50px;'> Cap. </th>
			<th> Tipo </th>
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_VEHICULOS -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='radio' name='idVehiculo' value='{idVehiculo}' id='idVehiculo_{idVehiculo}' onchange="onchangeRadioTable( this, '{_INDEX_PARITY_}' );" /> </th>
	 			<td style='width: 50px' onclick="radioSelect('idVehiculo_{idVehiculo}')" class='left'> {Interno} </td>
	 			<td style='width: 200px;' onclick="radioSelect('idVehiculo_{idVehiculo}')" class='left'> {Marca} - {Modelo} </td>
	 			<td style='width: 50px;' onclick="radioSelect('idVehiculo_{idVehiculo}')"> {CantidadPasajeros} </td>
	 			<td onclick="radioSelect('idVehiculo_{idVehiculo}')" class='left'> {Tipo} </td>
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>
	
	<a href='javascript:void(0);' style='margin-left: 50px' onclick="radiosSetNone(form, 'idVehiculo')"> Seleccionar Ninguno </a>
	
	
	<div class='division'></div>
	
	<div>
		<label for='Nombre' class='middle'> Nombre (*): </label>
		<input type='text' name='Nombre' id='Nombre' />
	
	</div>

</fieldset>



<br />
<span class='title'> Choferes </span>
<fieldset class='border' style='text-align: center'>

	<table class='titles'>
	
		<tr>
			<th class='check' onclick="checksInvertChecked(form, 'Choferes');"> * </th>
			<th style='width: 170px;'> Nombre </th>
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
	 			<td style='width: 170px;' onclick="checkSelect('Choferes_{idPersona}')"  class='left'> {Apellido}, {Nombre} </td>
	 			<td style='width: 100px;' onclick="checkSelect('Choferes_{idPersona}')"> {Capacidad} </td>
	 			<td onclick="checkSelect('Choferes_{idPersona}')"  class='left'> {CUIL}  </td>
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>

</fieldset>


<br />

<span class='title'> Asistentes </span>
<fieldset class='border' style='text-align: center'>

	<table class='titles'>
	
		<tr>
			<th class='check' onclick="checksInvertChecked(form, 'Asistentes');"> * </th>
			<th style='width: 150px; '> Nombre </th>
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
	 			<td style='width: 150px;'  class='left' onclick="checkSelect('Asistentes_{idPersona}')"> {Apellido}, {Nombre} </td>
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
		radiosSetValue(form, 'idVehiculo', '{idVehiculo}' );
		
		document.getElementById('Nombre').value = '{Nombre}';
		
		var radioVehiculoSelected = radiosGetSelected(form, 'idVehiculo');
		if(radioVehiculoSelected) 
			radioVehiculoSelected.parentNode.parentNode.parentNode.parentNode.parentNode.scrollTop = radioVehiculoSelected.parentNode.parentNode.offsetTop;
	
	<!-- END --> 
	
	
				
</script>