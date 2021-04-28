<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	if(!isLogin()){go_url("/index.php");}

	$oXajax = new xajax();	
	$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);
	$oXajax->register( XAJAX_FUNCTION , 'getDatosGrupo');
	$oXajax->register( XAJAX_FUNCTION , 'enviarSMSmultiple');	
	$oXajax->register( XAJAX_FUNCTION , 'getMailUnidadNegocio');
	
	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");

	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);
	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$aParametros['HOME'] = $_SESSION['LOGIN'];
	//$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
	$headerBox = otenerMenu($aParametros, 1);
	
	$sCondicion = " grupos.sEstado ='A'";
	$aOpciones['optionsGrupos'] = $oMysql->getListaOpciones('grupos','id','sNombre','',$sCondicion);
	$sCondicion2 = " unidadesnegocios.sEstado ='A'";
	$aOpciones['optionsUnidadesNegocios'] = $oMysql->getListaOpciones('unidadesnegocios','id','sNombre','',$sCondicion2);	
	
	$body = xhtmlTablaABM($aOpciones,'MailsMasivos');
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
		<div class="border">
			<div class="padding">
			<div class="element-box">
			
			'.$body.'
			</div>
			</div>
		</div>
	</div>	
					
		<div id="border-bottom"><div><div></div></div>
	</div>
	<div id="footer">
		<p class="copyright">
			Copyright &copy; 2011</p>
	</div>';
	
	
	echo $sDiv;
	
	echo "</body></html>";
?>