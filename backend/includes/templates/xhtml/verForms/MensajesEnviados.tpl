<body style="background-color:#FFFFFF">

<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-smsSend.png" border="0" />&nbsp;&nbsp;<strong>Mensajes Enviados</strong></td>
		</tr>
	</table>	
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
</div>
<script>
			  
	
    mygrid = new dhtmlXGridObject('gridbox');
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "id,Apellido,Nombre,Destinatario,Fecha,Mensaje";
	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("1,100,150,150,150,400");	
	mygrid.setColAlign("left,left,left,left,left,left");		
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro");
	
    var sColumnas="id,sApellido,sNombre,sDestinatario,dFecha,sMensaje";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("int,str,str,str,str,str");
	mygrid.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	
	mygrid.setMultiLine(false);	
	
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlEnviados.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    myDataProcessor.enableDataNames('true');
    myDataProcessor.setUpdateMode("on");
    myDataProcessor.defineAction("error",myErrorHandler);
    myDataProcessor.setTransactionMode("GET");
    myDataProcessor.init(mygrid);

    /*mygrid.attachEvent("onEnter",doOnEnter);
    mygrid.attachEvent("onRowSelect",doOnEnter);
    
    function doOnEnter(id){
		//alert("Rows with id: "+id+" was selected by user");
		xajax_getDatosContacto(id);
	}*/
    
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
	
	/*function sendForm(){
		if(!validarDatosForm())
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');		
		xajax_updateDatosContacto(xajax.getFormValues('form'));
	}	
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xml.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idContacto.value = 0;		
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}*/
</script>