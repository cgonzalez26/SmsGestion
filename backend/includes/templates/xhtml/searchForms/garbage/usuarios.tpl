<span class='title'> Datos Usuario </span>
<fieldset class='border'>

	<!-- DEFINE NICK array('NAME' => 'nick', 'TITLE' => 'Nombre de Usuario', 'VALUE' => "{_GET[nick]}"); -->
	<!-- INCLUDE searchFormsParts/text NICK -->
	
	
	
	<!-- DEFINE TIPOS array('NAME' => 'tipos', 'TITLE' => 'Tipos de Usuarios', 'SELECTED' => {@_GET[tipos]}, 'ITEMS' => getListaTiposUsuarios()); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS -->
	
	
	<div class='division'></div>
	
	
	<!-- DEFINE ESTADO array('NAME' => 'estado', 'TITLE' => 'Estado de Cuenta', 'ITEMS' => array( array('VALUE' => 'activo', 'TEXT' => 'Activo'), array('VALUE' => 'inactivo', 'TEXT' => 'Inactivo') ), 'SELECTED' => "{_GET[estado]}"); -->
	<!-- INCLUDE searchFormsParts/selectOptional ESTADO -->
	

	<div class='division'></div>
	
	
	<!-- DEFINE ULTIMO_ACCESO array('NAME' => 'ultimoAcceso', 'TITLE' => 'Fecha Último Acceso', 'SELECTED' => {@_GET[ultimoAcceso]}); -->
	<!-- INCLUDE searchFormsParts/dateTime ULTIMO_ACCESO -->
	

</fieldset>

<br />
<!-- DEFINE PERSONA array('NAME' => 'per', 'VALUES' => {@_GET[per]}, 'TITLE' => 'Datos Personales' ); -->
<!-- INCLUDE searchFormsParts/datosPersonales PERSONA -->