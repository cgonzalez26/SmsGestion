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
		
					$set = "sNombre,sDescripcion,sEstado";					
					$values = "'{$_GET['sNombre']}','{$_GET['sDescripcion']}','A'";
					$ToAuditry = "Insercion de Grupo ::: {$_GET['sNombre']}";
					$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"grupos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);
					$action = "insert";
		
	}elseif (isset($_GET["!nativeeditor_status"]) && $_GET["!nativeeditor_status"] == 'deleted'){
					$set = "sEstado = 'B'";
					$sConditions = "grupos.id = '{$_GET['gr_id']}'";
					$ToAuditry = "Baja Logica de Grupos ::: {$_GET['gr_id']}";					
					$oMysql->startTransaction();
					$oMysql->consultaAff("CALL usp_UpdateTable(\"grupos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");
					$oMysql->commit();
					$newId = $_GET["gr_id"];
					$action = "delete";	
	}else{
		
					$set = "sNombre='{$_GET['sNombre']}',
							sDescripcion='{$_GET['sDescripcion']}'";							
					$sConditions = "grupos.id = '{$_GET['gr_id']}'";
					
					$ToAuditry = "Update de Grupos ::: {$_GET['gr_id']}";
					
					//var_export("CALL usp_updateTable(\"Productos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");die();
					$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"grupos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");										
					
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

