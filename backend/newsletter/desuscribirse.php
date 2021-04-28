<?php
define( 'BASE' , dirname( __FILE__ ) . '/../..');
include_once(  BASE . '/_global.php' );

$mnensaje = "";
if($_POST['desuscribir']){
	global $oMysql;
	$oMysql->startTransaction();
	$oMysql->consultaAff("UPDATE contactos SET contactos.sEstado='B' WHERE contactos.id={$_POST['id_contacto']}");
	$oMysql->commit();	
	$mnensaje = "<h3>Desuscribirse del newsletter</h3>
	<p>Ud. se ha desuscripto de nuesro newsletter correctamente. Saludos.</p>";
}else{
	$mnensaje = "<h3>Desuscribirse del newsletter</h3> 
		    <p>Estimado suscriptor: esperamos no haberle ocasionado molestias y lo invitamos a volver cuando desee.</p>
		    <input type='submit' value='Solicitar desuscripción' id='cmd_Desuscribir' name='cmd_Desuscribir' />";
}
?>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>Griva Soluciones Informaticas</title>
	<meta content="text/html; charset='iso-8859-1'" http-equiv="Content-Type">
	<link type="image/png" href="../backend/includes/images/icono.png" rel="shortcut icon" sizes="32x32">
	<link id="bones-base-css" media="all" type="text/css" href="http://www.grivacomputacion.com.ar/wp-content/themes/bones/library/css/base.css?ver=3.4.1" rel="stylesheet"/>	
	<link id="bones-stylesheet-css" media="all" type="text/css" href="http://www.grivacomputacion.com.ar/wp-content/themes/bones/library/css/layout.css?ver=3.4.1" rel="stylesheet"/>
<style>
.caja {
    width: 414px;
}

tr:hover td{
    background: url("../SmsGestion/backend/includes/images/pnt_caja_fondo.gif") repeat-y scroll 0 0 transparent;
    color:#444444;
}
.contenido {
    margin: 0 30px;
    text-align: center;
}
.caja_centro {
    background: url("../SmsGestion/backend/includes/images/pnt_caja_fondo.gif") repeat-y scroll 0 0 transparent;
    padding: 20px 30px;
    text-align: left;
    white-space: normal;
    width: 354px;
}
td{background:transparent}
td,table,tr hover{background:transparent}

</style>
</head>
<body>
<div id="header">
    
<div class="container">    
    							
    
    <div class="sixteen columns alpha " style="display: block;" id="menu">
    
    <div class="three columns alpha" id="logo">    
        <a href="http://www.grivacomputacion.com.ar"><img src="http://www.grivacomputacion.com.ar/wp-content/themes/bones/library/images/logo.png" alt=""></a>    
    </div>
		<ul class="navtop twelve  columns omega">
           <li><a href="http://www.grivacomputacion.com.ar#quienessomos">Quienes Somos</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #novedades">Novedades</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #contacto">Contacto</a></li> 
		   <li>
		   <ul style="display:none;" class="login">
		   <li><a href="http://www.grivacomputacion.com.ar/ #registrarse">Registrarse</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #entrar">Entrar</a></li> 
		   </ul>
		   </li>
        </ul>
        <!--END UL-->

        <ul class="navbottom twelve  columns omega">
           <li><a href="http://www.grivacomputacion.com.ar/ #productos">Productos</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #sistemas">Sistemas</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #comunicaciones">Comunicaciones</a></li> 
		   <li><a href="http://www.grivacomputacion.com.ar/ #serviciotecnico">Servicio Técnico</a></li> 
      
        </ul><!--END UL-->
    </div><!--END MENU-->
</div>
</div>

<div id="content">

	<!--<div class="wrap clearfix" id="inner-content">

		<div role="main" class="eightcol first clearfix" id="main">-->

			<form id="form" name="form" method="POST" action="desuscribirse.php">
			<input type="hidden" id="desuscribir" name="desuscribir" value="1" />
			<input type="hidden" id="id_contacto" name="id_contacto" value="<?php echo $_GET['id']?>" />
			<div style="height:100px">&nbsp;</div>
			<div class="contenido">
				<center>
					 <table width="414" class="caja" cellpadding="0" cellspacing="0">
					  <tbody>
					  <!--<tr>
					       <td width="414" height="6"><img src="../SmsGestion/backend/includes/images/pnt_caja_tope.gif"></td>
					  </tr>-->
					  <tr>
					       <td class="caja_centro">
					        <?php echo $mnensaje; ?>
					        </td>
					  </tr>
					  <!--<tr>
					       <td width="414" height="6"><img src="../SmsGestion/backend/includes/images/pnt_caja_pie.gif"></td>
					  </tr>-->
					</tbody>
					</table>
				</center>
			</div>
				
			</form>

		</div> <!-- end #main -->

	</div> <!-- end #inner-content -->

</div>
			


<div id="footer">
		<!--<a href="#home" id="back_to_top">-->
		</a><a href="http://www.grivacomputacion.com.ar" class="loguito">top</a>
</div>
</body>
</html>