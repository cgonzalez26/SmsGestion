<?php

	function numProducts($idTipoProducto){
		global $oMysql;
		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM Productos WHERE idTipoProducto = '$idTipoProducto'",true);
		
		if($count == false) $count = 0;
		
		return $count;		
	}
	
	function numFacturas($idProducto){
		global $oMysql;
		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM DetallesFacturas WHERE idProducto = '$idProducto'",true);
		
		if($count == false) $count = 0;
		
		return $count;		
	}
	
	function numTypesProducts($idRubro){
		global $oMysql;
		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM TiposProductos WHERE idRubro = '$idRubro'",true);
		
		if($count == false) $count = 0;
		
		return $count;		
	}
	
	function numFacturasByCustomer($idCustomer){
		global $oMysql;
		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM Facturas WHERE idCliente = '$idCustomer'",true);
		
		if($count == false) $count = 0;
		
		return $count;		
	}	

	function numTareas($idEstado){
		global $oMysql;
		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM Tareas WHERE idEstado = '$idEstado'",true);
		
		if($count == false) $count = 0;
		
		return $count;		
	}
	
	function numModelos($idMarca){
		global $oMysql;		
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM marcas_modelos WHERE idMarca='$idMarca'",true);		
		if($count == false) $count = 0;		
		return $count;		
	}
	
	function numMarcas($idModelo){		
		global $oMysql;
		$count = $oMysql->consultaSel("SELECT IFNULL(COUNT(id),0) FROM marcas_modelos WHERE idModelo = '$idModelo'",true);		
		if($count == false) $count = 0;
		return $count;		
	}
?>