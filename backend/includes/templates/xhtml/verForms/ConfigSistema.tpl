<script type="text/javascript" src="../includes/ckeditor/ckeditor.js"></script>
<body style="background-color:#FFFFFF">

<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/menu/icon-16-configSystem.png" border="0" />&nbsp;&nbsp;<strong>Configuraci&oacute;n del Sistema</strong></td>
		</tr>
	</table>

<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idParam" name="idParam" value={id} />
	
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Sistema:</legend>	
		<table cellpadding='0' cellspacing='5' class='TablePermits' border="0">
		 <tr>
            <td style="width:140px">(*)Titulo del Sistema:</td>
            <td>
                <input type="text" id="sTitulo" name="sTitulo" value="{sTitulo}" style="width:200px" />
            </td>
         </tr>
         <tr>
        	<td>(*)Mail Default:</td>
            <td>
                <input type="text" id="sMailDefault" name="sMailDefault" value="{sMailDefault}" style="width:200px" />
            </td>
         </tr>               
         <tr><td colspan="2">Mail Encabezado:</td></tr>
         <tr>
         	<td colspan="2"><textarea rows="4" style="width:90%;" id="sMailHeader" name="sMailHeader">{sMailHeader}</textarea></td>
         </tr>
         <tr><td colspan="2">Mail Encabezado:</td></tr>
         <tr>
         	<td colspan="2"><textarea rows="4" style="width:90%;" id="sMailFoot" name="sMailFoot">{sMailFoot}</textarea></td>
         </tr>
         <tr>	
			<td colspan='2' align='left'>
			<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Guardar' style="width:80px" onclick="sendForm(this);" />
			</td> 
		</tr>
         </table>
	</fieldset>
	</form>
</div>	
<script>
	CKEDITOR.replace( 'sMailHeader',
		{
			extraPlugins : 'uicolor',
			uiColor: '#FFF',
			 height:120,
			 width:640,
			 toolbar :[
			    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			    ['NumberedList','BulletedList','-','Outdent','Indent'],
			    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			    ['BidiLtr', 'BidiRtl'],
			    ['Link','Unlink','Anchor'],
			    ['Image','Table','SpecialChar','Iframe'],
			    '/',
			    ['Styles','Format','Font','FontSize'],
			    ['TextColor','BGColor','Preview'],
			],

			 filebrowserBrowseUrl : '{BASE_URL}/backend/includes/filemanager/index.php',
			 filebrowserWindowWidth : '640',
			 filebrowserWindowHeight : '500'																												
		}											
	);

	CKEDITOR.replace( 'sMailFoot',
		{
			extraPlugins : 'uicolor',
			uiColor: '#FFF',
			 height:150,
			 width:640,
			 toolbar :[
			    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			    ['NumberedList','BulletedList','-','Outdent','Indent'],
			    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			    ['BidiLtr', 'BidiRtl'],
			    ['Link','Unlink','Anchor'],
			    ['Image','Table','SpecialChar','Iframe'],
			    '/',
			    ['Styles','Format','Font','FontSize'],
			    ['TextColor','BGColor','Preview']
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
			if (sTitulo.value == ""){
				errores += "- El campo Titulo es requerido.\n";
			}	
			if (sMailDefault.value == ""){
				errores += "- El campo Mail Default es requerido.\n";
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
		xajax_updateDatosSistema(xajax.getFormValues('form'));
	}
</script>