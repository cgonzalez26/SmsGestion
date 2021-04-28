<script type="text/javascript" src="../includes/ckeditor/ckeditor.js"></script>
<body style="background-color:#FFFFFF">


<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
	<tr>
		<td class='title' width='100' style="height:30px;padding-left:20px">
			<img src="../includes/images/menu/icon-16-massemail.png" border="0" />&nbsp;&nbsp;<strong>Mails Masivos</strong>
		</td>
	</tr>
	</table>	
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idMensaje" name="idMensaje" value=0 />
	<fieldset style="background:#F5F5F5;">
	<legend>Datos del Mensaje:</legend>
	
	<form onsubmit="return vejecuta()" action="#" enctype="multipart/form-data" method="POST" id="enviomultipleid" name="enviomultiple">
	<!--<table width="600" cellspacing="0" cellpadding="0" border="0" style="font-family:Verdana;font-size:12px;">-->
	<table cellpadding='0' cellspacing='5' class='TablePermits' border="0">
	<tbody>
		<tr>
			<td align="left" style="width:30px;font-weight:bold">FROM:</td>
			<td align="right" style="width:100px">Unidad de Negocioo&nbsp;</td>
			<td align="left">
				<select style="width:250px;" id="idUnidadNegocio" name="idUnidadNegocio" onchange="setMailRemitente(this.value);">
				{optionsUnidadesNegocios}
				</select>
				&nbsp;&nbsp;
				<span id="sMailRemitente" ></span>
			</td>
		</tr>
		<tr>
			<td align="left" style="font-weight:bold">TO:</td>
			<td align="right" style="width:100px">(*)Enviar a Grupo&nbsp;</td>
			<td align="left">
				<select style="width:250px;" id="idGrupo" name="idGrupo">
				{optionsGrupos}
				</select>
			</td>
		</tr>
		<tr>
			<td align="left"></td>
			<td valign="top" align="right">(*)Mensaje&nbsp;:</td>
			<td align="left">
				<textarea rows="4" style="width:90%;" id="sMensaje" name="sMensaje" onkeyup="valida_longitud(this,120)"></textarea>
			</td>
		</tr>
		<!--<tr>
			<td valign="top" align="right"><br>Programar&nbsp;:</td>
			<td valign="top" align="left">
				<table width="100%" cellspacing="0" cellpadding="0" border="0" align="left" style="font-family:Verdana;font-size:12px;border:0px solid #9D9D9D;">
				<tbody>
				<tr>
					<td><input type="text" size="10" maxlength="10" onkeyup="mascara(this,'/',patron,true)" value="" style="width:60%;" id="programadoid" name="programado">&nbsp;dd/mm/AAAA</td>
				</tr>
				<tr>
					<td><input type="text" size="8" maxlength="8" onkeyup="mascara(this,':',patron3,true)" value="" style="width:60%;" id="programado_hid" name="programado_h">&nbsp;hh:mm:ss (24hs)</td>
				</tr>
				</tbody>
				</table>
			</td>
		</tr>-->
		<tr>
			<td align="center" colspan="2"><br><div align="left" style="background:#F5F0CB;padding:5px;border:1px solid #B4B4B4;">(*)Campos requeridos.</div><br></td>
		</tr>
		<tr>
			<td align="center" colspan="2"><input type="hidden" value="1" name="frm_enviomultiple">
				<!--<input type="submit" value="Enviar" id="envio" name="envio">-->
				<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Enviar' style="width:80px" onclick="sendForm(this);" />
				<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
			</td>
		</tr>
	</tbody>
	</table>
	</form>
	
	</fieldset>
	</form>
</div>
<script>
	CKEDITOR.replace( 'sMensaje',
		{
			extraPlugins : 'uicolor',
			uiColor: '#FFF',
			 height:370,
			 width:700,
			 toolbar :[
			    ['Preview'],
			    ['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker', 'Scayt'],
			    ['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
			    '/',
			    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			    ['NumberedList','BulletedList','-','Outdent','Indent'],
			    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			    ['BidiLtr', 'BidiRtl'],
			    ['Link','Unlink','Anchor'],
			    ['Image','Table','SpecialChar','Iframe'],
			    '/',
			    ['Styles','Format','Font','FontSize'],
			    ['TextColor','BGColor'],
			    ['Maximize','ShowBlocks','Source']
			],

			 filebrowserBrowseUrl : '{BASE_URL}/backend/includes/filemanager/index.php',
			 filebrowserWindowWidth : '640',
			 filebrowserWindowHeight : '500'																												
		}											
	);
	
	function validarDatosForm(){
		var errores = "";
		var form = document.forms['form'];
		with (form){
			if (idGrupo.value == "0"){
				errores += "- Debe seleccionar un Grupo.\n";
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
		//viewMessageLoad('divMessageOperacion');				
		//alert("paso");
		if(confirm("¿Esta seguro que desea enviar SMS Masivo al Grupo?")){
			form['sMensaje'].value = CKEDITOR.instances.sMensaje.getData();			
			xajax_enviarMailsMasivos(xajax.getFormValues('form'));
		}
	}	
	
	function resetDatosForm__(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idMensaje.value = 0;		
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
	
	function setMailRemitente(idUnidadNegocio){
		if(idUnidadNegocio>0){
			xajax_getMailUnidadNegocio(idUnidadNegocio);
		}
	}
</script>