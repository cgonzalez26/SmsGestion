<?php //----------------------------------------------

define('COLOR_HEX_BLANCO', 'FFFFFF');
define('COLOR_HEX_NEGRO', '000000');
define('COLOR_HEX_AZUL', '0000FF');
define('COLOR_HEX_VERDE', '008000');
define('COLOR_HEX_ROJO', 'FF0000');
define('COLOR_HEX_AMARILLO', 'FFFF00');
define('COLOR_HEX_AZUL_OSCURO', '000080');
define('COLOR_HEX_VERDE_CLARO', '00FF00');
define('COLOR_HEX_ROJO_CLARO', 'FF8080');
define('COLOR_HEX_NARANJA', 'FF8040');
define('COLOR_HEX_MORADO', '0080C0');
define('COLOR_HEX_GRIS', 'C0C0C0');
define('COLOR_HEX_CELESTE', '00FFFF');
define('COLOR_HEX_GRIS_OSCURO', '808080');
define('COLOR_HEX_MORADO_OSCURO', '2A5A8A');
define('COLOR_HEX_FUCCIA', 'FF00FF'); 


//----------------------------------------
@define('BASE_URL', 'http://' . $_SERVER['SERVER_NAME'] . ':8080/SmsGestion' );

define('BACKEND_DIR', dirname( __FILE__ ) . '/backend');


define('INCLUDES_DIR', BACKEND_DIR . '/includes');

define('TEMPLATES_DIR', INCLUDES_DIR . '/templates');
define('CSS_DIR', INCLUDES_DIR . '/css');
define('JS_DIR', INCLUDES_DIR . '/js');
define('CLASSES_DIR', INCLUDES_DIR . '/clases');
define('FUNCTIONS_DIR', INCLUDES_DIR . '/functions');
define('XAJAX_DIR', INCLUDES_DIR . '/xajax');


define('GLOBAL_FUNCTIONS_DIR', INCLUDES_DIR . '/globalFunctions');

define('IMAGES_DIR', BASE_URL . '/backend/includes/images');

define('TEMPLATES_XHTML_DIR', TEMPLATES_DIR . '/xhtml');
//--------------------------------------------------


define('SESSION_USER_NAME', 'USUARIO_SESION');
define('SESSION_USER_TIPO', 'USUARIO_TIPO');

define('USER_HOME_URL', BASE_URL);
define('LOGIN_URL', 'login');

//--------------------------------------------------

define('USER_NICK_FILTER', '^([a-zA-Z0-9_\.\-]){4,20}$');
define('USER_PASS_FILTER', '^([a-zA-Z0-9]){4,15}$');

//--------------------------------------------------

define('PAGGING_NUM', 20);
define('NUMBER_SECRET', 20091982);


define('ACCEDER', 1);
define('AGREGAR', 2);
define('MODIFICAR', 3);
define('ELIMINAR', 4);


define('dhx_template', 'dhx_black');



//---------------------------------------------- ?>
