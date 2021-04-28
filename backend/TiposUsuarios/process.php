<?php

	define( 'BASE' , dirname( __FILE__ ) . '/../..');

	include_once(  BASE . '/_global.php' );

	#Control de Acceso al archivo
	#if(!isLogin()){go_url("../index.php");}

	$idUser = $_SESSION['ID_USER'];

	//$boolean = securityAcces('home');

 	header("Content-type: application/xhtml+xml"); 
 		//header("Content-type: text/xml");
	//}
	echo("<?xml version=\"1.0\" encoding=\"iso-8859-1\"?>\n"); 
	
	
	
	if(isset($_GET["!nativeeditor_status"]) && $_GET["!nativeeditor_status"] == 'inserted'){
		
					$set = "sNombre,iCuotas,sEstado";
					
					$values = "'{$_GET['sNombre']}','A'";
					$ToAuditry = "Insercion de Plan de Pago ::: {$_GET['sNombre']}";
					
					$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"planespagos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);
					
					$action = "insert";
		
	}elseif (isset($_GET["!nativeeditor_status"]) && $_GET["!nativeeditor_status"] == 'deleted'){
		
					$sConditions = "planespagos.id = '{$_GET['gr_id']}'";
					$ToAuditry = "Baja de planes de pagos::: {$_GET['gr_id']}";
						
					$oMysql->consultaSel("CALL usp_deleteTable(\"planespagos\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");
									
					$newId = $_GET["gr_id"];
					$action = "delete";						
						
	}else{
		
					$set = "sNombre='{$_GET['sNombre']}'";							
					$sConditions = "planespagos.id = '{$_GET['gr_id']}'";
					$ToAuditry = "Update de planes de pagos ::: {$_GET['gr_id']}";
					
					$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"planespagos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");				
					
					$newId = $_GET["gr_id"];					
					$action = "update";			
	}

?>
<!-- response xml -->
<data>
	<?php 
	if($newId!=0){
		print("<action type='".$action."' sid='".$_GET["gr_id"]."' tid='".$newId."'/>");
	}else{
		print("<action type='error'>$smsError</action>");
	}
	?>
</data>

