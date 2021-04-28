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
	<input type="hidden" id="sFromMail" name="sFromMail" value="" />
	<input type="hidden" id="sFromName" name="sFromName" value="" />
	<input type='hidden' name='hdnEnviar' id='hdnEnviar' value=0 />
	
	<fieldset style="background:#F5F5F5;">
	<legend>Datos del Mensaje:</legend>
	
	<form onsubmit="return vejecuta()" action="#" enctype="multipart/form-data" method="POST" id="enviomultipleid" name="enviomultiple">
	<!--<table width="600" cellspacing="0" cellpadding="0" border="0" style="font-family:Verdana;font-size:12px;">-->
	<table cellpadding='0' cellspacing='5' class='TablePermits' border="0">
	<tbody>
		<tr>
			<td align="right" style="width:140px">Unidad de Negocioo(From)&nbsp;</td>
			<td align="left" colspan="2">
				<select style="width:250px;" id="idUnidadNegocio" name="idUnidadNegocio" onchange="setMailRemitente(this.value);">
				{optionsUnidadesNegocios}
				</select>
				&nbsp;&nbsp;
				<span id="sMailRemitente" ></span>
			</td>
			
		</tr>
		<tr>
			<td align="right" style="width:140px">(*)Enviar a Grupo(To)&nbsp;</td>
			<td align="left" colspan="2">
				<select style="width:250px;" id="idGrupo" name="idGrupo">
				{optionsGrupos}
				</select>
			</td>
		</tr>
		<tr>
			<td align="right" style="width:140px">Asunto:</td>
			<td align="left" colspan="2">
				<input type="text" id="sAsunto" name="sAsunto" value="" style="width:500px;" />
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">Programar&nbsp;:</td>
			<td style="width:300px;">
				<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
				<tr>
					
					<td style="width:130px">
					<!--<input type="text" size="10" maxlength="10" value="" style="width:60%;" id="dFechaEnvio" name="dFechaEnvio">dd/mm/AAAA-->
						<div style="position: relative; border: 1px solid #000;width:120px">
							<input type="text" id="dFechaEnvio" name="dFechaEnvio" value=""" style="width:100px;float: left;border-width: 0px;" />
							<img src="../includes/images/calendar.gif"  title="Elegir Fecha" onclick="showCalendar();" style="cursor: pointer;" />
							<div style="position: absolute;top: 20px; display: none;" id="calendar1">
						</div>
					</td>								
					<td style="width:65px;"><input type="text" maxlength="8" value="" style="width:60px;" id="dHrEnvio" name="dHrEnvio"></td>
					<td>hh:mm:ss</td>
				</tr>		
				</table>
			</td>
			<td >
				<input type="checkbox" id="iEncabezadoPie" name="iEncabezadoPie" checked="checked" />Incluir Encabezado y Pie de la Empresa
			</td>
		</tr>
		<tr>
			<td valign="top" align="right">(*)Mensaje&nbsp;:</td>
			<td align="left" colspan="3">
				<textarea rows="4" style="width:90%;" id="sMensaje" name="sMensaje"></textarea>
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
			<td align="center" colspan="4"><br><div align="left" style="background:#F5F0CB;padding:5px;border:1px solid #B4B4B4;">(*)Campos requeridos.</div><br></td>
		</tr>
		<tr>
			<td align="center" colspan="4"><input type="hidden" value="1" name="frm_enviomultiple">
				<!--<input type="submit" value="Enviar" id="envio" name="envio">-->
				<input type="button" id="cmd_Preview" name='cmd_Preview' value='Vista Previa' style="width:80px" onclick="previewForm(this);" />
				<input type="button" id="cmd_Enviar" name='cmd_Enviar' value='Enviar' style="width:80px" onclick="sendForm(1);" />
				<input type="button" id="cmd_Guardar" name='cmd_Guardar' value='Guardar' style="width:80px" onclick="sendForm(0);" class="button"/>
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
	InputMask('dFechaEnvio',"99/99/9999");
	InputMask('dHrEnvio',"99:99:99");
	
	var mCal,cal1;
	window.onload = function() {
    	cal1 = new dhtmlxCalendarObject('calendar1');
    	cal1.setOnClickHandler(selectDate1);
    }
	function selectDate1(date) {
		var dateformat = "%d/%m/%Y";
	    document.getElementById('dFechaEnvio').value = cal1.getFormatedDate(dateformat, date);
	    document.getElementById('calendar1').style.display = 'none';
	    return true;
	}	
	function showCalendar() {
	    document.getElementById('calendar1').style.display = 'block';
	}
	
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
		var instance = CKEDITOR.instances.sMensaje;
		instance.updateElement();
		form['sMensaje'].value = instance.getData();
				
		with (form){
			if (idGrupo.value == "0"){
				errores += "- Debe seleccionar un Grupo.\n";
			}	
			if (sMensaje.value == "" || sMensaje.value == "<br>"){
				errores += "- El campo Mensaje es requerido.\n";
			}	
        }
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}
	
	function sendForm(iEnviar){
		if(!validarDatosForm())
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');				
		//alert("paso");
		var sConfirm="";
		if(iEnviar == 1)
			sConfirm += "¿Esta seguro que desea Enviar el Mail Masivo al Grupo?"; 
		else
			sConfirm += "¿Esta seguro que desea Guardar el Mail Masivo al Grupo?";
		if(confirm(sConfirm)){
			document.getElementById('hdnEnviar').value = iEnviar;			
			CKEDITOR.instances.sMensaje.updateElement();
			form['sMensaje'].value = CKEDITOR.instances.sMensaje.getData();			
			//alert("paso");
			xajax_enviarMailsMasivos(xajax.getFormValues('form'));
		}		
	}	
	
	function resetDatosForm__(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idMensaje.value = 0;		
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Enviar.value = "Enviar";//seteamos el boton nuevo
	}
	
	function setMailRemitente(idUnidadNegocio){
		if(idUnidadNegocio>0){
			xajax_getMailUnidadNegocio(idUnidadNegocio);
		}
	}
	
	function previewForm(){
	   var form = document.forms['form'];
	   //form.submit();
	   var sMensaje = CKEDITOR.instances.sMensaje.getData();
	   var iEncabezadoPie = 0;
	   if(document.getElementById("iEncabezadoPie").checked)
	   		iEncabezadoPie=1;
	   		
	   createWindows('PreviewMail.php?sMensaje='+sMensaje+'&iEP='+iEncabezadoPie,'Vista Previa de Mail','Sms',900,800);
	}
	
	var dhxWins1;
	function createWindows(sUrl,sTitulo,idProyecto_,iWidth,iHeight){
	    var idWind = "window_"+idProyecto_;
		//if(!dhxWins.window(idWind)){
	     	dhxWins1 = new dhtmlXWindows();     	
		    dhxWins1.setImagePath("../includes/grillas/dhtmlxWindows/sources/imgs/");	  
		    _popup_ = dhxWins1.createWindow(idWind, 350, 100, iWidth, iHeight);
		    _popup_.setText(sTitulo);
		    ///_popup_.center();
		    _popup_.button("close").attachEvent("onClick", closeWindows);
			_url_ = sUrl;
		    _popup_.attachURL(_url_);
		//}
	} 
	
	function closeWindows(_popup_){
		_popup_.close();
		//recargar();
		//parent.dhxWins.close(); // close a window
	}  	
	
	function recargar(){
		var idMensaje = document.getElementById("idMensaje").value;
		window.location = "MailsRapidos.php?idMensaje=" + idMensaje;
	}
</script>