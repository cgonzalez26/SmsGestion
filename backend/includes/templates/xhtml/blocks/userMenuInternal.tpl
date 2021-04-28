<div id='header-box'>
	<div id="module-menu" style="width:60%">
		<ul id="menu">
			<li class="node"><a href="../administrador/index.php">Inicio</a></li>
			<li class="node" {MOSTRAR_MENU_USUARIOS}><a href="../Usuarios/Usuarios.php">Usuarios</a></li>
			<!--<li class="node"><a href="../Configuracion/Configuracion.php">Configuracion</a></li>-->
			<li class="node" {MOSTRAR_MENU_CONTACTOS}><a href="../Contactos/Contactos.php">Contactos</a></li>
			<li class="node" {MOSTRAR_MENU_GRUPOS}><a href="../Grupos/Grupos.php">Grupos</a></li>
			<li class="node" {MOSTRAR_MENU_UNIDADESNEGOCIOS}><a href="../UnidadesNegocios/UnidadesNegocios.php">Unidades de Negocios</a></li>
			<li class="node" {MOSTRAR_MENU_SMS}>
				<a>Mensajes SMS</a>
				<ul style="width:140px;">
					<li style="width:140px;"><a href="../Mensajes/MensajesRapidos.php" class="icon-16-smsFast">Mensajes rapidos</a></li>				
					<li style="width:140px;"><a href="../Mensajes/MensajesMultiples.php" class="icon-16-smsAccounts">Mensajes Masivos</a></li>	
					<li style="width:140px;"><a href="../Mensajes/MensajesEnviados.php" class="icon-16-smsSend">Mensajes Enviados</a></li>
					<li style="width:140px;"><a href="../Mensajes/MensajesRecibidos.php" class="icon-16-smsReceived">Mensajes Recibidos</a></li>					
					<li style="width:140px;"><a href="../Mensajes/Sorteos.php" class="icon-16-smsReceived">Sorteos</a></li>					
				</ul>
			</li>
			<li class="node" {MOSTRAR_MENU_MAIL}>
				<a>E-Mail</a>
				<ul style="width:140px;">
					<li style="width:140px;"><a href="../Mailer/Mails.php" class="icon-16-smsFast">Listado de Mails</a></li>	
					<li style="width:140px;"><a href="../Mailer/MailsRapidos.php" class="icon-16-smsFast">Mensajes rapidos</a></li>				
					<li style="width:140px;"><a href="../Mailer/MailsMasivos.php" class="icon-16-massemail">Mensajes Masivos</a></li>	
					<li style="width:140px;"><a href="../Mailer/MailsCampanias.php" class="icon-16-massemail">Campa&ntilde;as</a></li>	
				</ul>
			</li>
			<li class="node" {MOSTRAR_MENU_CONFIGURACION}>
				<a>Configuracion</a>
				<ul style="width:140px;">
					<li style="width:140px;"><a href="../Configuraciones/ConfigModem.php" class="icon-16-configModem">Configuracion Modem</a></li>
					<li style="width:140px;"><a href="../Configuraciones/ConfigSistema.php" class="icon-16-configSystem">Configuracion Sistema</a></li>				
				</ul>
			</li>
		</ul>	
	</div>	
	<div id="module-status" >	
		<span class="loggedin-users">Usuario: <b>{LOGIN}</b></span><span class="logout" style="width:40px"><a href="../../logout.php" class="linkLogout">Salir</a></span>
	</div>
</div>
<script>
try {
  document.execCommand('BackgroundImageCache', false, true);
} catch(e) {}

document.menu = null
window.addEvent('load', function(){
	element = $('menu')
	if(!element.hasClass('disabled')) {
		var menu = new JMenu(element)
		document.menu = menu
	}
});
</script>