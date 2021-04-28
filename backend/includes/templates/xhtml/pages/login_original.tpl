<style>

div#pieLogin{
	font-family: Tahoma;
	font-size:10px;
	color:#FFF;
	background:#727878;
	text-align:left;
	width:80%;
	
}

div#pieLogin a{
	font-family: Tahoma;
	font-size:10px;
	font-weight:bold;
	color:#FFF;
	text-decoration:none;
}

div#pieLogin a:hover{
	font-weight:bold;
	color:#FFF;	
	text-decoration:underline;
}

div#pieLogin a:visited{
	font-weight:bold;
	color:#FFF;
	text-decoration:none;	
}

</style>

<div class='cuerpo'>

	<script type='text/javascript' src='jscript/forms.js'></script> 
  	<div class="espacio"></div>
	<table width='600' cellpadding='0' cellspacing='0' style='font-family:Tahoma;font-size:11px;'>
		<tr>
			<td style='font-size:22px;color:#E98320; font-family:Sylfaen,Times New Roman;/*#CFB84D;/*text-shadow:5px 5px 5px gray;*/font-weight:bold;'>
				Ingreso a TeneloFacil
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
			</td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>		
		<tr>
			<td align='left' style='margin-left:25px;'>
				Para poder ingresar al sistema debes proporcionar los siguientes datos <br /><br />
				- <span style='color:#000;'>usuario con el que te registraste (*)</span><br />
				- <span style='color:#000;'>Contrase&ntilde;a que indicaste al registraste(*)</span><br /><br />
				
				En caso de haber olvidado tu contrase&ntilde;a puedes recuperarla haciendo click en el enlace 'olvide mi contrase&ntilde;a' y seguir las intrucciones.
				
			</td>
		</tr>
	</table>

	<div class="espacio"></div>
  
	<form action='' id='form' name='form' method='post' class='FormGeneric' enctype='multipart/form-data'>			
	
		<table width='600' cellpadding='5' cellspacing='5' align='center' style='font-family:Tahoma;font-size:11px;'>
			<tr>
				<td colspan='2'>
					<div id='idMessage' style='color:#F00;'>{ERRORES}</div>
				</td>
			</tr>
			<tr>
				<td colspan='2'>&nbsp;</td>
			</tr>		
			<tr>
				<td width='100'>
					 <strong style='font-family:Times New Roman;font-size:12px;color:#2f2f2f;'>Usuario (*):</strong> 
				</td>
				<td>
					<input type='text' name='Nick' id='Nick' size='60' value='{Nick}'/>
				</td>		
			</tr>
			<tr>
				<td>
					 <strong style='font-family:Times New Roman;font-size:12px;color:#2f2f2f;'>Contrase&ntilde;a(*):</strong>  
				</td>
				<td>
					<input type='password' name='Pass' id='Pass' size='60' value='{Pass}'/>
				</td>		
			</tr>	
			<tr>
				<td>&nbsp;</td>
				<td align='left' style=''>
					 <img src='{IMAGES_DIR}/rememberPass.png' title='' alt='' border='0' hspace='10' align='absmiddle'>
					 <a href='requestPass.php' style='color:#E98320;text-decoration:none;font-size:11px;'>Olvide mi Contrase&ntilde;a</a>
				</td>
			</tr>			
			<tr>				
				<td align='left' style='' colspan='2'>
					&nbsp;
				</td>
			</tr>			
			<tr>
				<td colspan='2' style='color:#a4a4a4;'>
					 (*) Campos Obligatorios
				</td>
			</tr>			
			<tr>
				<td colspan='2' align='center' style=''>
					 <input type='hidden' name='Confirmar' value='1' />
					 <!--<a href="javascript: return sendFormLogin();"><img src='{IMAGES_DIR}/buttonLogin.gif' alt='' title='' border='0'></a>-->
					 
					 <input type='submit' value='Aceptar' style='height:20px;width:120px;margin-right:45px;'> 
				</td>
			</tr>		
		</table>

	</form>    
  
	<div class="espacio"></div>

</div>

<div id='pieLogin'>&nbsp;</div>
<center>
<div id='pieLogin'>
	Copyright © Griva Soluciones
</div>
</center>

<script type='text/javascript'>

	document.forms['form'].Nick.focus();
	
	function sendFormLogin(){
		var Formu = document.forms['form'];
		var iError = 0;
		
		document.getElementById('idMessage').innerHTML = '';
		
		if(Formu.Nick.value==''){
			document.getElementById('idMessage').innerHTML += '<li>- Nombre de Usuarios Invalido</li>';
			iError = 1;
		}
		
		if(Formu.Pass.value==''){
			document.getElementById('idMessage').innerHTML += '<li>- Contrase&ntilde;a Invalidada</li>';
			iError = 1;
		}		
		
		if(iError == 0){
			Formu.submit();
			return true;
		}else{
			return false;
		}
		
	}
	
</script>

