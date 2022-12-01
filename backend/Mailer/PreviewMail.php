<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	global $oMysql;
	
	if(!isLogin()){go_url("/index.php");}
	
	$oXajax = new xajax();	
	//$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);
	$oXajax->register( XAJAX_FUNCTION , 'enviarMailsRapidos');	
	
	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");

	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);
	
	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$aParametros['HOME'] = $_SESSION['LOGIN'];
	
	//$headerBox = otenerMenu($aParametros, 1);
	$aOpciones['HTML_BODY'] = $_GET['sMensaje'];

	$aOpciones['MOSTRAR_EP']= "style='display:none'";
	if($_GET['iEP'] == 1){
		$aOpciones['MOSTRAR_EP']= "style='display:inline'";
	}
	//$body = xhtmlTablaABM($aOpciones,'previewMail');
	$body = parserTemplate(TEMPLATES_XHTML_DIR."/pages/promo.tpl" , $aOpciones);
	//echo $HtmlTemplate;
	$body = '<div id="divBody">'.$body.'</div>';
	
	/*$sDiv = '
	<link rel="stylesheet" type="text/css" href="../includes/css/wick.css" />
	<script>
	function checkForm() {
	answer = true;
	if (siw && siw.selectingSomething)
		answer = false;
	return answer;
	}//
	collection = ['.$sDatos.'];
	</script>
	<body style="background-color:#FFFFFF">
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
			Copyright &copy; 2022</p>
	</div>';*/
	
	
	echo $body;
	
	echo "</body></html>";
?>