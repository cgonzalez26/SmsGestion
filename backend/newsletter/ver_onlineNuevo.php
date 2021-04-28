<?php 
include_once('../SmsGestion/_global.php');
global $oMysql;
?>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Griva Soluciones Informaticas</title>
	<meta content="text/html; charset='iso-8859-1'" http-equiv="Content-Type">
<link type="image/png" href="{CSS_DIR}/images/icono.png" rel="shortcut icon" sizes="32x32">

</head>
<body>
<center>
<?php 
if($_GET['idmsje']){
	$sContenido = $oMysql->consultaSel("SELECT campanias.sMensaje FROM campanias WHERE id ={$_GET['idmsje']}",true);	
	$sContenido = stripslashes($sContenido);
	
	$sVer = "";
	if($_GET['mostrarLinkVer'] == 0) $sVer = "style='display:none'";
	$arrayHTML=array("HTML_BODY"=>$sContenido,"ID_MSJE"=>$idCampania,"ID_CONTACTO"=>0,"MOSTRAR_LINK_VER"=>$sVer);			
	$HtmlTemplate = parserTemplate(TEMPLATES_XHTML_DIR."/pages/promo.tpl" , $arrayHTML);
	echo $HtmlTemplate;
}
?>
</center>	
</body>
</html>