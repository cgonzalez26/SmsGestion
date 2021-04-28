<body style="background-color:#FFFFFF">

<form id="form" method="POST" action="" name='form'>
<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;' align="left">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/menu/icon-16-smsReceived.png" border="0" />&nbsp;&nbsp;<strong>Mensajes Recibidos</strong></td>
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
		<td valign="top">
		<fieldset style="background:#F5F5F5;">
		<input type="hidden" id="idContacto" name="idContacto" value="0" />
		<input type="hidden" id="idMensaje" name="idMensaje" value="0" />
		
		<legend>Responder un Mensaje:</legend>
			<div class="form">
	            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0" width="80%">
				<tbody>
					<tr>
						<td width="50%" align="right">Contacto:</td>
						<td width="50%" align="left"><span id="sContacto" /></td>
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
						<td align="center" colspan="2" height="20"><input type="hidden" value="1" name="frm_enviorapido">
							<input type="button" id="cmd_Enviar" name='cmd_Enviar' id='cmd_Aceptar' value='Enviar' style="display:none;width:80px" onclick="sendForm(this);" />
							<input type="button" id="cmd_Agregar" name='cmd_Agregar' id='cmd_Agregar' value='Agregar Contacto' style="display:none;width:120px" onclick="abrirAgregarContacto()" />
							<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
						</td>
						</tr>
				</tbody>
				</table>
	
	           </div>
	        </fieldset>   
		</td>
	</tr>
	</table>	
</div>
</form>
<script>
    mygrid = new dhtmlXGridObject('gridbox');
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "id,idContacto,Apellido,Nombre,Movil,Fecha,Mensaje";
	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("1,1,100,150,120,130,280");	
	mygrid.setColAlign("left,left,left,left,left,left,left");		
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro");
	
    var sColumnas="id,idContacto,sApellido,sNombre,sDestinatario,dFecha,sMensaje";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("int,int,str,str,str,str,str");
	mygrid.attachHeader(",,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	
	mygrid.setMultiLine(false);	
	
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	//mygrid.enablePaging(true,200, 3, "recinfoArea");
   // mygrid.setPagingSkin("toolbar", "dhx_skyblue");
	mygrid.init();
	
   	mygrid.loadXML("xmlRecibidos.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    myDataProcessor.enableDataNames('true');
    myDataProcessor.setUpdateMode("on");
    myDataProcessor.defineAction("error",myErrorHandler);
    myDataProcessor.setTransactionMode("GET");
    myDataProcessor.init(mygrid);

    mygrid.attachEvent("onEnter",doOnEnter);
    mygrid.attachEvent("onRowSelect",doOnEnter);
    
    function doOnEnter(id){
    	var idMensaje = mygrid.cells(id,0).getValue();
		var idContacto = mygrid.cells(id,1).getValue();
		var sMovil = mygrid.cells(id,4).getValue();
		var Formu = document.forms['form'];	
		Formu.idMensaje.value = idMensaje;
		Formu.cmd_Cancelar.style.display = "inline";//ocultamos el boton cancelar
		Formu.cmd_Enviar.style.display = "inline";//seteamos el boton nuevo
		Formu.cmd_Agregar.style.display = "inline";
		xajax_getDatosContacto(idContacto,sMovil);
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
		if(!validarDatosForm())
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');				
		xajax_enviarSMSRapido(xajax.getFormValues('form'));
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
		mygrid.updateFromXML("xmlRecibidos.php"); 
		mygrid.init();		
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		mygrid.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	}
	
	window.setInterval("refreshGrilla()",30000); //refresca la grilla cada 30seg, 1seg=1000
	
function abrirAgregarContacto(){
	var sMovil = document.getElementById("sMovil").value;
	var idMensaje = document.getElementById("idMensaje").value;
	createWindows('../Contactos/WindowContactos.php?sMovil='+sMovil+'&id='+idMensaje,'Agregar Contacto','1','1');
}	
	
function doOnLoad() {
    dhxWins1 = new dhtmlXWindows();
    dhxWins1.enableAutoViewport(false);
    dhxWins1.attachViewportTo("dhtmlx_wins_body_content");
    dhxWins1.setImagePath("../../codebase/imgs/");
}
var dhxWins1;
function createWindows(sUrl,sTitulo,idProyecto_,tipo_){
    var idWind = "window_"+idProyecto_+"_"+tipo_;
	//if(!dhxWins.window(idWind)){
     	dhxWins1 = new dhtmlXWindows();     	
	    dhxWins1.setImagePath("../includes/grillas/dhtmlxWindows/sources/imgs/");	  
	    _popup_ = dhxWins1.createWindow(idWind, 350, 100, 600, 300);
	    _popup_.setText(sTitulo);
	    ///_popup_.center();
	    _popup_.button("close").attachEvent("onClick", closeWindows);
		_url_ = sUrl;
	    _popup_.attachURL(_url_);
	//}
} 

function closeWindows(_popup_){
	_popup_.close();
	recargar();
	//parent.dhxWins.close(); // close a window
}  	

function recargar(){
	var idMensaje = document.getElementById("idMensaje").value;
	window.location = "MensajesRecibidos.php?idMensaje=" + idMensaje;
}
</script>