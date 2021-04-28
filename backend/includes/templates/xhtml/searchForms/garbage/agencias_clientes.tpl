<span class='title'> Datos {FIELDSET_TITLE} </span>
<fieldset class='border'>

	<!-- DEFINE RAZON_SOCIAL array('NAME' => 'razonSocial', 'TITLE' => 'Razón Social', 'VALUE' => "{_GET[razonSocial]}"); -->
	<!-- INCLUDE searchFormsParts/text RAZON_SOCIAL -->
	
	<div class='division'></div>
	
	
	<!-- DEFINE CUIT array('NAME' => 'cuit', 'TITLE' => 'CUIT', 'VALUE' => "{_GET[cuit]}"); -->
	<!-- INCLUDE searchFormsParts/text CUIT -->
	
	
	<!-- DEFINE TIPOS_IVA array('NAME' => 'tiposIVA', 'TITLE' => 'Situaciones I.V.A.', 'SELECTED' => {@_GET[tiposIVA]}, 'ITEMS' => getListaTiposIVA()); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS_IVA -->
	

</fieldset>

<br />
<!-- DEFINE PERSONA array('NAME' => 'cont', 'VALUES' => {@_GET[cont]}, 'TITLE' => 'Datos Contacto' ); -->
<!-- INCLUDE searchFormsParts/datosPersonales PERSONA -->