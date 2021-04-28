<div>

<span class='title'> Busqueda </span>

<fieldset class='border'>		

	<!-- DEFINE FECHA_SALIDA array('NAME' => 'salida', 'TITLE' => 'Fecha de Salida', 'SELECTED' => {@_GET[salida]}); -->
	<!-- INCLUDE searchFormsParts/dateT FECHA_SALIDA -->	
	
	<!-- DEFINE FECHA_LLEGADA array('NAME' => 'llegada', 'TITLE' => 'Fecha de Llegada', 'SELECTED' => {@_GET[llegada]}); -->
	<!-- INCLUDE searchFormsParts/dateT FECHA_LLEGADA -->	
	
	<div class='division'></div>
	
	<!-- DEFINE PATENTE array('NAME' => 'patente', 'VALUE' => "{_GET[patente]}", 'TITLE' => 'Patente' ); -->
	<!-- INCLUDE searchFormsParts/text PATENTE -->	
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='idMarcaVehiculo'> Marca: </label>
		<select id='idMarcaVehiculo' name='mar'></select>
	</div>
	
	
	<div>
		<label class='middle' for='idModeloVehiculo'> Modelo: </label>
		<select id='idModeloVehiculo' name='mod'></select>
	</div>
	
	
	
</fieldset>
<!-- INCLUDE jscript/ajaxMarcasModelos -->
<script type='text/javascript'>	
	
	asignarAccionesSelectMarcasModelos('idMarcaVehiculo', 'idModeloVehiculo', '{_GET[mar]}', '{_GET[mod]}', 'No especificar');
	
</script>
</div>