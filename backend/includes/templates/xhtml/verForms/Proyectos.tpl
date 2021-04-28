<body style="background-color:#FFFFFF">
<div id="GrillaGeneral">
<table width="{ANCHO_GRILLA}" align="center">
<tbody>
		<tr>
         
			<td align="center">
			    <div style="width:{ANCHO_GRILLA};"  id="iDivMenuProyecto"></div>		    
				<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #000000; background-color:white;height:200px; font-size:20pt;"></div>
				<div style="background:#000000;" align="left"> </div>
			</td>
		</tr>
		<tr>
		 <td id="recinfoArea" >&nbsp;</td>
		</tr>
</tbody>				
</table>

<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits' border="0">
		<tr>
			<td class='title' width='300'><strong>Modulos de Proyectos : </strong></td>
			<td class='title'><div id='divNameUser' style='text-align:left;'></div></td>
		</tr>
	</table>
	<div id='divMessageOperacion' style='text-align:left;'>- Mensaje Operacion</div>
	<form method='POST' name= 'form' id='form' action="">
	<input type="hidden" id="idProyecto" name="idProyecto" value="0" />
	<input type="hidden" name="type" id="type" value="NEW"> 
	
	<table width='100%' cellpadding='10' cellspacing='10' border="0">
		<tr>
			<th width='90'> (*)Nombre: </th>
			<td align="left"><input type="text" id="sNombre" name="sNombre" style="width:300px"/></td>
		</tr>
		<tr>
			<th width='90' valign="top"> Descripci&oacute;n: </th>
			<td align="left">
				<textarea class="textarea" name='sDescripcion' id='sDescripcion' style='border:1px solid #DDD;width:100%;height:80px;'></textarea> 
			</td>
		</tr>
		<tr>
				<th valign="top"> Modulos : </th>			         
				<td align="left">
				    
					<div style="width:{ANCHO_GRILLA};"  id="iDivMenu"></div>		    
					<div id="Modulos" style="width:{ANCHO_GRILLA}; border:solid 1px #000000; background-color:white;height:250px; font-size:20pt;"></div>
					
					<div style="background:#000000;width:{ANCHO_GRILLA};" align="left"> 							
						<table style="color:#FFFFFF;font-size:9pt;font-family:Sans-serif;">
						<tr>
							<th>&nbsp;&nbsp;|&nbsp;&nbsp;[F8]-Nuevo  &nbsp;&nbsp;| &nbsp;&nbsp; </th>
						    <th>[F9]-Guardar   &nbsp;&nbsp;|&nbsp;&nbsp;  </th>
						    <th>[SHIFT+SUPR]-Borrar   &nbsp;&nbsp;|&nbsp;&nbsp;</th>
						    <th>[Ctrl+Shift]-Detalle   &nbsp;&nbsp;|&nbsp;&nbsp;</th>
						</tr> 
						</table>
					</div>
				</td>
		</tr>
		<!--<tr>	
			<td colspan="4">
			<input type='button' name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' onclick="sendFormProyecto()" />
			<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosFormProyecto();" style="display:none" />
			</td>
		</tr>-->	
	</table>	
</form>

</div>

<script>
	
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Proyecto,Descripcion";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("200,400");//",195,170,150,300"
	mygrid.setColAlign("left,left");
	
	mygrid.setColTypes("ed,ed");
	
    var sColumnas="sNombre,sDescripcion";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str");
	
	//mygrid.attachHeader("#text_filter,#text_filter");
	
	mygrid.setColumnColor("#B5D6DF,white");
	mygrid.setMultiLine(false);	
	
	mygrid.setMathRound(2);
    mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);	
	
	mygrid.init();
	
   	mygrid.loadXML("get.php");
	   	
	myDataProcessor = new dataProcessor("update.php");
    
    myDataProcessor.enableDataNames('true');
    
    //myDataProcessor.setVerificator(0,checkIfNotZero);
    //myDataProcessor.setVerificator(1,checkIfNotZero);    
  
    myDataProcessor.setUpdateMode("on");
    
    myDataProcessor.defineAction("error",myErrorHandler);
   
    myDataProcessor.setTransactionMode("GET");

    myDataProcessor.init(mygrid);

    
    function myErrorHandler(obj){
        alert("Ocurrio un error durante la operacion: .\n " + obj.firstChild.nodeValue);
        myDataProcessor.stopOnError = true;
        return false;
    }
    
    function checkIfNotZero(value,colName){
        if(value.toString()._dhx_trim()==""){
            alert("El valor de "+colName+" no debe estar vacio");
            value="---";
            return false
        }else
            return true;
    }
    	  
    mygrid.attachEvent("onEnter",onEnter_);
    
    function onEnter_(id_){      	
    	viewMessageLoad('divMessageOperacion');    	
		xajax_getProyecto(id_);
	}

	function EnviarDatos(){
		myDataProcessor.sendData();
	}
	
	var menu = new dhtmlXMenuObject("iDivMenuProyecto",'dhx_black');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");	
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	menu.attachEvent("onClick", menuClick);
	
	function menuClick(id) {
		switch(id)
			{
				case 'idNuevo':{
					
								 mygrid.clearSelection();
								 Filas = mygrid.getRowsNum() + 1;
								 
					             try{
					             	//var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
					             	var idCell = mygrid.getRowsNum();
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
	
/********************** Grilla: Modulos  ***********************/
	mygrid_ = new dhtmlXGridObject('Modulos');
    
	mygrid_.selMultiRows = true;
	
	mygrid_.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "Modulo,Descripcion,Estado";
	
	mygrid_.setHeader(flds);

	mygrid_.setInitWidths("200,350,80");
	
	mygrid_.setColAlign("left,left,left");	
	
	mygrid_.setColTypes("ed,ed,co");

	mygrid_.enableCellIds(true);

    var sColumnas="sNombre,sDescripcion,sEstado";
    
	mygrid_.setColumnIds(sColumnas);
	
	mygrid_.setColSorting("str,str,int");
	
    mygrid_.getCombo(2).put(0,'ALTA');
    mygrid_.getCombo(2).put(1,'BAJA');

	mygrid_.setColumnColor("#DAEBEB,white");
	
	mygrid_.setMultiLine(false);	
	
	//mygrid_.setMathRound(2);
    //mygrid_.enableMathEditing(true);
	mygrid_.setSkin("xp");
	//mygrid_.enableSmartRendering(true);

	mygrid_.init();
	
	//if({ID_PROYECTO} == 0)
	//mygrid_.loadXML("xml.xml");
	//else
	mygrid_.loadXML("xmlModulosProyectos.php");
	//============================================================================================;
	   	
	myDataProcessor_ = new dataProcessor("processModulosProyectos.php");
    
    myDataProcessor_.enableDataNames('true');
  
    myDataProcessor_.setUpdateMode("on");
    
    myDataProcessor_.defineAction("error",myErrorHandler);
   
    myDataProcessor_.setTransactionMode("GET");

    myDataProcessor_.init(mygrid_);

    
    function myErrorHandler(obj){
        alert("Ocurrio un error durante la operacion: \n " + obj.firstChild.nodeValue);
        myDataProcessor_.stopOnError = true;
        return false;
    }
    
    var menu_ = new dhtmlXMenuObject("iDivMenu",'dhx_black');//
	menu_.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu_.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu_.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	menu_.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");	
	menu_.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	
	menu_.attachEvent("onClick", menuClickModulos);
	
	function menuClickModulos(id) {
		switch(id)
			{
				case 'idNuevo':{
					
								 mygrid_.clearSelection();
								 Filas = mygrid_.getRowsNum() + 1;
								 
					             try{
					             	//var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
					             	var idCell = mygrid_.getRowsNum();
					             }catch(e){	
					             	var idCell=1;
					             }					              
					             mygrid_.addRow(Filas,['-'],idCell);					             
					             mygrid_.selectRow(idCell);					             				                             
				    break;} 
				case 'idGuardar':{saveDatos_(); break;}
				case 'idBorrar':{ mygrid_.deleteSelectedRows(); break; }
				case 'idPrint':{alert('En Construccion');break;}				
				
			}
		
		return true;
	}

	function saveDatos_(){
		myDataProcessor_.sendData();
	}
	
	function setDatosFormProyecto(idProyecto_){
		var Formu = document.forms['form'];			
		Formu.idProyecto.value = idProyecto_;		
		Formu.type.value = "EDIT";
		
		mygrid_.updateFromXMl("xmlModulosProyectos.php?idProyecto=" + idProyecto_); 		
		mygrid_.init();
		
		Formu.sNombre.focus();		
		
	}
	
	function sendFormProyecto(){
		if(!validarProyecto(document.forms['form']))
		{
			return;
		}
		var Formu = document.forms['form'];								
		viewMessageLoad('divMessageOperacion');		
		
		switch(Formu.type.value){
		case "NEW":
			mygrid_.parentFormOnSubmit(); //enviamos la lista para que guarde los datos			
			break;
		case "EDIT":		
		    myDataProcessor_.sendData();
		    break;			  				
		}
		xajax_updateDatosProyecto(xajax.getFormValues('form'));
	}	
	
	function validarProyecto(form){
			
		var errores = "";
		with (form){
			if (sNombre.value == ""){
				errores += "- El campo Nombre es requerido.\n";
			}	
		}
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}
	
	function resetDatosFormProyecto(){
		var Formu = document.forms['form'];		
		Formu.reset();
		mygrid_.updateFromXMl("xmlModulosProyectos.php"); 		
		mygrid_.init();
	}
	
	function updateGridProyectos(){
		mygrid.updateFromXMl("get.php");
		mygrid.init();
		resetDatosFormProyecto();
	}

</script>


