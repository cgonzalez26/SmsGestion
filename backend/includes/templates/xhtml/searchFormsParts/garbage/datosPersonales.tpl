<span class='title'> {TITLE} </span>
<fieldset class='border'>

	<!-- DEFINE APELLIDO array('NAME' => '{NAME}[apellido]', 'TITLE' => 'Apellido', 'VALUE' => "{VALUES[apellido]}"); -->
	<!-- INCLUDE searchFormsParts/text APELLIDO -->
	
	
	<!-- DEFINE NOMBRE array('NAME' => '{NAME}[nombre]', 'TITLE' => 'Nombre', 'VALUE' => "{VALUES[nombre]}"); -->
	<!-- INCLUDE searchFormsParts/text NOMBRE -->
	
	
	
	<div class='division'></div>
	
	
	<!-- DEFINE FECHA_NACIMIENTO array('NAME' => '{NAME}[fechNac]', 'TITLE' => 'Fecha de Nacimiento', 'SELECTED' => {@VALUES[fechNac]}); -->
	<!-- INCLUDE searchFormsParts/date FECHA_NACIMIENTO -->
	
	
	<div class='division'></div>
	
	<!-- DEFINE DOC array('NAME' => '{NAME}[doc]', 'TITLE' => 'Documento', 'VALUE' => "{VALUES[doc]}"); -->
	<!-- INCLUDE searchFormsParts/text DOC -->
	
	
	<!-- DEFINE TIPOS_DOC array('NAME' => '{NAME}[tiposDoc]', 'TITLE' => 'Tipos de Documentos', 'ITEMS' => getListaTiposDocumentos(), 'SELECTED' => {@VALUES[tiposDoc]}, 'HEIGHT' => 'auto'); -->
	<!-- INCLUDE searchFormsParts/checkList TIPOS_DOC -->
	

</fieldset>