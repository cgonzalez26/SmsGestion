<?php //---------------------------------
include_once( dirname(__FILE__) . '/constants.inc.php' );
include_once( FUNCTIONS_DIR . '/xajax.php' );
include_once( FUNCTIONS_DIR . '/template.php' );
//@include_once( FUNCTIONS_DIR . '/user.php' );
include_once( FUNCTIONS_DIR . '/navigation.php' );
include_once( FUNCTIONS_DIR . '/filtros.php' );
include_once( FUNCTIONS_DIR . '/deletes.php' );
include_once( FUNCTIONS_DIR . '/funcsms.php' );


include_once( GLOBAL_FUNCTIONS_DIR . '/main.funciones.inc.php' );

//include_once( CLASSES_DIR . '/ListObject.class.php' );
//include_once( CLASSES_DIR . '/Menu.class.php' );
include_once( CLASSES_DIR . '/Usuarios.class.php' );
//include_once( CLASSES_DIR . '/Office.class.php' );
//include_once( CLASSES_DIR . '/Message.class.php' );
include_once( CLASSES_DIR . '/MySQL.class.php' );

include_once( CLASSES_DIR . '/mysqli.clase.php' );

//include_once( CLASSES_DIR . '/class.upload.php' );
//include_once( CLASSES_DIR . '/excel.php' );
//include_once( CLASSES_DIR . '/Botonera/ToolBar.clase.php' );
//include_once( CLASSES_DIR . '/ExcelWriter.clase.php' );
//include_once( CLASSES_DIR . '/email.clase.php' );
include_once( CLASSES_DIR . '/class.sms.php' );
//include_once( CLASSES_DIR . '/phpmailer/class.smtp.php' );
include_once( CLASSES_DIR . '/phpmailer/class.phpmailer.php' );

include_once( XAJAX_DIR . '/xajax_core/xajax.inc.php' );


function mathDivision( $num1, $num2 ) { return $num1 / $num2; }

function mathModule( $num1, $num2 ) { return $num1 % $num2; }

function mathParity( $num ) { return $num % 2 == 0 ? 'PAR' : 'IMPAR'; }


session_start(); #Inicializo Sesion

$mysql = new MySql();
$oMysql=new mysql2();

$arrayTypeUser= array('Administrador','Supervisor','Cobrador','Cajero');

setlocale (LC_TIME, "es_ES.utf-8"); 

//---------------------------------- ?>
