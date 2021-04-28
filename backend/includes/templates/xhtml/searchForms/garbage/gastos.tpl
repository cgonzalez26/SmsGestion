<span class='title'> Datos Gasto </span>
<fieldset class='border'>

	<!-- DEFINE TIPOS array('NAME' => 'tipos', 'TITLE' => 'Tipos Gastos', 'SELECTED' => {@_GET[tipos]}, 'ITEMS' => getListaTiposGastos()); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS -->
	
	<div class='division'></div>
	
	<!-- DEFINE FECHA array('NAME' => 'fecha', 'SELECTED' => {@_GET[fecha]}, 'TITLE' => 'Fecha' ); -->
	<!-- INCLUDE searchFormsParts/date FECHA -->
	
	<div class='division'></div>
	
	<!-- DEFINE IMPORTE array('NAME' => 'importe', 'VALUES' => {@_GET[importe]}, 'TITLE' => 'Importe', 'PREFIJO' => '$') -->
	<!-- INCLUDE searchFormsParts/number IMPORTE -->
	
	
	<!-- DEFINE DESCUENTO array('NAME' => 'descuento', 'VALUES' => {@_GET[descuento]}, 'TITLE' => 'Descuento', 'PREFIJO' => '$') -->
	<!-- INCLUDE searchFormsParts/number DESCUENTO -->

	<div class='division'></div>
	
	<!-- DEFINE FACTURA array('NAME' => 'factura', 'TITLE' => 'Factura', 'VALUE' => "{_GET[factura]}"); -->
	<!-- INCLUDE searchFormsParts/text FACTURA -->
	
</fieldset>