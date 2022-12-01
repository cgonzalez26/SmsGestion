<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	global $oMysql;
	
	$idUser = $_SESSION['ID_USER'];
	$TypeUser = $_SESSION['TYPE_USER'];	

	#Control de Acceso al archivo
	if(!isLogin()){go_url("/index.php");}

	$oXajax = new xajax();	
	//$oXajax->setCharEncoding('ISO-8859-1');
	$oXajax->configure('decodeUTF8Input',true);
	$oXajax->register( XAJAX_FUNCTION , 'enviarMailsRapidos');	
	$oXajax->register( XAJAX_FUNCTION , 'getMailUnidadNegocio');	
	
	$oXajax->processRequest();					
	$oXajax->printJavascript( "../includes/xajax/");

	$aParametros = array();
	$aParametros = getParametrosBasicos(1);	

	echo xhtmlHeaderPagina($aParametros);
	xhtmlHeaderGrillas($aOpciones);
	
	$aParametros['LOGIN'] = $_SESSION['LOGIN'];
	$aParametros['HOME'] = $_SESSION['LOGIN'];
	//$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
	$headerBox = otenerMenu($aParametros, 1);
	
	$aDatos = array();	 
	$aContactos = $oMysql->consultaSel("SELECT * FROM contactos WHERE sEstado='A' AND sMail<>''");      
	if(count($aContactos)>0)
	    foreach($aContactos as $row){
    		$aDatos[] = "'".$row['sNombre']." ". $row['sApellido']." <".$row['sMail']."> '";
    	}
	$sDatos = implode(",",$aDatos);
	$sCondicion2 = " unidadesnegocios.sEstado ='A'";
	$aOpciones['optionsUnidadesNegocios'] = $oMysql->getListaOpciones('unidadesnegocios','id','sNombre','',$sCondicion2);	

	/*echo $sDatos;
    echo "<script>
	    	collection = [".$sDatos."];
	</script>";*/
    //$aOpciones['sDatos'] = $sDatos;
	$body = xhtmlTablaABM($aOpciones,'MailsRapidos');
	$body = '<div id="divBody">'.$body.'</div>';
	
	$sDiv = '
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
	</div>';
	
	
	echo $sDiv;
	
	echo "</body></html>";
?>