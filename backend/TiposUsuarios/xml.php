<?php

define( 'BASE' , dirname( __FILE__ ) . '/../..');

include_once(  BASE . '/_global.php' );

#Control de Acceso al archivo
#if(!isLogin()){go_url("../index.php");}

$idUser = $_SESSION['ID_USER'];

//include db connection settings
error_reporting(E_ALL ^ E_NOTICE);


function getRowsFromDB($parent_id){
	
	GLOBAL $oMysql;
	$sConditions = "tiposusuarios.sEstado <> 'B'";	
	$array = $oMysql->consultaSel("CALL usp_getTiposUsuarios(\"$sConditions\",\"\",\"\",\"\");");
		
	if(count($array)>0)
	{
		foreach ($array as $row){
			print("<row id='".$row['id']."'>");
		  	print("<cell><![CDATA[".stripslashes($row['sNombre'])."]]></cell>");
			print("</row>");			
		}
		
	}
}

//include XML Header (as response will be in xml format)
if ( stristr($_SERVER["HTTP_ACCEPT"],"application/xhtml+xml") ) {
 		header("Content-type: application/xhtml+xml"); } else {
 		header("Content-type: text/xml");
}

echo "<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n"; 
?>

<!-- start grid xml -->
<rows id="0">
	
<?php	
	getRowsFromDB(0);	
?>

</rows>
<!-- close grid xml -->