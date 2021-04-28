
<form action='' method='POST' name='formLogin' id='formLogin' style='display:inline;'>
<input type='hidden' name='Confirmar' value='1' />
<input type="hidden" id="urlBack" name="urlBack" value="{URL_BACK}" />

<div style="position:relative;z-index:100; padding-top:0px;width:210px;">
	<table style="width:210px;background:url(backend/includes/images/sitio/Login.jpg);width:210px;height:76px" cellpadding='0' cellspacing='0' align='right' id='tableLogin'  border='0'>	
	<tr>
		<td></td>
		<td align="right" style="padding-right:12px;padding-top:6px">
			<input type='text' name='sUser' id='sUser' style='width:115px;height:9px;font-size:9px'/>	
		</td>
	</tr>

	<tr>
		<td></td>
		<td align="right" style="padding-right:12px;padding-top:5px">
			<input type='password' name='Pass' id='Pass' style='width:115px;height:9px;font-size:9px'/>
		</td>
	</tr>
	<tr>
		<td style='font-weight:normal;padding-left:5px' >				
			<!--<button type="button" id="loguearse" name="loguearse" onclick="xajax_logueo(xajax.getFormValues('formLogin'))" style='width:60px;height:20px;font-size:9px' >Enviar</button>-->
			<img src="backend/includes/images/sitio/EnviarNormal.png" onmouseover="ImageChange(this,'backend/includes/images/sitio/EnviarSust.png')" onmouseout="ImageChange(this,'backend/includes/images/sitio/EnviarNormal.png')" alt="" style='width:59px;height:17px;cursor:pointer' onclick="xajax_logueo(xajax.getFormValues('formLogin'))" />
		</td>		
		<td style='padding-left:10px'>
			<a href="ajaxLogin.html?height=350&width=320&modal=true" class="thickbox" title="Registrarse"><img src="backend/includes/images/sitio/nuevoUsuario.jpg" alt="" /></a>
		</td>
	</tr>	
	
	</table>
</div>

<!--<div style="position:relative;z-index:1; padding-top:0px">
<img src="" style="" alt="" usemap="#Map1" />
<map name="Map1" id="Map1">
<area shape="rect" coords="95,40,204,64" href="registrarse.php" target="_self" alt="Nuevo Usuario" />
</map>
</div>-->

</form>
<div id="login" style="display:none">
  <p><span id='login_error_msg' class="login_error" style="display:none">&nbsp;</span></p>
  <div style="clear:both"></div>
  <p><span class="login_label">login</span> <span class="login_input"><input type="text"/></span></p>
  <div style="clear:both"></div>
  <p><span class="login_label">password</span> <span class="login_input"><input type="password"/></span></p>
  <div style="clear:both"></div>
</div>
<script>
   
</script>