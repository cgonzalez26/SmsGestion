<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	//if(!isLogin()){go_url("/index.php");}

	$oXajax = new xajax();
	
	//$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);

	$oXajax->register( XAJAX_FUNCTION , 'getDatosTiposUsuarios');

	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");

	$aOpciones['ANCHO_GRILLA']='100%';
	$aOpciones['ID_USUARIO'] = 0;
	
	$aParametros = array();
	$aParametros = getParametrosBasicos(1);

	echo xhtmlHeaderPagina($aParametros);
	
	xhtmlHeaderGrillas($aOpciones);
	echo xhtmlTablaABM($aOpciones,'TiposUsuarios');
	
	echo xhtmlFootPagina();
?>

