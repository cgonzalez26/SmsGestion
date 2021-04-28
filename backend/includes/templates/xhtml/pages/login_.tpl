
<form action='' method='POST' name='formLogin' id='formLogin' style='display:inline;'>
<input type='hidden' name='Confirmar' value='1' />

	<table width='100%' cellpadding='0' cellspacing='2' align='right' id='tableLogin' style="border:1px solid #">
	<tr><td id='td_mensaje' colspan="2" style='font-family:Tahoma;font-size:11px;text-align:left;color:#FFF;font-weight:bold;heigth:25px'>&nbsp;</td></tr>
	<tr>
		<td style='width:50px;padding-left:5px' align='left'>
			Usuario: 
		</td>
		<td>
			<input type='text' name='sUser' id='sUser' style='width:100px'/>	
		</td>
	</tr>

	<tr>
		<td style='padding-left:5px' align='left'>
			Contrase&ntilde;a:
		</td>
		<td>
			<input type='password' name='Pass' id='Pass' style='width:100px'/>
		</td>
	</tr>
	<tr>
		<td style='font-weight:normal;padding-left:5px' >				
			<button type="button" id="loguearse" name="loguearse" onclick="xajax_logueo(xajax.getFormValues('formLogin'))" style='width:60px' >Enviar</button>
		</td>
		<td>Soy nuevo en</td>
	</tr>	
	
	</table>

</form>