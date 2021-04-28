<?php 
define( 'BASE' , dirname( __FILE__ ) . '/../..');
include_once(  BASE . '/_global.php' );
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
	$sContenido = $oMysql->consultaSel("SELECT mails.sMensaje FROM mails WHERE mails.id ={$_GET['idmsje']}",true);	
	echo $sContenido;
}
?>
	</center>
</body>
</html>