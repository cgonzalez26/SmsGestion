

<!-- DEFINE PERSONA array('NAME' => 'per', 'VALUES' => {@_GET[per]}, 'TITLE' => 'Datos Personales' ); -->
<!-- INCLUDE searchFormsParts/datosPersonales PERSONA -->


<br />
<span class='title'> Datos Pasaje </span>
<fieldset class='border'>

	<!-- DEFINE FORMAS_PAGO array('NAME' => 'formasPago', 'ITEMS' => getListaFormasPagosViajes(), 'SELECTED' => {@_GET[formasPago]}, 'TITLE' => 'Formas de Pago' ); -->
	<!-- INCLUDE searchFormsParts/checkList FORMAS_PAGO -->
	
	<!-- DEFINE MONTO array('NAME'=>'monto', TITLE=>'Monto', 'VALUES' => {@_GET[monto]} ); -->
	<!-- INCLUDE searchFormsParts/number MONTO -->
	
	
	<div class='division'></div>
	<!-- DEFINE FECHA array('NAME' => 'fecha', 'SELECTED' => {@_GET[fecha]}, 'TITLE' => 'Fecha Pago' ); -->
	<!-- INCLUDE searchFormsParts/dateTime FECHA -->
	

</fieldset>

