<?php
session_start();
$_SESSION["autentificado"]="SI";

require ('/var/www/htmlx/sms/class.template.php');
include ('/var/www/htmlx/sms/funciones.php');
include ('/var/www/htmlx/sms/usuarios.conf.php');
require ('/var/www/htmlx/sms/class.sms.php');
include ('/var/www/htmlx/sms/funcsms.php');

include ('/var/www/htmlx/sms/seguridad.php');

$paramst=param_script_actual($nusuarios_menu);
valida_usuario($paramst[0]["usuariosn"]);
$mmenu=recup_menu($nusuarios_menu,$_SESSION["tipousuario"],0,0);
$mmenu2=recup_menu($nusuarios_menu,$_SESSION["tipousuario"],$paramst[0]["nivel"],$paramst[0]["id"]);
if(count($mmenu2)<1)
 $mmenu2=recup_menu($nusuarios_menu,$_SESSION["tipousuario"],$paramst[0]["nivel"]-1,$paramst[0]["depende"]);

$template = new Template("./templates", "[", "]");

ini_set("max_execution_time","120");
set_time_limit(0);

include ('/var/www/htmlx/sms/config.php'); 
$conn = mysql_connect($mhost,$musuario,$mpass);
$bd=mysql_select_db($bd);$rescb=mysql_query("use ".$bd,$conn); 
if (!$conn){echo"No se pudo establecer conexion con la base"; exit();}


//if(strlen($_SERVER['QUERY_STRING'])<1){

//simulada 
//$sms = new SMS("localhost",null,null,"/sistemas3/sms/home/mensajes/sms(9).message");  //simulada
//  "/sistemas/sms/home/sms.message"   "/sistemas/sms/home/mensajes/sms(6).message"  "/sistemas/sms/home/mensajes/sms(8).message"  "/sistemas3/sms/home/mensajes/sms(5).message"
//$res=$sms->recuperar_sms(8080);
//$res=$sms->recuperar_sms();

//real
$sms = new SMS();
$resp=$sms->recibir_sms();
$res=$sms->recuperar_sms();

foreach($res as $indic => $valor){
 $umsj=array();
 $umsj=parsea_mensaje($valor);	
 //print_r($umsj);
 /*echo "<br>"."-------------------------------------------"."<br>";
 echo "numero: ".$umsj["numero"];
 echo "<br>";
 echo "fecha: ".$umsj["fechao"]." -- ".$umsj["fechap"];
 echo "<br>";
 echo "mensaje: ".$umsj["mensaje"];
 echo "<br>";
 echo "id gen: ".$umsj["idgen"];
 echo "<br>"."-------------------------------------------"."<br>";*/
 if(!empty($umsj["numero"])){
 $sqlc="SELECT * FROM mensaje WHERE idunic='".$umsj["idgen"]."' AND tipo=2;";
 $resc=@mysql_query($sqlc,$conn);
 if(!($rowc=@mysql_fetch_array($resc))){
  
  /*comprobacion estructura mensaje*/ /*seguir programando este rutina*/
  /*$mensjtemp="";
  if((substr($umsj["mensaje"],0,2)=="00")&&(substr($umsj["mensaje"],4,2)=="00")){
  	$longcadena=round(strlen($umsj["mensaje"])/4);
    for($ilen=1;$ilen<=$longcadena;$ilen++){
  		$mensjtemp.=hexToStr(substr($umsj["mensaje"],($ilen-1)*4+2,2));
    }
    $umsj["mensaje"]=$mensjtemp;
  }*/
  /*fin comprobacion estructura mensaje*/
  
  $sqlr="INSERT INTO mensaje (remitente,mensaje,tipo,otime,idunic,estado) VALUES ("
  		      ."'".$umsj["numero"]."',"
  		      ."'".$umsj["mensaje"]."',"
  		      ."2".","
  		      .$umsj["fechau"].","
  		      ."'".$umsj["idgen"]."',"
  		      ."3"
  		      .");";
  $resr=@mysql_query($sqlr,$conn);
 } 
 //print($sqlr."<br>");
 }
}
//}

$template->assign("mensaje", "");

$template->assign("titulo", "Sistema de Env&iacute;o y Recepci&oacute;n de Sms");
$template->assign("menu", menu_format($mmenu,$paramst[0]["script"]));
$template->assign("menu2", menu_format($mmenu2,$paramst[0]["script"]));
$template->assign("contenido", "<br><span style=\"color:#11AE00;font-weight:bold;\">Se han recuperado satisfactoriamente los mensajes.</span>");
                                
$template->assign("pie","Salta - 2010");
$template->display("marco.html");

?>