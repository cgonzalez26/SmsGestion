<?php
final class Factura {
	
	public $id = 0;
	public $idDetail = 0;
	public $aDatos = array();
	public $TypeOperation = "New"; # New = ALTA , Edit = MODIFICACION , Delete = ELIMINAR ,  View = FICHA 
	
	public function __construct($idFactura){
		$this->id = $idFactura;				
	}	
	
	
	public function setDatos(){		
		global $mysql;
		$this->aDatos = array_shift($mysql->query("CALL usp_getFacturas(\"Facturas.id=$this->id\",\"\",\"\",\"\");"));
	}
	
	public function getDatos(){
		$this->setDatos();
		return $this->aDatos;
	}
	
	
	public function setTypeOperation($Operation){
		$this->TypeOperation = $Operation;
	}
	
	public function insert($aDatos){
		global $oMysql;

		$aDatos['dFchAlta'] = dateToMySql($aDatos['dFchAlta']);
		
		$Customer = new Customer($aDatos['idCliente']);
		$arrayCustomer = $Customer->getDatos();
		
		$sNombreCliente = $arrayCustomer['sNombre'];
		$sApellidoCliente = $arrayCustomer['sApellido'];
		$sDomicilioCliente = $arrayCustomer['sDomicilio'];
		$sTelefonoCliente = $arrayCustomer['sTelefono'];
		$sCuitCliente = $arrayCustomer['sCuit'];
		$idTipoIva = $arrayCustomer['idTipoIva'];
		
		$Set = "idTipoFactura,idCliente,idListadoCobranza,idTipoPago,idTipoIva,idUsuario,idVehiculo,idMovimientoCuentaCorriente,sNumFactura,dFchAlta,dFchRegistro,fTotal,sNombreCliente,sApellidoCliente,sDomicilio,sTelefonoCliente,sCuit,sEstado";

		$Values = "'{$aDatos['idTipoFactura']}','{$aDatos['idCliente']}','{$aDatos['idListadoCobranza']}','{$aDatos['idTipoPago']}','$idTipoIva','{$_SESSION['ID_USER']}','{$aDatos['idVehiculo']}','{$aDatos['idMovimientoCuentaCorriente']}','{$aDatos['sNumFactura']}','{$aDatos['dFchAlta']}',NOW(),'{$aDatos['fTotal']}','{$sNombreCliente}','{$sApellidoCliente}','{$sDomicilioCliente}','{$sTelefonoCliente}','{$sCuitCliente}','R'";

		$ToAuditory = "Alta de Factura ::: '{$aDatos['sNumFactura']}'";
		
		$this->id = array_shift($oMysql->consultaSel("CALL usp_InsertTable(\"Facturas\",\"$Set\",\"$Values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");"));

		return $this->id;
	}
	
	public function insertDetails($aDatos){
		global $oMysql;

		$set = "(idProducto,idFactura,iCantidad,fPrecioUnitario,fSubTotal)";
		$values = "";
		
		$array=array();
		foreach ($aDatos as $aItem ){			
			$array[] = "('{$aItem['idProducto']}','$this->id','{$aItem['iCantidad']}','{$aItem['fPrecio']}','{$aItem['fSubTotal']}')";
		}		
		
		$values = implode(',',$array);
		
		$ToAuditory = "Alta de Detalle de Factura ::: '{$this->id}'";	
		
		$id = array_shift($oMysql->consultaSel("CALL usp_abm_General(\"DetallesFacturas\",\"$set\",\"$values\",\"1\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");"));

		return $id;
	}
	
	public function delete(){
		global $oMysql;

		$this->id = $oMysql->consultaSel("CALL usp_deleteTable(\"Facturas\",\"Facturas.id='$this->id'\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");

		return $this->id;
	}
	
	public function update($array){
		
		global $oMysql;
		
		$i = 0;
		$Set = "";
		foreach ($array as $key => $value) {			
			
				$Set .= "$key = '$value',"; 			

		}
		
		$Set = substr_replace($Set,"",-1);
		
		$ToAuditory = "Actualizacion de datos de Factura id:::: $this->id";
		$sConditions = "Facturas.id = '$this->id'";	
		
		$id = $oMysql->consultaSel("CALL usp_UpdateTable(\"Facturas\",\"$Set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
	}	
	
}

?>