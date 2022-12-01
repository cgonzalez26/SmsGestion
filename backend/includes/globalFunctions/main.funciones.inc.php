<?php
function xhtmlTablaSearchVehiculosSitio($aVariables = array()){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/searchForms/vehiculos.tpl", $aVariables);
}

function xhtmlHeaderPagina($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.header.tpl", $aVariables);
}

//-------------------------------------------
function xhtmlHeaderGrillas($aVariables=False){
	
	$sCadena = "";
	$sCadena = parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.header.grillas.tpl", $aVariables);
	
	echo $sCadena;	
}

function xhtmlHeaderXGrid($aVariables=False){
	
	$sCadena='';
	$sCadena=parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.header.xgrid.tpl", $aVariables);
	
	echo $sCadena;
	
}

function xhtmlTablaABM($aVariables=false,$sNombre=false){
	
	$sCadena='';

	if($sNombre){
		$sCadena=parserTemplate( TEMPLATES_XHTML_DIR . "/verForms/$sNombre.tpl", $aVariables);
	}else {
		$sCadena=parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.tabla.abm.tpl", $aVariables);
	}
	
	return $sCadena;	
}





function xhtmlFootPagina($aVaribales = array()){	
	
	if(sizeof($aVaribales) > 0){
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.tpl", $aVaribales);
	}else{
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.tpl", false);
	}
	
	
}

//-------------------------------------------

function  xhtmlFormRequestPassword($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/pages/RecordarContrase�a.tpl", $aVariables);
}

//-------------------------------------------

function xhtmlMainHeaderPagina($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/mainHeader.tpl", $aVariables);
}

//-------------------------------------------

function xhtmlUserMenuPagina($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenu.tpl", $aVariables);
}

//-------------------------------------------
/*
function __autoload( $className ) {		
	@ include_once( CLASSES_DIR . "/{$className}.class.php" );	
}
*/
//-------------------------------------------

function exitMessagge( $messagge, $link = null, $linkText = null ) {
		
	echo parserTemplate( TEMPLATES_XHTML_DIR . "/pages/exitMessage.tpl", false);
	
}

//-------------------------------------------

function getParametrosBasicos($Level){
	
	$arrayVariables = array();
	switch ($Level) {
		case 0:
			$BaseUrl = "backend/includes";		
			break;
		case 1:
			$BaseUrl = "../includes";		
			break;			
	}	
	
	$Browser = ObtenerNavegador($_SERVER['HTTP_USER_AGENT']);
	if( $Browser == 'Internet Explorer'){ $archiveStyle = 'styleIE.css';}else{$archiveStyle = 'styleMozilla.css';}
	
	$arrayVariables['ARCHIVE_CSS'] = $archiveStyle;
	$arrayVariables['CSS_DIR'] = $BaseUrl;
	$arrayVariables['JS_DIR'] = $BaseUrl;
	$arrayVariables['TEMPLATE_DIR'] = TEMPLATES_DIR;
	$arrayVariables['TEMPLATES_XHTML_DIR'] = TEMPLATES_XHTML_DIR;
	$arrayVariables['XHTML_TITLE'] = "SMSGestion";
	
	return $arrayVariables;
}

//-------------------------------------------

function anyElementInArray($arrayElements, $arrayToSearch){
	global $mysql;
	$boolean = false;
	$TamarrayElements = sizeof($arrayElements) - 1;
	$i = 0;
	while(!$boolean && $i <= $TamarrayElements){
		$boolean = (in_array($arrayElements[$i],$arrayToSearch)) ? true : false;
		$i++;
	}
	
	return $boolean;
	
}

//-------------------------------------------

function xhtmlTituloSector($class,$seccion){
									
		return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/headerSector.tpl",array('CLASS' => $class,'SECCION' => $seccion));					
}

//-------------------------------------------

function arrayToOptions( $array ,$selected = null ){

	$sOptions = "";
	
	foreach($array as $option){		
		
		$select = ($option['sNombre'] = $selected) ? "selected" : "";
		$sOptions .= "<option value='{$option['CODE']}' $select>{$option['TEXT']}</option>";
	}
	
	return $sOptions;
}

function array_2_options( $array, $seleccionado = '' ) {
	$cadena = "";
	
	If( !is_array( $array ) ) return;
	
	// Iteramos sobre el array
	Foreach( $array as $valor => $texto )
	
		// Si es un array el elemento actual, entonces
		// debemos crear un grupo de opciones <optgroup...,
		// y pasamos a la misma funci�n el array para
		// obtener las opciones <options.. del subarray
		
		If( is_array( $texto ) )
			
		$cadena.=	"<optgroup label='$valor'>".
					array_2_options( $texto, $seleccionado ).
					"</optgroup>";
							
			
							
		Else 
		
		$cadena.=	"<option value='$valor' title='$texto'".(($seleccionado == $valor )? "selected='selected'":'')." style='text-align:left;'>$texto</option>";
		
		
	return $cadena;
}
function array_2_javascript_array( $array, $nombre = 'array_nuevo', $numerico = false ) {
	
	$cadena = "var $nombre = new Array();\n";
	
	Foreach( $array as $clave => $valor )  
	
	If( !is_array( $valor ) ) {
		
		If( !$numerico ) $clave = "'$clave'";
		$cadena.= "{$nombre}[$clave] = \"$valor\";\n";
	}
		
	Else Foreach( $valor as $clave_valor => $valor_valor ) {
		
		$clave = "{$clave}[{$clave_valor}]";
		
		If( !$numerico ) $clave = "'$clave'";
		$cadena.= "{$nombre}[$clave] = \"$valor_valor\";\n";
	}
	
	return $cadena;
}
//-------------------------------------------

function buttonNuevo($url,$text){
	return "<div class='botonNuevo'><a href='$url'>$text</a></div><div class='espacio'></div>";
}

function buttonExtras($url,$text,$images){
	$existImages = false;
	
	if(!is_array($url)){
		return "NO-VALIDO";
	}
	
	if(sizeof($images) == sizeof($url)){ $existImages = true;}
	
	$tamUrl = sizeof($url) - 1;
	for( $i=0; $i<=$tamUrl; $i++ ){
		$xhtmlImage = "";
		
		if($existImages) $xhtmlImage = "<img src='".IMAGES_DIR."/$images[$i]' border='0' hspace='4' title='{$text[$i]}'>";
		
		$xhtmlLinks .= $xhtmlImage . "<a href=\"$url[$i]\">[ $text[$i] ]</a> |";
	}
	return "<div style='text-align:right;margin-right:15px;'>$xhtmlLinks</div><div class='espacio'></div>";
}




//-------------------------------------------

function dateToMySql($date){
	if(ereg (  "([0-9]{1,2})/([0-9]{1,2})/([0-9]{2,4})" ,  $date ,  $dateMySql )){
		$Fecha = $dateMySql [ 3 ]. "-" . $dateMySql [ 2 ]. "-" . $dateMySql [ 1 ];  	
	}else{
		$Fecha = "";
	}
	
	
	return $Fecha;
}

//-------------------------------------------

function FormLocalidades($idProvincia){
	global $mysql;		
	
	$array = array();
	
	
	$OptionsProvincias = $mysql->query("CALL usp_getSelect('Provincias','id','sNombre','')");
	
	$array['OptionsProvincias'] = arrayToOptions($OptionsProvincias);
	
	$array['idProvincia'] = (!is_null($idProvincia)) ? $idProvincia : 0 ;	
	
	$array['JAVASCRIPT_ADICIONAL'] = "document.forms['form'].idProvincia.value= '{$array['idProvincia']}';";
	
	return parserTemplate( TEMPLATES_XHTML_DIR . "/formsParts/Localidades.tpl",$array);
}

//-------------------------------------------

function securityAcces($Object = '',$Permit = ''){
	global $oMysql;
	
	$arrayExceptions = array('');
	
	$idUser = $_SESSION['ID_USER'];
	
	if(is_null($idUser) || $idUser == 0){ return 0;}
	#Debo::: determinar controlar el acceso del usuario a un determinado sector	
	
	//$id = $oMysql->consultaSel("SELECT fcn_isPermit(\"$Permit\",\"$Object\",\"$idUser\");",true);
	
	$id = 1;
	
	if($id == 0 && in_array($Object,$arrayExceptions)){ $id = 1; }
	
	return $numRules;
	
}

//-------------------------------------------

function isLogin(){
	if(isset($_SESSION['ID_USER']) && !empty($_SESSION['ID_USER'])){
		return true;		
	}else{
		return false;
	}
}

//-------------------------------------------

function ObtenerNavegador($user_agent) {
     $navegadores = array(
          'Opera' => '/Opera/',
          'Mozilla Firefox'=> '/(Firebird)|(Firefox)/',
          'Galeon' => '/Galeon/',
          'Mozilla'=>'/Gecko/',
          'MyIE'=>'/MyIE/',
          'Lynx' => '/Lynx/',
          'Netscape' => '/(Mozilla/4\.75)|(Netscape6)|(Mozilla/4\.08)|(Mozilla/4\.5)|(Mozilla/4\.6)|(Mozilla/4\.79)/',
          'Konqueror'=>'/Konqueror/',
          'Internet Explorer' => '/MSIE/',
);
	foreach($navegadores as $navegador=>$pattern){
	       if (preg_match($pattern, $user_agent))
	       return $navegador;
	    }
	return 'Desconocido';
}


function getIdPagoEmpresa($idEmpresa,$idTipoPago){
	global $mysql;
	
	$idPagoEmpresa = $mysql->selectvalue("SELECT id FROM PagosEmpresas WHERE idEmpresa = '$idEmpresa' AND idTipoPago = '$idTipoPago'");
	
	return $idPagoEmpresa;
}

function addZero($string){
	if(!is_string($string)) settype($string,"string");
	
	$tamString = strlen($string) - 1;
	$CantCeros = 7;
	$sCadena = "";
	for($i = 0; $i < $CantCeros; $i++){
		$sCadena .= ( isset($string[$i])) ? $string[$i] : "0";
	}
	
	return strrev($sCadena);
}


function checkBoxOpener(){
		global $mysql;		 
		 
		list($idSucursal,$idOficina) = getSucursalyOficina($_SESSION['ID_USER']);	 
		$hoy = date("d/m/Y");
		
		$idCaja = Caja::getCaja($idOficina,$hoy);
		$idUser = $_SESSION['ID_USER'];		
		if($idCaja == 0){
			
			$SQL = "SELECT MAX(id) FROM Cajas WHERE idOficina = '$idOficina' AND sEstadoOficina = 'A' AND sEstadoUsuario = 'A';";
			$idCaja = $mysql->selectValue($SQL);
			//var_export($idOficina);die();
			$mysql->query("CALL usp_AbrirCerrarCajaGeneral(\"$idOficina\",\"$idCaja\",\"$idUser\");");
		}
		
		return true;
		
	}


function subirMostrarXML($form)
{
	//GLOBAL $oMysql;
    $imag=new upload($_FILES['archivo'],'es_ES');
	if ($imag->uploaded)
	{	
			$imag->file_new_name_body='BackupArticulos';
	        $imag->file_new_name_ext='xml';
	        $imag->Process('./Archivos/');
	        if ($imag->processed) 
	        {
	            /*$cadena= "<fieldset>";
	            $cadena.="<legend>Archivo Subido con Exito</legend>";
	            //$cadena.=" <a class='link' href='../call_center/SistemaLocal.php'>Volver</a><br/>";
	            $cadena.="</fieldset>";
	            echo $cadena;    */
	            
	            echo leerXML();
	            
	            
	            
	           
	        } else echo"<p style=\"color:red;\">Error Problemas en la Direccion : ".$imag->error."</p><br><a class='link' href='javascript:history.back(1)'  style='cursor:pointer;'>Volver</a><br/>";  
	        
	        $imag-> Clean();          
		}else 
		{
		  echo "Error Subiendo Archivo";	
		}
}



function leerXML()
{
     
	GLOBAL $oMysql;
	$cade=''; 
    //$fech=substr($fech,0,2).'_'.substr($fech,3,2).'_'.substr($fech,6,4).'.xml';
    $archivo='./Archivos/BackupArticulos.xml';//.$fech;

    
	if (file_exists($archivo)) 
	{
		$cade="<table cellspacing='0' cellpadding='2' border='1' style='width:400px;' >";
	    $cade.="<tr style='background-color:#CCC'><td>Codigo</td><td>Descripcion</td><td>Adicional</td></tr>"; 
	    $encabezado=$cade;
	    $oXml= simplexml_load_file($archivo);
	    
	    $aRegistros=Array();
	    foreach ($oXml->data[0]->row as $aRow) 
	    {
	    	
	    	 $cade.="<tr>
						<td> ".$aRow['COD_ARTICU']." </td>
						<td>".$aRow['DESCRIPCIO']." </td>
						<td>".$aRow['DESC_ADIC']." </td>
				     </tr>"; 
	    	 
	    	 $sCodigo=$oMysql->escaparCadena($aRow['COD_ARTICU']);
	    	 $sDescripcion=$oMysql->escaparCadena($aRow['DESCRIPCIO']);
	    	 $sAdicional=$oMysql->escaparCadena($aRow['DESC_ADIC']);
	    	 
	    	 $aRegistros[]="(\"$sCodigo\",\"$sDescripcion\",\"$sAdicional\")";
	    	 
	    	 
	    	 
		}
		
		$oMysql->startTransaction();
		$sAA=$oMysql->consultaSel("TRUNCATE Articulos;");   
		$sConsulta="INSERT INTO Articulos (sCodigo,sDescripcion,sDescAdicional) VALUES ".implode(',',$aRegistros);
		$res=$oMysql->consultaAff($sConsulta);    
		 
		$oMysql->commit();
		
	    if ($cade==$encabezado) $cade='Se Actualizaron todos los Articulos de esta fecha';
	    else 
	    {
	    	$cade.='</table>';
	    }
	} 
	else $cade='No existen Pagos en esa Fecha';
	
	return $cade;
}


	function subirImagen($aDatos){
	GLOBAL $oMysql;
	
	    $imag=new upload($_FILES['archivo'],'es_ES');
		if ($imag->uploaded)
		{	
			$imag->image_resize= true;
			$imag->image_y= 100;
            $imag->image_x= 100;
	        $imag->Process('./Imags/');
	        if ($imag->processed) 
	        {
	        	$sCadena="
	        	         <center> 
	        	         
	        	         <span class='espacio'></span>
	        	         <br>
	        	         <div style='border:solid 1px #94217A;' >
	        	         <p style='font-family:Tahoma;font-style:italic;font-weight:bold;font-size:10pt; color:#94217A;'>
	        	             La imagen : \"{$imag->file_dst_name}\" se adjunto al Articulo correctamente 	            
	        	          </p>
	        	          </div>
	        	          </center>
	        	          ";
	            echo $sCadena;
	           
	           $oMysql->startTransaction(); 
	           $sConsulta="UPDATE Articulos SET sImagen=\"{$imag->file_dst_name}\" WHERE id={$aDatos['idArticulo']}";
	           $res=$oMysql->consultaAff($sConsulta);   
	           $oMysql->commit();
	        } else echo"<p style=\"color:red;\">Error Problemas en la Direccion : ".$imag->error."</p><br><a class='link' href='../call_center/SistemaLocal.php'>Volver</a><br/>";  
	        
	        $imag-> Clean();          
		}
	
}


function math_promedio($array){
	if(is_array($array))
	{
		$notas=0;
		$contador=0;
		$promedio;
		 foreach($array as $nota)
		  {
		     $notas = $nota + $notas;
		     $contador++;
		  }
		$promedio = $notas/$contador;
		return $promedio;
	} else {
		echo 'El parametro introducido no es un array';
		return false;
     }
}

function xhtmlPanel($aVariables=false){
	
	$sCadena='';
	$sCadena=parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtmlPanel.tpl", $aVariables);
	
	echo $sCadena;	
}
function stringToUpper($array){
		$Up = array();
		
		foreach ($array as $key => $value) {
			
			if(!is_array($value)){
				$Up[$key] = strtoupper($value);	
			}else{
				$Up[$key] =stringToUpper($value);	
			}
			
		}
		
		return $Up;		
	}
	
function FechaYMD($Fecha,$Y=false){
	$aFecha = explode('/', $Fecha );
	
	$aHora=explode(':',$aFecha[2]);
	if($Y){
		
		if($Y=='Y'){
			$sHora=substr($aFecha[2],5);
			$aFecha[2]=substr($aFecha[2],0,4);
		}elseif($Y=='y'){
			$sHora=substr($aFecha[2],3);
			$aFecha[2]=substr($aFecha[2],0,2);
		}
		$Fecha = "{$aFecha[2]}-{$aFecha[1]}-{$aFecha[0]} {$sHora}";
		
	}else $Fecha = "{$aFecha[2]}-{$aFecha[1]}-{$aFecha[0]}";
	return $Fecha;
}

function getIdProducto($sCodigo){
	global $oMysql;
	
	$sCodigo=$oMysql->escaparCadena($sCodigo);
	$sCodigo=trim($sCodigo);
	$sCodigo=strtoupper($sCodigo);
	
	$sConsulta="select id from Productos where upper(sCodigo)='$sCodigo';";
	
	$idProducto=$oMysql->consultaSel($sConsulta,true);
	
	return $idProducto;
}
	function getProducto($sCodigo){
		global $oMysql;
		
		$sCodigo=$oMysql->escaparCadena($sCodigo);
		//$sCodigo=trim($sCodigo);
		//$sCodigo=strtoupper($sCodigo);
		
		$sConsulta="select * from Productos where Productos.id = '$sCodigo';";
		
		$Producto=$oMysql->consultaSel($sConsulta,true);
		
		return $Producto;
	}

	function stringPermitsUser($idUsuario){
		global $oMysql;
		$body = "";
			

		$permits = $oMysql->consultaSel("CALL usp_getPermitUser(\"$idUsuario\");");	
		
		$idItem = "";
			
		foreach ($permits as $permit){

			$idItem .= "idPermitObject_".$permit['ID_PERMIT_OBJECT'].",";

		}
		
		$idItem = substr_replace($idItem,"",-1);
		//var_export($idItem);die();		
		return $idItem;
	}
	
	function getNumeroInternoyPatente($idRodado){
		global $oMysql;
		
		$sRodado = $oMysql->consultaSel("SELECT getNumeroInternoyPatente(\"$idRodado\");",true);
		
		return $sRodado;
	}
	
	
	//-------------------------------------------
	
	function dateFormatMysql($Fecha){
		#$Fecha -> formato dd/mm/YYYY hh:mm:ss
		$array = explode(" ",$Fecha);
		$parts = explode("/",$array[0]);
		
		$Date = $parts[2]."-".$parts[1]."-".$parts[0];
		if($array[1] != "" && $array[1] != "00:00:00") $Date .= " ".$array[1];
		
		return $Date;
	}
	
	function unhtmlspecialchars( $string )
	{
	  $string = str_replace ( '&amp;', '&', $string );
	  $string = str_replace ( '&#039;', '\'', $string );
	  $string = str_replace ( '&quot;', '"', $string );
	  $string = str_replace ( '&lt;', '<', $string );
	  $string = str_replace ( '&gt;', '>', $string );
	  $string = str_replace ( '&uuml;', '?', $string );
	  $string = str_replace ( '&Uuml;', '?', $string );
	  $string = str_replace ( '&auml;', '?', $string );
	  $string = str_replace ( '&Auml;', '?', $string );
	  $string = str_replace ( '&ouml;', '?', $string );
	  $string = str_replace ( '&Ouml;', '?', $string );    
	  return $string;
	}
	
	function imprimirHeader($dFechaCobro1,$dFechaCobro2,$dFechaCobro3){
	$fecha1 = explode("/",$dFechaCobro1);
	$fecha1[2] = substr($fecha1[2],2,2);
	$dFechaCobro1 = $fecha1[0]."/".$fecha1[1]."/".$fecha1[2];

	$fecha2 = explode("/",$dFechaCobro2);
	$fecha2[2] = substr($fecha2[2],2,2);
	$dFechaCobro2 = $fecha2[0]."/".$fecha2[1]."/".$fecha2[2];

	$fecha3 = explode("/",$dFechaCobro3);
	$fecha3[2] = substr($fecha3[2],2,2);
	$dFechaCobro3 = $fecha3[0]."/".$fecha3[1]."/".$fecha3[2];
	
	$htmlHeader = "";
	$signo = "$";
	$htmlHeader .= "<tr>
		<td style='border:1px solid #000000;width:350px;height:18px'> &nbsp;<b>CLIENTES</b> </td>
		<td style='border:1px solid #000000;width:35px;height:18px' align='center'> <b>$</b> </td>
		<td style='border:1px solid #000000;height:18px'> {$dFechaCobro1}</td>
		<td style='border:1px solid #000000;height:18px'> {$dFechaCobro2}</td>
		<td style='border:1px solid #000000;height:18px'> {$dFechaCobro3}</td>
		<td style='border:1px solid #000000;height:18px'> <b>".$signo."Total</b> </td>
		</tr>";	
	return $htmlHeader;
	}


	
	function formatMoney($number, $cents = 1) { // cents: 0=never, 1=if needed, 2=always
	  if (is_numeric($number)) { // a number
	    if (!$number) { // zero
	      $money = ($cents == 2 ? '0.00' : '0'); // output zero
	    } else { // value
	      if (floor($number) == $number) { // whole number
	        $money = number_format($number, ($cents == 2 ? 2 : 0),',', '.'); // format
	      } else { // cents
	        $money = number_format(round($number, 2), ($cents == 0 ? 0 : 2),',', '.'); // format
	      } // integer or decimal
	    } // value
	    //return '$'.$money;
	    return $money;
	  } // numeric
	} // formatMoney
	
	
	/**Cristian**/
	function xhtmlHeaderPaginaSitio($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.header.sitio.tpl",$aVariables);
	}
	
	function xhtmlMainHeaderPaginaSitio($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/mainHeader.sitio.tpl", $aVariables);
	}
	
	function xhtmlMainHeaderInternalSitio($aVariables){
	return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/mainHeader.internal.sitio.tpl", $aVariables);
	}
	
	function xhtmlFootPaginaSitio($aVaribales = array()){	
	if(sizeof($aVaribales) > 0){
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.sitio.tpl", $aVaribales);
	}else{
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.sitio.tpl", false);
	}
	}
	
	function xhtmlFootPaginaInternalSitio($aVaribales = array()){	
	if(sizeof($aVaribales) > 0){
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.internal.sitio.tpl", $aVaribales);
	}else{
		return parserTemplate( TEMPLATES_XHTML_DIR . "/struct/xhtml.foot.internal.sitio.tpl", false);
	}
	}
	
	
	function xhtmlPublicidadPaginaSitio($aVaribales = array()){
		return parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/publicidad.sitio.tpl", $aVariables);
	}
	
	
	
	
	function paginar($registros,$pagina,$aNoticias){
		global $oMysql;		
		$fila_pag = "";
		$aFilas = $oMysql->consultaSel("SELECT * FROM vehiculos WHERE vehiculos.sEstado <> 'B'");	   
		$total_registros = sizeof($aFilas);
		
		$total_paginas = ceil($total_registros / $registros); 	
		//$fila_pag .= $registros.'-'.$pagina.'-'.$total_registros.'-'.$total_paginas.'<br>';
		if($total_registros) {
			
			$fila_pag .="<table border='0' width='100%'><tbody>
					<tr><td bgcolor='#FFF' align='right'>";
			if(($pagina - 1) > 0) {
				$fila_pag .= "<a href='index.php?pagina=".($pagina-1)."' class='linkPag3'>Anterior</a> ";
			}
			if($total_paginas >1){
				for ($i=1; $i<=$total_paginas; $i++){ 
					if ($pagina == $i) {
						$fila_pag .= "<span class='linkPag1'><b>".$pagina."/</b></span>"; 
					} else {
						$fila_pag .= "<span class='linkPag2'><a href='index.php?pagina=$i' class='linkPag2'>$i</a><b>/</b></span>"; 
					}	
				}
			}else{
				$fila_pag .= "&nbsp;";
			}
			if(($pagina + 1)<=$total_paginas) {
			$fila_pag .= " <a href='index.php?pagina=".($pagina+1)."' class='linkPag3'>Siguiente</a>";
			}
			$fila_pag .= "</td></tr></tbody></table></center>";
			
		}
		return $fila_pag;
	}
	
	function otenerMenu($aParametros, $iNivel){
		
		$aParametros["MOSTRAR_MENU_USUARIOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_CONTACTOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_GRUPOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_UNIDADESNEGOCIOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_SMS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_MAIL"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_CONFIGURACION"] = "style='display:none'";
		if(array_key_exists(1,$_SESSION['PERMISOS']))//Usuarios
			$aParametros["MOSTRAR_MENU_USUARIOS"] = "style='display:inline'";
		if(array_key_exists(2,$_SESSION['PERMISOS']))//Contactos
			$aParametros["MOSTRAR_MENU_CONTACTOS"] = "style='display:inline'";
		if(array_key_exists(3,$_SESSION['PERMISOS']))//Grupos
			$aParametros["MOSTRAR_MENU_GRUPOS"] = "style='display:inline'";
		if(array_key_exists(4,$_SESSION['PERMISOS']))//Unidades de Negocios
			$aParametros["MOSTRAR_MENU_UNIDADESNEGOCIOS"] = "style='display:inline'";
		if(array_key_exists(5,$_SESSION['PERMISOS']))//Mensajes SMS
			$aParametros["MOSTRAR_MENU_SMS"] = "style='display:inline'";
		if(array_key_exists(6,$_SESSION['PERMISOS']))//Mensajes Mail		
			$aParametros["MOSTRAR_MENU_MAIL"] = "style='display:inline'";
		if(array_key_exists(7,$_SESSION['PERMISOS']))//Mensajes Mail		
			$aParametros["MOSTRAR_MENU_CONFIGURACION"] = "style='display:inline'";
		if($iNivel == 0)	
			$sMenu = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenu.tpl", $aParametros);
		else
			$sMenu = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenuInternal.tpl", $aParametros);
		
		return $sMenu;
	}

	function otenerOpcionesMenu($aParametros){
		
		$aParametros["MOSTRAR_MENU_USUARIOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_CONTACTOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_GRUPOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_UNIDADESNEGOCIOS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_SMS"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_MAIL"] = "style='display:none'";
		$aParametros["MOSTRAR_MENU_CONFIGURACION"] = "style='display:none'";

		if(array_key_exists(1,$_SESSION['PERMISOS']))//Usuarios
			$aParametros["MOSTRAR_MENU_USUARIOS"] = "style='display:inline'";
		if(array_key_exists(2,$_SESSION['PERMISOS']))//Contactos
			$aParametros["MOSTRAR_MENU_CONTACTOS"] = "style='display:inline'";
		if(array_key_exists(3,$_SESSION['PERMISOS']))//Grupos
			$aParametros["MOSTRAR_MENU_GRUPOS"] = "style='display:inline'";
		if(array_key_exists(4,$_SESSION['PERMISOS']))//Unidades de Negocios
			$aParametros["MOSTRAR_MENU_UNIDADESNEGOCIOS"] = "style='display:inline'";
		if(array_key_exists(5,$_SESSION['PERMISOS']))//Mensajes SMS
			$aParametros["MOSTRAR_MENU_SMS"] = "style='display:inline'";
		if(array_key_exists(6,$_SESSION['PERMISOS']))//Mensajes Mail		
			$aParametros["MOSTRAR_MENU_MAIL"] = "style='display:inline'";
		if(array_key_exists(7,$_SESSION['PERMISOS']))//Mensajes Mail		
			$aParametros["MOSTRAR_MENU_CONFIGURACION"] = "style='display:inline'";
		
		return $aParametros;
	}
	
?>