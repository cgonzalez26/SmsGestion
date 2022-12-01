<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	if(!isLogin()){go_url("/index.php");}
	
	$oXajax = new xajax();
	
	//$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);

	$oXajax->register( XAJAX_FUNCTION , 'getDatosContacto');
	$oXajax->register( XAJAX_FUNCTION , 'updateDatosContacto');
	

	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");
		
	$sCondicion = " grupos.sEstado ='A'";
	$aOpciones['optionsGrupos'] = $oMysql->getListaOpciones('grupos','id','sNombre','',$sCondicion);
	//$aOpciones['optionsTiposAgencias'] = $oMysql->getListaOpciones('agencias','id','sNombre');

	$aOpciones['ANCHO_GRILLA'] = '100%';
	$aOpciones['ID_USUARIO'] = 0;
	
	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);
	
	xhtmlHeaderGrillas($aOpciones);
	
	//$headerInternal = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/headerInternal.tpl", $aParametros);
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	//$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
	$headerBox = otenerMenu($aParametros, 1);
	
	$body = xhtmlTablaABM($aOpciones,'Contactos');
	$body = '<div id="divBody">'.$body.'</div>';
	
$sDiv = '<body style="background-color:#FFFFFF">
	<div id="border-top" class="h_green" style="text-align:left">
		<div >
			<div >
				<span class="title" style="text-align:left">SMS Gestion</span>
			</div>
		</div>
	</div>
	'.$headerBox.'
	
	<div id="content-box">
		'.$body.'
	</div>	
					
	<div id="border-bottom"><div><div></div></div>
</div>
<div id="footer">
	<p class="copyright">
		Copyright &copy; 2022</p>
</div>';


echo $sDiv;

echo "</body></html>";

?>
