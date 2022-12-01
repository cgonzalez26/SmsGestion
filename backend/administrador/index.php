<?php //------------------------------------------------------------------
define( 'BASE' , dirname( __FILE__ ) . '/../..');
include_once(  BASE . '/_global.php' );

if(!isLogin()){go_url("/index.php");}

$mysql = new MySQL();

$aParametros = array();
$aParametros = getParametrosBasicos(1);

echo xhtmlHeaderPagina($aParametros);

$aParametros['LOGIN'] = $_SESSION['LOGIN'];
//$headerBox = parserTemplate( TEMPLATES_XHTML_DIR . "/blocks/userMenu.tpl", $aVariables);
$headerBox = otenerMenu($aParametros, 0);
$aMenu = otenerOpcionesMenu($aParametros);
$sDiv = '
	<div id="border-top" class="h_green" style="text-align:left">
		<div >
			<div >
				<span class="title" style="text-align:left">SMSGestion</span>
			</div>
		</div>
	</div>
	'.$headerBox.'
	<div id="content-box">	
		<div id="divBody">
		<div id="cpanel" style="padding:10px">
			<table cellpadding="0" cellspacing="0" class="adminform">
			<tr>
				<td>
				<div style="float: left;" >
					<div class="icon" '.$aMenu['MOSTRAR_MENU_USUARIOS'].'>
						<a href="../Usuarios/Usuarios.php">
							<img alt="Administrar Usuarios" src="../includes/images/internas/icon-48-user.png"><span>Administrar Usuarios del Sistema</span></a>
					</div>
				</div>	
				<div style="float: left;" >
					<div class="icon" '.$aMenu['MOSTRAR_MENU_CONTACTOS'].'>
						<a href="../Contactos/Contactos.php">
							<img alt="Administrar Contactos" src="../includes/images/internas/icon-48-contact.png" height="48" width="48"><span>Administrar Contactos</span></a>
					</div>
				</div>
				<div style="float: left;" >
					<div class="icon" '.$aMenu['MOSTRAR_MENU_GRUPOS'].'>
						<a href="../Grupos/Grupos.php">
							<img alt="Administrar Grupos" src="../includes/images/internas/icon-48-grupo.png"><span>Administrar Grupos</span></a>
					</div>		
				</div>
				<div style="float: left;" >
					<div class="icon" '.$aMenu['MOSTRAR_MENU_UNIDADESNEGOCIOS'].'>
						<a href="../Grupos/Grupos.php">
							<img alt="Administrar Grupos" src="../includes/images/internas/icon-48-grupo.png"><span>Administrar Unidades de Negocio</span></a>
					</div>		
				</div>
				</td>
			</tr>
			<tr>
				<td >
				<div '.$aMenu['MOSTRAR_MENU_SMS'].'>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mensajes/MensajesRapidos.php">
								<img alt="SMS Rapidos" src="../includes/images/internas/icon-48-smsFast.png"><span>SMS Rapidos</span></a>
						</div>		
					</div>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mensajes/MensajesMultiples.php">
								<img alt="SMS Masivos" src="../includes/images/internas/icon-48-smsAccounts.png"><span>SMS Masivos</span></a>
						</div>		
					</div>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mensajes/MensajesEnviados.php">
								<img alt="SMS Enviados" src="../includes/images/internas/icon-48-smsSend.png"><span>SMS Enviados</span></a>
						</div>		
					</div>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mensajes/MensajesRecibidos.php">
								<img alt="SMS Recibidos" src="../includes/images/internas/icon-48-smsReceived.png"><span>SMS Recibidos</span></a>
						</div>		
					</div>
				</div>
				</td>
			</tr>
			<tr>
				<td>
				<div '.$aMenu['MOSTRAR_MENU_MAIL'].'>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mailer/MailsRapidos.php">
								<img alt="E-mail Rapidos" src="../includes/images/internas/icon-48-smsFast.png"><span>E-mail Rapidos</span></a>
						</div>		
					</div>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mailer/MailsMasivos.php">
								<img alt="E-mail Masivos" src="../includes/images/internas/icon-48-massemail.png"><span>E-mail Masivos</span></a>
						</div>		
					</div>
					<div style="float: left;">
						<div class="icon">
							<a href="../Mailer/MailsMasivos.php">
								<img alt="E-mail Masivos" src="../includes/images/internas/icon-48-massemail.png"><span>Campa&ntilde;a</span></a>
						</div>		
					</div>
				</div>
				</td>
			</tr>
			</table>
		</div>
		<div style="height:250px">&nbsp;</div>	
		</div>
	</div>
		
	<div id="border-bottom"><div><div></div></div>
</div>
<div id="footer">
	<p class="copyright">
		Copyright &copy; 2022</p>
</div>';


echo $sDiv;

echo xhtmlFootPaginaSitio($aParametros);

?>