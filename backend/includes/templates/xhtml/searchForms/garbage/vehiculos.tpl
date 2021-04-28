<span class='title'> Datos Vehículo </span>
<fieldset class='border'>
	
	<!-- DEFINE PATENTE array('NAME' => 'patente', 'VALUE' => "{_GET[patente]}", 'TITLE' => 'Patente' ); -->
	<!-- INCLUDE searchFormsParts/text PATENTE -->
	
	<!-- DEFINE TIPOS array('NAME' => 'tipos', 'SELECTED' => {@_GET[tipos]}, 'TITLE' => 'Tipos Vehículos', 'ITEMS' => getListaTiposVehiculos() ); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS -->
	
	<div class='division'></div>

	<!-- DEFINE ANIO_MODELO array('NAME' => 'anio', 'VALUES' => {@_GET[anio]}, 'TITLE' => 'Año Modelo' ); -->
	<!-- INCLUDE searchFormsParts/number ANIO_MODELO -->
	
	<div class='division'></div>
	
	
	
	<div>
		<label class='middle' for='idMarcaVehiculo'> Marca: </label>
		<select id='idMarcaVehiculo' name='mar'></select>
	</div>
	
	
	<div>
		<label class='middle' for='idModeloVehiculo'> Modelo: </label>
		<select id='idModeloVehiculo' name='mod'></select>
	</div>
	
	
	
	
	
	
	<div class='division'></div>
	
	<!-- DEFINE VELOCIDAD array('NAME' => 'vel', 'VALUES' => {@_GET[vel]}, 'TITLE' => 'Velocidad Máxima', 'SUFIJO' => 'Km/h') -->
	<!-- INCLUDE searchFormsParts/number VELOCIDAD -->
	
	
	<!-- DEFINE CAPACIDAD array('NAME' => 'cap', 'VALUES' => {@_GET[cap]}, 'TITLE' => 'Capacidad Pasajeros' ) -->
	<!-- INCLUDE searchFormsParts/number CAPACIDAD -->

	<div class='division'></div>
	
	
	<!-- DEFINE PROPIETARIO array('NAME' => 'prop', 'TITLE' => 'Propietario', 'ITEMS' => array( array('VALUE' => '1', 'TEXT' => 'Sí'), array('VALUE' => '0', 'TEXT' => 'No') ), 'SELECTED' => "{_GET[prop]}"); -->
	<!-- INCLUDE searchFormsParts/selectOptional PROPIETARIO -->
	
	
</fieldset>

<br >

<span class='title'> Estados </span>
<fieldset class='border'>
	

	<!-- DEFINE ESTADO_FECHA array('NAME' => 'estadoFecha', 'SELECTED' => {@_GET[estadoFecha]}, 'TITLE' => 'Fecha', 'ON_CHECK' => "document.getElementById('estado').disabled = !checked;" ); -->
	<!-- INCLUDE searchFormsParts/dateTime ESTADO_FECHA -->
	
	<!-- DEFINE ESTADO array('NAME' => 'estado', 'TITLE' => 'Estado', 'ITEMS' => array_merge( array( array('VALUE' => 'disponible', 'TEXT' => 'Disponible'), array('VALUE' => 'viaje', 'TEXT' => 'En Viaje') ), getListaTiposEstadosVehiculos()), 'SELECTED' => "{_GET[estado]}"); -->
	<!-- INCLUDE searchFormsParts/select ESTADO -->
	
	
</fieldset>

<!-- INCLUDE jscript/ajaxMarcasModelos -->

<script type='text/javascript'>


	document.getElementById('estadoFecha_CHECK').onclick();
	
	asignarAccionesSelectMarcasModelos('idMarcaVehiculo', 'idModeloVehiculo', '{_GET[mar]}', '{_GET[mod]}', 'No especificar');
	
</script>