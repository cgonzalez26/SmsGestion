<?php 
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
	global $oMysql;
	$aClientes = $oMysql->consultaSel("SELECT PrestaFacil.clientes.sTelefono,PrestaFacil.clientes.sApellido,PrestaFacil.clientes.sNombre,PrestaFacil.clientes.sDni,PrestaFacil.clientes.sDomicilioParticular, 
	PrestaFacil.clientes.sMail,PrestaFacil.clientes.sEstado FROM PrestaFacil.clientes");

	$i=0;
	foreach ($aClientes as $row){
		if($row['sTelefono']){
			$aContacto = $oMysql->consultaSel("SELECT contactos.id,contactos.sMovil,contactos.sApellido,contactos.sNombre FROM contactos WHERE contactos.sMovil LIKE '{$row['sTelefono']}'",true);
			if(!$aContacto){
				$i++;
				//echo $i.'-TEL1='.$row['sTelefono'].'-TEL2='.$aContacto['sMovil'].'----'.$row['sApellido'].','.$row['sNombre']."<br>";	
				$sql = "INSERT INTO contactos(sNombre,sApellido,sDni,sMovil,sDireccion,sMail,sEstado) VALUES('{$row['sNombre']}','{$row['sApellido']}','{$row['sDni']}','{$row['sTelefono']}','{$row['sDomicilioParticular']}','{$row['sMail']}','{$row['sEstado']}')";
				$oMysql->startTransaction();
				$oMysql->consultaAff($sql);
				$oMysql->commit();	
				echo $i.'-TEL1='.$row['sTelefono'].'----'.$row['sApellido'].','.$row['sNombre']." <br>";			
			}		
			/*else{
				//echo $i.'-TEL1='.$row['sTelefono'].'-TEL2='.$aContacto['sMovil'].'----'.$row['sApellido'].','.$row['sNombre']."  EXISTE<br>";	
			}*/
		}
	}
	
?>