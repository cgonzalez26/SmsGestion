<body style="background-color:#FFFFFF">

<form id="form" method="POST" action="" name='form'>
<input type="hidden" id="idMail" name="idMail" value=0 />
<input type="hidden" id="idTipoMail" name="idTipoMail" value=0 />


<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;' align="left">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/menu/icon-16-smsReceived.png" border="0" />&nbsp;&nbsp;<strong>Listado de Mails</strong></td>
		</tr>
	</table>	
	<table width="950" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>
			<table width="{ANCHO_GRILLA}" align="center">
				<tbody>
					<tr>         
						<td align="center">
						    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
							<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:400px; font-size:20pt;"></div>
							<div style="background:#000000;" align="left"> 
						</div>
						</td>
					</tr>
				</tbody>		
			</table>
		</td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="hidden" value="1" name="frm_enviomultiple">
			<!--<input type="submit" value="Enviar" id="envio" name="envio">-->
			<input type='button' name='cmd_Vista' id='cmd_Vista' value='Vista Previa' onclick="previewMail();" style="width:100px" class="button"/>
			<input type="button" id="cmd_Editar" name='cmd_Editar' value='Editar' style="width:80px" onclick="sendForm(1);" class="button"/>
			<!--<input type="button" id="cmd_Guardar" name='cmd_Guardar' value='Guardar' style="width:80px" onclick="sendForm(0);" class="button"/>
			<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm();" style="display:none;width:80px" />-->
			
		</td>
	</tr>
	</table>	
</div>
</form>
<script>
    mygrid = new dhtmlXGridObject('gridbox');
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "id,idTipoMail,Titulo,Remitente,Fecha Registro,Fecha Envio,Tipo";
	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("1,1,200,230,120,120,100");	
	mygrid.setColAlign("left,left,left,left,center,center,center");		
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro");
	
    var sColumnas="id,idTipoMail,sTitulo,sDestinatario,dFechaRegistro,dFechaEnvio,sTipo";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("int,int,str,str,str,str,str");
	mygrid.attachHeader(",,#text_filter,#text_filter,#text_filter,#text_filter,#select_filter");
	mygrid.setColumnColor(",,#B5D6DF,white,#B5D6DF,white,#B5D6DF,white");
	
	mygrid.setMultiLine(false);	
	
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlListadoMails.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    myDataProcessor.enableDataNames('true');
    myDataProcessor.setUpdateMode("on");
    myDataProcessor.defineAction("error",myErrorHandler);
    myDataProcessor.setTransactionMode("GET");
    myDataProcessor.init(mygrid);

    mygrid.attachEvent("onEnter",doOnEnter);
    mygrid.attachEvent("onRowSelect",doOnEnter);
    
    function doOnEnter(id){
	/*
	   	var idMensaje = mygrid.cells(id,0).getValue();
		var idContacto = mygrid.cells(id,1).getValue();
		var sMovil = mygrid.cells(id,4).getValue();
		var Formu = document.forms['form'];	
		Formu.idMensaje.value = idMensaje;
		Formu.cmd_Cancelar.style.display = "inline";//ocultamos el boton cancelar
		Formu.cmd_Enviar.style.display = "inline";//seteamos el boton nuevo
		xajax_getDatosContacto(idContacto,sMovil);*/
		document.getElementById("idMail").value = id;
		document.getElementById("idTipoMail").value = mygrid.cells(id,1).getValue();		
	}
    
    function myErrorHandler(obj){
        alert("Ocurrio un error durante la operacion: \n " + obj.firstChild.nodeValue);
        myDataProcessor.stopOnError = true;
        return false;
    }
    
    function checkIfNotZero(value,colName){
        if(value.toString()._dhx_trim()==""){
            alert("El valor de "+colName+" no debe estar vacio");
            value = "";
            return false
        }else
            return true;
    }
    
	
    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_black');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "", false, "");
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");	
	menu.attachEvent("onClick", menuClick);
	//var id=mygrid.uid(); mygrid.addRow(id,'',0); mygrid.showRow(id);
	
	var Filas=0;
	
	function menuClick(id) {
		switch(id)
			{
				case 'idNuevo':{
					
								 mygrid.clearSelection();
								 Filas = mygrid.getRowsNum() + 1;
								 
					             try{
					             	//var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
					             	var idCell=mygrid.getRowsNum();
					             }catch(e){	

					             	var idCell=1;

					             }
					              
					             mygrid.addRow(Filas,['-'],idCell);					             
					             mygrid.selectRow(idCell);					             
				                              
				    break;} 
				case 'idGuardar':{saveDatos(); break;}
				case 'idBorrar':{ mygrid.deleteSelectedRows(); break; }
				case 'idPrint':{alert('En Construccion');break;}				
				
			}
		
		return true;
	}

	function saveDatos(){
		myDataProcessor.sendData();
	}
	
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
		if(document.getElementById("idMail").value == 0){
			alert("Debe seleccionar un Mail para Editar.");
			return;
		}
		var idMail = document.getElementById("idMail").value;
		switch(document.getElementById("idTipoMail").value){
			case 1:{
				window.location = "../Mailer/MailsRapidos.php?id="+idMail;
				break;}
			case 2:{
				window.location = "../Mailer/MailsMasivos.php?id="+idMail;
				break;}
			case 3:{
				window.location = "MailsCampanias.php?id="+idMail;
				break;}
		}
		//viewMessageLoad('divMessageOperacion');				
		//xajax_enviarSMSRapido(xajax.getFormValues('form'));
	}	
	
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xmlRecibidos.php"); 
		mygrid.init();		
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		mygrid.attachHeader(",,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idContacto.value = 0;		
		document.getElementById("sContacto").innerHTML = "";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Enviar.style.display = "none";//seteamos el boton nuevo
		Formu.cmd_Agregar.style.display = "none";//seteamos el boton nuevo
	}
	
	function refreshGrilla(){
		//alert();
		mygrid.updateFromXML("xmlListadoMails.php"); 
		mygrid.init();		
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		mygrid.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter");
	}
	
	
function doOnLoad() {
    dhxWins1 = new dhtmlXWindows();
    dhxWins1.enableAutoViewport(false);
    dhxWins1.attachViewportTo("dhtmlx_wins_body_content");
    dhxWins1.setImagePath("../../codebase/imgs/");
}
var dhxWins1;
function createWindows(sUrl,sTitulo,idWindow_,alto_,ancho_){
    var idWind = "window_"+idWindow_;
	//if(!dhxWins.window(idWind)){
     	dhxWins1 = new dhtmlXWindows();     	
	    dhxWins1.setImagePath("../includes/grillas/dhtmlxWindows/sources/imgs/");	  
	    _popup_ = dhxWins1.createWindow(idWind, 350, 100, alto_, ancho_);
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
	window.location = "MensajesRecibidos.php?idMensaje=" + idMensaje;
}

function previewMail(){
	if(document.getElementById("idMail").value == 0){
		alert("Debe seleccionar un Mail para Visualizar.");
		return;
	}
	var idMail = document.getElementById("idMail").value; 
	createWindows('../../../newsletter/ver_onlineNuevo.php?idmsje='+idMail+'&mostrarLinkVer=1','Vista Previa','Preview',950,700);	
}
</script>