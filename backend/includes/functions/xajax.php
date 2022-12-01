<?php

//--------------------------------------------------------------------------------------------------------------

function Validate($sLogin){
	$mysql = new MySql();
	$oRespuesta = new xajaxResponse();		
	
	$SQL = "SELECT sLogin FROM Usuarios WHERE Usuarios.sLogin = '$sLogin'";
	$estaLogin = (boolean) $mysql->selectValue($SQL);
	if($estaLogin){
		$sms = "<span style='font-weight:bold;color:#990000;'>Login Invalido</span>";
		$oRespuesta->call('estaLogin(1)');
	}else{
		$sms = "<span style='font-weight:bold;color:#336699;'>Login Valido</span>";
		$oRespuesta->call('estaLogin(0)');
	}
	$oRespuesta->assign("LoginValid","innerHTML",$sms);
	
	return $oRespuesta;
}

//--------------------------------------------------------------------------------------------------------------

function SelectRules($idTipoUsuario){
	$mysql = new MySql();
	$oRespuesta = new xajaxResponse();			
	$Rules = $mysql->query("CALL usp_getReglas();");
	$Permisos = $mysql->query("CALL usp_getPermisos(\"Permisos.idTipoUsuario = '$idTipoUsuario'\");");
	foreach ($Permisos as $Permiso){$arrayReglas[] = $Permiso['PERMISOS']['idRegla'];}
	$color[0] = "#FFFFFF";
	$color[1] = "#F5F5F5";
	$i = 0;
	$HtmlCheckBox = "";
	
	foreach ($Rules as $rule) {
		
		$checked = (in_array($rule['REGLAS']['id'],$arrayReglas)) ? "checked": "";
		$colorSelected = $color[($i % 2)];
		$array = array("BACKGROUND" => $colorSelected,"id" => $rule['REGLAS']['id'], "sNombre" => $rule['REGLAS']['sNombre'], "checked_" => $checked,"sObjeto" => $rule['REGLAS']['sObjeto']);
		$HtmlCheckBox .= parserTemplate(TEMPLATES_XHTML_DIR . "/searchFormsParts/checkboxReglas.tpl" , $array);

		$i++;
	}
	
	$oRespuesta->assign("tdRules","innerHTML",$HtmlCheckBox);
	
	return $oRespuesta;	
}

//--------------------------------------------------------------------------------------------------------------

function tagSelectLocalidades($idProvincia=null){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();			
	
	$where = (is_null($idProvincia)) ? "" : "Localidades.idProvincia = '$idProvincia'" ;	
	$options = arrayToOptions(($mysql->query("CALL usp_getSelect(\"Localidades\",\"id\",\"sNombre\",\"$where\");")));
	
	$selects = "&nbsp;<select name='idLocalidad' id='idLocalidad' style='width:150px;'><option value='0'>[-Selecccionar-]</option>".$options."</select>";		
	
	$oRespuesta->assign('tdLocalidad','innerHTML',$selects);	
	
	
	return $oRespuesta;		
}

//--------------------------------------------------------------------------------------------------------------

function existCompanyName($nameCompany){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();				
	$bExistName = false;
	
	$bExistName = (boolean) $mysql->selectValue("SELECT IF(Empresas.sRazonSocial<> '' , 0, 1) as 'NameCompany' FROM Empresas WHERE sRazonSocial='$nameCompany'");	
	
	if($bExistName){		
		$text = "Nombre Existente";
		$classText = "Prohibited";
		$oRespuesta->call("changeStatus(false);");
	}else{
		$text = "Ok";
		$classText = "Allowed";
		$oRespuesta->call("changeStatus(true);");
	}
	
	$sms = "<span class='$classText'>$text</span>";
	$oRespuesta->assign('nameCompany','innerHTML',$sms);
	
	
	
	return $oRespuesta;			
}

//--------------------------------------------------------------------------------------------------------------


function getTagSelectUsuarios($idOficina){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();

	$options = arrayToOptions($mysql->query("CALL usp_getSelect(\"Usuarios\",\"id\",\"sNombre\",\"idOficina = '$idOficina'\");"));
	
	$selects = "&nbsp;<select name='idUsuario' id='idUsuario' style='width:200px;'><option value='0'>[-Selecccionar-]</option>".$options."</select>";
		
	$oRespuesta->assign('tdUsuario','innerHTML',$selects);
	
	
	return $oRespuesta;
}

//--------------------------------------------------------------------------------------------------------------

function tagSelectEmpresas(){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();

	$options = arrayToOptions($mysql->query("CALL usp_getSelect(\"Empresas\",\"id\",\"sRazonSocial\",\"\");"));
	
	$selects = "&nbsp;<select name='idEmpresa' id='idEmpresa' style='width:200px;' onchange=\"xajax_getTagTiposPagos(this.value);\"><option value='0'>[-Selecccionar-]</option>".$options."</select>";
		
	$oRespuesta->assign('tdEmpresas','innerHTML',$selects);
	
	
	return $oRespuesta;
}

//--------------------------------------------------------------------------------------------------------------

function checkNumeroComprobante($NumeroComprobante = ""){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();	
	$txtMessage = "";
	$SQL = "SELECT IF(ISNULL(sNumeroComprobante),0,1) as 'NumeroComprobante' FROM Pagos WHERE Pagos.sNumeroComprobante = '$NumeroComprobante'";	
	if($NumeroComprobante != "" && !is_null($NumeroComprobante)) $estaNumero = (boolean) $mysql->selectValue($SQL); 
	else {$estaNumero = true;$txtMessage = "Recibo Invalido";}
	
	if($estaNumero){
		$txtMessage = ($txtMessage == "") ? "Recibo Duplicado" : $txtMessage ;		
		$color='#ff0000';
		$oRespuesta->call("NumeroReciboCheck(0)");
	}else{
		$txtMessage = "Recibo Ok";
		$color='#336699';		
		$oRespuesta->call("NumeroReciboCheck(1)");
	}
	$Message = "<span style='color:$color;font-family:Tahoma;font-size:10px;font-style:italic;'>$txtMessage</span>";	
	
	$oRespuesta->assign('tdMensajeCheckRecibo','innerHTML',$Message);	
	
	return $oRespuesta;	
}


//--------------------------------------------------------------------------------------------------------------

function getFields($idTable){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();		
	
	$arrayFields = $mysql->query("CALL usp_getCamposTablas(\"$idTable\");");	
	

	$color[0] = "#FFFFFF";
	$color[1] = "#F5F5F5";
	$i = 0;
	$HtmlCheckBox = "";
	
	foreach ($arrayFields as $Field) {		
		
		$colorSelected = $color[($i % 2)];
		$Field['Campos']['BACKGROUND'] = $colorSelected;		
		$xhtmlcheckBoxField .= parserTemplate(TEMPLATES_XHTML_DIR . "/searchFormsParts/checkFields.tpl" , $Field['Campos']);
		$i++;
	}		
	
	
	$xhtmlTableFields = parserTemplate( TEMPLATES_XHTML_DIR . "/formsParts/formFields.tpl",array("FIELDS_REMOTES" => $xhtmlcheckBoxField,"IMAGES_DIR" => IMAGES_DIR, "ID_TABLE" => $idTable));
	//$arrayAcces['TABLES_REMOTES'] = $xhtmlTableFields;
	
	$oRespuesta->assign('tdTablesFieldsRemotes','innerHTML',$xhtmlTableFields);
	
	return $oRespuesta;
	
}

//--------------------------------------------------------------------------------------------------------------

function beginConditions($idAcceso, $idTable){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();			
	
	$arrayTablas = $mysql->query("CALL usp_getTablasRemotas(\"$idAcceso\");");
	
	foreach ($arrayTablas as $Table){
		$Conditions = "idTabla = '{$Table['Tablas']['id']}'";
		$mysql->query("CALL usp_DeleteTable(\"Relaciones\",\"$Conditions\");");
	}
	
	$xhtmlSelectVinculos = "Ya ta";
	
	$oRespuesta->assign('tdConditions','innerHTML',$xhtmlSelectVinculos);
		
	return $oRespuesta;			
}

//--------------------------------------------------------------------------------------------------------------

function loadLinkRelations($idTabla){
	$oRespuesta = new xajaxResponse();	
	
	$xhtmlLink =  "<img src='".IMAGES_DIR."/relacionesTablas.png' title='Relaciones' align='absmiddle'>&nbsp;<a href=\"#\">[Dependencias]</a>";
	
	$oRespuesta->assign('sLinkRelations','innerHTML',$xhtmlLink);
	
	return $oRespuesta;		
}

//--------------------------------------------------------------------------------------------------------------

function getRelationsTables($idTable){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();	
	
	$nameTable = getNameTable($idTable);
	
	#la idea de la funcion obtener todas las tablas que se viculan con idTable
	
	
	#Esta parte es para armar las relaciones
	$ForeignKeys = $mysql->query("SELECT id FROM Relaciones WHERE idTabla = '$idTable'");	
	
	foreach ($ForeignKeys as $key) { //Recorro las distintas relaciones que puede tener una tabla		
		$arrayTables = $mysql->query("CALL usp_getRelaciones(\"$key\");");
	}
	$i = 0;
	foreach ($arrayTables as $table) {		
		$arrayOptions[$i]['CODE'] = $table['Relaciones']['id'];
		$arrayOptions[$i]['TEXT'] = $table['Relaciones']['sTabla'];		
		$i++;
	}
	
	$array['OptionsTablasDependientes'] = arrayToOptions($arrayOptions);	
	$array['IMAGES_DIR'] = IMAGES_DIR;
	$array['Tabla_Local'] = $nameTable;
	$xhtmlTableRelations = parserTemplate( TEMPLATES_XHTML_DIR . "/formsParts/formRelations.tpl",$array);
	
	$oRespuesta->assign('tdTablesRelations1','innerHTML',$xhtmlTableRelations);
	
	return $oRespuesta;	
}

//--------------------------------------------------------------------------------------------------------------

function uploadFields($idRelacion){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();
	
	$SQL = "
			SELECT
				Relaciones.id as 'Relaciones[id]',
				Relaciones.idTabla as 'Relaciones[idTabla]',
				Relaciones.idForeignKey as 'Relaciones[idForeignKey]',
				Relaciones.sCampoLocal as 'Relaciones[sCampoLocal]',
				Relaciones.sCampoForeign as 'Relaciones[sCampoForeign]',
				
				Tablas.sTabla as 'Relaciones[sTabla]'
			FROM
				Relaciones
				LEFT JOIN Tablas ON Relaciones.idTabla = Tablas.id
	        WHERE Relaciones.id = '$idRelacion'
		   ";
	
	$arrayFields = $mysql->query($SQL);	
	
	foreach ($arrayFields as $Field) {
		/*$xhtmlCampoLocal = "<option value='".$Field['Relaciones']['sCampoLocal']."'>&nbsp;".$Field['Relaciones']['sCampoLocal']."</option>";
		$xhtmlCampoForeign = "<option value='".$Field['Relaciones']['sCampoForeign']."'>&nbsp;<img src='".IMAGES_DIR."/add_16.png'> ".$Field['Relaciones']['sCampoForeign']."</option>";*/
		$xhtmlRelacion = "<option value='".$Field['Relaciones']['sCampoLocal']."=".$Field['Relaciones']['sCampoForeign']."'>&nbsp;".$Field['Relaciones']['sCampoLocal']." = ".$Field['Relaciones']['sCampoForeign']."</option>";		
		$sTabla = $Field['Relaciones']['sTabla'];
	}
	
	$TagSelectCampoLocal = "<input type='text' name='sCampoLocal' id='sCampoLocal' size='30'>";
	$TagSpan = $sTabla;
	$TagSelectRelacion = "<select name='idRelacion' id='idRelacion' size='10' multiple style='width:460px;text-align:center;'>$xhtmlRelacion</select>";
	
	//$oRespuesta->assign('tdCampoLocal','innerHTML',$TagSelectCampoLocal);
	$oRespuesta->assign('sTabla','innerHTML',$TagSpan);
	$oRespuesta->assign('tdRelacion','innerHTML',$TagSelectRelacion);
	return $oRespuesta;
}

function setPagoEmpresa($array){
	$mysql = new MySQL();
	$oRespuesta = new xajaxResponse();
	
	#Creo Caja Operario
	$hoy = date("d/m/Y");
	$idCaja = CajaOperario::issetCaja($_SESSION['ID_USER'], $hoy);
	$caja = new CajaOperario($idCaja);
	
	//var_export($array);die();
	
	$caja->addPagoEmpresa($array);
	
	$xhtmlRow= "<tr><td style='color:#000000;font-family:Tahoma;font-size:11px;' valign='top'>--------->Se registro su Pago</td></tr>";
	#Retorno respuesta
	$oRespuesta->assign('tdFormPago','innerHTML',$xhtmlRow);
	
	return $oRespuesta;	
}



function ComboCombinado($sTabla,$iColumna,$id){
	GLOBAL $oMysql;
	$oRespuesta = new xajaxResponse();
	
	$sCondiciones=" where idProvincia=$id  ";
	$sLista="id , sNombre ";
	
	$sConsulta="call usp_getSelectTable(\"$sTabla\",\"$sCondiciones\",\"$sLista\")";
	
	$aDatos=$oMysql->consultaSel($sConsulta,false,'id');
	
	$sScript="";
	foreach ($aDatos AS $key => $sDato ){
		
		    $sScript.="mygrid.getCustomCombo(mygrid.getSelectedId(),$iColumna).put('$key','$sDato');";
	}
	   

	$oRespuesta->script($sScript);
	   
   return $oRespuesta;
}

function GuardarLocalidad($aForm){
	GLOBAL $oMysql;
	$oRespuesta = new xajaxResponse();
	
		   
	$aDatos['TABLA']=$aForm['sTABLA'];
	$aDatos['CAMPOS']="idLocalidad ='{$aForm['idLocalidad']}'";
	$aDatos['VALORES']="id = {$aForm['idKey']}";
	$aDatos['OPERACION']=3;
	$aDatos['ID_USER']=0;
	$aDatos['ID_TIPOAUDIT']=0;
	$aDatos['$DETALLE']='--';
		                  
	$oMysql->operacionABM($aDatos);

	$oRespuesta->script($sScript);
	
	$oRespuesta->assign("divMessageLocalidad","innerHTML","");	
	   
   return $oRespuesta;
	
}

function LoadDatosUser($id,$sTabla){
   GLOBAL $oMysql;
   $oRespuesta = new xajaxResponse();
   
   $sConditions = "usuarios.id = '$id'";
   
   $aUser = $oMysql->consultaSel("CALL usp_getUsuarios(\"$sConditions\",\"\",\"\",\"\");",true);
   
   $oRespuesta->assign('sLogin_','value',$aUser['sLogin']);
   
   if($aUser['sLogin'] != '' && $aUser['sLogin'] != 'NO_NAME'){
   		$oRespuesta->assign('sLogin_','disabled',true);	
   }
   
   $oRespuesta->script("LoadOficina({$aUser['idSucursal']},{$aUser['idOficina']})");
   
   
   $oRespuesta->assign('idSucursal','value',$aUser['idSucursal']);
   $oRespuesta->assign('idOficina','value',$aUser['idOficina']);
   $oRespuesta->assign('sEstado','value',$aUser['sEstado']);
   
   $Name = $aUser['sNombre'].", ".$aUser['sApellido'];
   $oRespuesta->assign('divNameUser','innerHTML',$Name);

	   
   return $oRespuesta;	
}

	
function  CargarProducto($idRow,$sValue){
	GLOBAL $oMysql;
    $oRespuesta = new xajaxResponse();
	
    $aDatos=getProducto($sValue);
    $sScript="
    mygrid.cells($idRow,1).setValue('{$aDatos['fPrecio']}');
    mygrid.cells($idRow,2).setValue('1');
    mygrid.cells($idRow,3).setValue('=c1*c2');
     ";
   
    $oRespuesta->script($sScript);
	return $oRespuesta;	
}


function DatosUser($id,$sTabla){
   GLOBAL $oMysql;
   $oRespuesta = new xajaxResponse();
   
   $sConditions = "usuarios.id = '$id'";
   
   $aUser = $oMysql->consultaSel("CALL usp_getUsuarios(\"$sConditions\",\"\",\"\",\"\");",true); 
   
   $sPermits = stringPermitsUser($id);	   
   
   $oRespuesta->assign('sLogin_','value',$aUser['sLogin']);
   
   if($aUser['sLogin'] != '' && $aUser['sLogin'] != 'NO_NAME'){
   		$oRespuesta->assign('sLogin_','disabled',true);	
   		$oRespuesta->assign('saveUser','value','0');
   }else{
   	$oRespuesta->assign('saveUser','value','1');
   }
   
  // var_export($aUser);die();
   $script = "DatosUserBasic({$aUser['idTipoUsuario']},'$id','$sPermits')";
   $oRespuesta->script($script);
   
   
   $oRespuesta->assign('idSucursal','value',$aUser['idSucursal']);
   $oRespuesta->assign('idTipoUsuario','value',$aUser['idTipoUsuario']);
   $oRespuesta->assign('sEstado','value',$aUser['sEstado']);
   $oRespuesta->assign('idUsuario','value',$aUser['id']);
   
   $Name = $aUser['sNombre'].", ".$aUser['sApellido'];
   $oRespuesta->assign('sNombre','value',$aUser['sNombre']);
   $oRespuesta->assign('sApellido','value',$aUser['sApellido']); 
   $oRespuesta->assign('sDireccion','value',$aUser['sDireccion']); 
   $oRespuesta->assign('sMail','value',$aUser['sMail']);  
   $oRespuesta->assign('sTelefono','value',$aUser['sTelefono']);  
   $oRespuesta->assign('sMovil','value',$aUser['sMovil']);     
   $oRespuesta->assign('sPassword_','value',"**********");     
   $oRespuesta->assign('sPasswordRepeat_','value',"**********"); 
   
   $oRespuesta->assign('cmd_Aceptar','value','Guardar');
   $oRespuesta->assign('cmd_Cancelar','style.display','inline');
   
   return $oRespuesta;	
}


function savePermitsUser($idUser,$sPermits){
   GLOBAL $oMysql;
   $oRespuesta = new xajaxResponse();
   
   
   
   $oRespuesta->assign('divNameUser','innerHTML',$Name);
	   
   return $oRespuesta;	
}


function updateDatosUser($aDatos){
   GLOBAL $oMysql;
   $oRespuesta = new xajaxResponse();   
   
   $permitUser = $aDatos['permitUser'];     
   $salir = false;
   $array = array();
   $sPassword = md5($aDatos['sPassword_']);
   
   if($aDatos['sPassword_'] != "**********"){
   		$id = $oMysql->consultaSel("SELECT id FROM usuarios WHERE usuarios.id={$aDatos['idUsuario']} AND usuarios.sPassword='{$sPassword}'",true);
   		if($id){
			$oRespuesta->alert("La Nueva Clave debe ser diferente a la Clave anterior, verifique.");	
			$salir = true;
   		}   		
   }
   if($aDatos['idUsuario'] != "0"){
	   $id = $oMysql->consultaSel("SELECT id FROM usuarios WHERE usuarios.sLogin_='{$aDatos['sLogin_']}'",true);
	   if($id){
			$oRespuesta->alert("El Login ya existe en el Sistena.");	
			$salir = true;
	   }
   }

   if(!$salir){
   	   $aDatos['sNombre'] = convertir_especiales_html($aDatos['sNombre']);
   	   $aDatos['sApellido'] = convertir_especiales_html($aDatos['sApellido']);
   	   $aDatos['sDireccion'] = convertir_especiales_html($aDatos['sDireccion']);
   	
   	   if($aDatos['idUsuario'] == "0"){
			$set = "sNombre,sApellido,sMail,sTelefono,sDireccion,sMovil,sLogin,sPassword,idTipoUsuario,sEstado";			
			$values = "'{$aDatos['sNombre']}','{$aDatos['sApellido']}','{$aDatos['sMail']}','{$aDatos['sTelefono']}','{$aDatos['sDireccion']}','{$aDatos['sMovil']}','{$aDatos['sLogin_']}','{$sPassword}','{$aDatos['idTipoUsuario']}','{$aDatos['sEstado']}'";
			$ToAuditry = "Insercion de Usuario ::: '{$aDatos['sNombre']}, {$aDatos['sApellido']}'";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"usuarios\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$User = new User($newId);
			//$smsMessage = " - Se dio de alta el Usuario";
	   }else{	
	   	   if($aDatos['sPassword_'] != '' && $aDatos['sPassword_'] == $aDatos['sPasswordRepeat_'] && $aDatos['sPassword_'] != '**********'){ $array['sPassword'] = $sPassword; }	
	   	      	   
	  	   if($aDatos['saveUser'] == 1){ $array['sLogin'] = $aDatos['sLogin_']; }	   
		   if($aDatos['idOficina'] != 0){ $array['idOficina'] = $aDatos['idOficina']; }
		   
		   if($aDatos['idTipoUsuario'] != 0){ $array['idTipoUsuario'] = $aDatos['idTipoUsuario']; }
		
		   if($aDatos['sEstado'] != '0'){ $array['sEstado'] = $aDatos['sEstado']; } 
		   
		   if($aDatos['sNombre'] != ''){ $array['sNombre'] = $aDatos['sNombre']; }
		   if($aDatos['sApellido'] != ''){ $array['sApellido'] = $aDatos['sApellido']; }
		   if($aDatos['sDireccion'] != ''){ $array['sDireccion'] = $aDatos['sDireccion']; }
		   if($aDatos['sMail'] != ''){ $array['sMail'] = $aDatos['sMail']; }
		   if($aDatos['sTelefono'] != ''){ $array['sTelefono'] = $aDatos['sTelefono']; }
		   if($aDatos['sMovil'] != ''){ $array['sMovil'] = $aDatos['sMovil']; }
		   
		   $User = new User($aDatos['idUsuario']);
		   $User->update($array);
	   }
	   $User->savePermit($permitUser);
	
	   $js = "setFormUser()";
	   
	   $smsMessage = "- Se registro su operacion";
	   	  
	   $oRespuesta->alert($smsMessage);
	   $oRespuesta->script("resetDatosForm__()");
   //$oRespuesta->assign('divMessageUser','innerHTML',$smsMessage);
   }
   return $oRespuesta;		
}

	function checkNumeroFactura($sNumeroFactura){
		GLOBAL $oMysql;
		$oRespuesta = new xajaxResponse();	
		
		$ExisteFactura = $oMysql->consultaSel("SELECT fcn_ExisteNumeroFactura(\"$sNumeroFactura\");",true);
		
		if($ExisteFactura != 0){
			$smsError = "<span style='color:#FF0000;font-size:11px;'> - Numero de Factura Existente</span>";
			$oRespuesta->assign('divMessageFactura','innerHTML',$smsError);
		}else{
			$smsError = "<span style='color:#336699;font-size:11px;'> - Numero Habilitado</span>";
			$oRespuesta->assign('divMessageFactura','innerHTML',$smsError);
		}
		
		return $oRespuesta;
	}
	

	
	
	function CargarDatosCliente($sCodigo){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
	    $sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	   
	    $sConditions = "clientes.id = '$sCodigo'";	   
   
  	    $aCliente= $oMysql->consultaSel("CALL usp_getClientes(\"$sConditions\",\"\",\"\",\"\");",true);
  
  	    //$aCliente = stringToUpper($aCliente);
  	 
	    $sConsulta = "select idProvincia from localidades where id={$aCliente['idLocalidad']}";
	    $idProv = $oMysql->consultaSel($sConsulta,true); 
		//$oRespuesta->alert($idProv);
	    if($idProv){ 
	  	   $oRespuesta->assign('idProvincia','value',$idProv);    
	       $oRespuesta->script("selectOpcionesCondicionado( idProvincia_idLocalidad_CondicionadoMultiple_IDS_PADRES, 'idLocalidad', idProvincia_idLocalidad_CondicionadoMultiple, 'Seleccionar...', 'Seleccionar...', 'Seleccionar...', 0, 0);");
           $oRespuesta->assign('idLocalidad','value',$aCliente['idLocalidad']); 
            
	    }else{
	  	   $oRespuesta->assign('idProvincia','value',0);  
	  	   $oRespuesta->assign('idLocalidad','value',0); 
	    }
	   
	    $oRespuesta->assign('idCliente','value',$aCliente['id']);
	    $oRespuesta->assign('sNombre','value',$aCliente['sNombre']);
	    $oRespuesta->assign('sApellido','value',$aCliente['sApellido']);	    
	    $oRespuesta->assign('sDni','value',$aCliente['sDni']);
	    $oRespuesta->assign('sMail','value',$aCliente['sMail']);
	    $oRespuesta->assign('dFechaNac','value',$aCliente['dFechaNac']);
	    $oRespuesta->assign('sTelefono','value',$aCliente['sTelefono']);
	    $oRespuesta->assign('sDomicilioParticular','value',unhtmlspecialchars($aCliente['sDomicilioParticular']));
	    $oRespuesta->assign('sDomicilioComercial','value',unhtmlspecialchars($aCliente['sDomicilioComercial']));
	    $oRespuesta->assign('sBarrio','value',unhtmlspecialchars($aCliente['sBarrio']));
	    $oRespuesta->assign('sConyuge','value',$aCliente['sConyuge']);
	    $oRespuesta->assign('sRubro','value',$aCliente['sRubro']);
	    $oRespuesta->assign('sNombreLocal','value',unhtmlspecialchars($aCliente['sNombreLocal']));
	    
	    $oRespuesta->assign('sCredito','value',$aCliente['fImporte']);
	    
	    $oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	function updateDatosClientes($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
		$dFechaNac =  dateFormatMysql($form['dFechaNac']);
		$form['sDomicilioParticular']=$oMysql->escapeString($form['sDomicilioParticular']);
		$form['sDomicilioComercial']=$oMysql->escapeString($form['sDomicilioComercial']);
		$form['sNombreLocal']=$oMysql->escapeString($form['sNombreLocal']);
		$form['sBarrio']=$oMysql->escapeString($form['sBarrio']);
		$form['sCredito'] = str_replace(",",".", $form['sCredito']);
		
		if($form['idCliente'] == "0"){
			$set = "sNombre,sApellido,sDni,sMail,dFechaNac,sTelefono,sConyuge,sDomicilioParticular,sDomicilioComercial,sBarrio,idLocalidad,sRubro,sNombreLocal,sEstado,fMargenCredito";			
			$values = "'{$form['sNombre']}','{$form['sApellido']}','{$form['sDni']}','{$form['sMail']}','{$dFechaNac}','{$form['sTelefono']}','{$form['sConyuge']}','{$form['sDomicilioParticular']}','{$form['sDomicilioComercial']}','{$form['sBarrio']}','{$form['idLocalidad']}','{$form['sRubro']}','{$form['sNombreLocal']}','A','{$form['sCredito']}'";
			//$oRespuesta->alert($values);
			$ToAuditry = "Insercion de Cliente ::: '{$form['sNombre']}, {$form['sApellido']}'";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"clientes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$iCodigo = 1000 + $newId;
			$sqlCliente = "UPDATE clientes SET sCodigo='{$iCodigo}' WHERE clientes.id ='{$newId}'";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlCliente);
			$oMysql->commit();
			
			$sql = "INSERT INTO creditos(idCliente,idPlanPago,dFecha,fImporte,bInicial)VALUES('$newId',0,NOW(),'{$form['sCredito']}',1)";
			
			$smsMessage = " - Se dio de alta el Cliente";
		}else{		
			$set = "sNombre='{$form['sNombre']}',
			 sApellido='{$form['sApellido']}',
			 sDni='{$form['sDni']}',
			 sMail='{$form['sMail']}',
			 dFechaNac='{$dFechaNac}',
			 sTelefono='{$form['sTelefono']}',
			 sDomicilioParticular='{$form['sDomicilioParticular']}',
			 sDomicilioComercial='{$form['sDomicilioComercial']}',
			 idLocalidad='{$form['idLocalidad']}',
			 sBarrio='{$form['sBarrio']}',
			 sConyuge='{$form['sConyuge']}',
			 sRubro='{$form['sRubro']}',
			 sNombreLocal='{$form['sNombreLocal']}'";		
										
			$sConditions = "clientes.id = '{$form['idCliente']}'";
			$ToAuditry = "Update de Clientes ::: {$form['idCliente']}";
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"clientes\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");		
		
			$smsMessage = " - Se modificaron los datos del Cliente";				
			$form['sCredito'] = str_replace(",",".", $form['sCredito']);
			
			$sql = "UPDATE creditos SET fImporte='{$form['sCredito']}' WHERE creditos.idCliente ='{$form['idCliente']}' AND bInicial = 1";
			
		}
		//$oRespuesta->alert($sql);
		$oMysql->startTransaction();
		$oMysql->consultaAff($sql);
		$oMysql->commit();
		
		//if($newId ){
			$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
			$oRespuesta->script("resetDatosForm__()");
		//}
		return $oRespuesta;	
		
	}
	
	
	function buscarCliente($buscar){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
	 	$sConditions = "clientes.id = '$buscar' or clientes.sApellido like '%$buscar%' or clientes.sNombre like '%$buscar%' ";	   
   
  	    $aCliente= $oMysql->consultaSel("CALL usp_getClientes(\"$sConditions\",\"\",\"\",\"\");",true);
  
  	    //$aCliente = stringToUpper($aCliente);
  	 
	    $sConsulta = "select idProvincia from localidades where id={$aCliente['idLocalidad']}";
	    $idProv = $oMysql->consultaSel($sConsulta,true); 
					  
	    if($idProv){ 
	  	   $oRespuesta->assign('idProvincia','value',$idProv);    
	       $oRespuesta->script("selectOpcionesCondicionado( idProvincia_idLocalidad_CondicionadoMultiple_IDS_PADRES, 'idLocalidad', idProvincia_idLocalidad_CondicionadoMultiple, 'Seleccionar...', 'Seleccionar...', 'Seleccionar...', 0, 0);");
           $oRespuesta->assign('idLocalidad','value',$aCliente['idLocalidad']); 
            
	    }else{
	  	   $oRespuesta->assign('idProvincia','value',0);  
	  	   $oRespuesta->assign('idLocalidad','value',0); 
	    }
	   
	    $oRespuesta->assign('sNroCliente','value',$aCliente['sCodigo']);
	    $oRespuesta->assign('hdnNroCliente','value',$aCliente['sCodigo']);
	    $oRespuesta->assign('idCliente','value',$aCliente['id']);
	    $oRespuesta->assign('sNombre','value',$aCliente['sNombre']);
	    $oRespuesta->assign('sApellido','value',$aCliente['sApellido']);	    
	    $oRespuesta->assign('sDni','value',$aCliente['sDni']);
	    $oRespuesta->assign('sMail','value',$aCliente['sMail']);
	    $oRespuesta->assign('dFechaNac','value',$aCliente['dFechaNac']);
	    $oRespuesta->assign('sTelefono','value',$aCliente['sTelefono']);
	    $oRespuesta->assign('sDomicilioParticular','value',$aCliente['sDomicilioParticular']);
	    $oRespuesta->assign('sDomicilioComercial','value',$aCliente['sDomicilioComercial']);
	    $oRespuesta->assign('sBarrio','value',$aCliente['sBarrio']);
	    $oRespuesta->assign('sConyuge','value',$aCliente['sConyuge']);
	    $oRespuesta->assign('sRubro','value',$aCliente['sRubro']);
	    $oRespuesta->assign('sNombreLocal','value',$aCliente['sNombreLocal']);
	    
	    $oRespuesta->assign('sCredito','value',$aCliente['fMargenCredito']);
	    
		return $oRespuesta;	
	}
	
	/********************  VEHICULOS  *********************/
	function cargarDatosVehiculo($sCodigo){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "vehiculos.id = '$sCodigo'";	   
  	    $aVehiculo = $oMysql->consultaSel("CALL usp_getVehiculos(\"$sConditions\",\"\",\"\",\"\");",true);  	 
		
  	    $oRespuesta->assign('idVehi','value',$aVehiculo['id']);
  	    $oRespuesta->assign('idVehiculo','value',$aVehiculo['idVehiculo']);
  	    $oRespuesta->assign('idTipoVehiculo','value',$aVehiculo['idTipoVehiculo']);
  	    //$oRespuesta->assign('idMarca','value',$aVehiculo['idMarca']);
  	    $oRespuesta->assign('iPuertas','value',$aVehiculo['iPuertas']);
  	    $oRespuesta->assign('iAnio','value',$aVehiculo['iAnio']);
  	    $oRespuesta->assign('fPrecio','value',$aVehiculo['fPrecio']);
  	    $oRespuesta->assign('idColor','value',$aVehiculo['idColor']);
  	    $oRespuesta->assign('idCombustible','value',$aVehiculo['idCombustible']);
  	    $oRespuesta->assign('idDireccion','value',$aVehiculo['idDireccion']);
		$oRespuesta->assign('idTransmision','value',$aVehiculo['idTransmision']);
		$oRespuesta->assign('iKms','value',$aVehiculo['iKms']);
  	    
		$script = "chooseLocation({$aVehiculo['idMarca']},{$aVehiculo['idMarcaModelo']})";
		$oRespuesta->script($script);
		
		if($aVehiculo['sEquipamiento'] != ""){
			$aEquip = explode(',',$aVehiculo['sEquipamiento']);
			foreach($aEquip as $sEquipamiento){
				if(!is_bool(strrpos($sEquipamiento,"c_"))){						
					$chkObj = explode('_',$sEquipamiento);								
					$chk = 'confort_'.$chkObj[1];
					//$oRespuesta->alert($sEquipamiento.'--sip---'.$chk);	
					$oRespuesta->assign($chk,'checked',true); 
				}
				if(!is_bool(strrpos($sEquipamiento,"se_"))){						
					$chkObj = explode('_',$sEquipamiento);								
					$chk = 'seg_'.$chkObj[1];
					$oRespuesta->assign($chk,'checked',true); 
				}
				if(!is_bool(strrpos($sEquipamiento,"e_"))){						
					$chkObj = explode('_',$sEquipamiento);								
					$chk = 'ext_'.$chkObj[1];
					$oRespuesta->assign($chk,'checked',true); 
				}
				if(!is_bool(strrpos($sEquipamiento,"so_"))){						
					$chkObj = explode('_',$sEquipamiento);								
					$chk = 'sonido_'.$chkObj[1];
					$oRespuesta->assign($chk,'checked',true); 
				}				
			}
		}
		
        $oRespuesta->assign('sImagen','value',$aVehiculo['sImagen']);	    
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");
	    if($aVehiculo['sImagen'] != '')
	   	   $oRespuesta->assign('imgVehiculo','src','../includes/images/sitio/Vehiculos/'.$aVehiculo['sImagen']);	
	    else    
	   	   $oRespuesta->assign('imgVehiculo','src','../includes/images/internas/no_image.gif');	
	   	      
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
		return $oRespuesta;
	}


	
	/********************  PEDIDOS  *********************/
	function cargarDatosPedido($sCodigo){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "pedidos.id = '$sCodigo'";	   
  	    $aPedidos = $oMysql->consultaSel("CALL usp_getPedidos(\"$sConditions\",\"\",\"\",\"\");",true);  	 
		
  	   $oRespuesta->assign('idAgencia','value',$aPedidos['id']);
	    $oRespuesta->assign('sNombre','value',$aPedidos['sNombre']);
	    $oRespuesta->assign('sApellido','value',$aPedidos['sApellido']);
	    $oRespuesta->assign('sMail','value',$aPedidos['sMail']);
	    $oRespuesta->assign('sTelefono','value',$aPedidos['sTelefono']);
	    
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
		return $oRespuesta;
	}

	function updateDatosPedido($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$form['sNombre']=$oMysql->escaparCadena($form['sNombre']);
		$form['sApellido']=$oMysql->escaparCadena($form['sApellido']);
		$form['sDescripcion']=$oMysql->escaparCadena($form['sDescripcion']);
	
		if($form['idPedido'] == "0"){
			$set = "sNombre,sApellido,sTelefono,sMail,idTipoUso,idTipoVehiculo,idMarcaModelo,iAnio,fPrecio,iPuertas,idColor,sDescripcion,sEstado";			
			$values = "'{$form['sNombre']}','{$form['sApellido']}','{$form['sTelefono']}','{$form['sMail']}','{$form['idTipoUso']}','{$form['idTipoVehiculo']}','{$form['idModelo']}','{$form['iAnio']}','{$form['fPrecio']}','{$form['iPuertas']}','{$form['idColor']}','{$form['sDescripcion']}','A'";
			//$oRespuesta->alert($values);
			$ToAuditry = "Insercion de Pedido ::: '{$form['sApellido']}', '{$form['sNombre']}'";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"pedidos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$smsMessage = " - Se dio de alta el Pedido";	
		}else{
			$set = "sNombre='{$form['sNombre']}',
			 sApellido='{$form['sApellido']}',
			 sTelefono='{$form['sTelefono']}',
			 sMail='{$form['sMail']}',			 
			 idTipoVehiculo='{$form['idTipoVehiculo']}',
			 idTipoUso='{$form['idTipoUso']}',
			 iAnio='{$form['iAnio']}',
			 fPrecio='{$form['fPrecio']}',
			 iPuertas='{$form['iPuertas']}',
			 idColor='{$form['idColor']}'";
			
			$sConditions = "pedidos.id = '{$form['idPedido']}'";
			$ToAuditry = "Update de Pedidos ::: {$form['idPedido']}";
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"pedidos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");		
			
			$smsMessage = " - Se modificaron los datos de la Pedido";		
		}
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;
	}
	
	function logueo($form){	
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$errores = '';
		
		if($form['sUser'] == "") $errores = 'El Nombre de Usuario no es valido';
		else if($form['Pass'] == "") $errores = 'La contrase&ntilde;a no es v�lida';
		else {		
		    
			$nick = $oMysql->escaparCadena( $form['sUser'] );
			$pass = md5( $oMysql->escaparCadena( $form['Pass'] ) );	
			$datos = $oMysql->consultaSel("SELECT id,sPassword,sEstado FROM usuarios WHERE sLogin = '{$nick}'",true);		
			if(!$datos) $errores = 'La Cuenta no existe';
			
			else if( $datos['sPassword'] != $pass ) $errores = 'La contrase�a es incorrecta';
				
				else if($datos['sEstado'] != 'AUTORIZADO') $errores = 'Su Cuenta tiene conflicto. Contacte con el administrador';	
			
				else{
					session_start();
					$_SESSION['LOGIN'] =$nick;									
					$_SESSION['ID_USER'] = $datos['id'];								
					
					$formLogin = "<span style='font-family:Tahoma;font-size:11px;text-align:left;color:#FFF;font-weight:bold;'>Hola {$_SESSION['LOGIN']} &nbsp;&nbsp;<a href='".BASE_URL."/logoutSitio.php?urlBack={$form['urlBack']}' style='margin-right:10px;' class='linkLogout'>Salir</a></span>"; 	
					
					$oRespuesta->assign("tdTableLogin","innerHTML","");
					$oRespuesta->assign("tdLogin","innerHTML",$formLogin);
				}		
		}
		if($errores != ''){			
			$oRespuesta->alert($errores);
		}
		return  $oRespuesta;
	}
	
    function updateDatosUsuario($aDatos){
	   GLOBAL $oMysql;
	   $oRespuesta = new xajaxResponse();   
	   $aDatos['sNombre'] = $oMysql->escaparCadena($aDatos['sNombre']);
	   $aDatos['sApellido'] = $oMysql->escaparCadena($aDatos['sApellido']);
	   $aDatos['sDireccion'] = $oMysql->escaparCadena($aDatos['sDireccion']);
	
	   if($aDatos['idUsuario'] =='0'){
		 	 $array['sLogin'] = $aDatos['sLogin_']; 
	   //if($aDatos['sPassword_'] != '' && $aDatos['sPassword_'] = $aDatos['sPasswordRepeat_']){ $array['sPassword'] = md5($aDatos['sPassword_']); }
  	   $aDatos['sPassword'] = md5($aDatos['sPassword']);
  	   $aDatos['idOficina'] = 1;
  	   $aDatos['idTipoUsuario'] = 2;//usuario web
  	   $aDatos['sEstado'] = 'AUTORIZADO'; 	   
    
  	   $set = "sNombre,sApellido,sDireccion,sMail,sTelefono,sMovil,sLogin,sPassword,idTipoUsuario,sEstado";
  	   $values = "'{$aDatos['sNombre']}','{$aDatos['sApellido']}','{$aDatos['sDireccion']}','{$aDatos['sMail']}','{$aDatos['sTelefono']}','{$aDatos['sMovil']}','{$aDatos['sLogin_']}','{$aDatos['sPassword']}','{$aDatos['idTipoUsuario']}','{$aDatos['sEstado']}'";
  	   $ToAuditory = "Insercion de Usuario ::: {$aDatos['sApellido']}, {$aDatos['sNombre']}";
  	   $id = $oMysql->consultaSel("CALL usp_InsertTable(\"usuarios\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");",true);   
  	   $smsMessage = "<p style='height:50px'><img src='backend/includes/images/sitio/icon-48-checkin.png' width='20' height='20' alt=''/>&nbsp;La operacion se realizo correctamente, se ha enviado un mail a su cuenta de correo con sus datos de usuario</p>";
			 $oRespuesta->assign("cmd_submit","style.display","none");
	  	 $oRespuesta->assign("cmd_cancelar","value","Cerrar"); 
			 
	   }else{
		   $set = "sNombre='{$aDatos['sNombre']}',
        			 sApellido='{$aDatos['sApellido']}',			 
        			 sDireccion='{$aDatos['sDireccion']}',
        			 sTelefono='{$aDatos['sTelefono']}',
        			 sMovil='{$aDatos['sMovil']}',
        			 sMail='{$aDatos['sMail']}'";
			
			$sConditions = "usuarios.id = '{$aDatos['idUsuario']}'";
			$ToAuditry = "Update de Usuarios ::: {$aDatos['idUsuario']}";
			$oRespuesta->alert($sConditions);
			/*$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"usuarios\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);
			
			$smsMessage = "<p style='height:50px'><img src='backend/includes/images/sitio/icon-48-checkin.png' width='20' height='20' alt=''/>&nbsp;La operacion se realizo correctamente</p>";
			//$smsMessage = " - Se modificaron los datos correctamente";		
			$oRespuesta->assign("cmd_submit","style.display","none");
	 	  $oRespuesta->assign("cmd_borrar","style.display","none");*/
			 
		 }
	   //$oRespuesta->script("resetDatosForm__()");
	   
	   
	   $oRespuesta->assign("tdFormRegistrar","innerHTML",$smsMessage);
	   	   
   		return $oRespuesta;		
	}

	function buscarVehiculos($form){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();   
	    $sConditions = "";
	    if($form['idMarca'] != 0)
			$sConditions .= "marcas_modelos.idMarca = '{$form['idMarca']}'";	    
	    if($form['idModelo'] != 0)
			$sConditions .= "vehiculos.idMarcaModelo = '{$form['idModelo']}'";
		if($form['iAnioDesde'] != '')	
			$sConditions .= " AND vehiculos.iAnio >={$form['iAnioDesde']}";	   
		if($form['iAnioHasta'] != '')	
			$sConditions .= " AND vehiculos.iAnio <={$form['iAnioHasta']}";	   
   
		//$oRespuesta->alert($sConditions);
  	    $aVehiculos= $oMysql->consultaSel("CALL usp_getVehiculos(\"$sConditions\",\"\",\"\",\"\");");
  	    
  	    $array = array();
  	    $sTablaHml ="";
  	    if(count($aVehiculos)>0){  	    	
  	    	$archivo='./backend/Vehiculos/Equipamientos.xml';    
			if (file_exists($archivo)) 	{
				$oXml= simplexml_load_file($archivo);
			}
  	    	foreach($aVehiculos as $row){
  	    		$sEquipos = "";
  	    		$aEquipos = array();
				if($row['sEquipamiento'] != ""){
					$aEquip = explode(',',$row['sEquipamiento']);
					$i = 0;
					foreach($aEquip as $sEquipamiento){						
						$aEquipo = $oXml->xpath('//equipamientos//equipo[@pref="' . $sEquipamiento . '"]//descripcion');
						$aEquipos[]	=$aEquipo[0];
						$i++;
						if($i==5) break;
					}
				}
				$sEquipos = implode(',',$aEquipos);
				$url = "index.php?idVehiculo=".$row['id'];
  	    		$array['sDescripcion'] = "
						<table cellspacing='0' cellpadding='0' border='0' style='width:100%;height:100%' >
						<tr><td style='padding-left:10px;padding-top:5px;' class='content'>
							Kms: ".$row['iKms'] ." kms<br>"
								."Combustible: ".$row['sCombustible'] ."<br>"		
								.$sEquipos.
							"</td></tr>
							<tr><td align='right' valign='top'>
							<table cellspacing='0' cellpadding='0' border='0'  >
							<tr>
							<td align='right'>
							<a href='http://www.facebook.com/sharer.php?u=http://www.norteautomotor.com/index.php?idVehiculo={$row['id']}' target='_blank' class='linkFacebook'><img src='backend/includes/images/facebook.png' style='width:16px;height:16px;' /></a>
							</td>
							<td align='left' valign='top'>
							<a href='http://www.facebook.com/sharer.php?u=http://www.norteautomotor.com/index.php?idVehiculo={$row['id']}' target='_blank' class='linkFacebook'>Compartir</a></td>
							<td style='padding-left:10px'><a href='".$url."' class='linkSitio'>Ver mas..</a></td>
							</tr>
							</table>
							</td>
							</tr></table>";
				$array['titulo'] = $row['sMarca'].'/'.$row['sModelo'] .'/'.$row['iAnio'];
				$array['sImagen'] = 'backend/includes/images/sitio/Vehiculos/' .$row['sImagen'];
				$array['sImagenAgencia'] = 'backend/includes/images/sitio/Agencias/' .$row['sImagenAgencia'];			
  	    		$tablaVehiculo = parserTemplate(TEMPLATES_XHTML_DIR . "/verFormsParts/tabla.vehiculo.tpl" , $array);
  	    		
  	    		$sTablaHml .= "<tr><td valign='top' style='padding-top:3px;height:105'>"
  	    					 .$tablaVehiculo."</td></tr>";		  	    		
  	    	} 
  	    }
  	    if($sTablaHml == ""){
  	    	$sTablaHml = "<table cellspacing='0' cellpadding='0' border='0' style='width:100%;' ><tr><td style='height:50px;font-size:14px'>No se encontraron resultados</td></tr></table>";
  	    }else{
  	    	$sTablaHml = "<table cellspacing='0' cellpadding='0' border='0' style='width:100%;' >".$sTablaHml."</table>";
  	    }
  	    $oRespuesta->assign("divVehiculos","innerHTML",$sTablaHml);
  	    
  	    return $oRespuesta;	
	}
	
	/************************  CONTACTOS ****************************/
	function getDatosContacto($sCodigo,$sMovil){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
	    $sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "contactos.id = '$sCodigo'";	   
   
  	    $aContacto= $oMysql->consultaSel("CALL usp_getContactos(\"$sConditions\",\"\",\"\",\"\");",true);
  
  	    //$aCliente = stringToUpper($aCliente);
  	 
	    /*$sConsulta = "select idProvincia from localidades where id={$aCliente['idLocalidad']}";
	    $idProv = $oMysql->consultaSel($sConsulta,true);
		//$oRespuesta->alert($idProv);
	    if($idProv){ 
	  	   $oRespuesta->assign('idProvincia','value',$idProv);    
	       $oRespuesta->script("selectOpcionesCondicionado( idProvincia_idLocalidad_CondicionadoMultiple_IDS_PADRES, 'idLocalidad', idProvincia_idLocalidad_CondicionadoMultiple, 'Seleccionar...', 'Seleccionar...', 'Seleccionar...', 0, 0);");
           $oRespuesta->assign('idLocalidad','value',$aCliente['idLocalidad']); 
            
	    }else{
	  	   $oRespuesta->assign('idProvincia','value',0);  
	  	   $oRespuesta->assign('idLocalidad','value',0); 
	    } */
	    if($sCodigo != 0){
		    $oRespuesta->assign('idContacto','value',$aContacto['id']);
		    $oRespuesta->assign('sNombre','value',$aContacto['sNombre']);
		    $oRespuesta->assign('sApellido','value',$aContacto['sApellido']);	    
		    $oRespuesta->assign('sDni','value',$aContacto['sDni']);
		    $oRespuesta->assign('sMail','value',$aContacto['sMail']);
		    $oRespuesta->assign('sMovil','value',$aContacto['sMovil']);
		    $oRespuesta->assign('sTelefono','value',$aContacto['sTelefono']);
		    $oRespuesta->assign('sDireccion','value',unhtmlspecialchars($aContacto['sDireccion']));
		    $oRespuesta->assign('idGrupo','value',$aContacto['idGrupo']);
		    $oRespuesta->assign('sContacto','innerHTML',$aContacto['sApellido'].', '.$aContacto['sNombre']);	    
		    $oRespuesta->assign('dFechaNacimiento','innerHTML',$aContacto['dFechaNacimiento']);	    
	    }else{
	    	 $oRespuesta->assign('sMovil','value',$sMovil);
	    	 //$oRespuesta->assign('cmd_Agregar','style.display','inline');
	    }
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	function updateDatosContacto($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
		$dFechaNacimiento =  dateFormatMysql($form['dFechaNacimiento']);
		$form['sDireccion']=$oMysql->escapeString($form['sDireccion']);
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
		$form['sApellido']=$oMysql->escapeString($form['sApellido']);
		if($form['idContacto'] == 0){
			$set = "sNombre,sApellido,sMovil,sMail,sTelefono,sDireccion,idGrupo,sEstado,dFechaNacimiento";			
			$values = "'{$form['sNombre']}','{$form['sApellido']}','{$form['sMovil']}','{$form['sMail']}','{$form['sTelefono']}','{$form['sDireccion']}','{$form['idGrupo']}','A','{$dFechaNacimiento}'";
			$ToAuditry = "Insercion de Contacto ::: '{$form['sNombre']}, {$form['sApellido']}'";
			$oMysql->consultaAff("CALL usp_InsertTable(\"contactos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");				
			
			if($form['updateMensajes']){
				$idContacto = $oMysql->getLastID();
				$sql = "UPDATE mensajes SET idContacto={$idContacto} WHERE mensajes.id={$form['idMensaje']}";
				$oRespuesta->alert($sql);
				$oMysql->consultaAff($sql);
			}
			$smsMessage = " - Se dio de alta el Contacto";
		}else{		
			$set = "sNombre='{$form['sNombre']}',
			 sApellido='{$form['sApellido']}',
			 sMovil='{$form['sMovil']}',
			 sMail='{$form['sMail']}',
			 sTelefono='{$form['sTelefono']}',
			 sDireccion='{$form['sDireccion']}',
			 idGrupo='{$form['idGrupo']}',
			 dFechaNacimiento='{$form['dFechaNacimiento']}'";		
										
			$sConditions = "contactos.id = '{$form['idContacto']}'";
			$ToAuditry = "Update de Contactos ::: idContacto = {$form['idContacto']}";
			
			$oMysql->consultaAff("CALL usp_UpdateTable(\"contactos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");				
			$smsMessage = " - Se modificaron los datos del Contacto";							
		}
		
			//$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;	
	}
	 
	function getDatosTiposUsuarios(){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
		return $oRespuesta;	
	}
	
	/************************  GRUPOS DE CONTACTOS  ****************************/
	function getDatosGrupo($sCodigo){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
	    $sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "grupos.id = '$sCodigo'";	   
   
  	    $aGrupo= $oMysql->consultaSel("CALL usp_getGrupos(\"$sConditions\",\"\",\"\",\"\");",true);
  
	   
	    $oRespuesta->assign('idGrupo','value',$aGrupo['id']);
	    $oRespuesta->assign('sCodigo','innerHTML',$aGrupo['id']);	    
	    $oRespuesta->assign('sNombre','value',$aGrupo['sNombre']);
	    $oRespuesta->assign('sDescripcion','value',$aGrupo['sDescripcion']);	    
	    
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	
	function updateDatosGrupo($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
		$form['sDescripcion']=$oMysql->escapeString($form['sDescripcion']);
		
		if($form['idGrupo'] == 0){
			$set = "sNombre,sDescripcion,sEstado";			
			$values = "'{$form['sNombre']}','{$form['sDescripcion']}','A'";
			$ToAuditry = "Insercion de Grupos de Contacto ::: '{$form['sNombre']}";
			
			//$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"grupos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"7\",\"$ToAuditry\");",true);				
			$oMysql->consultaAff("CALL usp_InsertTable(\"grupos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"7\",\"$ToAuditry\");");
			$smsMessage = " - Se dio de alta el Grupo";
		}else{		
			$set = "sNombre='{$form['sNombre']}',			
			 		sDescripcion='{$form['sDescripcion']}'";		
										
			$sConditions = "grupos.id = '{$form['idGrupo']}'";
			$ToAuditry = "Update de Grupos ::: idGrupo = {$form['idGrupo']}";
			
			$oMysql->consultaAff("CALL usp_UpdateTable(\"grupos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"8\",\"$ToAuditry\");");				
			$smsMessage = " - Se modificaron los datos del Grupo";							
		}
		
			//$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;	
	}
	
	/************************  SMS  ****************************/
	function enviarSMSRapido($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sms = new SMS();
		$iResultado = $sms->envio_sms($form["sMovil"],$form["sMensaje"]);
		$derror="";
		switch($iResultado){
		 	case "101":
		 	 //$derror="<div align=\"center\" style=\"color:#049D00;font-weight:bold;\">Mensaje enviado.</div>";
		 	 $derror="Mensaje enviado.";
		 	 break;
		 	case "100":
		 	 //$derror="<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."Error en proceso envio.</div>";
		 	 $derror="Error en proceso envio.";
			 break; 	 
		 	case "0":
		 	 //$derror="<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."No se especifica destinatario.</div>";
		 	 $derror="No se especifica destinatario.";
			 break; 	 
		 	case "-1":
		 	 //$derror="<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."Error en inicializaci&oacute;n puerto.</div>";
		 	 $derror="Error en inicializacion puerto.";
			 break; 	 
		 	case "-2": 
		 	 //$derror="<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."Error en conexi&oacute;n con dispositivo.</div>";
		 	 $derror="Error en conexi&oacute;n con dispositivo.";
		 	 break;
		}
		//$iResultado = "101";
		if($iResultado == "101"){ //Si su pudo enviar el SMS lo grabo en la Base de Datos
			$form['sMensaje'] = convertir_especiales_html($form['sMensaje']);
			$set = "idContacto,idTipoMensaje,idUsuario,idEstadoMensaje,sRemitente,sDestinatario,sMensaje,dFechaRegistro,sObservacion";			
			$values = "'0','1','{$_SESSION['ID_USER']}','1','modem','{$form["sMovil"]}','{$form['sMensaje']}',NOW(),'-'";
			$ToAuditry = "Envio de Mensaje Rapido ::: Usuario={$_SESSION['ID_USER']} - Destinatario={$form["sMovil"]}";
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"mensajes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"10\",\"$ToAuditry\");",true);				
		}
		//$oRespuesta->alert($newId);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;		
	}
	
	
	function enviarSMSMultiple($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		ini_set("memory_limit","2048M");
		set_time_limit(0);
		
		$sms = new SMS();
		
		//$c_campos=array("[nombre]","[apelllido]","[movil]","[email]","[domicilio]");
		$c_campos=array("#nombre","#apellido","#movil","#email","#domicilio");
		
		$iTotalContactos = $oMysql->consultaSel("SELECT count(*) FROM contactos WHERE idGrupo=".$form["idGrupo"]." AND sEstado='A'",true);		
		
		if($iTotalContactos >0){
			$set = "idGrupo,idUsuario,idEstadoTrabajo,sMensaje,dFechaRegistro,sObservacion";			
			$values = "'{$form['idGrupo']}','{$_SESSION['ID_USER']}','1','{$form['sMensaje']}',NOW(),''";
			$ToAuditry = "Envio de Mensaje Masivo ::: Usuario={$_SESSION['ID_USER']} - Grupo={$form["idGrupo"]}";
			$idTrabajo = $oMysql->consultaSel("CALL usp_InsertTable(\"trabajos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"12\",\"$ToAuditry\");",true);	
				
			$setEstado = "idTrabajo,idUsuario,idEstadoTrabajo,dFechaRegistro";
			$valuesEstado = "'{$idTrabajo}','{$_SESSION['ID_USER']}','1',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Trabajos ::: Usuario ={$_SESSION['ID_USER']} ::: Grupo={$form["idGrupo"]} ::: estado=1";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialtrabajos\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
		
			$iVeces = floor($iTotalContactos/5);	
			for($i=0; $i<= $iVeces; $i++){
				$iDesde = $i * 5; 
					
				$aContactos = $oMysql->consultaSel("SELECT * FROM contactos WHERE idGrupo=".$form["idGrupo"]." AND sEstado='A' LIMIT {$iDesde},5");
				//$oRespuesta->alert("SELECT * FROM contactos WHERE idGrupo=".$form["idGrupo"]." AND sEstado='A' LIMIT {$iDesde},5");
				
				$form['mensaje'] = convertir_especiales_html($form['mensaje']);
						
				if(count($aContactos)>0){
					
					$numerosv=array(); //Inicializar el vector con los Numeros a enviar los Sms
					$mensajesv=array();//Inicializar el vector Mensaje
					
					foreach ($aContactos as $rs){
				    	$numerosv[] = $rs["sMovil"];	
						$mensajeff = $form["sMensaje"];
					    $c_vars=array($rs["sNombre"],$rs["sApellido"],$rs["sMovil"],$rs["sMail"],$rs["sDireccion"]);
					    /*$rowvalores=explode("<*=*>",$row["valores"]);
					    foreach($rowvalores as $ivalt => $valts){
					    	$c_vars[]=$valts;
					    }*/
					    $mensajeff=str_replace($c_campos,$c_vars,$mensajeff);
					    
					    $mensajesv[]=$mensajeff;
					    
					    $sql = "INSERT INTO mensajestrabajos(idTrabajo,idContacto,idEstadoMensaje) VALUES({$idTrabajo},{$rs['id']},1)";
					    $oMysql->consultaAff($sql);
					} 
					//$numerosv=explode(";",$_POST["numero"]);
					//for($j=1; $j<=$form["iVeces"]; $j++){  
				     	$res=$sms->envio_sms($numerosv,$mensajesv);				     	
				     	//sleep(10);
					//}
			   	   	//$res = "101";
			   	   	//$oRespuesta->alert($res);
			   	   	$idEstadoTrabajo = 0;
				    if($res < 101){
				    	$derror = "Se han enviado";				
				    	$idEstadoTrabajo = 2;
				    }else{ 
				    	$derror = "No se han enviado";
				    	$idEstadoTrabajo = 3;
				    }
		
				    $oRespuesta->alert($derror." ".count($aContactos)." SMS");
				}else{
				  	$derror = "No hay remitentes para enviar.";
				  	$oRespuesta->alert($derror);
				}
				
			}

			$sql = "UPDATE trabajos SET trabajos.idEstadoTrabajo={$idEstadoTrabajo} WHERE trabajos.id={$idTrabajo}";
			$oMysql->consultaAff($sql);
			    	
			$derror = "El mensaje ha sido enviado.";
			$setEstado = "idTrabajo,idUsuario,idEstadoTrabajo,dFechaRegistro";
			$valuesEstado = "'{$idTrabajo}','{$_SESSION['ID_USER']}','{$idEstadoTrabajo}',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Trabajos ::: Usuario ={$_SESSION['ID_USER']} ::: Grupo={$form["idGrupo"]} ::: estado={$idEstadoTrabajo}";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialtrabajos\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
		}				
		
		//$oRespuesta->alert($derror);
		$oRespuesta->script("resetDatosForm()");
		return $oRespuesta;		
	}	
	
	function enviarSMSMultiplev2($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$aContactos = $oMysql->consultaSel("SELECT * FROM contactos WHERE idGrupo=".$form["idGrupo"]." AND sEstado='A'",true);		
		
		if(count($aContactos) >0){
			$form['mensaje'] = convertir_especiales_html($form['mensaje']);
			
			$set = "idGrupo,idUsuario,idEstadoTrabajo,sMensaje,dFechaRegistro,dFechaEnvio,dHrEnvio,sObservacion";			
			$values = "'{$form['idGrupo']}','{$_SESSION['ID_USER']}','3','{$form['sMensaje']}',NOW(),'{$form['dFechaEnvio']}','{$form['dHrEnvio']}',''";
			$ToAuditry = "Envio de Mensaje Masivo ::: Usuario={$_SESSION['ID_USER']} - Grupo={$form["idGrupo"]}";
			$idTrabajo = $oMysql->consultaSel("CALL usp_InsertTable(\"trabajos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"12\",\"$ToAuditry\");",true);	
				
			$setEstado = "idTrabajo,idUsuario,idEstadoTrabajo,dFechaRegistro";
			$valuesEstado = "'{$idTrabajo}','{$_SESSION['ID_USER']}','1',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Trabajos ::: Usuario ={$_SESSION['ID_USER']} ::: Grupo={$form["idGrupo"]} ::: estado=3";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialtrabajos\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
		}				
		
		//$oRespuesta->alert($derror);
		$oRespuesta->script("resetDatosForm()");
		return $oRespuesta;		
	}	
	
	/************************  E-MAIL  ****************************/
	function enviarMailsRapidos($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();

		$aMails = explode(",",$form['sMail']);		
		$sBody =convertir_especiales_html($form['sMensaje']);
		$form['sMensaje'] = convertir_especiales_html(addslashes($form['sMensaje']));
		
		$sScript = "";
		$EmailError = "";
		$iCantidadEnviados = 0;
		
		if($form['hdnEnviar'] == 1){
			$dFechaEnvio .= "NOW()";
		}else{
			 $form['dFechaEnvio'] = dateToMySql( $form['dFechaEnvio']);
			$dFechaEnvio .= $form['dFechaEnvio']." ".$form['dHrEnvio'];					
		}
			
		$set = "idUsuario,idEstadoMail,idTipoMail,idUnidadNegocio,sRemitente,sAsunto,sMensaje,dFechaRegistro,dFechaEnvio,sEstado";			
		$values = "'{$_SESSION['ID_USER']}',1,1,'{$form['idUnidadNegocio']}','{$form['sFromMail']}','{$form['sAsunto']}','{$form['sMensaje']}',NOW(),'{$dFechaEnvio}','A'";			
		$ToAuditry = "Envio de E-Mail Rapido ::: Usuario={$_SESSION['ID_USER']}";
		$idMail = $oMysql->consultaSel("CALL usp_InsertTable(\"mails\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"12\",\"$ToAuditry\");",true);
		
		$setEstado = "idMail,idUsuario,idEstadoMail,dFechaRegistro";
		$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}','1',NOW()";
		$ToAuditoryEstado = "Insercion Historial de Mails ::: Usuario ={$_SESSION['ID_USER']} ::: estado=1";
		$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
			
		if(count($aMails)>0){
			$mail = new PHPMailer(true); 
			$mail->IsSMTP();
			$mail->Mailer = "smtp";
			//$mail->SMTPDebug  = 2;                     // Habilita informaci�n SMTP (opcional para pruebas) // 1 = errores y mensajes   // 2 = solo mensajes
		  	$mail->SMTPAuth   = true;                  // Habilita la autenticaci�n SMTP
		  	$mail->SMTPSecure = "ssl";                 // Establece el tipo de seguridad SMTP
		  	$mail->Host       = "smtp.gmail.com";      // Establece Gmail como el servidor SMTP
		  	$mail->Port       = 465;                   // Establece el puerto del servidor SMTP de Gmail
		  	$mail->Username   = "crisgonzalez26@gmail.com";         // Usuario Gmail
		  	$mail->Password   = "cucris2007";           // Contrase�a Gmail
		  	$mail->IsHTML(true);
		  	
			$mail->From = $form['sFromMail']; 
			$mail->FromName = $form['sFromName']; 
			$mail->Subject = $form['sAsunto']; 						
			$mail->MsgHTML($sBody);
			
			foreach ($aMails as $sMail){
				if(strpos($sMail,"<") !== false){ //encontrado
					$sMail = trim($sMail);
					$sMail = substr($sMail,strpos($sMail,"<")+1,-1);
				}
				$aContacto = $oMysql->consultaSel("SELECT * FROM contactos WHERE contactos.sMail = '{$sMail}'",true);
				if($form['hdnEnviar'] == 1){
					try{				
						$mail->AddAddress($sMail,""); 
						$mail->Send(); 
						//echo "Mensaje enviado. Que chivo va vos!!";
						$EmailError .= "<strong>- Se envio su consulta con exito. Pronto se le contactara</strong>";
						$sScript .= "alert('- Se envio su consulta con exito. Pronto se le contactara');";
						$iCantidadEnviados++;
						
						$sqlContacto = "INSERT INTO mailscontactos(idMail,idContacto,idEstadoMensaje) VALUES('{$idMail}','{$aContacto['id']}',2)";
					} catch (phpmailerException $e) {
					  $EmailError.= $e->errorMessage(); //Errores de PhpMailer
					  $aMailError[] = $sMail;
					  $sqlContacto = "INSERT INTO mailscontactos(idMail,idContacto,idEstadoMensaje) VALUES('{$idMail}','{$aContacto['id']}',3)";
					} catch (Exception $e) {
					  $EmailError.= $e->getMessage(); //Errores de cualquier otra cosa.
					  $aMailError[] = $sMail;
					  $sqlContacto = "INSERT INTO mailscontactos(idMail,idContacto,idEstadoMensaje) VALUES('{$idMail}','{$aContacto['id']}',3)";
					}
				}else{
					$sqlContacto = "INSERT INTO mailscontactos(idMail,idContacto,idEstadoMensaje) VALUES('{$idMail}','{$aContacto['id']}',6)";
				}
				$oRespuesta->alert(count($aContacto));
				if(count($aContacto) > 0){
					$oMysql->consultaAff($sqlContacto);
				}
			}
		}
		$sMsje = "";
		if($form['hdnEnviar'] == 0){ //Si se desea solo Guardar la campa�a sin enviar los mails
			$sMsje .= "Se ha guardado correctamente la Campa�a.\n";
				
		}else{
			if(count($aMailError) == 0){
				$sMsje .= "Se han enviado {$iCantidadEnviados} Mails.\n";
				$idEstadoMail = 2;
			}
			if(count($aMailError) > 0){
				$sMsje .= "No se pudieron enviar el Mail Rapido a los siguientes E-mail:\n";
				$sMsje .= implode(",",$aMailError);
				$idEstadoMail = 3;
			}
			
			$sql = "UPDATE mails SET mails.idEstadoMail={$idEstadoMail} WHERE mails.id={$idMail}";
			$oMysql->consultaAff($sql);
	
			$setEstado = "idMail,idUsuario,idEstadoMail,dFechaRegistro";
			$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}','{$idEstadoMail}',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Mails ::: Usuario ={$_SESSION['ID_USER']} ::: estado={$idEstadoMail}";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
		}
				
		/*$form['sMensaje'] = convertir_especiales_html($form['sMensaje']);
		$derror="";
	   		
		$body = $form['sMensaje'];
		$mail->Body = $body;
			
		$array['To'] = $form['sMail'];
		$array['From'] = "jricardone@gmail.com";
		
		$array['Subject'] = "Promocion";
		$array['Message'] = $form['sMensaje'];
		$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
		$cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
		$cabeceras .= 'From: GRIVA Computacion <info@grivasoluciones.com.ar>' . "\r\n";
		
		//$oRespuesta->alert($form['sMail']);
		$send = mail($array['To'], $array['Subject'], $array['Message'], $cabeceras);
		$smsError = ($send) ? "_OK_" : "_ERROR_";*/
		
		//if($smsError == '_OK_'){
		//if($mail->Send()) {
		//	$oRespuesta->alert("El mensaje ha sido enviado.");
		//}else{
		//	$oRespuesta->alert("El mensaje no pudo ser enviado.\n");
			/*$set = "sDestinatario,idUsuario,sMensaje,dFechaRegistro";			
			$values = "'{$form['sMail']}','{$_SESSION['ID_USER']}','{$form['sMensaje']}',NOW()";
			$ToAuditry = "Envio de Mail Rapido ::: Usuario={$_SESSION['ID_USER']}";
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"mailsgrupos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"15\",\"$ToAuditry\");",true);	*/
		//}
		
		$oRespuesta->alert($sMsje);
		//$oRespuesta->script("resetDatosForm()");
		$oRespuesta->redirect("MailsRapidos.php");
		return $oRespuesta;		
	}
	
	function enviarMailsMasivos($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sBody =convertir_especiales_html($form['sMensaje']);
		$form['sMensaje'] = convertir_especiales_html(addslashes($form['sMensaje']));
		$aContactos = $oMysql->consultaSel("SELECT * FROM contactos WHERE idGrupo={$form["idGrupo"]} AND sEstado='A'");
		
		$sMsje = "";		
		if(count($aContactos)>0){
			$aMailError = array();
			$aOpciones = array();
			$iCantidadEnviados = 0;
			$dFechaEnvio = "";
			 
			if($form['hdnEnviar'] == 1){
				$dFechaEnvio .= "NOW()";
			}else{
				 $form['dFechaEnvio'] = dateToMySql( $form['dFechaEnvio']);
				 if($form['dFechaEnvio'] != "")
					$dFechaEnvio .= $form['dFechaEnvio']." ".$form['dHrEnvio'];					
			}
			
			$aOpciones['MOSTRAR_EP']= "style='display:none'";
			$iEncabezadoPie = 0;
			if(isset($form['iEncabezadoPie'])){
				$aOpciones['MOSTRAR_EP']= "style='display:inline'";
				$iEncabezadoPie = 1;
			}
			$set = "idGrupo,idUsuario,idEstadoMail,idTipoMail,idUnidadNegocio,sRemitente,sAsunto,sMensaje,dFechaRegistro,dFechaEnvio,sEstado,iEncabezadoPie";			
			$values = "'{$form['idGrupo']}','{$_SESSION['ID_USER']}',1,3,'{$form['idUnidadNegocio']}','{$form['sFromMail']}','{$form['sAsunto']}','{$form['sMensaje']}',NOW(),'{$dFechaEnvio}','A','{$iEncabezadoPie}'";			
			$ToAuditry = "Envio de E-Mail Masivo ::: Usuario={$_SESSION['ID_USER']}";
			$idMail = $oMysql->consultaSel("CALL usp_InsertTable(\"mails\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"12\",\"$ToAuditry\");",true);
			
			$setEstado = "idMail,idUsuario,idEstadoMail,dFechaRegistro";
			$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}','1',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Mails ::: Usuario ={$_SESSION['ID_USER']} ::: estado=1";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"12\",\"$ToAuditoryEstado\");",true);
			
			$mail = new PHPMailer(true); 
			$mail->IsSMTP();
			$mail->Mailer = "smtp";
			//$mail->SMTPDebug  = 2;                     // Habilita informaci�n SMTP (opcional para pruebas) // 1 = errores y mensajes   // 2 = solo mensajes
		  	$mail->SMTPAuth   = true;                  // Habilita la autenticaci�n SMTP
		  	$mail->SMTPSecure = "ssl";                 // Establece el tipo de seguridad SMTP
		  	$mail->Host       = "smtp.gmail.com";      // Establece Gmail como el servidor SMTP
		  	$mail->Port       = 465;                   // Establece el puerto del servidor SMTP de Gmail
		  	$mail->Username   = "info@grivasoluciones.com.ar";         // Usuario Gmail
		  	$mail->Password   = "superinfo";           // Contrase�a Gmail
		  	$mail->IsHTML(true);
		  	
		  	//$oRespuesta->alert($form['sFromMail']);
			$mail->SetFrom($form['sFromMail'],$form['sFromName']); 
			//$mail->AddReplyTo($form['sFromMail'],$form['sFromName']);
			//$mail->From = $form['sFromMail'];
			//$mail->FromName = $form['sFromName']; 
			$mail->Subject = $form['sAsunto']; 						
						
			$aOpciones['HTML_BODY'] = $sBody;
			$aOpciones['ID_MSJE'] = $idMail;
			
			foreach($aContactos as $row){
				$sMail = $row['sMail'];				
				$sqlContacto = "";
				$iTipoEstadoMensaje = 0;
				if($form['hdnEnviar'] == 1){									
					$aOpciones['ID_CONTACTO'] = $row['id'];
					$HtmlTemplate = parserTemplate(TEMPLATES_XHTML_DIR."/pages/promo.tpl" , $aOpciones);
					$sCuerpo = $HtmlTemplate; 
					
					try{			
						$mail->MsgHTML($sCuerpo);	
						$mail->AddAddress($sMail,""); 
						$mail->Send(); 
						$iCantidadEnviados++;						
						$iTipoEstadoMensaje = 2;
												
					} catch (phpmailerException $e) {
					  $EmailError.= $e->errorMessage(); //Errores de PhpMailer
					  $aMailError[] = $sMail;
					  $iTipoEstadoMensaje = 3;
					} catch (Exception $e) {
					  $EmailError.= $e->getMessage(); //Errores de cualquier otra cosa.
					  $aMailError[] = $sMail;
					  $iTipoEstadoMensaje = 3;
					}
					
					$mail->ClearAddresses(); //Reinicio de las E-mail argegado
				}else{
					$iTipoEstadoMensaje = 6;	
				}
				
				if($iTipoEstadoMensaje != 0){
					$sqlContacto .= "INSERT INTO mailscontactos(idMail,idContacto,idEstadoMensaje) VALUES('{$idMail}','{$row['id']}',{$iTipoEstadoMensaje})";
					$oMysql->consultaAff($sqlContacto);
				}
			}

			if($form['hdnEnviar'] == 0){ //Si se desea solo Guardar la campa�a sin enviar los mails
				$sMsje .= "Se ha guardado correctamente el E-mail Masivo.\n";				
			}else{
				if(count($aMailError) == 0){
					$sMsje .= "Se han enviado {$iCantidadEnviados} Mails.\n";
					$idEstadoMail = 2;
				}
				if(count($aMailError) > 0){
					$sMsje .= "No se pudieron enviar el Mail Rapido a los siguientes E-mail:\n";
					$sMsje .= implode(",",$aMailError);
					$idEstadoMail = 3;
				}
				$sql = "UPDATE mails SET mails.idEstadoMail={$idEstadoMail} WHERE mails.id={$idMail}";
				$oMysql->consultaAff($sql);
				    	
				$setEstado = "idMail,idUsuario,idEstadoMail,dFechaRegistro";
				$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}','{$idEstadoMail}',NOW()";
				$ToAuditoryEstado = "Insercion Historial de Trabajos ::: Usuario ={$_SESSION['ID_USER']} ::: Grupo={$form["idGrupo"]} ::: estado={$idEstadoMail}";
				$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
			}
			
		}else{
		  	//$derror = "<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."No hay remitentes para enviar.</div>";
		  	$sMsje .= "No hay remitentes para enviar.";
		}
		$oRespuesta->alert($sMsje);
		//$oRespuesta->redirect("MailsRapidos.php");
		//$oRespuesta->script("resetDatosForm()");
		
		return $oRespuesta;
	}
	
	function enviarMailsCampanias($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$form['sMensaje'] = convertir_especiales_html($form['sMensaje']);
		$form['sTitulo'] = convertir_especiales_html($form['sTitulo']);
		$aMails = explode(",",$form['sMailsContactos']);
				
		if(count($aMails)>0){
			$sUnidadNegocio = $oMysql->consultaSel("SELECT sNombre FROM unidadesnegocios WHERE id={$form['idUnidadNegocio']}",true);
			
			$cabeceras  = 'MIME-Version: 1.0' . "\r\n";
			$cabeceras .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
			$cabeceras .= 'From: '.$sUnidadNegocio.'<'.$form['sMailUnidadNegocio'].'>' . "\r\n";
			
			$set = "idUsuario,idEstadoTrabajo,idUnidadNegocio,sRemitente,sTitulo,sMensaje,dFechaRegistro,sObservacion";			
			$values = "'{$_SESSION['ID_USER']}',1,'{$form['idUnidadNegocio']}','{$form['sMailUnidadNegocio']}','{$form['sTitulo']}','{$form['sMensaje']}',NOW(),''";
			//$ToAuditry = "Nueva Campa�as de E-mail  ::: Usuario={$_SESSION['ID_USER']}";
			//$idCampania = $oMysql->consultaSel("CALL usp_InsertTable(\"campanias\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"19\",\"$ToAuditry\");",true);	
			//$idCampania = $oMysql->consultaSel("INSERT INTO campanias({$set}) VALUES({$values})",true);
			$oMysql->consultaAff("INSERT INTO campanias({$set}) VALUES({$values})");
			$idCampania = $oMysql->getLastID();
				
			$setEstado = "idCampania,idUsuario,idEstadoTrabajo,dFechaRegistro";
			$valuesEstado = "'{$idCampania}','{$_SESSION['ID_USER']}','1',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Trabajos ::: Usuario ={$_SESSION['ID_USER']} ::: Campa�a={$idCampania} ::: estado=1";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialcampanias\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"20\",\"$ToAuditoryEstado\");",true);
			
			//$array['Subject'] = convertir_especiales_html($form['sAsunto']);
			$array['Subject'] = $form['sAsunto'];
			$array['Message'] = $form['sMensaje'];
			
			$iCantidadEnviados = 0;
			$aMailError = array();
			foreach($aMails as $sDato){
				
				if(!is_null($sDato)){
					
					if(strpos($sDato,"userMenuLink_") !== false){

						$sMail = str_replace("userMenuLink_","",$sDato);
						
						$aContacto = $oMysql->consultaSel("SELECT * FROM contactos WHERE contactos.sMail = '{$sMail}'",true);
						//$oRespuesta->alert($idCampania.'---'.$aContacto['id'].'---'.$sMail);
						
						$arrayHTML=array("HTML_BODY" => $form['sMensaje'],"ID_MSJE" => $idCampania,"ID_CONTACTO" => $aContacto['id']);			
						$HtmlTemplate = parserTemplate(TEMPLATES_XHTML_DIR."/pages/promo.tpl" , $arrayHTML);
						$sCuerpo = $HtmlTemplate; 
					
						$array['To'] = $sMail;
						
						$send = mail($array['To'], $array['Subject'], $sCuerpo, $cabeceras);
						$smsError = ($send) ? "_OK_" : "_ERROR_";
						//$smsError = "_OK_";
						if($smsError != '_OK_'){
							$aMailError[] = $sMail;
							$sql = "INSERT INTO campaniascontactos(idCampania,idContacto,idEstadoMensaje) VALUES({$idCampania},{$aContacto['id']},3)";
						}else{
							$iCantidadEnviados++;
							$sql = "INSERT INTO campaniascontactos(idCampania,idContacto,idEstadoMensaje) VALUES({$idCampania},{$aContacto['id']},1)";
						}
						$oMysql->consultaAff($sql);
					}
				}
			}
			
			if(count($aMailError) == 0){
				$sMsje .= "Se han enviado {$iCantidadEnviados} Mails.\n";
			}
			if(count($aMailError) > 0){
				$sMsje .= "No se pudieron enviar el Mail masivo a los siguientes E-mail:\n";
				$sMsje .= implode(",",$aMailError);
			}
			$idEstadoTrabajo = 0;
			if($iCantidadEnviados == count($aMails)){
				$idEstadoTrabajo = 2;
			}else{
				$idEstadoTrabajo = 3;
			}
			
			$sql = "UPDATE campanias SET campanias.idEstadoTrabajo={$idEstadoTrabajo} WHERE campanias.id={$idCampania}";
			$oMysql->consultaAff($sql);
			    	
			$derror = "El mensaje ha sido enviado.";
			$setEstado = "idCampania,idUsuario,idEstadoTrabajo,dFechaRegistro";
			$valuesEstado = "'{$idCampania}','{$_SESSION['ID_USER']}','{$idEstadoTrabajo}',NOW()";
			$ToAuditoryEstado = "Insercion Historial de Campa�as ::: Usuario ={$_SESSION['ID_USER']} ::: Campania={$form["idCampania"]} ::: estado={$idEstadoTrabajo}";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialcampanias\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
			
		}else{
		  	//$derror = "<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."No hay remitentes para enviar.</div>";
		  	$derror = "No hay remitentes para enviar.";
		}
		$oRespuesta->alert($derror);
		//$oRespuesta->script("resetDatosForm()");
		$oRespuesta->redirect("MailsCampanias.php");
		return $oRespuesta;
	}
		
	function enviarMailsCampaniasNuevo($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sBody = convertir_especiales_html($form['sMensaje']);
		$form['sMensaje'] = addslashes(convertir_especiales_html($form['sMensaje']));
		$sAsunto = convertir_especiales_html($form['sAsunto']);
		//$oRespuesta->alert($form['sMensaje']);
		$aMails = explode(",",$form['sMailsContactos']);
		
		$sMsje = "";			
		if(count($aMails)>0){
			$aOpciones = array();	
			$sUnidadNegocio = $oMysql->consultaSel("SELECT sNombre FROM unidadesnegocios WHERE id={$form['idUnidadNegocio']}",true);
			
			$dFechaEnvio = "";
			if($form['hdnEnviar'] == 1){
				$dFechaEnvio .= "NOW()";
			}else{
				$form['dFechaEnvio'] = dateToMySql( $form['dFechaEnvio']);
				$dFechaEnvio .= $form['dFechaEnvio']." ".$form['dHrEnvio'];					
			}
			
			$aOpciones['MOSTRAR_EP']= "style='display:none'";
			$iEncabezadoPie = 0;
			if(isset($form['iEncabezadoPie'])){
				$aOpciones['MOSTRAR_EP']= "style='display:inline'";
				$iEncabezadoPie = 1;
			}
			
			$set = "idUsuario,idEstadoMail,idUnidadNegocio,idTipoMail,sRemitente,sAsunto,sMensaje,dFechaRegistro,dFechaEnvio,sEstado,iEncabezadoPie";			
			$values = "'{$_SESSION['ID_USER']}',1,'{$form['idUnidadNegocio']}',2,'{$form['sMailUnidadNegocio']}','{$sAsunto}','{$form['sMensaje']}',NOW(),'{$dFechaEnvio}','A',{$iEncabezadoPie}";			
			$oMysql->consultaAff("INSERT INTO mails({$set}) VALUES({$values})");
			$idMail = $oMysql->getLastID();
				
			$setEstado = "idMail,idUsuario,idEstadoMail,idTipoMail,dFechaRegistro,dFechaEnvio,sRemitente";
			$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}',1,2,NOW(),'{$dFechaEnvio}','{$form['sMailUnidadNegocio']}'";
			$ToAuditoryEstado = "Insercion Historial de Mails ::: Usuario ={$_SESSION['ID_USER']} ::: idMail={$idMail} ::: estado=1 idTipoMail=2";
			$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"20\",\"$ToAuditoryEstado\");",true);
			
			$array['Message'] = stripslashes($form['sMensaje']);
			
			$mail = new PHPMailer(true); 
			$mail->IsSMTP();
			$mail->Mailer = "smtp";
			//$mail->SMTPDebug  = 2;                     // Habilita informaci�n SMTP (opcional para pruebas) // 1 = errores y mensajes   // 2 = solo mensajes
		  	$mail->SMTPAuth   = true;                  // Habilita la autenticaci�n SMTP
		  	$mail->SMTPSecure = "ssl";                 // Establece el tipo de seguridad SMTP
		  	$mail->Host       = "smtp.gmail.com";      // Establece Gmail como el servidor SMTP
		  	$mail->Port       = 465;                   // Establece el puerto del servidor SMTP de Gmail
		  	$mail->Username   = "info@grivasoluciones.com.ar";         // Usuario Gmail
		  	$mail->Password   = "superinfo";           // Contrase�a Gmail
		  	$mail->IsHTML(true);
		  	
			$mail->From = $form['sFromMail']; 
			$mail->FromName = $form['sFromName']; 
			$mail->Subject = $form['sAsunto']; 
			
			$iCantidadEnviados = 0;
			$aMailError = array();
				
			$aOpciones['HTML_BODY'] = $sBody;
			$aOpciones['ID_MSJE'] = $idMail;
			
			foreach($aMails as $sDato){
				
				if(!is_null($sDato) && strpos($sDato,"userMenuLink_") !== false){
					
					$sMail = str_replace("userMenuLink_","",$sDato);
					
					$aContacto = $oMysql->consultaSel("SELECT * FROM contactos WHERE contactos.sMail = '{$sMail}'");
					if(count($aContacto)>0){
						$idEstadoMensaje = 0;
						if($form['hdnEnviar'] == 1){
						
							$aOpciones['ID_CONTACTO'] = $aContacto['id'];
							//$oRespuesta->alert($aContacto['id']);
							$HtmlTemplate = parserTemplate(TEMPLATES_XHTML_DIR."/pages/promo.tpl" , $aOpciones);
							$sCuerpo = $HtmlTemplate; 
							
							try{			
								$mail->MsgHTML($sCuerpo);	
								$mail->AddAddress($sMail,""); 
								$mail->Send(); 
								$iCantidadEnviados++;						
								$idEstadoMensaje = 2;
								
							} catch (phpmailerException $e) {
							  $EmailError.= $e->errorMessage(); //Errores de PhpMailer
							  $aMailError[] = $sMail;
							  $idEstadoMensaje = 3;
							} catch (Exception $e) {
							  $EmailError.= $e->getMessage(); //Errores de cualquier otra cosa.
							  $aMailError[] = $sMail;
							  $idEstadoMensaje = 3;
							}
							
							$mail->ClearAddresses(); //Reinicio de las E-mail argegado
						}else{
							$idEstadoMensaje = 6;
							
						}
						if($idEstadoMensaje != 0){
							$sql = "INSERT INTO detallesmails(idMail,idContacto,idEstadoMensaje) VALUES({$idMail},{$aContacto['id']},{$idEstadoMensaje})";
							$oMysql->consultaAff($sql);
						}
					}
				}
			}
			
			$idEstadoMail = 0;
			if($form['hdnEnviar'] == 0){ //Si se desea solo Guardar la campa�a sin enviar los mails
				$sMsje .= "Se ha guardado correctamente la Campa�a.\n";
				
			}else{
				$sMsje .= "Se han enviado {$iCantidadEnviados} Mails.\n";
				if(count($aMailError) > 0){
					$sMsje .= "No se pudieron enviar el Mail masivo a los siguientes E-mail:\n";
					$sMsje .= implode(",",$aMailError);
				}
				
				if($iCantidadEnviados == count($aMails)){
					$idEstadoMail = 2;
				}else{
					$idEstadoMail = 3;
				}
				$sql = "UPDATE mails SET mails.idEstadoMail={$idEstadoMail} WHERE mails.id={$idMail}";
				$oMysql->consultaAff($sql);
				    	
				//$derror = "El mensaje ha sido enviado.";
				$setEstado = "idMail,idUsuario,idEstadoTrabajo,idTipoMail,dFechaRegistro,dFechaEnvio,sRemitente";
				$valuesEstado = "'{$idMail}','{$_SESSION['ID_USER']}','{$idEstadoMail}','2',NOW(),'{$dFechaEnvio}','{$form['sMailUnidadNegocio']}'";
				$ToAuditoryEstado = "Insercion Historial de Mails ::: Usuario ={$_SESSION['ID_USER']} ::: idMail={$idMail} ::: estado={$idEstadoMail} idTipoMail=2";
				$idHistorial = $oMysql->consultaSel("CALL usp_InsertTable(\"historialmails\",\"$setEstado\",\"$valuesEstado\",\"{$_SESSION['ID_USER']}\",\"14\",\"$ToAuditoryEstado\");",true);
			}			
			
		}else{
		  	//$derror = "<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."No hay remitentes para enviar.</div>";
		  	$sMsje = "No hay remitentes para enviar.";
		}
		$oRespuesta->alert($sMsje);
		//$oRespuesta->script("resetDatosForm()");
		$oRespuesta->redirect("MailsCampanias.php");
		return $oRespuesta;
	}
	/************************  UNIDADES DE NEGOCIOS  ****************************/
	function getDatosUnidadNegocio($sCodigo){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
	    $sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "unidadesnegocios.id = '$sCodigo'";	   
   
  	    $aUnidadNegocio = $oMysql->consultaSel("CALL usp_getUnidadesNegocios(\"$sConditions\",\"\",\"\",\"\");",true);
  
	    $oRespuesta->assign('idUnidadNegocio','value',$aUnidadNegocio['id']);
	    $oRespuesta->assign('sNombre','value',$aUnidadNegocio['sNombre']);
	    $oRespuesta->assign('sMail','value',$aUnidadNegocio['sMail']);	    
	    
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	
	function updateDatosUnidadNegocio($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
		$form['sMail']=$oMysql->escapeString($form['sMail']);
		$smsMessage = "";
		
		if($form['idUnidadNegocio'] == 0){
			$set = "sNombre,sMail,sEstado";			
			$values = "'{$form['sNombre']}','{$form['sMail']}','A'";
			$ToAuditry = "Insercion de Unidades de Negocios ::: '{$form['sNombre']}";
			
			$oMysql->consultaAff("CALL usp_InsertTable(\"unidadesnegocios\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"16\",\"$ToAuditry\");");				
			$smsMessage .= " - Se dio de alta la Unidad de Negocio";
		}else{		
			$set = "sNombre='{$form['sNombre']}',			
			 		sMail='{$form['sMail']}'";		
										
			$sConditions = "unidadesnegocios.id = '{$form['idUnidadNegocio']}'";
			$ToAuditry = "Update de Unidades de Negocio ::: idGrupo = {$form['idGrupo']}";
			
			$oMysql->consultaAff("CALL usp_UpdateTable(\"unidadesnegocios\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"17\",\"$ToAuditry\");");				
			$smsMessage .= " - Se modificaron los datos de la Unidad de Negocio";							
		}
		
			//$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;	
	}
	
	function getMailUnidadNegocio($idUnidadNegocio){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
	    $sConditions = "unidadesnegocios.id = '$idUnidadNegocio'";	
		$aUnidadNegocio = $oMysql->consultaSel("CALL usp_getUnidadesNegocios(\"$sConditions\",\"\",\"\",\"\");",true);
		
		if($idUnidadNegocio == 0){
			$oRespuesta->assign('sFromMail','value','');
			$oRespuesta->assign('sFromName','value','');
			$oRespuesta->assign('sMailRemitente','innerHTML','');
			$oRespuesta->assign('sMailUnidadNegocio','value','');			
		}else{	
			$oRespuesta->assign('sFromMail','value',$aUnidadNegocio['sMail']);
			$oRespuesta->assign('sFromName','value',$aUnidadNegocio['sNombre']);
			$oRespuesta->assign('sMailRemitente','innerHTML',$aUnidadNegocio['sMail']);
			$oRespuesta->assign('sMailUnidadNegocio','value',$aUnidadNegocio['sMail']);
		}
		return $oRespuesta;	
	}
	
	function buscarMensajesSMS($dDesde,$dHasta,$sTexto){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		//$oRespuesta->alert($dDesde."----".$dHasta."----".$sTexto);
		$sScript = "mygrid.clearAll();
		mygrid.loadXML('xmlRecibidos.php?dDesde=".$dDesde."&dHasta=".$dHasta."&sTexto=".$sTexto."'); 
		mygrid.init();		
		mygrid.attachHeader(',#text_filter,#text_filter,#text_filter,#text_filter,#text_filter');";
		
		$oRespuesta->script($sScript);
		
		return $oRespuesta;	
	}
	
	function obtenerGanador($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$dDesde = $form['hdnDesde'];
		$dHasta = $form['hdnHasta'];
		$sTexto = $form['hdnTexto'];
		
		$sConditions = " mensajes.idTipoMensaje = 2";//Tipo 2 son Recibidos en el Modem
		if($dDesde != ""){
			$dDesde = dateFormatMysql($dDesde);
			$sConditions .= " AND mensajes.dFechaRegistro >= '{$dDesde}'";
		}
		if($dHasta != ""){
			$dHasta = dateFormatMysql($dHasta.' 24:00:00');
			$sConditions .= " AND mensajes.dFechaRegistro <= '{$dHasta}'";
		}
		/*if($sTexto != "")
			$sConditions .= " AND mensajes.sMensaje LIKE '{$sTexto}'";
		*/	
		//$array=$oMysql->consultaSel("CALL usp_getMensajes(\"$sConditions\",\"\",\"\",\"\");");
		$array=$oMysql->consultaSel("SELECT mensajes.idContacto,mensajes.sRemitente,contactos.sApellido,contactos.sNombre,mensajes.sMensaje 
									FROM mensajes 
									LEFT JOIN contactos ON mensajes.idContacto = contactos.id
									WHERE $sConditions");
		$iCantidadMensajes = count($array);
		if($iCantidadMensajes > 0){
			$aRandom = array_rand($array);
			
			$sFila = "<tr id=\'rowDetalle_".$array[$aRandom]['idContacto']."\'></tr>";
			$sContacto = "";
			if($array[$aRandom]['sApellido'] != "")
				$sContacto .= $array[$aRandom]['sApellido'] .", ". $array[$aRandom]['sNombre'];
			
			$array[$aRandom]['sMensaje'] = trim(convertir_especiales_html(utf8_encode(strhexcode($array[$aRandom]['sMensaje']))));		
			$strHtmlFinal = "<td style=\'border:1px solid black\'>{$sContacto}</td><td style=\'border:1px solid black\'>{$array[$aRandom]['sRemitente']}</td><td style=\'border:1px solid black\'>{$array[$aRandom]['sMensaje']}</td>";
			//$oRespuesta->alert($strHtmlFinal);
			$sScript = "
				jQuery('#tbDetalle').append('".$sFila."');
				jQuery('#rowDetalle_".$array[$aRandom]['idContacto']."').html('".$strHtmlFinal."');
				";
			$oRespuesta->script($sScript);
		}
		
		return $oRespuesta;	
	}
	
	
	function updateDatosModem($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();

		$set = "url='{$form['url']}'";		
										
		$sConditions = "params.id = '{$form['idParam']}'";
		$ToAuditry = "Update de Parametros del Modem::: idUsuario = {$_SESSION['ID_USER']}";
		
		$oMysql->consultaAff("CALL usp_UpdateTable(\"params\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"23\",\"$ToAuditry\");");				
		$smsMessage .= " - Se modificaron los datos del Modem";	
		return $oRespuesta;	
	}
	
	function updateDatosSistema($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$form['sTitulo'] = addslashes(convertir_especiales_html($form['sTitulo']));
		$form['sMailHeader'] = addslashes(convertir_especiales_html($form['sMailHeader']));
		$form['sMailFoot'] = addslashes(convertir_especiales_html($form['sMailFoot']));

		$set = "sTitulo='{$form['sTitulo']}',
				sMailDefault='{$form['sMailDefault']}',
				sMailHeader='{$form['sMailHeader']}',
				sMailFoot='{$form['sMailFoot']}'";		
										
		$sConditions = "params_system.id = '{$form['idParam']}'";
		$ToAuditry = "Update de Parametros del Sistema::: idUsuario = {$_SESSION['ID_USER']}";
		
		$oMysql->consultaAff("CALL usp_UpdateTable(\"params_system\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"24\",\"$ToAuditry\");");				
		$smsMessage .= " - Se modificaron los datos del Sistema";	
		return $oRespuesta;	
	}
?>