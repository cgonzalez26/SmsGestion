<body style="background-color:#FFFFFF">

<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/menu/icon-16-configModem.png" border="0" />&nbsp;&nbsp;<strong>Configuraci&oacute;n Modem</strong></td>
		</tr>
	</table>

<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idParam" name="idParam" value={id} />
	
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Modem:</legend>	
		<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
		<tr>
		<td width="100%">
            <div class="form">
            <table cellpadding="5" class='TablePermits' cellspacing="0" border="0">
                <tr>
                    <td style="width:140px">Url:</td>
                    <td>
                        <input type="text" id="url" name="url" value="{url}" style="width:200px" />
                    </td>
                	<td>Ruta Envio:</td>
                    <td>
                        <input type="text" id="rutaenv" name="rutaenv" value="{rutaenv}" style="width:200px" readonly='readonly' disabled />
                    </td>
                </tr>
                <tr>
                	<td>Ruta Recepcion:</td>
                    <td>
                        <input type="text" id="rutarecep" name="rutarecep" value="{rutarecep}" style="width:200px" readonly='readonly' disabled />
                    </td>
                	<td>Ruta bck:</td>
                    <td>
                        <input type="text" id="rutabck" name="rutabck" value="{rutabck}" style="width:200px" readonly='readonly' disabled />
                    </td>
                </tr>
                <tr>
                	<td>Time Conexion:</td>
                    <td>
                        <input type="text" id="timeocon" name="timeocon" value="{timeocon}" style="width:200px" readonly='readonly' disabled />
                    </td>
                	<td>Time Envio:</td>
                    <td>
                        <input type="text" id="timeoenv" name="rutaenv" value="{rutaenv}" style="width:200px" readonly='readonly' disabled />
                    </td>
                </tr>
                <tr>
                	<td>User Dispo:</td>
                    <td>
                        <input type="text" id="userdispo" name="userdispo" value="{userdispo}" style="width:200px" readonly='readonly' disabled />
                    </td>
                	<td>Ruta Sistema:</td>
                    <td>
                        <input type="text" id="rutasis" name="rutasis" value="{rutasis}" style="width:200px" readonly='readonly' disabled />
                    </td>
                </tr>
            </table>            
       </td>
       </tr>
       <tr>	
			<td colspan='4' align='left'>
			<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Guardar' style="width:80px" onclick="sendForm(this);" />
			</td> 
		</tr>
       </table>
   </fieldset>
</div>                    
<script>
function validarDatosForm(){
	var errores = "";
	var form = document.forms['form'];
	with (form){
		if (url.value == ""){
			errores += "- El campo Url es requerido.\n";
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
	xajax_updateDatosModem(xajax.getFormValues('form'));
}	
</script>