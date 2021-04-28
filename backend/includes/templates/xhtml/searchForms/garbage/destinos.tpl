<span class='title'> Datos Hotel </span>
<fieldset class='border'>

	<!-- DEFINE NOMBRE array('NAME' => 'nombre', 'TITLE' => 'Nombre', 'VALUE' => "{_GET[nombre]}"); -->
	<!-- INCLUDE searchFormsParts/text NOMBRE -->
	
	
	
	<div class='division'></div>
	
	
	<div>
		<label id='LABEL_idPais'  for='idPais' class='middle'> País: </label>
		
		<select name='pais' id='idPais' onchange=''></select>
	
	</div>
	
	
	<div>
		
		<label for='idProvincia' class='middle' id='LABEL_idProvincia'> Provincia: </label>
		<select name='prov' id='idProvincia'></select>
		
	</div>
	
	
		
	<div>
		<label for='idLocalidad' class='middle' id='LABEL_idLocalidad'> Localidad: </label>
		<select name='loc' id='idLocalidad'></select>
	
	</div>
	
	<div class='division'></div>
	
		
	<!-- DEFINE RUTAS array('NAME' => 'rutas', 'TITLE' => 'Rutas', 'SELECTED' => {@_GET[rutas]}, 'ITEMS' => getListaRutas()); -->
	<!-- INCLUDE searchFormsParts/checkList RUTAS -->
		
	<div class='division'></div>
	
	<!-- DEFINE DISTANCIA array('NAME' => 'dis', 'VALUES' => {@_GET[dis]}, 'TITLE' => 'Distancia', 'SUFIJO' => 'Km') -->
	<!-- INCLUDE searchFormsParts/number DISTANCIA -->
	
	

</fieldset>


<!-- INCLUDE jscript/ajaxUbicaciones -->

<script type='text/javascript'>

		
	asignarAccionesSelectUbicaciones('idPais', 'idProvincia', 'idLocalidad', "{_GET[pais]}", "{_GET[prov]}", "{_GET[loc]}", 'No especificar');
	
</script>