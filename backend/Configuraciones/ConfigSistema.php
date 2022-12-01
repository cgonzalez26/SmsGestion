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
	$oXajax->register( XAJAX_FUNCTION , 'updateDatosSistema');
	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");

	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);
	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$headerBox = otenerMenu($aParametros, 1);
	
	$aDatos = $oMysql->consultaSel("SELECT * FROM params_system WHERE id=0",true);
	$aOpciones["id"] = $aDatos["id"];
	$aOpciones["sTitulo"] = $aDatos["sTitulo"];
	$aOpciones["sMailDefault"] = $aDatos["sMailDefault"];
	$aOpciones["sMailHeader"] = $aDatos["sMailHeader"];
	$aOpciones["sMailFoot"] = $aDatos["sMailFoot"];
	
	$body = xhtmlTablaABM($aOpciones,'ConfigSistema');
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