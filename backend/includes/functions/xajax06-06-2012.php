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

	function ProcesarFactura($aForm){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		

		
		
		$aRows = explode(',',$aForm['Productos_rowsadded']);
		$aRowsDeletes = explode(',',$aForm['Productos_rowsdeleted']);
		$fTotal=0;	
		
		foreach ($aRows AS $key => $value){
			if(!in_array($value,$aRowsDeletes ) ){
				$aDetalles[] = array('idProducto' => $aForm["Productos_{$value}_0"], 'fPrecio' => $aForm["Productos_{$value}_1"], 'iCantidad' => $aForm["Productos_{$value}_2"], 'fSubTotal' => $aForm["Productos_{$value}_3"]);
				 $fTotal += $aForm["Productos_{$value}_3"];
			}
		}		
		
		$hoy=date('d/m/Y');
		$idCaja = CajaOperario::issetCaja($_SESSION['ID_USER'], $hoy);			
		
		if($idCaja == 0){
			$smsError = "<span style='color:#FF0000;'> - No existe una caja abierta para ud.</span>";
			$oRespuesta->assign('divMessageFactura','innerHTML',$smsError);
		}else{
			
			$CajaOperario = new CajaOperario($idCaja);	
			
			if($aForm['idTipoPago'] == 1 ){
					#TipoPago=EFECTIVO
					$idPago = $CajaOperario->addPago(array('fImporte' => $fTotal));					
					
			}else{
					#TipoPago=CUENTACORRIENTE
					
					$aForm['idTipoMovimientoCuentaCorriente'] = 2;
					$idPago = 0;
					if(isset($aForm['chkbox'])){
						#Realizo adelanto en cuenta corriente
						
						$idPago = $CajaOperario->addPago(array('fImporte' => $aForm['fMontoAdelanto']));
						$aForm['fHaber'] = $aForm['fMontoAdelanto'];
						$aForm['idTipoMovimientoCuentaCorriente'] = 1;
					}
					
					$aForm['fDebe'] = $fTotal;
					$aForm['idPago'] = $idPago;
					
					$Customer = new Customer($aForm['idCliente']);
					
					$idMovimientoCuentaCorriente = $Customer->addMovimientoCuentaCorriente($aForm);
					
			}

			$Factura = new Factura(0);
			
			$aForm['idMovimientoCuentaCorriente'] = $idMovimientoCuentaCorriente;
			$aForm['idListadoCobranza'] = $CajaOperario->getIdCajaOperario();
			$aForm['fTotal'] = $fTotal;
			
			$idFactura = $Factura->insert($aForm);						
			
			$idDetalle = $Factura->insertDetails($aDetalles);
			
			$smsError = "<span style='color:#336699;font-size:11px;font-weight:bold;'> - La factura se almaceno</span>";
			$oRespuesta->assign('divMessageFactura','innerHTML',$smsError);
			$js = "updateGridFacturas()";
			$oRespuesta->script($js);
					
		}
		   
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
   $oRespuesta->assign('id','value',$aUser['id']);
   
   $Name = $aUser['sNombre'].", ".$aUser['sApellido'];
   $oRespuesta->assign('sNombre','value',$aUser['sNombre']);
   $oRespuesta->assign('sApellido','value',$aUser['sApellido']); 
   $oRespuesta->assign('sDireccion','value',$aUser['sDireccion']); 
   $oRespuesta->assign('sMail','value',$aUser['sMail']);  
   $oRespuesta->assign('sTelefono','value',$aUser['sTelefono']);  
   $oRespuesta->assign('sMovil','value',$aUser['sMovil']);     

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
   
   if($aDatos['saveUser'] == 1){ $array['sLogin'] = $aDatos['sLogin_']; }
   
   if($aDatos['sPassword_'] != '' && $aDatos['sPassword_'] = $aDatos['sPasswordRepeat_']){ $array['sPassword'] = md5($aDatos['sPassword_']); }
   
   if($aDatos['idOficina'] != 0){ $array['idOficina'] = $aDatos['idOficina']; }
   
   if($aDatos['idTipoUsuario'] != 0){ $array['idTipoUsuario'] = $aDatos['idTipoUsuario']; }

   if($aDatos['sEstado'] != '0'){ $array['sEstado'] = $aDatos['sEstado']; } 
   
   if($aDatos['sNombre'] != ''){ $array['sNombre'] = $aDatos['sNombre']; }
   if($aDatos['sApellido'] != ''){ $array['sApellido'] = $aDatos['sApellido']; }
   if($aDatos['sDireccion'] != ''){ $array['sDireccion'] = $aDatos['sDireccion']; }
   if($aDatos['sMail'] != ''){ $array['sMail'] = $aDatos['sMail']; }
   if($aDatos['sTelefono'] != ''){ $array['sTelefono'] = $aDatos['sTelefono']; }
   if($aDatos['sMovil'] != ''){ $array['sMovil'] = $aDatos['sMovil']; }
   
   $User = new User($aDatos['id']);
   
   $User->update($array);
   
   $User->savePermit($permitUser);

   $js = "setFormUser()";
   
   $smsMessage = "- Se registro su operacion";
   
   //$oRespuesta->script($js);
   $oRespuesta->alert($smsMessage);
   $oRespuesta->script("resetDatosForm__()");
   //$oRespuesta->assign('divMessageUser','innerHTML',$smsMessage);
	   
   return $oRespuesta;		
}

function datosCuentaCorriente($idMovimientoCtaCte){
	GLOBAL $oMysql;
	$oRespuesta = new xajaxResponse();

	$idMovimientoCtaCte=trim($idMovimientoCtaCte);

	$sConditions = "CuentasCorrientes.id = '$idMovimientoCtaCte'";

	$array = $oMysql->consultaSel("CALL usp_getCuentasCorrientes(\"$sConditions\",\"\",\"\",\"\");",true);
	
	$fImporte = $array['fDebe'] - $array['fHaber'];
	if($fImporte < 0){ $fImporte = $fImporte * (-1); }

	$oRespuesta->assign('dFecha','innerHTML',$array['dFechaMovimiento']);
	$oRespuesta->assign('idTipoMovimientoCuentaCorriente','value',$array['idTipoMovimientoCuentaCorriente']);
	$oRespuesta->assign('sComprobante','value',$array['sComprobante']);
	$oRespuesta->assign('fImporte','value',$fImporte);
	$oRespuesta->assign('sDetalle','value',$array['sDetalle']);
	$oRespuesta->assign('type','value','EditMov');
	$oRespuesta->assign('id_','value',$array['id']);
	
	$js = " document.getElementById('idTipoMovimientoCuentaCorriente').value = '{$array['idTipoMovimientoCuentaCorriente']}' ";

	$oRespuesta->script($js);

	return $oRespuesta;
}

function guardarDatosCuentaCorriente($array){
	GLOBAL $oMysql;
	$oRespuesta = new xajaxResponse();	
	
	#Averiguar bien que significa HABER Y DEBE para ellos	
	
	if(isset($_SESSION['idCustomer_']) && $_SESSION['idCustomer_'] != 0){

		$iTipoMovimiento = $oMysql->consultaSel("SELECT fcn_TipoMovimiento(\"{$array['id_']}\");",true);
		$fDebe = '0.00';
		$fHaber = '0.00';	
		
		if($iTipoMovimiento == 0){
			$fHaber = $array['fImporte'];
		}
		
		if($iTipoMovimiento == 1){#Es ingreso
			$fHaber = $array['fImporte'];
		}
		
		if($iTipoMovimiento == -1){#Es ingreso
			$fDebe = $array['fImporte'];
		}
		
		switch ($array['type']) {
			case "NewMov":
					if($_SESSION['Customer']['AGREGAR_MOVIMIENTOCUENTACORRIENTE_CLIENTE'] == 1){
						$set= "idCliente,idTipoMovimientoCuentaCorriente,sComprobante,fDebe,fHaber,dFechaRegistro,sDetalle";
						$values = "{$_SESSION['idCustomer_']},{$array['idTipoMovimientoCuentaCorriente']},'{$array['sComprobante']}','{$fDebe}','{$fHaber}',NOW(),'{$array['sDetalle']}'";
				
						$ToAuditory = "Se agrego movimiento de Cuenta Corriente a Cliente id ::: {$_SESSION['idCustomer_']}. Importe agregado Debe:$fDebe - Haber: $fHaber";
						//var_export("CALL usp_InsertTable(\"CuentasCorrientes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\" ");die();
						
						$id = $oMysql->consultaSel("CALL usp_InsertTable(\"CuentasCorrientes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");",true);						
						$smsError = "<span style='color:#336699;font-size:11px;'> Se agrego el movimiento de Cta Cte.</span>";
						$oRespuesta->script("setGridCuentaCorriente(\"{$_SESSION['idCustomer_']}\")");	
					}else{
						$smsError = "<span style='color:#FF0000;font-size:11px;'> Lo siento pero Ud. no puede agregar movimientos de Cta Cte</span>";
					}					
					
					$oRespuesta->assign('smsMessageCtaCte','innerHTML',$smsError);
				
				break;
		
			case "EditMov":
					if($_SESSION['Customer']['MODIFCAR_MOVIMIENTOCUENTACORRIENTE_CLIENTE'] == 1){
						$set= "idTipoMovimientoCuentaCorriente = '{$array['idTipoMovimientoCuentaCorriente']}',
							   sComprobante = '{$array['sComprobante']}',
							   fDebe = '{$fDebe}',
							   fHaber = '{$fHaber}',
							   sDetalle = '{$array['sDetalle']}'";
						$conditions = "CuentasCorrientes.id = '{$array['id_']}'";
						$ToAuditory = "Se actualizo movimiento de Cuenta Corriente a Cliente id ::: {$_SESSION['idCustomer_']}. Movimiento id ::: {$array['id_']}";
				
						$id = $oMysql->consultaSel("CALL usp_UpdateTable(\"CuentasCorrientes\",\"$set\",\"$conditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");",true);
						
						$smsError = "<span style='color:#336699;font-size:11px;'> Se actualizo el movimiento de Cta Cte.</span>";
					}else{
						$smsError = "<span style='color:#FF0000;font-size:11px;'> Lo siento pero Ud. no puede editar movimientos de Cta Cte</span>";
					}

					$oRespuesta->assign('smsMessageCtaCte','innerHTML',$smsError);					
					$oRespuesta->script("setGridCuentaCorriente(\"{$_SESSION['idCustomer_']}\")");	
				break;
		}
		
		

	}else{
		
		$smsError = "<span style='color:#FF0000;font-size:11px;'> Ocurrio uno de los siguientes problemas:<br / > - No Existe un cliente seleccionado <br /> - Ha caducado su sesion.</span>";
		$oRespuesta->assign('smsMessageCtaCte','innerHTML',$smsError);
		
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
	
	function updateDatosPedidos($form,$idEstadoPedido){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		$dFechaNac =  dateFormatMysql($form['dFechaNac']);
		$form['sDomicilioParticular']=$oMysql->escapeString($form['sDomicilioParticular']);
		$form['sDomicilioComercial']=$oMysql->escapeString($form['sDomicilioComercial']);
		$form['sNombreLocal']=$oMysql->escapeString($form['sNombreLocal']);
		$form['sBarrio']=$oMysql->escapeString($form['sBarrio']);		
		
		if($form['idPedido'] == "0"){
			$set = "sNroOperacion,sNroCliente,sVendedor,sResponsable,dFecha,sEstado,idUsuario,idCliente,idEstadoPedido";
			$values = "'{$form['sNroOperacion']}','{$form['hdnNroCliente']}','{$form['idVendedor']}','{$form['sResponsable']}',NOW(),'A','{$_SESSION['ID_USER']}','{$form['idCliente']}','$idEstadoPedido'";
			$ToAuditry = "Insercion de Pedidos ::: '{$form['sNroOperacion']}-{$form['sVendedor']}'";
			$newIdPedido = $oMysql->consultaSel("CALL usp_InsertTable(\"pedidos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$camposEntrega = "sNombre,sApellido,sDni,sMail,dFechaNac,sTelefono,sConyuge,sDomicilioParticular,sDomicilioComercial,sBarrio,idLocalidad,sRubro,sNombreLocal,idPedido,fCredito";
			$valuesEntrega = "'{$form['sNombre']}','{$form['sApellido']}','{$form['sDni']}','{$form['sMail']}','{$dFechaNac}','{$form['sTelefono']}','{$form['sConyuge']}','{$form['sDomicilioParticular']}','{$form['sDomicilioComercial']}','{$form['sBarrio']}','{$form['idLocalidad']}','{$form['sRubro']}','{$form['sNombreLocal']}','{$newIdPedido}','{$form['sCredito']}'";
						
			$sqlEntrega = "INSERT INTO datosentrega ({$camposEntrega}) VALUES ({$valuesEntrega})";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlEntrega);
			$oMysql->commit();
			
			$form['fAdelanto'] = str_replace(",",".", $form['fAdelanto']);
			$form['fMonto'] = str_replace(",",".", $form['fMonto']);
			$camposFPago = "idPlanPago,idPedido,fAdelanto,fMonto,iCuotas";
			
			$valuesFPago = "'{$form['idPlanPago']}','{$newIdPedido}','{$form['fAdelanto']}','{$form['fMonto']}','{$form['iCuotas']}'";
			$sqlFPago = "INSERT INTO formaspagos ({$camposFPago}) VALUES ({$valuesFPago})";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlFPago);
			$oMysql->commit();
			
			if($form['type'] == "NEW"){
				$aRows = array_unique(explode(',',$form['Productos_rowsadded']));
				$aRowsDeletes = explode(',',$form['Productos_rowsdeleted']);
				$fTotal=0;
				$aDetalles = array();	
				foreach ($aRows AS $key => $value){
					if(!in_array($value,$aRowsDeletes ) ){
						$sEstado = 'A';
						$aDetalles[] = array('sDescripcion' => $form["Productos_{$value}_0"], 'iCantidad' => $form["Productos_{$value}_1"], 'fPrecio' => $form["Productos_{$value}_2"],'fSubTotal' =>$form["Productos_{$value}_3"]);						
					}
				}						
				$id = insertProductos($aDetalles,$newIdPedido);
			}
			
			$fMargenCredito = $form['sCredito']-$form['sTotal'];
			
			$sqlCliente = "UPDATE clientes SET fMargenCredito= $fMargenCredito WHERE id={$form["idCliente"]}";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlCliente);
			$oMysql->commit();
			
			$iCodigo = 1000 + $newIdPedido;
			$sqlPedidos = "UPDATE pedidos SET sNroOperacion='{$iCodigo}' WHERE pedidos.id ='{$newIdPedido}'";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlPedidos);
			$oMysql->commit();
			
			$smsMessage = " - Se dio de alta el Pedido";
			
		}else{
			$smsMessage = " - Se modificaron los datos del Pedido";	
		}
		
		$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;			
	}
	
	function insertProductos($aDatos, $idPedido){
		global $oMysql;
		$setProductos = "(idPedido,sDescripcion,fPrecio,iCantidad,sEstado,fSubTotal)";
		$valuesProductos = "";
		$array=array();
		foreach ($aDatos as $aItem ){			
			$array[] = "('{$idPedido}','{$aItem['sDescripcion']}','{$aItem['fPrecio']}','{$aItem['iCantidad']}','A','{$aItem['fSubTotal']}')";
		}				
		$valuesProductos = implode(',',$array);
		
		//$ToAuditory = "Alta de Productos ::: Pedido :::'{$idPedido}'";	
		$sqlProducto = "INSERT INTO det_pedidos {$setProductos} VALUES {$valuesProductos}";
		$oMysql->startTransaction();
		$oMysql->consultaAff($sqlProducto);
		$oMysql->commit();
		$id = "1";
		/*$id = array_shift($oMysql->consultaSel("CALL usp_abm_General(\"det_pedidos\",\"$set\",\"$values\",\"1\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");"));*/
		
		return $id;
	}
	
	
	function cambiarEstadoProforma($form,$idEstadoPedido){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$set = "idEstadoPedido='{$idEstadoPedido}'";
													
		$sConditions = "pedidos.id = '{$form['idPedido']}'";
		$ToAuditry = "Update de Pedidos ::: {$form['idPedido']}";
		$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"pedidos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");	
		
		switch($idEstadoPedido){
			case "2":
				$msje = "El Pedido se Aprobo con exito";
				break;
			case "3":
				$msje = "El Pedido paso a estado Entregado con exito";
				break;		
		}
		
		$oRespuesta->alert($msje);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;
	}
	
	function updateDatosEntregaPedido($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();	
		$sPagare = 0;
		if($form['sPagare'])
			$sPagare = $form['sPagare'];
		$iProforma=0;	
		if(isset($form['iProforma']))$iProforma=1;
		$iDni=0;
		if(isset($form['iDni']))$iDni=1;
		$iBoleta=0;
		if(isset($form['iBoleta']))$iBoleta=1;
		$iMonotributo=0;
		if(isset($form['iMonotributo']))$iMonotributo=1;
		$iPagare=0;
		if(isset($form['iPagare']))$iPagare=1;
		
		$form['sPrecioCompra'] = str_replace(",",".", $form['sPrecioCompra']);
		$form['sPrecioContado'] = str_replace(",",".", $form['sPrecioContado']);
		$form['sComision'] = str_replace(",",".", $form['sComision']);
		$sPagare = str_replace(",",".", $sPagare);
		$dFechaRegistro =  dateFormatMysql($form['dFechaRegistro']);
		
		$set = "idPedido,idProveedor,dFechaRegistro,sResponsable,iProforma,iDni,iBoleta,iMonotributo,iPagare,fPagare,fPrecioCompra,fPrecioContado,fComision,idCobrador";
		
		$values = "'{$form['idPedido']}','{$form['idProveedor']}','{$dFechaRegistro}','{$form['sResponsable']}','{$iProforma}','{$iDni}','{$iBoleta}','{$iMonotributo}','{$iPagare}','{$sPagare}','{$form['sPrecioCompra']}','{$form['sPrecioContado']}','{$form['sComision']}','{$form['idCobrador']}'";
		
		$ToAuditry = "Insercion de datos de Entrega de Pedidos ::: '{$form['idPedido']}'";				
		$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"datospedidosentregados\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);
		//$oRespuesta->alert($sqlEntrega);
		
		/*********** Modificacion estado de Pedido ***********/
		$setPedido = "pedidos.idEstadoPedido=3";
		$sConditionsPedido = "pedidos.id = '{$form['idPedido']}'";
		$ToAuditry = "Update de Pedidos ::: {$form['idPedido']}";
		$sqlPedido = "CALL usp_UpdateTable(\"pedidos\",\"$setPedido\",\"$sConditionsPedido\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");";

		$oMysql->startTransaction();
		$oMysql->consultaAff($sqlPedido);
		$oMysql->commit();
			
		/*********** Impactamos en la CtaCte del Vendedor ***********/	
		$fHaber = str_replace(",",".", $form['sComision']);		
		$fDebe =  0;		
		
		$dFecha = dateFormatMysql(date("d/m/Y"));
		$set= "sDescripcion,dFecha,fDebe,fHaber,sObservacion,dFechaRegistro,idUsuario,idUsuarioCtaCte,idTipoMovimiento,sEstado,idProforma";
		$values = "'Comision Venta para N�Proforma:{$form['hdnCodigo']}','{$dFecha}','$fDebe}','{$fHaber}','',NOW(),'{$_SESSION['ID_USER']}','{$form['hdnIdVendedor']}',3,'A','{$form['idPedido']}'";
	
		$ToAuditory = "Se agrego movimiento de Cuenta Corriente al Vendedor id ::: {$form['hdnIdVendedor']}. Importe agregado  Haber:$fHaber-Debe:$fDebe";
		$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"cuentascorrientes\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditory\");",true);
		
		$oRespuesta->assign('divMessageOperacion','innerHTML','El Pedido se Entrego correctamente');
		$oRespuesta->script("resetDatosForm__()");
		
		return $oRespuesta;	
	}
	
	function CargarDatosPedidoEntregado($sCodigo){
		global $oMysql;
		$oRespuesta = new xajaxResponse();	
		
		$sConditions = "pedidos.id = '$sCodigo'";	      
  	    $aProforma= $oMysql->consultaSel("SELECT idEstadoPedido,sNroOperacion,sVendedor FROM pedidos WHERE {$sConditions}",true);
  	    
  	    $oRespuesta->assign('hdnCodigo','value',$aProforma['sNroOperacion']);
  	    $sVendedor= $oMysql->consultaSel("SELECT CONCAT(usuarios.sApellido,', ',usuarios.sNombre) as sVendedor FROM usuarios WHERE id={$aProforma['sVendedor']}",true);
  	    $oRespuesta->assign('sVendedor','innerHTML',$sVendedor);
  	    $oRespuesta->assign('hdnIdVendedor','value',$aProforma['sVendedor']);
  	    $oRespuesta->assign('idCobrador','value',5);
  	    
  	    if(($aProforma['idEstadoPedido'] == "3")||($aProforma['idEstadoPedido'] == "7")){ 
  	    //los datos de entrega se puede modificar si la Proforma esta en 'Entregado' o 'Suspendido' 	    	
  	    	$sConditionsPedido = "datospedidosentregados.idPedido = '$sCodigo'";
  	    	$aPedido= $oMysql->consultaSel("SELECT id,idProveedor,DATE_FORMAT(dFechaRegistro,'%d/%m/%Y') as 'dFechaRegistro',sResponsable,IFNULL(fPrecioCompra,0) as 'fPrecioCompra',IFNULL(fPrecioContado,0) as 'fPrecioContado',IFNULL(fComision,0) as 'fComision',iProforma,iDni,iBoleta,iMonotributo,iPagare,IFNULL(fPagare,0) as 'fPagare',idCobrador FROM datospedidosentregados WHERE {$sConditionsPedido}",true);
  	    	
  	    	//$oRespuesta->assign('idEstadoPedido','value',$idEstadoPedido);
  	    	$oRespuesta->assign('idProveedor','value',$aPedido['idProveedor']);
  	    	$oRespuesta->assign('dFechaRegistro','value',$aPedido['dFechaRegistro']);
  	    	$oRespuesta->assign('sResponsable','value',$aPedido['sResponsable']);
  	    	$oRespuesta->assign('sPrecioCompra','value',$aPedido['fPrecioCompra']);
  	    	$oRespuesta->assign('sPrecioContado','value',$aPedido['fPrecioContado']);
  	    	$oRespuesta->assign('sComision','value',$aPedido['fComision']); 
  	    	$oRespuesta->assign('idCobrador','value',$aPedido['idCobrador']); 
  	    	
  	    	if($aPedido['iProforma'] == "0")$oRespuesta->assign('iProforma','checked',false);  
  	    	else $oRespuesta->assign('iProforma','checked',true);  
  	    	if($aPedido['iDni'] == "0")$oRespuesta->assign('iDni','checked',false);  
  	    	else $oRespuesta->assign('iDni','checked',true);  
  	    	if($aPedido['iBoleta'] == "0")$oRespuesta->assign('iBoleta','checked',false);  
  	    	else $oRespuesta->assign('iBoleta','checked',true);  
  	    	if($aPedido['iMonotributo'] == "0")$oRespuesta->assign('iMonotributo','checked',false); 
  	    	else $oRespuesta->assign('iMonotributo','checked',true);  
  	    	if($aPedido['iPagare'] == "0"){
  	    		$oRespuesta->assign('iPagare','checked',false);  
  	    		$oRespuesta->assign('sPagare','value','');
  	    		$oRespuesta->assign('sPagare','style.display','none'); 
  	    	}
  	    	else{ 
  	    		$oRespuesta->assign('iPagare','checked',true); 
  	    		$oRespuesta->assign('sPagare','style.display','inline'); 
  	    		$oRespuesta->assign('sPagare','value',$aPedido['fPagare']);  
  	    	}  	    	
  	    	$oRespuesta->assign('cmd_Aceptar','style.display','none'); 
  	    	$oRespuesta->assign('cmd_Cancelar','style.display','inline'); 
  	    }
  	 
  	    $oRespuesta->script("setDatosFormPedido({$sCodigo})");
  	    return $oRespuesta;	
	}
	/********************  PROVEDORES  *********************/
	function CargarDatosProveedor($sCodigo){
		GLOBAL $oMysql;
	    $oRespuesta = new xajaxResponse();
	   
	    $sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "proveedores.id = '$sCodigo'";	   
  	    $aProvedor = $oMysql->consultaSel("CALL usp_getProveedores(\"$sConditions\",\"\",\"\",\"\");",true);  	 
	    $sConsulta = "select idProvincia from localidades where id={$aProvedor['idLocalidad']}";
	    $idProv = $oMysql->consultaSel($sConsulta,true); 
					 
	    if($idProv){ 
	  	   $oRespuesta->assign('idProvincia','value',$idProv);    
	       $oRespuesta->script("selectOpcionesCondicionado( idProvincia_idLocalidad_CondicionadoMultiple_IDS_PADRES, 'idLocalidad', idProvincia_idLocalidad_CondicionadoMultiple, 'Seleccionar...', 'Seleccionar...', 'Seleccionar...', 0, 0);");
           $oRespuesta->assign('idLocalidad','value',$aProvedor['idLocalidad']); 
            
	    }else{
	  	   $oRespuesta->assign('idProvincia','value',0);  
	  	   $oRespuesta->assign('idLocalidad','value',0); 
	    }
	   
	    $oRespuesta->assign('idProveedor','value',$aProvedor['id']);
  	    $oRespuesta->assign('idTipoIva','value',$aProvedor['idTipoIva']);
	    $oRespuesta->assign('sNombre','value',$aProvedor['sNombre']);
	    $oRespuesta->assign('sCuit','value',$aProvedor['sCuit']);
	    $oRespuesta->assign('sMail','value',$aProvedor['sMail']);
	    $oRespuesta->assign('sTelefono','value',$aProvedor['sTelefono']);
	    $oRespuesta->assign('sDomicilio','value',unhtmlspecialchars($aProvedor['sDomicilio']));	    
	    $oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	
	function updateDatosProveedores($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();	

		$form['sDomicilio']=$oMysql->escapeString($form['sDomicilio']);
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
	
		if($form['idProveedor'] == "0"){
			$set = "idTipoIva,sNombre,sCuit,sMail,sTelefono,sDomicilio,idLocalidad,sEstado";			
			$values = "'{$form['idTipoIva']}','{$form['sNombre']}','{$form['sCuit']}','{$form['sMail']}','{$form['sTelefono']}','{$form['sDomicilio']}','{$form['idLocalidad']}','A'";
			//$oRespuesta->alert($values);
			$ToAuditry = "Insercion de Proveedor ::: '{$form['sNombre']}'";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"proveedores\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$iCodigo = 1000 + $newId;
			$sqlCliente = "UPDATE proveedores SET sCodigo='{$iCodigo}' WHERE proveedores.id ='{$newId}'";
			$oMysql->startTransaction();
			$oMysql->consultaAff($sqlCliente);
			$oMysql->commit();
			
			$smsMessage = " - Se dio de alta el Proveedor";			
		}else{					
			$set = "idTipoIva='{$form['idTipoIva']}',
			 sNombre='{$form['sNombre']}',
			 sCuit='{$form['sCuit']}',
			 sMail='{$form['sMail']}',
			 sTelefono='{$form['sTelefono']}',
			 sDomicilio='{$form['sDomicilio']}',
			 idLocalidad='{$form['idLocalidad']}'";
			$sConditions = "proveedores.id = '{$form['idProveedor']}'";
			$ToAuditry = "Update de Proveedor ::: {$form['idProveedor']}";
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"proveedores\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");		
			
			$smsMessage = " - Se modificaron los datos del Proveedor";			
		}
	
	//if($newId ){
		$oRespuesta->assign('divMessageOperacion','innerHTML',$smsMessage);	
		$oRespuesta->script("resetDatosForm__()");
	//}
		return $oRespuesta;	
		
	}

	/********************  AGENCIAS  *********************/
	function cargarDatosAgencia($sCodigo){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		$sCodigo=trim($sCodigo);
	    $oMysql->escaparCadena($sCodigo);
	    $sConditions = "agencias.id = '$sCodigo'";	   
  	    $aAgencias = $oMysql->consultaSel("CALL usp_getAgencias(\"$sConditions\",\"\",\"\",\"\");",true);  	 
		
  	    $oRespuesta->assign('idAgencia','value',$aAgencias['id']);
	    $oRespuesta->assign('sNombre','value',$aAgencias['sNombre']);
	    $oRespuesta->assign('sCuit','value',$aAgencias['sCuit']);
	    $oRespuesta->assign('sMail','value',$aAgencias['sMail']);
	    $oRespuesta->assign('sTelefono','value',$aAgencias['sTelefono']);
	    $oRespuesta->assign('sDomicilio','value',unhtmlspecialchars($aAgencias['sDomicilio']));	        $oRespuesta->assign('sImagen','value',$aAgencias['sImagen']);
	    
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");
	    if($aAgencias['sImagen'] != '')
	   	   $oRespuesta->assign('imgAgencia','src','../includes/images/sitio/Agencias/'.$aAgencias['sImagen']);	
	    else    
	   	   $oRespuesta->assign('imgAgencia','src','../includes/images/internas/no_image.gif');	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
		return $oRespuesta;
	}

	function updateDatosAgencias($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$form['sDomicilio']=$oMysql->escapeString($form['sDomicilio']);
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
	
		if($form['idAgencia'] == "0"){
			$set = "sNombre,sCuit,sMail,sDomicilio,sTelefono,sImagen,sEstado";			
			$values = "'{$form['sNombre']}','{$form['sCuit']}','{$form['sMail']}','{$form['sDomicilio']}','{$form['sTelefono']}','{$form['sImagen']}','A'";
			//$oRespuesta->alert($values);
			$ToAuditry = "Insercion de Agencia ::: '{$form['sNombre']}'";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"agencias\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
			
			$smsMessage = " - Se dio de alta el Agencia";	
		}else{
			$set = "sNombre='{$form['sNombre']}',
			 sCuit='{$form['sCuit']}',
			 sMail='{$form['sMail']}',
			 sTelefono='{$form['sTelefono']}',
			 sDomicilio='{$form['sDomicilio']}',
			 sImagen='{$form['sImagen']}'";
			
			$sConditions = "agencias.id = '{$form['idAgencia']}'";
			$ToAuditry = "Update de Agencias ::: {$form['idAgencia']}";
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"agencias\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");		
			
			$smsMessage = " - Se modificaron los datos de la Agencia";		
		}
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
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

	function updateDatosVehiculo($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		$sEquip = array();
		if(isset($form['confort_1']))$sEquip[]="c_1";
		if(isset($form['confort_2']))$sEquip[]="c_2";
		if(isset($form['confort_3']))$sEquip[]="c_3";
		if(isset($form['confort_4']))$sEquip[]="c_4";
		if(isset($form['confort_5']))$sEquip[]="c_5";
		if(isset($form['confort_6']))$sEquip[]="c_6";
		if(isset($form['confort_7']))$sEquip[]="c_7";
		if(isset($form['confort_8']))$sEquip[]="c_8";
		if(isset($form['confort_9']))$sEquip[]="c_9";
		if(isset($form['confort_10']))$sEquip[]="c_10";
		if(isset($form['confort_11']))$sEquip[]="c_11";
		if(isset($form['confort_12']))$sEquip[]="c_12";
		if(isset($form['confort_13']))$sEquip[]="c_13";
		if(isset($form['confort_14']))$sEquip[]="c_14";
		if(isset($form['confort_15']))$sEquip[]="c_15";
		if(isset($form['confort_16']))$sEquip[]="c_16";
		if(isset($form['confort_17']))$sEquip[]="c_17";
		if(isset($form['confort_18']))$sEquip[]="c_18";
		if(isset($form['confort_19']))$sEquip[]="c_19";
		
		if(isset($form['seg_1']))$sEquip[]="se_1";
		if(isset($form['seg_2']))$sEquip[]="se_2";
		if(isset($form['seg_3']))$sEquip[]="se_3";
		if(isset($form['seg_4']))$sEquip[]="se_4";
		if(isset($form['seg_5']))$sEquip[]="se_5";
		if(isset($form['seg_6']))$sEquip[]="se_6";
		if(isset($form['seg_7']))$sEquip[]="se_7";
		if(isset($form['seg_8']))$sEquip[]="se_8";
		if(isset($form['seg_9']))$sEquip[]="se_9";
		if(isset($form['seg_10']))$sEquip[]="se_10";
		if(isset($form['seg_11']))$sEquip[]="se_11";
		if(isset($form['seg_12']))$sEquip[]="se_12";
		if(isset($form['seg_13']))$sEquip[]="se_13";
		if(isset($form['seg_14']))$sEquip[]="se_14";
		if(isset($form['seg_15']))$sEquip[]="se_15";
		if(isset($form['seg_16']))$sEquip[]="se_16";
		if(isset($form['seg_17']))$sEquip[]="se_17";
		
		if(isset($form['ext_1']))$sEquip[]="e_1";
		if(isset($form['ext_2']))$sEquip[]="e_2";
		
		if(isset($form['sonido_1']))$sEquip[]="so_1";
		if(isset($form['sonido_2']))$sEquip[]="so_2";
		if(isset($form['sonido_3']))$sEquip[]="so_3";
		if(isset($form['sonido_4']))$sEquip[]="so_4";
		if(isset($form['sonido_5']))$sEquip[]="so_5";
		if(isset($form['sonido_6']))$sEquip[]="so_6";
		if(isset($form['sonido_7']))$sEquip[]="so_7";
		if(isset($form['sonido_8']))$sEquip[]="so_8";
		if(isset($form['sonido_9']))$sEquip[]="so_9";		
		
		$sEquipamiento = implode(',',$sEquip);
		//$oRespuesta->alert($form['iKms']);
		if($form['idVehi'] == "0"){
			$set = "idVehiculo,idTipoVehiculo,idMarcaModelo,iPuertas,iAnio,fPrecio,idColor,idCombustible,idDireccion,idTransmision,iKms,sEquipamiento,sImagen,idAgencia,sEstado";			
			$values = "'{$form['idVehiculo']}','{$form['idTipoVehiculo']}','{$form['idModelo']}','{$form['iPuertas']}','{$form['iAnio']}','{$form['fPrecio']}','{$form['idColor']}','{$form['idCombustible']}','{$form['idDireccion']}','{$form['idTransmision']}','{$form['iKms']}','{$sEquipamiento}','{$form['sImagen']}','{$form['idAgencia']}','A'";
			
			$oRespuesta->alert($set.'----'.$values);
			$ToAuditry = "Insercion de Vehiculos ::: {$form['idMarca']}-{$form['idModelo']}";
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"vehiculos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);	
				
			$smsMessage = " - Se dio de alta el Vehiculo";	
		}else{
			$set = "idVehiculo='{$form['idVehiculo']}',
			 idTipoVehiculo='{$form['idTipoVehiculo']}',
		 	 idMarcaModelo='{$form['idModelo']}',
			 iPuertas='{$form['iPuertas']}',
			 iAnio='{$form['iAnio']}',
			 fPrecio='{$form['fPrecio']}',
			 idColor='{$form['idColor']}',
			 idCombustible='{$form['idCombustible']}',
			 idDireccion='{$form['idDireccion']}',
			 idTransmision='{$form['idTransmision']}',
			 iKms='{$form['iKms']}',
			 sEquipamiento='{$sEquipamiento}',
			 sImagen='{$form['sImagen']}',
			 idAgencia='{$form['idAgencia']}'";
			
			$sConditions = "vehiculos.id = '{$form['idVehi']}'";
			$ToAuditry = "Update de Vehiculos ::: {$form['idVehi']}";
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"vehiculos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");		
			
			$smsMessage = " - Se modificaron los datos del Vehiculo";		
		}
		$oRespuesta->alert($smsMessage);
		$oRespuesta->script("resetDatosForm__()");
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
	function getDatosContacto($sCodigo){
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
	   
	    $oRespuesta->assign('idContacto','value',$aContacto['id']);
	    $oRespuesta->assign('sNombre','value',$aContacto['sNombre']);
	    $oRespuesta->assign('sApellido','value',$aContacto['sApellido']);	    
	    $oRespuesta->assign('sDni','value',$aContacto['sDni']);
	    $oRespuesta->assign('sMail','value',$aContacto['sMail']);
	    $oRespuesta->assign('sMovil','value',$aContacto['sMovil']);
	    $oRespuesta->assign('sTelefono','value',$aContacto['sTelefono']);
	    $oRespuesta->assign('sDireccion','value',unhtmlspecialchars($aContacto['sDireccion']));
	    $oRespuesta->assign('idGrupo','value',$aContacto['idGrupo']);
	    
	    //$oRespuesta->assign('divMessageOperacion','innerHTML',"- Mensaje Operacion");	
	    $oRespuesta->assign('cmd_Aceptar','value','Guardar');
	    $oRespuesta->assign('cmd_Cancelar','style.display','inline');
	    return $oRespuesta;	
	}
	
	function updateDatosContacto($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();		
		
		//$dFechaNac =  dateFormatMysql($form['dFechaNac']);
		$form['sDireccion']=$oMysql->escapeString($form['sDireccion']);
		$form['sNombre']=$oMysql->escapeString($form['sNombre']);
		$form['sApellido']=$oMysql->escapeString($form['sApellido']);
		if($form['idContacto'] == 0){
			$set = "sNombre,sApellido,sMovil,sMail,sTelefono,sDireccion,idGrupo,sEstado";			
			$values = "'{$form['sNombre']}','{$form['sApellido']}','{$form['sMovil']}','{$form['sMail']}','{$form['sTelefono']}','{$form['sDireccion']}','{$form['idGrupo']}','A'";
			$ToAuditry = "Insercion de Contacto ::: '{$form['sNombre']}, {$form['sApellido']}'";
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"contactos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);				
			
			$smsMessage = " - Se dio de alta el Contacto";
		}else{		
			$set = "sNombre='{$form['sNombre']}',
			 sApellido='{$form['sApellido']}',
			 sMovil='{$form['sMovil']}',
			 sMail='{$form['sMail']}',
			 sTelefono='{$form['sTelefono']}',
			 sDireccion='{$form['sDireccion']}',
			 idGrupo='{$form['idGrupo']}'";		
										
			$sConditions = "contactos.id = '{$form['idContacto']}'";
			$ToAuditry = "Update de Contactos ::: idContacto = {$form['idContacto']}";
			
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"contactos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");				
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
			
			$newId = $oMysql->consultaSel("CALL usp_InsertTable(\"grupos\",\"$set\",\"$values\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");",true);				
			$smsMessage = " - Se dio de alta el Grupo";
		}else{		
			$set = "sNombre='{$form['sNombre']}',			
			 		sDescripcion='{$form['sDescripcion']}'";		
										
			$sConditions = "grupos.id = '{$form['idGrupo']}'";
			$ToAuditry = "Update de Grupos ::: idGrupo = {$form['idGrupo']}";
			
			$rs = $oMysql->consultaSel("CALL usp_UpdateTable(\"grupos\",\"$set\",\"$sConditions\",\"{$_SESSION['ID_USER']}\",\"0\",\"$ToAuditry\");");				
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
		$res=$sms->envio_sms($form["numero"],$form["mensaje"]);
		$derror="";
		switch($res){
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
		
		$oRespuesta->alert($derror);
		$oRespuesta->script("resetDatosForm__()");
		return $oRespuesta;		
	}
	
	
	function enviarSMSMultiple($form){
		global $oMysql;
		$oRespuesta = new xajaxResponse();
		
		
		$sms = new SMS();
		$sms->conn_dispo($conn);
		$numerosv=array();
		$mensajesv=array();
		$c_campos=array("[nombre]","[numero]","[email]","[domicilio]","[var1]","[var2]","[var3]","[var4]");
		$res=mysql_query("SELECT * FROM contacto WHERE grupo=".$_POST["grupo"]." ORDER BY id ASC;",$conn);
		if($row = @mysql_fetch_array($res))
		{
		   do{
		    $numerosv[]=$row["numero"];  	
		
		    $mensajeff=$_POST["mensaje"];
		    $c_vars=array($row["nombre"],$row["numero"],$row["email"],$row["domicilio"]);
		    $rowvalores=explode("<*=*>",$row["valores"]);
		    foreach($rowvalores as $ivalt => $valts){
		    	$c_vars[]=$valts;
		    }	
		    $mensajeff=str_replace($c_campos,$c_vars,$mensajeff);
		    $mensajesv[]=$mensajeff;
		   }while($row = @mysql_fetch_array($res));
		   //$numerosv=explode(";",$_POST["numero"]);
		   for($i=1;$i<=$form["veces"];$i++){  
		     $res=$sms->envio_sms($numerosv,$mensajesv);
		   }
		   $res="101";
		   if($res=="101")
		    	$derror = "<div align=\"center\" style=\"color:#049D00;font-weight:bold;\">Mensaje enviado.</div>";
		   else 
		    	$derror = "<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."El mensaje no ha sido enviado.</div>";
		 }else{
		  	$derror = "<div align=\"center\" style=\"color:#CC1115;font-weight:bold;\">"."No hay remitentes para enviar.</div>";
		}
				
		$oRespuesta->alert($derror);
		$oRespuesta->script("resetDatosForm()");
		return $oRespuesta;		
	}	
?>