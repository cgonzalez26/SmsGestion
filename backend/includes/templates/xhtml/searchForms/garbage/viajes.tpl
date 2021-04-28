
<script type='text/javascript'>

	var onchangeTipo = function onchangeTipo( tipo, checked ) {
		
		var div = document.getElementById(tipo == 'regular' ? 'divViajeRegular' : 'divViajePrivado');
		
		if(div) div.style.display = checked ? 'block' : 'none';
	}

</script>


<span class='title'> Datos Viaje </span>
<fieldset class='border'>

	
	<div id='divTipos'>
		
		<!-- DEFINE TIPOS array('NAME' => 'tipos', 'TITLE' => 'Tipos', 'ITEMS' => getListaTiposViajes(), 'HEIGHT' => 'auto', 'SELECTED' => {@_GET[tipos]}, 'ONCHANGE' => "onchangeTipo(this.value, this.checked);"); -->
		<!-- INCLUDE searchFormsParts/checkList TIPOS -->
		
		<div class='division'></div>
	
	</div>
	
	<!-- DEFINE ESTADOS array('NAME' => 'estados', 'TITLE' => 'Estados', 'ITEMS' => getListaEstadosViajes(), 'SELECTED' => {@_GET[estados]}); -->
	<!-- INCLUDE searchFormsParts/checkList ESTADOS -->
	
	
	<div class='division'></div>
	
	<!-- DEFINE DESTINOS array('NAME' => 'destinos', 'TITLE' => 'Destinos', 'ITEMS' => getListaDestinos(), 'SELECTED' => {@_GET[destinos]}); -->
	<!-- INCLUDE searchFormsParts/checkList DESTINOS -->
	
	<div class='division'></div>
	
	
	<!-- DEFINE IDIOMA_EXTRANJERO array('NAME' => 'iex', 'TITLE' => 'Idioma Extranjero', 'ITEMS' => array( array('VALUE' => '1', 'TEXT' => 'Sí'), array('VALUE' => '0', 'TEXT' => 'No') ), 'SELECTED' => "{_GET[iex]}"); -->
	<!-- INCLUDE searchFormsParts/selectOptional IDIOMA_EXTRANJERO -->
	
	<div class='division'></div>
	
	<!-- DEFINE FECHA_SALIDA array('NAME' => 'salida', 'TITLE' => 'Fecha de Salida', 'SELECTED' => {@_GET[salida]}); -->
	<!-- INCLUDE searchFormsParts/dateTime FECHA_SALIDA -->
	
	
	<div class='espacio'></div>
	
	<!-- DEFINE FECHA_LLEGADA array('NAME' => 'llegada', 'TITLE' => 'Fecha de Llegada', 'SELECTED' => {@_GET[llegada]}); -->
	<!-- INCLUDE searchFormsParts/dateTime FECHA_LLEGADA -->

	
	<div class='division'></div>
	
	
	<!-- DEFINE FECHA_CREACION array('NAME' => 'creacion', 'TITLE' => 'Fecha de Creación', 'SELECTED' => {@_GET[creacion]}); -->
	<!-- INCLUDE searchFormsParts/dateTime FECHA_CREACION -->

	
	
</fieldset>



<div id='divViajePrivado' style='display: none'>
	
	<br />
	<span class='title'> Datos Viaje Privado </span>
	<fieldset class='border'>

		<!-- DEFINE MONTO array('NAME' => 'monto', 'TITLE' => 'Monto', 'VALUES' => {@_GET[monto]}, 'PREFIJO' => '$'); -->
		<!-- INCLUDE searchFormsParts/number MONTO -->

		<div class='division'></div>
		
		<!-- DEFINE FORMAS_PAGO array('NAME' => 'formasPago', 'TITLE' => 'Formas de Pago', 'ITEMS' => array_merge( array( array('VALUE' => 'cuentaCorriente', 'TEXT' => ' <em> Cuenta Corriente </em>') ) ,  getListaFormasPagosViajes() ), 'SELECTED' => {@_GET[formasPago]}); -->
		<!-- INCLUDE searchFormsParts/checkList FORMAS_PAGO -->
	
		
	</fieldset>
</div>


<div id='divViajeRegular' style='display: none'>
	
	<br />	
	<span class='title'> Datos Viaje Regular </span>
	<fieldset class='border'>
	
		<!-- DEFINE PRECIO_PASAJE array('NAME' => 'pasaje', 'TITLE' => 'Precio Pasaje', 'VALUES' => {@_GET[pasaje]}, 'PREFIJO' => '$'); -->
		<!-- INCLUDE searchFormsParts/number PRECIO_PASAJE -->
	
	</fieldset>
</div>



<script type='text/javascript'>
	document.getElementById('tipos_regular').onclick();
	document.getElementById('tipos_privado').onclick();
	
	<!-- BLOCK HIDE_TIPOS --> document.getElementById('divTipos').style.display = 'none'; <!-- END -->
</script>