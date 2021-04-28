

<span class='title'> Datos Destino </span>


<fieldset class='border'> 

	<div>
		<label id='LABEL_Nombre' for='Nombre' class='middle'> Nombre (*): </label>
		<input type='text' id='Nombre' name='Nombre'/>
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label id='LABEL_idPais'  for='idPais' class='middle'> País (*): </label>
		
		<select name='idPais' id='idPais' onchange=''></select>
	
	</div>
	
	
	<div>
		
		<label for='idProvincia' class='middle' id='LABEL_idProvincia'> Provincia (*): </label>
		<select name='idProvincia' id='idProvincia'></select>
		
	</div>
	
	
		
	<div>
		<label for='idLocalidad' class='middle' id='LABEL_idLocalidad'> Localidad (*): </label>
		<select name='idLocalidad' id='idLocalidad'></select>
	
	</div>
		
	
	
	<div class='division'></div>
		
	
	<!-- DEFINE LISTA_RUTAS array_insert_arrays( getListaRutas(), array('NAME' => 'Rutas')); -->
	
	<div>
		<label class='middle' style='line-height: 100px' id='LABEL_Rutas'> Rutas: </label>
		
		<ul class='checks'>
		
			<!-- ARRAY LISTA_RUTAS -->
			
				<!-- INCLUDE formsInputs/checkboxListItem -->
			
			<!-- END -->
		
		</ul>
		
		<div>
		<label class='middle'> &nbsp; </label> Seleccionar: 
			<a href='javascript:void(0)' onclick="checksCheckAll(form, 'Rutas');">Todos</a> /
			<a href='javascript:void(0)' onclick="checksCheckNone(form, 'Rutas');">Ninguno</a>
		</div>			
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		
		<label for='Distancia' class='middle' id='LABEL_Distancia'> Distancia: </label>
		
		<input type='text' id='Distancia' name='Distancia' class='numerico' />
		
		<span class='sufijo'> Km </span>
	
	</div>
	
</fieldset>



	
<!-- INCLUDE jscript/ajaxUbicaciones -->

<script type='text/javascript'>

	var idPais = 0;
	var idProvincia = 0;
	var idLocalidad = 0;

	<!-- BLOCK DATOS -->
		
		document.getElementById('Nombre').value = '{Nombre}';
		document.getElementById('Distancia').value = '{Distancia}';
		
		idPais = '{idPais}';
		idProvincia = '{idProvincia}';
		idLocalidad = '{idLocalidad}';

		<!-- BLOCK Rutas --> checksSetChecked(form, 'Rutas', <!-- INCLUDE jscript/variables/array * --> ); 	<!-- END -->
	<!-- END -->
	
		
	asignarAccionesSelectUbicaciones('idPais', 'idProvincia', 'idLocalidad', idPais, idProvincia, idLocalidad);
	
</script>