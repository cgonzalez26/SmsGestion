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
		$sConditions = " mensajes.idEstadoMensaje <>4 AND idTipoMensaje=1 ORDER BY dFechaRegistro DESC";
		$array=$oMysql->consultaSel("CALL usp_getMensajes(\"$sConditions\",\"\",\"\",\"\");");
	
		if(count($array)>0)
		{
			foreach ($array as $row){
				if($row['sApellido'] == ""){
					$aContacto = $oMysql->consultaSel("SELECT id,sApellido,sNombre FROM contactos WHERE sMovil ='{$row['sDestinatario']}'",true);
					$row['sApellido'] = $aContacto['sApellido'];
					$row['sNombre'] = $aContacto['sNombre'];
				}
				print("<row id='".$row['id']."'>");
				  print("<cell><![CDATA[".$row['id']."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sApellido'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sNombre'])."]]></cell>");	
				  print("<cell><![CDATA[".stripslashes($row['sDestinatario'])."]]></cell>");	
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