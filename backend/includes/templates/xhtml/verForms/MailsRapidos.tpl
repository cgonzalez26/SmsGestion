<script type="text/javascript" src="../includes/ckeditor/ckeditor.js"></script>

<body style="background-color:#FFFFFF">


<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-smsFast.png" border="0" />&nbsp;&nbsp;<strong>Mensajes Rapidos</strong></td>
		</tr>
	</table>	

	<form id="form" method="POST" action="previewMail.php" name='form'>
	<input type="hidden" id="idMensaje" name="idMensaje" value=0 />
	<input type="hidden" id="sFromMail" name="sFromMail" value="" />
	<input type="hidden" id="sFromName" name="sFromName" value="" />
	<input type='hidden' name='hdnEnviar' id='hdnEnviar' value=0 />
	
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Mensaje:</legend>

	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
	<tr>
	<td width="100%">
            <div class="form">
            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0" width="95%">
			<tbody>
				<tr>
					<td align="right" style="width:150px">Unidad de Negocioo&nbsp;:</td>
					<td align="left" colspan="3">
						<select style="width:300px;" id="idUnidadNegocio" name="idUnidadNegocio" onchange="setMailRemitente(this.value);">
						{optionsUnidadesNegocios}
						</select>
						&nbsp;&nbsp;
						<span id="sMailRemitente" ></span>
					</td>
				</tr>
				<tr>
					<td align="right">(*)E-mail:</td>
					<td align="left" colspan="3"><input type="text" value="" style="width:500px;" id="sMail" name="sMail" class="wickEnabled"></td>
				</tr>
				<tr>
					<td align="right" style="width:150px">Asunto:</td>
					<td align="left">
						<input type="text" id="sAsunto" name="sAsunto" value="" style="width:300px;" />
					</td>
					<td colspan="2" style="width:300px;">
						<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
						<tr>
							<td valign="top" align="right">Programar&nbsp;:</td>
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
				</tr>
				<tr>
					<td valign="top" align="right">(*)Mensaje&nbsp;:</td>
					<td align="left" colspan="3">&nbsp;<textarea rows="4" style="width:600px;" id="sMensaje" name="sMensaje"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="4"><input type="hidden" value="1" name="frm_enviorapido">
						<input type="button" id="cmd_Preview" name='cmd_Preview' value='Vista Previa' style="width:80px" onclick="previewForm(this);" />	
						<input type="button" id="cmd_Enviar" name='cmd_Enviar' value='Enviar' style="width:80px" onclick="sendForm(1);" />						
						<input type="button" id="cmd_Guardar" name='cmd_Guardar' value='Guardar' style="width:80px" onclick="sendForm(0);" class="button"/>
						<input type='button' id='cmd_Cancelar' name='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
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
		form['sMensaje'].value = CKEDITOR.instances.sMensaje.getData();
		with (form){
			if (sMail.value == ""){
				errores += "- El campo E-mail es requerido.\n";
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
	
	function sendForm(iEnviar){
		if(!validarDatosForm())
		{
			return;
		}
		if(iEnviar == 1)
			sConfirm += "¿Esta seguro que desea Enviar el Mails?"; 
		else
			sConfirm += "¿Esta seguro que desea Guardar el Mails?";
		
		if(confirm(sConfirm)){	
			document.getElementById('hdnEnviar').value = iEnviar;
			form['sMensaje'].value = CKEDITOR.instances.sMensaje.getData();
			xajax_enviarMailsRapidos(xajax.getFormValues('form'));
		}
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
	   createWindows('PreviewMail.php?sMensaje='+sMensaje,'Vista Previa de Mail','Sms',900,800);
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
<script type="text/javascript" language="JavaScript" src="../includes/js/wick.js"></script> 