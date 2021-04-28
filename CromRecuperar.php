#!/usr/bin/php
<?php
//include_once('_global.php');

/*require ('/var/www/htmlx/sms/class.template.php');
include ('/var/www/htmlx/sms/funciones.php');
include ('/var/www/htmlx/sms/usuarios.conf.php');
require ('/var/www/htmlx/sms/class.sms.php');
include ('/var/www/htmlx/sms/funcsms.php');
include ('/var/www/htmlx/sms/seguridad.php');*/

include('/var/www/htmlx/SmsGestion/backend/includes/functions/template.php' );
include('/var/www/htmlx/SmsGestion/backend/includes/functions/navigation.php' );
include('/var/www/htmlx/SmsGestion/backend/includes/functions/filtros.php' );
include('/var/www/htmlx/SmsGestion/backend/includes/functions/deletes.php' );
include ('/var/www/htmlx/SmsGestion/backend/includes/functions/funcsms.php');

include ('/var/www/htmlx/SmsGestion/backend/includes/clases/mysqli.clase.php' );
$oMysql=new mysql2();
include ('/var/www/htmlx/SmsGestion/backend/includes/clases/class.sms.php');

ini_set("max_execution_time","120");
set_time_limit(0);

$sms = new SMS();
$resp=$sms->recibir_sms();
$res=$sms->recuperar_sms();

foreach($res as $indic => $valor){
 	$umsj=array();
 	$umsj=parsea_mensaje($valor);	
 	
 	if(!empty($umsj["numero"])){
 	
	 	 $sqlc="SELECT * FROM mensajes WHERE sCodigoUnico='".$umsj["idgen"]."' AND idTipoMensaje=2;";
	 	 $aMensaje = $oMysql->consultaSel($sqlc,true);
	 	
		 //if(!($rowc=@mysql_fetch_array($resc))){
	 	 if(!$aMensaje){
	 	 	
			$umsj["mensaje"] = convertir_especiales_html($umsj["mensaje"]);
			
			$sMovil = substr($umsj["numero"],3,strlen($umsj["numero"]));//eliminamos el +54
			$sPrefijo = "0".substr($sMovil,0,3); //obtenemos el prefijo
			$sNumero = "15".substr($sMovil,3,strlen($sMovil)); //obtenesmo el numeros
			$sMovil = $sPrefijo.$sNumero;
			
	  		$idContacto = $oMysql->consultaSel("SELECT id FROM contactos WHERE sMovil ='{$sMovil}'",true); //buscamos el Numero Movil en la BD para ver si es contacto
	  		//echo "SELECT id FROM contactos WHERE sMovil ='{$sMovil}'";
	  		if(!$idContacto) $idContacto = 0;
	  		
	  		if($umsj["numero"]!="813" && $umsj["numero"] !="810" && $umsj["numero"] !="7766"){	  			
		  		$sqlr = "INSERT INTO mensajes(idContacto,idTipoMensaje,idUsuario,idEstadoMensaje,sCodigoUnico,sRemitente,sDestinatario,sMensaje,dFechaRegistro,sObservacion) VALUES (
		  			'{$idContacto}'
		  			,2
		  			,1
		  			,5
		  			,'{$umsj["idgen"]}'
		  			,'{$umsj["numero"]}'
		  			,''
		  			,'{$umsj["mensaje"]}'
		  			,NOW()
		  			,''
		  			);";
		  		//echo $sqlr;
		  		$oMysql->startTransaction();
		  		$oMysql->consultaAff($sqlr);
		  		$oMysql->commit();
	  		}
	 	 } 
   	}
}

echo "Se han recuperado satisfactoriamente los mensajes.";
?>