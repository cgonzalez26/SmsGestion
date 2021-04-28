<?php

	define( 'BASE' , dirname( __FILE__ ) . '/../..');

	include_once(  BASE . '/_global.php' );

	$idUser = $_SESSION['ID_USER'];

	$boolean = isLogin();
	
	if(!$boolean){ go_url(BASE_URL); }

	//include db connection settings
	error_reporting(E_ALL ^ E_NOTICE);

	function getRowsFromDB($parent_id){
		
		GLOBAL $oMysql;	
		//$sConditions = "usuarios.sEstado = 'AUTORIZADO' and usuarios.id<>'2'";
		$sConditions = "usuarios.sEstado = 'AUTORIZADO'";
		$array=$oMysql->consultaSel("CALL usp_getUsuarios(\"$sConditions\",\"\",\"\",\"\");");
	
		if(count($array)>0)
		{
			foreach ($array as $row){
				
				print("<row id='".$row['id']."'>");
				  print("<cell><![CDATA[".$row['id']."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sNombre'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sApellido'])."]]></cell>");				  		  print("<cell><![CDATA[".stripslashes($row['sDireccion'])."]]></cell>");
				  print("<cell><![CDATA[".stripslashes($row['sMail'])."]]></cell>");
				  print("<cell><![CDATA[".stripslashes($row['sMovil'])."]]></cell>");				  
						
				print("</row>");			
				
			}
			
		}		
		
	}


if ( stristr($_SERVER["HTTP_ACCEPT"],"application/xhtml+xml") ) {
 		header("Content-type: application/xhtml+xml"); } else {
 		header("Content-type: text/xml");
}
echo("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n"); 
?>

<!-- start grid xml -->
<rows id="0">
	
<?php 
	getRowsFromDB(0);
?>

</rows>
<!-- close grid xml -->