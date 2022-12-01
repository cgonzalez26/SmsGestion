<?php
final class User {
	
	public $id = 0;
	public $aDatos = array();
	public $TypeOperation = "New"; # New = ALTA , Edit = MODIFICACION , Delete = ELIMINAR ,  View = FICHA 
	
	public function __construct($idUser){
		$this->id = $idUser;				
	}
	
	public function setDatos(){
		//$mysql = new MySql();
		global $mysql;
		$this->aDatos = array_shift($mysql->query("CALL usp_getUsuarios(\"usuarios.id=$this->id\",\"\",\"\",\"\");"));
	}
	
	public function getDatos(){
		$this->setDatos();
		return $this->aDatos;
	}
	
	
	public function setTypeOperation($Operation){
		$this->TypeOperation = $Operation;
	}
	
	public function xhtmlOperation(){		
		//$mysql = new MySql();
		global $mysql;
		switch ($this->TypeOperation) {
				case "New":#ALTA
							return true;
					break;
			
				case "Edit":#EDICION
							return true;
					break;
				case "Delete":#DELETE
							return true;
					break;					
				case "View":#VISTA
							return true;
					break;					
			}	
	}

	
	
	public function updateUser($aDatos){
		//$mysql = new MySql();					
		global $mysql;
		
		$UpdatePass = "";
		
		if($aDatos['Password'] != "") $UpdatePass = "usuarios.sPassword = '".md5($aDatos['sPassword'])."',";
		
		$set = "Usuarios.idOficina = '{$aDatos['idOficina']}',usuarios.idTipoUsuario = '{$aDatos['idTipoUsuario']}',$UpdatePass usuarios.sEstado = '{$aDatos['sEstado']}'";
		
		$mysql->query("CALL usp_UpdateTable(\"usuarios\",\"{$set}\",\"usuarios.id = '{$this->id}'\",\"{$_SESSION['ID_USER']}\",\"2\");");
		
		//$this->updatePermisos($aDatos['key']);
		
		return true;
		
	}
	
	public function insertUser($aDatos){		
		global $mysql;
				
		return true;
	}
	
	public function deleteUser(){
		//$mysql = new MySql();
		global $mysql;			
		
		#Corroborar que no tenga "Movimientos":: ya se agregra a medida que cresca
		
		$mysql->query("CALL usp_deleteTable(\"usuarios\",\"usuarios.id='$this->id'\",\"{$_SESSION['ID_USER']}\",\"3\");");		
		$this->id = $mysql->getLastInsertID();
		$this->updatePermisos($aDatos['key']);
		
		return $this->id;
	}		
	
	public function update($array){
		
		global $oMysql;
		
		$i = 0;
		$set = "";
		foreach ($array as $key => $value) {			
			
				$set .= "$key = '$value',"; 			

		}
		
		$set = substr_replace($set,"",-1);
		
		$ToAuditory = "Actualizacion de datos del Usuario id:::: $this->id";
		$sConditions = "usuarios.id = '$this->id'";	
		//var_export($set);die();
		$id = $oMysql->consultaSel("CALL usp_UpdateTable(\"usuarios\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
	}
	
	
	public function savePermit($sPermits){
		#$sPermit ::: userMenuLink_sTipoObjeto_idObjeto_idPermiso 		
		
		GLOBAL $oMysql;	
		
		#tengo un array con ::: idPermisoObjeto		
		$aPermitObject = explode(",",$sPermits);

		$search   = 'idPermitObject_';

		foreach ($aPermitObject as $PermitObject){

			$pos = strpos($PermitObject, $search);

			if ($pos !== false) { 
				$idPermit = str_replace("idPermitObject_","",$PermitObject);		
				$aNewRulesUsers[] = $idPermit; 
			}
		}		
		
		#Obtengo Reglas del Usuario en cuestion			
		
		$array = $oMysql->consultaSel("CALL usp_getPermitUser(\"$this->id\");");
		
		$aOldRulesUsers = array();				
		
		foreach( $array as $keyPermitObject ) { $aOldRulesUsers[] = $keyPermitObject['ID_PERMIT_OBJECT'] ; }	
		
		foreach ($aNewRulesUsers as $idRule ){

			if(!in_array($idRule,$aOldRulesUsers)){
				
				$idPermitUser = $this->addRule($idRule);
				$aOldRulesUsers[] = $idRule;
				
			}

		}
		
		foreach ($aOldRulesUsers as $idRule ){

			if(!in_array($idRule,$aNewRulesUsers)){
				
				$idPermitUser = $this->removeRule($idRule);
				
			}

		}		
		
	}		
	
	public function addRule($idPermitObject){
		Global $oMysql;						
		
			
		$ToAuditory = "Se asocio reglas (idPermisoObjeto,idUsuario) ::: ($idTypePermit,$idObject,$this->id) al usuario $this->id";
		$Set = "idPermisoObjeto,idUsuario";
		$Values = "$idPermitObject,$this->id";
		
		$id = $oMysql->consultaSel("CALL usp_InsertTable(\"permisosobjetosusuarios\",\"$Set\",\"$Values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
		return $id ;
	}
	
	public function removeRule($idPermitObject){
		Global $oMysql;						
		
			
		$ToAuditory = "Se quito regla (idPermisoObjeto,idUsuario) ::: ($idPermitObject,$this->id) al usuario $this->id";
		$sConditions = "permisosobjetosusuarios.idPermisoObjeto = $idPermitObject AND PermisosObjetosUsuarios.idUsuario = '$this->id'";
		
		$id = $oMysql->consultaSel("CALL usp_DeleteTable(\"permisosobjetosusuarios\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");");
		
		return $id ;
	}	
		
}
?>