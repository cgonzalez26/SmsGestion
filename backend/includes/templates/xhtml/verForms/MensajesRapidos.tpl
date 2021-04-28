<body style="background-color:#FFFFFF">


<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-contact.png" border="0" />&nbsp;&nbsp;<strong>Mensajes Rapidos</strong></td>
		</tr>
	</table>	

	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idMensaje" name="idMensaje" value=0 />
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Mensaje:</legend>

	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
	<tr>
	<td width="100%">
	  	   <div class="titlePage">
               Envios rapidos de SMS
           </div>
            <div class="form">
            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0" width="80%">
			<tbody>
				<tr>
					<td width="50%" align="right">Contacto:</td>
					<td width="50%" align="left">&nbsp;<input type="text" value="" style="width:200px;" id="sContacto" name="sContacto"></td>
				</tr>
				
				<tr>
					<td width="50%" align="right">(*)N&uacute;mero&nbsp;:</td>
					<td width="50%" align="left">&nbsp;<input type="text" value="" style="width:200px;" id="sMovil" name="sMovil"></td>
				</tr>
				<tr>
					<td width="50%" valign="top" align="right">(*)Mensaje&nbsp;:</td>
					<td width="50%" align="left">&nbsp;<textarea rows="4" style="width:300px;" id="sMensaje" name="sMensaje"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="2"><input type="hidden" value="1" name="frm_enviorapido">
						<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Enviar' style="width:80px" onclick="sendForm(this);" />
						<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
					</td>
					</tr>
			</tbody>
			</table>

           </div>
		</td>
	</tr>
	</table>
	</fieldset>
	</form>
</div>
<script>

	function validarDatosForm(){
		var errores = "";
		var form = document.forms['form'];
		with (form){
			if (sMovil.value == ""){
				errores += "- El campo Numero es requerido.\n";
			}	
			if (sMensaje.value == ""){
				errores += "- El campo Mensaje es requerido.\n";
			}	
        }
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}
	
	function sendForm(){
		if(!validarDatosForm())
		{
			return;
		}
		xajax_enviarSMSRapido(xajax.getFormValues('form'));
	}	
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
	}
	
	function resetDatosForm__(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idMensaje.value = 0;		
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
</script>