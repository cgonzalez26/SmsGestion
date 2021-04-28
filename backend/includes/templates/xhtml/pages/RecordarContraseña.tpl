<div class='cuerpo'>

	<script type='text/javascript' src='jscript/forms.js'></script> 
  	<div class="espacio"></div>
	<table width='600' cellpadding='0' cellspacing='0' style='font-family:Tahoma;font-size:11px;'>
		<tr>
			<td style='font-size:22px;color:#E98320; font-family:Sylfaen,Times New Roman;/*#CFB84D;/*text-shadow:5px 5px 5px gray;*/font-weight:bold;'>
				Sistema de SHELL
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
			</td>
		</tr>	
		<tr>
			<td style='font-size:18;color:#E98320'>
				¿Olvidaste tu contrase&ntilde;a?
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<img src='{IMAGES_DIR}/agt_home.png' title='' alt='' border='0' hspace='4' align='absmiddle'>
				&nbsp;
				<a href='{BASE_URL}/'>ir a Inicio</a>
			</td>
		</tr>
		<tr>
			<td><br /></td>
		</tr>		
		<tr>
			<td align='left' style='margin-left:25px;'>
				Para poder recuperar tu Contrase&ntilde;a por favor debes proporcionar los siguientes datos <br /><br />
				- <span style='color:#E98320;'>Dirección de E-mail que nos proporcionaste al registrarte (*)</span><br />
				- <span style='color:#E98320;'>Tu nombre de Usuario (*)</span><br /><br />
				Te enviaremos en forma autom&aacute;tica la informaci&oacute;n necesaria para ingresar al sistema.
			</td>
		</tr>
	</table>

	<div class="espacio"></div>
  
	<form action='' id='form' name='form' method='post' class='FormGeneric' enctype='multipart/form-data'>			
	
		<table width='800' cellpadding='5' cellspacing='5' align='center' style='font-family:Tahoma;font-size:11px;'>
			<tr>
				<td colspan='2'>
					<div id='idMessage'>{MESSAGE}</div>
				</td>
			</tr>
			<tr>
				<td colspan='2'>&nbsp;</td>
			</tr>		
			<tr>
				<td width='100'>
					 Usuario (*): 
				</td>
				<td>
					<input type='text' name='sLogin' id='sLogin' size='60' value='{sLogin}'/>
				</td>		
			</tr>
			<tr>
				<td>
					 E-mail (*): 
				</td>
				<td>
					<input type='text' name='sMail' id='sMail' size='60' value='{sMail}'/>
				</td>		
			</tr>	
			<tr>
				<td colspan='2' style='color:#FF0000;'>
					 (*) Campos Obligatorios
				</td>
			</tr>			
			<tr>
				<td colspan='2' align='center'>
					 <input type='hidden' name='Confirmar' value='1' />
					 <input type='submit' onclick="javascript: return checkFormRequest();" value='Aceptar'> 
				</td>
			</tr>		
		</table>

	</form>    
  
	<div class="espacio"></div>

</div>


<script type='text/javascript'>

	function checkFormRequest(){
		var Formu = document.forms['form'];
		var ERROR = 'Han ocurrido los siguientes errores: \n';
		var smsError = '';
		var ExpRegEMail = new RegExp ('(^[0-9a-zA-Z]+(?:[._][0-9a-zA-Z]+)*)@([0-9a-zA-Z]+(?:[._-][0-9a-zA-Z]+)*\.[0-9a-zA-Z]{2,3})$');
		
		if(Formu.sLogin.value == ''){
			smsError += "<li>- Nombre de Usuario Invalido</li>";
		}		
		
		if(!ExpRegEMail.test(Formu.sMail.value)){
			smsError += "<li>- E-Mail Invalido </li>";
		}		
		
		if(smsError != ''){
			//alert(ERROR + smsError);
			document.getElementById('idMessage').innerHTML = "<div style='color:#FF0000;'>" + smsError + "</div>";
			return false;
		}else{
			imageLoaderWithText('idMessage','ejecuntado operacion');
			return true;
		}
	}

</script>

