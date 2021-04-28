<?php

	define( 'BASE' , dirname( __FILE__ ) . '/../..');

	include_once(  BASE . '/_global.php' );

	$idUser = $_SESSION['ID_USER'];

	$boolean = isLogin();
	
	/*if(!$boolean){ go_url(BASE_URL); }*/

	//include db connection settings
	error_reporting(E_ALL ^ E_NOTICE);
	
	
	function arrayPermits(){
		global $oMysql;
		
		$array = $oMysql->consultaSel("CALL usp_getContactos(' contactos.sEstado=\'A\'','','','');");
		
		if(!is_array($array)) $array = array();				
		
		$newRows = array();
		$keyTypeObject = 'sNombreGrupoUsuario';
		$keyObject = 'sMail';
		
		foreach ($array as $object) {			
				
			$LastTypeObject = $object[ $keyTypeObject ];
			$LastObject = $object[ $keyObject ];
			$newRows[ $LastTypeObject ][ $LastObject ][] =  $object ;					

		}
		
			
		return $newRows;	
		
	}
	
	function paint_xml($array){
		global $oMysql;
		$body = "";

		foreach ($array as $keyTypeObjetc => $object){
			print("<item id=\"userMenuLink_$keyTypeObjetc\" text=\"{$keyTypeObjetc}\" im0=\"\" im1=\"\" im2=\"\" open=\"1\" call=\"1\" select=\"1\">");		
			
			$i = 0;	
			foreach ($object as $keyObject => $values){
				$i++;
				//$idItem = "userMenuLink_".$keyTypeObjetc."_".$keyObject;
				$idItem = "userMenuLink_".$keyObject;
				if($keyObject != ""){
					print("<item id=\"$idItem\" text=\"{$keyObject}\" im0=\"\" im1=\"\" im2=\"\" open=\"1\" call=\"1\" select=\"0\">");
					/*foreach ($values as $permit){
	
						$idItem = "idPermitObject_".$permit['idPermisoObjeto'];
	
						print("<item id=\"$idItem\" text=\"{$permit['sNombreTipoPermiso']}\" im0=\"\" im1=\"\" im2=\"\"/>");
					}*/
					print("</item>");
				}
			}

			print("</item>");
		}		

	}	

	

	if ( stristr($_SERVER["HTTP_ACCEPT"],"application/xhtml+xml") ) {
	 		header("Content-type: application/xhtml+xml"); 
	} else {
	 		header("Content-type: text/xml");
	}

echo("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n"); 
?>

<!-- start grid xml -->
<tree id="0">	
<?php 
	$array = arrayPermits();
	
	paint_xml($array);
?>
</tree>
<!-- close grid xml -->