<?php
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	include(BASE ."/backend/includes/clases/ExcelReader/reader.php");
	
	$sMsje = "";
	
	if ($_POST['action'] == "upload"){
		
		$archivo = $_FILES['excel']['name'];
		$destino = "bak_".$archivo;
		
		if (!copy($_FILES['excel']['tmp_name'],$destino))		
		    echo "Error Al Cargar el Archivo";
		    
		if (!file_exists("bak_".$archivo)){
			$sMsje .= "No existe el Archivo excel.";
		}else{
			
			$datos = new Spreadsheet_Excel_Reader();
			
			//$nombre = "ContactosMail.xls";
			$datos->read("bak_".$archivo);
			
			$celdas = $datos->sheets[0]['cells'];
			
			$k = 0;
			$aMailExiste = array();
			for ($i = 2; $i <= $datos->sheets[0]['numRows']; $i++) {
				$celdas[$i][4] = trim($celdas[$i][4]);
				$sqlContacto = "SELECT contactos.id FROM contactos WHERE contactos.sMail = '{$celdas[$i][4]}' ";
				//contactos.sMail = '{$celdas[$i][4]}'
				if($celdas[$i][6] != "") $sqlContacto .= " OR contactos.sMovil ='{$celdas[$i][6]}'"; 
				$idContacto = $oMysql->consultaSel($sqlContacto,true);
				if(!$idContacto){
					$celdas[$i][1] = strtoupper($celdas[$i][1]);
					$celdas[$i][2] = strtoupper($celdas[$i][2]);
					$celdas[$i][3] = strtoupper($celdas[$i][3]);
					
					$sql= "INSERT INTO contactos(idGrupo,sNombre,sApellido,sDireccion,sTelefono,sMail,sMovil,sEstado) VALUES('{$celdas[$i][7]}','{$celdas[$i][1]}','{$celdas[$i][2]}','{$celdas[$i][3]}','{$celdas[$i][5]}','{$celdas[$i][4]}','{$celdas[$i][6]}','{$celdas[$i][8]}');";
					$oMysql->startTransaction();
					$oMysql->consultaAff($sql);
					$oMysql->commit();
					$k++;
				}else {
					$aMailExiste[] = $celdas[$i][4];
				}
				
			}
			if($k > 0) $sMsje .= "Se insertaron ".$k." registros como contactos.<br>";
			if(count($aMailExiste) > 0) $sMsje .= "Los siguientes mails ya existen en Bases de Datos: <br>".implode(",<br>",$aMailExiste);
		}
	}
?>

<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title> Importar de Excel a la Base de Datos</title>
</head>

<body>
	<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' align="center">
		<tr>
			<td class='title' width='100' style="height:30px;" align="center"><strong>Importacion de Contactos</strong></td>
		</tr>
	</table>	

Selecciona el archivo a importar:

<form name="importa" method="post" action="Importar.php" enctype="multipart/form-data" >

<input type="file" name="excel" />

<input type="submit" name="enviar"  value="Importar"  />

<input type="hidden" value="upload" name="action" />

</form>
<span><?php echo $sMsje; ?></span>
</body>