<?php
include_once('../SmsGestion/_global.php');
$mnensaje = "";
if($_POST['desuscribir']){
	global $oMysql;
	$oMysql->consultaAff("UPDATE contactos SET sEstado='B' WHERE id={$_POST['id_contacto']}");
	$mnensaje = "<h3>Desuscribirse del newsletter</h3>
	<p>Su email ha sido eliminado de nuestra base de datos. Saludos.</p>";
}else{
	$mnensaje = "<h3>Desuscribirse del newsletter</h3> 
		    <p>Estimado suscriptor: esperamos no haberle ocasionado molestias y lo invitamos a volver cuando desee.</p>
		    <input type='submit' value='Solicitar desuscripción' id='cmd_Desuscribir' name='cmd_Desuscribir' />";
}
?>
<html>
<head>
	<title>Griva Soluciones Informaticas</title>
	<link type="image/png" href="../backend/includes/images/icono.png" rel="shortcut icon" sizes="32x32">

<style>
.caja {
    width: 414px;
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

</style>
</head>
<body>
<form id="form" name="form" method="POST" action="desuscribirse.php" />
<input type="hidden" id="desuscribir" name="desuscribir" value="1">
<input type="hidden" id="id_contacto" name="id_contacto" value="<? echo $_GET['id']?>">
<div style="height:100px">&nbsp;</div>
<div class="contenido">
	<center>
		 <table width="414" class="caja" cellpadding="0" cellspacing="0">
		  <tbody>
		  <tr>
		       <td width="414" height="6"><img src="../SmsGestion/backend/includes/images/pnt_caja_tope.gif"></td>
		  </tr>
		  <tr>
		       <td class="caja_centro">
		        <?php echo $mnensaje; ?>
		        </td>
		  </tr>
		  <tr>
		       <td width="414" height="6"><img src="../SmsGestion/backend/includes/images/pnt_caja_pie.gif"></td>
		  </tr>
		</tbody>
		</table>
	</center>
</div>
	
</form>
</body>
</html>