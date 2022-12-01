<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	if(!isLogin()){go_url("/index.php");}

	$aParametros = array();
	
	$aOpciones['ANCHO_GRILLA'] = '100%';	
	
	$aParametros = getParametrosBasicos(1);	
	echo xhtmlHeaderPagina($aParametros);
	xhtmlHeaderGrillas($aOpciones);
	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$aParametros['HOME'] = $_SESSION['LOGIN'];
	//$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
	$headerBox = otenerMenu($aParametros, 1);
	
	$body = xhtmlTablaABM($aOpciones,'MensajesEnviados');
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
			Copyright &copy; 2022</p>
	</div>';
	
	
	echo $sDiv;
	
	echo "</body></html>";
?>