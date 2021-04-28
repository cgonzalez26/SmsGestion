<span class='title'> Datos Hotel </span>
<fieldset class='border'>

	<!-- DEFINE NOMBRE array('NAME' => 'nombre', 'TITLE' => 'Nombre', 'VALUE' => "{_GET[nombre]}"); -->
	<!-- INCLUDE searchFormsParts/text NOMBRE -->
	
	
	<!-- DEFINE CUIT array('NAME' => 'cuit', 'TITLE' => 'CUIT', 'VALUE' => "{_GET[cuit]}"); -->
	<!-- INCLUDE searchFormsParts/text CUIT -->
	
	<div class='division'></div>
	
	
	
	<!-- DEFINE TIPOS array('NAME' => 'tipos', 'TITLE' => 'Tipos Hoteles', 'SELECTED' => {@_GET[tipos]}, 'ITEMS' => getListaTiposHoteles(), 'HEIGHT' => 'auto'); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS -->
	
	
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

</fieldset>


<!-- INCLUDE jscript/ajaxUbicaciones -->

<script type='text/javascript'>

		
	asignarAccionesSelectUbicaciones('idPais', 'idProvincia', 'idLocalidad', "{_GET[pais]}", "{_GET[prov]}", "{_GET[loc]}", 'No especificar');
	
</script>