<body style="background-color:#FFFFFF">

<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<!--<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-smsFast.png" border="0" />&nbsp;&nbsp;<strong>Mensajes Rapidos</strong></td>
		</tr>
	</table>	-->
	<form id="form" method="POST" action="previewMail.php" name='form'>
		<input type="hidden" id="idMensaje" name="idMensaje" value="0" />
		<input type="hidden" id="iPreview" name="iPreview" value="1" />
		<input type="hidden" id="idUnidadNegocio" name="idUnidadNegocio" value="{idUnidadNegocio}" />
		<input type="hidden" id="sFromMail" name="sFromMail" value="{sFromMail}" />
		<input type="hidden" id="sFromName" name="sFromName" value="{sFromName}" />
		<input type="hidden" id="sAsunto" name="sAsunto" value="{sAsunto}" />
		<input type="hidden" id="sMensaje" name="sMensaje" value="{hdnMensaje}" />
		
		<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
		<tr>
		<td width="100%">
			<fieldset style="background:#FFFFFF;">
				<span id="sContenido">{sMensaje}</span>
			</fieldset>	
		</td>
		</tr>
		<!--<tr>
			<td align="center" colspan="2">
			<input type="hidden" value="1" name="frm_enviorapido">
			<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' value='Enviar' style="width:80px" onclick="sendForm(this);" />
			<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="javascript:history.back(1)" style="width:80px" />
			</td>
		</tr>-->
		</table>	
	</form>	
</div>	
<script>
function sendForm(){
	xajax_enviarMailsRapidos(xajax.getFormValues('form'));
}	
</script>