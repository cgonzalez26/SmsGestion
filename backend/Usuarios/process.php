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
		
					$set = "sNombre,sApellido,sDireccion,sMail,sMovil";					
					$values = "'{$_GET['sNombre']}','{$_GET['sApellido']}','{$_GET['sDireccion']}','{$_GET['sMail']}','{$_GET['sMovil']}'";
					$ToAuditry = "Insercion de Usuario ::: {$_GET['sNombre']} {$_GET['sApellido']}";
					$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"usuarios\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);
					$action = "insert";
		
	}elseif (isset($_GET["!nativeeditor_status"]) && $_GET["!nativeeditor_status"] == 'deleted'){
					$set = "sEstado = 'DENEGADO'";
					$sConditions = "usuarios.id = '{$_GET['gr_id']}'";
					$ToAuditry = "Baja Logica de Usuario ::: {$_GET['gr_id']}";
					//$oMysql->consultaSel("CALL usp_deleteTable(\"usuarios\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");
					$oMysql->startTransaction();
					$oMysql->consultaAff("CALL usp_UpdateTable(\"usuarios\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");
					$oMysql->commit();				
					$newId = $_GET["gr_id"];
					$action = "delete";	
	}else{
		
					$set = "sNombre='{$_GET['sNombre']}',
							sApellido='{$_GET['sApellido']}',							
							sDireccion='{$_GET['sDireccion']}',
							sMovil='{$_GET['sMovil']}',
							sMail='{$_GET['sMail']}'
							";							

					$sConditions = "usuarios.id = '{$_GET['gr_id']}'";
					
					$ToAuditry = "Update de Usuarios ::: {$_GET['gr_id']}";
					
					//var_export("CALL usp_updateTable(\"Productos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");die();
					$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"usuarios\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");										
					
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

