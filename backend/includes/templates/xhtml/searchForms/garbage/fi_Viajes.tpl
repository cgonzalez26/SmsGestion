<div>

<span class='title'> Busqueda </span>

<fieldset class='border'>		

	<!-- DEFINE FECHA_SALIDA array('NAME' => 'salida', 'TITLE' => 'Fecha de Salida', 'SELECTED' => {@_GET[salida]}); -->
	<!-- INCLUDE searchFormsParts/dateT FECHA_SALIDA -->	
	
	<!-- DEFINE FECHA_LLEGADA array('NAME' => 'llegada', 'TITLE' => 'Fecha de Llegada', 'SELECTED' => {@_GET[llegada]}); -->
	<!-- INCLUDE searchFormsParts/dateT FECHA_LLEGADA -->	
	
	<div class='division'></div>
	
	<!-- DEFINE DESTINOS array('NAME' => 'destinos', 'TITLE' => 'Destinos', 'ITEMS' => getListaDestinos(), 'SELECTED' => {@_GET[destinos]}); -->
	<!-- INCLUDE searchFormsParts/checkList DESTINOS -->	
	
	
	
</fieldset>
</div>