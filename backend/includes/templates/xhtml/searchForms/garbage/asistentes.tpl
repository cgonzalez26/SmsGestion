<span class='title'> Datos Asistente </span>
<fieldset class='border'>
	
	<!-- DEFINE TIPOS_ASISTENTE array('NAME' => 'tipos', 'SELECTED' => {@_GET[tipos]}, 'TITLE' => 'Tipos Asistentes', 'ITEMS' => getListaTiposAsistentes(), 'HEIGHT' => 'auto' ); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS_ASISTENTE -->
	
	<!-- DEFINE IDIOMAS array('NAME' => 'idiomas', 'SELECTED' => {@_GET[idiomas]}, 'TITLE' => 'Idiomas', 'ITEMS' => getListaIdiomas() ); -->
	<!-- INCLUDE searchFormsParts/checkList IDIOMAS -->
	
	
	
	<div class='division'></div>
	
	<!-- DEFINE DESTINOS array('NAME' => 'destinos', 'TITLE' => 'Destinos', 'ITEMS' => getListaDestinos(), 'SELECTED' => {@_GET[destinos]}); -->
	<!-- INCLUDE searchFormsParts/checkList DESTINOS -->
	
	
	<div class='division'></div>
	
	<!-- DEFINE ARANCEL array('NAME' => 'arancel', 'VALUES' => {@_GET[arancel]}, 'TITLE' => 'Arancel', 'PREFIJO' => '$' ); -->
	<!-- INCLUDE searchFormsParts/number ARANCEL -->

</fieldset>


<br />
<span class='title'> Estados </span>
<fieldset class='border'>


	

	<!-- DEFINE ESTADO_FECHA array('NAME' => 'estadoFecha', 'SELECTED' => {@_GET[estadoFecha]}, 'TITLE' => 'Fecha', 'ON_CHECK' => "document.getElementById('estado').disabled = !checked;" ); -->
	<!-- INCLUDE searchFormsParts/dateTime ESTADO_FECHA -->
	
	<!-- DEFINE ESTADO array('NAME' => 'estado', 'TITLE' => 'Estado', 'ITEMS' => array_merge( array( array('VALUE' => 'disponible', 'TEXT' => 'Disponible'), array('VALUE' => 'viaje', 'TEXT' => 'En Viaje') ), getListaTiposEstadosPersonal()), 'SELECTED' => "{_GET[estado]}"); -->
	<!-- INCLUDE searchFormsParts/select ESTADO -->
	
	
</fieldset>

<br />

<!-- DEFINE PERSONA array('NAME' => 'per', 'VALUES' => {@_GET[per]}, 'TITLE' => 'Datos Personales' ); -->
<!-- INCLUDE searchFormsParts/datosPersonales PERSONA -->


<script type='text/javascript'>
	document.getElementById('estadoFecha_CHECK').onclick();
</script>