<?php
final class Customer {
	
	public $id = 0;	
	public $aDatos = array();
	public $TypeOperation = "New"; # New = ALTA , Edit = MODIFICACION , Delete = ELIMINAR ,  View = FICHA 	
	
	public function __construct($idFactura){
		$this->id = $idFactura;				
	}
	
	public function setDatos(){		
		global $mysql;
		$this->aDatos = array_shift($mysql->query("CALL usp_getClientes(\"Clientes.id=$this->id\",\"\",\"\",\"\");"));
	}
	
	public function getDatos(){
		$this->setDatos(); return $this->aDatos;
	}
	
	
	public function setTypeOperation($Operation){
		$this->TypeOperation = $Operation;
	}	

	
	public function insert($aDatos){
		global $oMysql;

		$Set = "";

		$Values = "'{$aDatos['']}',";

		$ToAuditory = "Alta de cliente ::: '{$aDatos['']}'";

		$this->id = array_shift($oMysql->consultaSel("CALL usp_InsertTable(\"Clientes\",\"$Set\",\"$Values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");"));

		return $this->id;
	}	
	
	
	public function delete(){
		global $oMysql;

		$this->id = $oMysql->consultaSel("CALL usp_deleteTable(\"Clientes\",\"Clientes.id='$this->id'\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");

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
		
		$ToAuditory = "Actualizacion de datos de Cliente id ::: $this->id";
		$sConditions = "Clientes.id = '$this->id'";
		
		$id = $oMysql->consultaSel("CALL usp_UpdateTable(\"Clientes\",\"$Set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
	}

	public function addMovimientoCuentaCorriente($aDatos){
		global $oMysql;
		
		$hoy = date("Y-m-d h:i:s");
		
		$set = "idCliente,idTipoMovimientoCuentaCorriente,sComprobante,fDebe,fHaber,dFechaRegistro,sDetalle,idPago";

		$values = "'{$this->id}','{$aDatos['idTipoMovimientoCuentaCorriente']}','{$aDatos['sComprobante']}','{$aDatos['fDebe']}','{$aDatos['fHaber']}','{$hoy}','{$aDatos['sDetalle']}','{$aDatos['idPago']}'";

		$ToAuditory = "Alta de Movimiento de Cuenta Corriente para Cliente ::: '{$aDatos['idCliente']}'";

		$id = array_shift($oMysql->consultaSel("CALL usp_InsertTable(\"CuentasCorrientes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");"));

		return $id;
		
	}
	
	public function destroyMovimientoCuentaCorriente(){
		global $oMysql;
		
		
		
		return $id;
	}
	
	public function cancelMovimientoCuentaCorriente($id){
		global $oMysql;
		
		$set = "CuentasCorrientes.iBorrado = 1";
		
		$ToAuditory = "cancelacion de Movimiento de CuentaCorriente de Cliente id ::: $this->id";
		
		$sConditions = "CuentasCorrientes.id = '$id'";
		
		$id = $oMysql->consultaSel("CALL usp_UpdateTable(\"CuentasCorrientes\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
		return $id;		
	}	
	
}

?>