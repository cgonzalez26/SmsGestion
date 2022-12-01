<?//------------------------------------------------------------------
include_once('_global.php');

//$mysql = new MySQL();

$aParametrosBasicos = getParametrosBasicos(0);
$display_error = "style='display:none'";

if($_POST['Confirmar']) {
	//echo $_POST['Nick'].'---'.$_POST['Pass'];
	if(!ereg(USER_NICK_FILTER, $_POST['Nick'])) $errores['Nick'] = 'El Nombre de Usuario no es v&aacute;lido';
	else if(!ereg(USER_PASS_FILTER, $_POST['Pass'])) $errores['Pass'] = 'La contrase&ntilde;a no es v&aacute;lida';
	else {		

		$mysql = new MySQL();

	
		$nick = $mysql->escapeString( $_POST['Nick'] );
		$pass = md5( $mysql->escapeString( $_POST['Pass'] ) );
	
		$datos = $mysql->selectRow("SELECT id,sPassword,sEstado,sNombre FROM usuarios WHERE sLogin = '$nick'");				
		
		if(!$datos) $errores['Nick'] = 'La Cuenta no existe';
		else if( $datos['sPassword'] != $pass ) $errores['Pass'] = 'La contrase&ntilde;a es incorrecta';
			
			else if($datos['sEstado'] != 'AUTORIZADO') $errores['Nick'] = 'Su Cuenta tiene conflicto. Contacte con el administrador';	
		
			else{
				//var_export($errores);
							
				unset($_POST);
				session_start();				
				$_SESSION['ID_USER'] = $datos['id'];
				$_SESSION['LOGIN'] = $nick;
				//checkBoxOpener();
				go_url( '/backend/administrador/' );
			}
		
	}
	
}

if(!empty($errores)){
	foreach ($errores as $error){
		$sErrores = $error;
	}
	$display_error = "style='display:block'";
}

$aParametrosBasicos['ERRORES'] = $sErrores;

echo xhtmlHeaderPagina($aParametrosBasicos);
$sDiv = '
<div id="border-top" class="h_green" style="text-align:left">
		<div >
			<div >
				<span class="title" style="text-align:left">SMSGestion</span>
			</div>
		</div>
	</div>
	<div id="content-box">
		<div class="padding">
			<div id="element-box" class="login">
				<div class="t">
					<div class="t">
						<div class="t"></div>
					</div>
				</div>
				<div class="m">

					<h1>Administraci&oacute;n Login</h1>
			<dl id="system-message" '.$display_error.'>			
			<dd class="error message fade">
				<ul>
					<li style="text-align:left">'.$sErrores.'</li>
				</ul>
			</dd>
			</dl>		
		<div id="section-box">
			<div class="t">
				<div class="t">
					<div class="t">
						
					</div>
		 		</div>
	 		</div>
			<div class="m">
	<form action="index.php" method="post" name="login" id="form-login" style="clear: both;">
	<input type="hidden" name="Confirmar" value="1" />
	<p id="form-login-username">
		<label for="modlgn_username">Usuario</label>
		<input name="Nick" id="Nick" class="inputbox" size="15" type="text">
	</p>

	<p id="form-login-password">
		<label for="modlgn_passwd">Password</label>
		<input name="Pass" id="Pass" class="inputbox" size="15" type="password">
	</p>
		<p id="form-login-lang" style="clear: both;">
		</p>
	<div class="button_holder">
	<div class="button1">
		<div class="next">
			<a onclick="login.submit();">
				Login</a>

		</div>
	</div>
	</div>
	<div class="clr"></div>
	<input style="border: 0pt none; padding: 0pt; margin: 0pt; width: 0px; height: 0px;" value="Login" type="submit">
	<input name="option" value="com_login" type="hidden">
	<input name="task" value="login" type="hidden">
	<input name="5831de38747b213b64e30178c197cfa3" value="1" type="hidden"></form>
				<div class="clr"></div>
			</div>
			<div class="b">
				<div class="b">
		 			<div class="b"></div>
				</div>
			</div>
		</div>
		
					<p>Utilice un nombre de Usuario y Contrase&ntilde;a v&aacute;lidos para acceder al Administrador .</p>					
					<div id="lock"></div>
					<div class="clr"></div>
				</div>
				<div class="b">
					<div class="b">
						<div class="b"></div>
					</div>
				</div>
			</div>
			<noscript>
				Warning! JavaScript must be enabled for proper operation of the Administrator back-end.			</noscript>
			<div class="clr"></div>
		</div>
	</div>
	<div id="border-bottom"><div><div></div></div>
</div>
<div id="footer">
	<p class="copyright">
		Copyright &copy; 2022</p>
</div>
';


echo $sDiv;

echo xhtmlFootPaginaSitio($aParametrosBasicos);

?>