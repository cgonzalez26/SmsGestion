<span class='title'> Estados </span>
<fieldset class='border'>
	

	<!-- DEFINE ESTADO_FECHA array('NAME' => 'estadoFecha', 'SELECTED' => {@_GET[estadoFecha]}, 'TITLE' => 'Fecha', 'ON_CHECK' => "document.getElementById('estado').disabled = !checked;" ); -->
	<!-- INCLUDE searchFormsParts/dateTime ESTADO_FECHA -->
	
	<!-- DEFINE ESTADO array('NAME' => 'estado', 'TITLE' => 'Estado', 'ITEMS' => array_merge( array( array('VALUE' => 'disponible', 'TEXT' => 'Disponible'), array('VALUE' => 'viaje', 'TEXT' => 'En Viaje') ), getListaTiposEstadosPersonal()), 'SELECTED' => "{_GET[estado]}"); -->
	<!-- INCLUDE searchFormsParts/select ESTADO -->
	
	
</fieldset>


<br />

<span class='title'> Datos Chofer </span>
<fieldset class='border'>
	
	
	
	<!-- DEFINE FECHA_ALTA_CARNET array('NAME' => 'altaCarnet', 'SELECTED' => {@_GET[altaCarnet]}, 'TITLE' => 'Fecha Alta Carnet CNRT' ); -->
	<!-- INCLUDE searchFormsParts/date FECHA_ALTA_CARNET -->
	
	<!-- DEFINE FECHA_VENC_CARNET array('NAME' => 'vencCarnet', 'SELECTED' => {@_GET[vencCarnet]}, 'TITLE' => 'Fecha Vencimiento Carnet' ); -->
	<!-- INCLUDE searchFormsParts/date FECHA_VENC_CARNET -->
	
	
	<div class='division'></div>

	
	<!-- DEFINE FECHA_ALTA_CARNET_SALTA array('NAME' => 'altaCarnetSalta', 'SELECTED' => {@_GET[altaCarnetSalta]}, 'TITLE' => 'Fecha Alta Carnet Salta' ); -->
	<!-- INCLUDE searchFormsParts/date FECHA_ALTA_CARNET_SALTA -->
	
	<!-- DEFINE FECHA_VENC_CARNET_SALTA array('NAME' => 'vencCarnetSalta', 'SELECTED' => {@_GET[vencCarnetSalta]}, 'TITLE' => 'Fecha Vencimiento Carnet Salta' ); -->
	<!-- INCLUDE searchFormsParts/date FECHA_VENC_CARNET_SALTA -->
	
	
	<div class='division'></div>
		
	
	<!-- DEFINE CAPACIDAD array('NAME' => 'capacidad', 'ITEMS' => getListaCapacidadesChoferes(), 'SELECTED' => {@_GET[capacidad]}, 'TITLE' => 'Capacidades', 'HEIGHT' => 'auto' ); -->
	<!-- INCLUDE searchFormsParts/checkList CAPACIDAD -->
	
	<div class='division'></div>
	
	<!-- DEFINE CUIL array('NAME' => 'cuil', 'VALUE' => "{_GET[cuil]}", 'TITLE' => 'CUIL' ); -->
	<!-- INCLUDE searchFormsParts/text CUIL -->
	

</fieldset>




<br />

<!-- DEFINE PERSONA array('NAME' => 'per', 'VALUES' => {@_GET[per]}, 'TITLE' => 'Datos Personales' ); -->
<!-- INCLUDE searchFormsParts/datosPersonales PERSONA -->


<script type='text/javascript'>
	document.getElementById('estadoFecha_CHECK').onclick();
</script>