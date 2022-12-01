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

	$oXajax->register( XAJAX_FUNCTION , 'updateDatosContacto');	

	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");
	
	$sCondicion = " grupos.sEstado ='A'";
	$aOpciones['optionsGrupos'] = $oMysql->getListaOpciones('grupos','id','sNombre','',$sCondicion);
	//$aOpciones['optionsTiposAgencias'] = $oMysql->getListaOpciones('agencias','id','sNombre');

	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);	
	
	//xhtmlHeaderGrillas($aOpciones);
	$aOpciones['MOVIL'] = substr($_GET['sMovil'],3,strlen($_GET['sMovil']));	
	$aOpciones['ID_MENSAJE'] = $_GET['id'];
	
	$body = xhtmlTablaABM($aOpciones,'WindowContactos');
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

echo $body;
//echo $sDiv;

echo "</body></html>";

?>
