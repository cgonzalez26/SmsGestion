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
		$sConditions = " mensajes.idTipoMensaje = 2 ORDER BY dFechaRegistro DESC limit 0,50";//Tipo 2 son Recibidos en el Modem
		$array=$oMysql->consultaSel("CALL usp_getMensajes(\"$sConditions\",\"\",\"\",\"\");");
	
		if(count($array)>0)
		{
			$i = count($array)+1;
			foreach ($array as $row){
				$row['sMensaje'] = utf8_encode(strhexcode($row['sMensaje']));
				$i--;
				print("<row id='".$row['id']."'>");
				
				  print("<cell><![CDATA[".$row['idContacto']."]]></cell>");	
				  print("<cell><![CDATA[".$i."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sApellido'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sNombre'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sRemitente'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['dFechaRegistro'])."]]></cell>");				  
				  print("<cell><![CDATA[".stripslashes($row['sMensaje'])."]]></cell>");
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