 <table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
	<tr>
		<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-contact.png" border="0" />&nbsp;&nbsp;<strong>Administrar Contactos</strong></td>
	</tr>
</table><p>&nbsp;</p>	
<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idContacto" name="idContacto" value=0 />
	<input type="hidden" id="updateMensajes" name="updateMensajes" value="1" />
	<input type="hidden" id="idMensaje" name="idMensaje" value={ID_MENSAJE} />
	
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Contacto:</legend>

	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
	<tr>
	<td width="100%">
	  	  
            <div class="form">
            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0">
                <tr>
                    <td style="width:140px">(*)Nombre:</td>
                    <td>
                        <input type="text" id="sNombre" name="sNombre" style="width:200px" />
                    </td>
                    <td>(*)Apellido:</td>
                    <td>                            
                        <input type="text" id="sApellido" name="sApellido" style="width:200px" />
                    </td>
                </tr>
                <tr>
                	<td>(*)Movil:</td>
                    <td>
                        <input type="text" id="sMovil" name="sMovil" style="width:200px" value="{MOVIL}" />
                    </td>
                    <td>Telefono:</td>
                    <td>
                        <input type="text" id="sTelefono" name="sTelefono" style="width:150px" />
                    </td>
                </tr>      
                <tr>
                	<td>Direcci&oacute;n :</td>
                    <td>
                        <input type="text"  id="sDireccion" name="sDireccion" style="width:200px" />
                    </td>
                    <td>E-Mail:</td>
                    <td>
                        <input type="text" id="sMail" name="sMail" style="width:200px" />
                    </td>
                </tr>
                <tr>
					<td>Grupo:</td>
					<td>
						<select name='idGrupo' id='idGrupo' style='width:200px;'>
							{optionsGrupos}
						</select>
					</td>
					<td colspan="2"></td>
				</tr>          
				<tr>	
					<td colspan='4' align='left'>
					<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
					</td> 
				</tr>
			</table>
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
			if (sNombre.value == ""){
				errores += "- El campo Nombre es requerido.\n";
			}	
			if (sApellido.value == ""){
				errores += "- El campo Apellido es requerido.\n";
			}	
			if (sMovil.value == ""){
				errores += "- El campo Movil es requerido";
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
		//viewMessageLoad('divMessageOperacion');		
		xajax_updateDatosContacto(xajax.getFormValues('form'));
	}	
	
	function resetDatosForm__(){
		resetDatosForm();		
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idContacto.value = 0;		
		Formu.sMovil.value = '';	
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
</script>
