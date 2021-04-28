<?php
ob_start();
ob_implicit_flush(true);

require 'class.sms.php';

ini_set("max_execution_time","120");
set_time_limit(0);

$sms = new SMS();
//$res=$sms->envio_sms("3874084625","ESTE ES UN MENSAJE DE PRUEBA");
//$res=$sms->envio_sms(array("3874084625","3875799593"),"ESTE ES UN MENSAJE DE PRUEBA");
//$res=$sms->envio_sms(array("3874084625","3875799593"),array("ESTE ES UN MENSAJE DE PRUEBA PARA JUAN JOSE","ESTE ES UN MENSAJE DE PRUEBA PARA MERCEDES"));
$mensajes=array("mensaje 1","mensaje 2","mensaje 3","mensaje 4","mensaje 5","mensaje 6","mensaje 7","mensaje 8","mensaje 9","mensaje 10");
//$res=$sms->envio_sms("3874084625",array("ESTE ES UN MENSAJE DE PRUEBA 1 PARA JUAN JOSE","ESTE ES UN MENSAJE DE PRUEBA 2 PARA JUAN JOSE"));

print(date("d/m/Y - H:i:s",time())."<br>");
$res=$sms->envio_sms("3874084625",$mensajes);
print($res);
print("<br>".date("d/m/Y - H:i:s",time()));

ob_end_flush();
ob_implicit_flush(false);

?>