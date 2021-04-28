<!-- DEFINE LISTA_ANIOS range(1950, ((integer) date('Y')) + 2 ); -->
<!-- DEFINE LISTA_TIPOS_VEHICULOS getListaTiposVehiculos(); -->

<span class='title'> Datos Vehículo </span>

<fieldset class='border'> 


	<div>
		<label class='middle' for='Interno'> Nº  Vehículo (*): </label>
		<input type='text' name='Interno' id='Interno' />
	</div>

	<div>
		<label class='middle' for='Patente'> Patente (*): </label>
		<input type='text' name='Patente' id='Patente' />
	</div>
	
	
	<div>
		<label class='middle' for='idTipoVehiculo'> Tipo Vehículo (*): </label>
		<select id='idTipoVehiculo' name='idTipoVehiculo'>
			<option value='0'> Seleccionar... </option>
			<option value='0'></option>
			<!-- ARRAY LISTA_TIPOS_VEHICULOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
			
		</select>
	</div>
	
	
	<div class='division'></div>

	
	<div>
		<label class='middle' for='idMarcaVehiculo'> Marca (*): </label>
		<select id='idMarcaVehiculo' name='idMarcaVehiculo'></select>
	</div>
	
	
	<div>
		<label class='middle' for='idModeloVehiculo'> Modelo (*): </label>
		<select id='idModeloVehiculo' name='idModeloVehiculo'></select>
	</div>
	
	
		
	<div>
		<label class='middle' for='ModeloAnio'> Año Modelo (*): </label>
		<select id='ModeloAnio' name='ModeloAnio'>
			<option value='0'> Seleccionar... </option>
			<option value='0'></option> 
			<!-- ARRAY LISTA_ANIOS --> <option value='{*}'> {*} </option> <!-- END -->
		</select>
	</div>
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='VelocidadMaxima'> Velocidad Máxima: </label>
		<input type='text' name='VelocidadMaxima' id='VelocidadMaxima' class='numerico' /> 
		<span class='sufijo'> Km/h </span>
	</div>
	
	
	<div>
		<label class='middle' for='CantidadPasajeros'> Capacidad Pasajeros (*): </label>
		<input type='text' name='CantidadPasajeros' id='CantidadPasajeros' class='numerico' />
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Propietario'> Propietario: </label>
		<select id='Propietario' name='Propietario'>
		<option value='1'> Sí </option>
		<option value='0'> No </option>
		</select>
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Descripcion'> Descripción: </label>
		<input type='text' name='Descripcion' id='Descripcion' />
	</div>
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' name='Observaciones' id='Observaciones' />
	</div>

	
</fieldset>


<!-- INCLUDE jscript/ajaxMarcasModelos -->

<script type='text/javascript'>

	var idMarcaVehiculo = 0;
	var idModeloVehiculo = 0;
	
	<!-- BLOCK DATOS -->
		
		
		idModeloVehiculo = '{idModeloVehiculo}';
		idMarcaVehiculo = '{idMarcaVehiculo}';
		
		document.getElementById('Interno').value = '{Interno}';
		document.getElementById('Patente').value = '{Patente}';
		document.getElementById('idTipoVehiculo').value = '{idTipoVehiculo}';
		document.getElementById('ModeloAnio').value = '{ModeloAnio}';
		document.getElementById('VelocidadMaxima').value = '{VelocidadMaxima}';
		document.getElementById('CantidadPasajeros').value = '{CantidadPasajeros}';
		document.getElementById('Propietario').value = '{Propietario}';
		document.getElementById('Descripcion').value = '{Descripcion}';
		document.getElementById('Observaciones').value = '{Observaciones}';
		
		
	<!-- END -->
			
	asignarAccionesSelectMarcasModelos('idMarcaVehiculo', 'idModeloVehiculo', idMarcaVehiculo, idModeloVehiculo );
	
</script>