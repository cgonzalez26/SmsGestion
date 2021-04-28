<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );	
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	if(!isLogin()){go_url("/index.php");}

	$aOpciones['ANCHO_GRILLA'] = '790';	
	
	$oXajax = new xajax();	
	$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);
	$oXajax->register( XAJAX_FUNCTION , 'getDatosContacto');
	
	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");
	
	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$aParametros['HOME'] = $_SESSION['LOGIN'];
	
	echo xhtmlHeaderPagina($aParametros);
	xhtmlHeaderGrillas($aOpciones);
	
	$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
	
	//$body = xhtmlTablaABM($aOpciones,'MensajesEnviados');
	
	//$sms = new SMS("localhost",null,null,"/sistemas3/sms/home/sms.message");
	$body = xhtmlTablaABM($aOpciones,'Mails');
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