
<!-- DEFINE LISTA_TIPOS_HOTELES getListaTiposHoteles() -->


<span class='title'> Datos Hotel </span>

<fieldset class='border'> 
	
	<div>
		<label class='middle' for='Nombre'> Nombre (*): </label>
		<input type='text' id='Nombre' name='Nombre' />
	</div>
	
	
	<div>
		<label class='middle' for='idTipoHotel'> Tipo Hotel (*): </label>
		<select name='idTipoHotel' id='idTipoHotel'>
		
		<option value='0'>Seleccionar... </option>
		<option value='0'></option>
		<!-- ARRAY LISTA_TIPOS_HOTELES --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		</select>
	
	</div>
	
	
	<div>
		<label class='middle' for='CUIT'> CUIT: </label>
		<input type='text' id='CUIT' name='CUIT' />
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='idPais'> País: </label>
		<select name='idPais' id='idPais'> </select>
	
	</div>
	
	
	<div>
		<label class='middle' for='idProvincia'> Provincia: </label>
		<select name='idProvincia' id='idProvincia'> </select>
	
	</div>
	
	
		
	<div>
		<label class='middle' for='idLocalidad'> Localidad: </label>
		<select name='idLocalidad' id='idLocalidad'> </select>
	
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Direccion'> Dirección: </label>
		<input type='text' id='Direccion' name='Direccion' />
	
	</div>
	
	
	<div>
		<label class='middle' for='Telefono'> Teléfono: </label>
		<input type='text' id='Telefono' name='Telefono' />
	</div>
	
	<div>
		<label class='middle' for='Fax'> Fax: </label>
		<input type='text' id='Fax' name='Fax' />
	</div>
	
		
	<div>
		<label class='middle' for='Email'> E-Mail: </label>
		<input type='text' id='Email' name='Email' />
	</div>

	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='PaginaWeb'> Página Web: </label>
		<input type='text' id='PaginaWeb' name='PaginaWeb' />
	</div>
	
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' id='Observaciones' name='Observaciones' />
	</div>
	
</fieldset>

<!-- INCLUDE jscript/ajaxUbicaciones -->

<script type='text/javascript'>

	var idPais = 0;
	var idProvincia = 0;
	var idLocalidad = 0;

	<!-- BLOCK DATOS -->
		
		idPais = '{idPais}';
		idProvincia = '{idProvincia}';
		idLocalidad = '{idLocalidad}';
		
		document.getElementById('Nombre').value = '{Nombre}';
		document.getElementById('idTipoHotel').value = '{idTipoHotel}';
		document.getElementById('CUIT').value = '{CUIT}';
		document.getElementById('Direccion').value = '{Direccion}';
		document.getElementById('Telefono').value = '{Telefono}';
		document.getElementById('PaginaWeb').value = '{PaginaWeb}';
		document.getElementById('Email').value = '{Email}';
		document.getElementById('Fax').value = '{Fax}';
		document.getElementById('Observaciones').value = '{Observaciones}';

	<!-- END -->
	
		
	asignarAccionesSelectUbicaciones('idPais', 'idProvincia', 'idLocalidad', idPais, idProvincia, idLocalidad);
	
</script>