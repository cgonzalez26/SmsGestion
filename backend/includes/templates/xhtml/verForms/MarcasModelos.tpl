<body style="background-color:#FFFFFF">

<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:40px"><strong>Administrar Agencias</strong></td>
		</tr>
</table>	

	
<div id='divFormGrupos'>

	<form action='' name='FormGrupos' id='FormGrupos'>	
	<table cellspacing='0' cellpadding='0' style="width:100%;">
	<tr>
		<td align='left'>
			<div id='smsMessageCuentas' style='margin-left:5px;'></div>
		</td>
	</tr>
	<tr>
		<td>

			<table style="width:100%;"><tr> 
			<td width="33%">
			<div id="GrillaGeneral">
				<table width="{ANCHO_GRILLA}" align="center" style=''>
				<tbody>
				<tr>         
					<td align="center">
						<fieldset style='padding:10px;border:1px solid #DDD;'>
							<legend>Marcas</legend>
					    	<div style="width:{ANCHO_GRILLA};margin-top:5px;"  id="iDivMenu"></div>
							<div id="Igridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>									
						</fieldset>					
					</td>
				</tr>
				</tbody>		
						
				</table>
				</div>
			</td>
			<td width="33%" align='left'>
				<div id="GrillaGeneral">
					<table width="{ANCHO_GRILLA}" align="center" style=''>
					<tbody>
					<tr>         
						<td align="center">								
							<fieldset style='padding:10px;border:1px solid #DDD;'>
								<legend>Relacion Marcas Modelos</legend>
						    	<div style="width:{ANCHO_GRILLA};margin-top:5px;"  id="iDivMenuCS"></div>
								<div id="gridboxCS" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>									
							</fieldset>
						</td>
					</tr>
					</tbody>		
							
					</table>
					</div>
			</td>
			<td width="33%">
			
			<div id="GrillaGeneral">
				<table width="{ANCHO_GRILLA}" align="center" style=''>
				<tbody>
				<tr>         
					<td align="center">
						<fieldset style='padding:10px;border:1px solid #DDD;'>
							<legend>Modelos</legend>								
					    	<div style="width:{ANCHO_GRILLA};margin-top:5px;"  id="iDivmenuS"></div>
							<div id="Egridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>
						</fieldset>
					</td>
				</tr>
				</tbody>		
				</table>
				</div>		
			</td>  
			</tr> 
			
			</table>
			
				
		</td>
	</tr>
	</table>

	
	</form>
</div>			 



<script type="text/javascript">
var idCuentaTesoreria=0;
//INSTANCIA DE GRILLA DE GRUPOS 

mygrid_G = new dhtmlXGridObject('Igridbox'); 
mygrid_G.selMultiRows = true;
mygrid_G.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
var flds = "Nombre";

mygrid_G.setHeader(flds);

mygrid_G.setInitWidths("250");
mygrid_G.setColAlign("left");	

mygrid_G.setColTypes("ed");

var sColumnas="sNombre";
mygrid_G.setColumnIds(sColumnas);	
mygrid_G.setColSorting("str");
mygrid_G.setColumnColor("white");
mygrid_G.setMultiLine(false);
mygrid_G.setSkin("xp");	
mygrid_G.enableSmartRendering(true);
mygrid_G.init();

mygrid_G.loadXML("xml.php?sType=MA");

mygrid_G.attachEvent("onRowSelect",verModelos);
//mygrid_G.attachEvent("onRowCreated",SeleCFila);

function verModelos(id){
	//alert(id);
	mygrid_GS.updateFromXMl("xml.php?sType=MAMO&idMarca="+id); 		
    mygrid_GS.init();	
}

//IProcess= new dataProcessor("processGrupos.php");
IProcess= new dataProcessor("process.php?sType=MA");
IProcess.enableDataNames('true');
IProcess.setUpdateMode("on");
IProcess.defineAction("error",myErrorHandlerG);
IProcess.setTransactionMode("GET");
IProcess.init(mygrid_G);


function myErrorHandlerG(obj){
    alert("Error occured.\n"+obj.firstChild.nodeValue);
    //document.getElementById('iDivMessageCustomer').innerHTML = obj.firstChild.nodeValue ;
    IProcess.stopOnError = true;
    //mygrid_G.clearSelection();
    
    //mygrid_G.updateFromXMl("xml.php?sType=G"); 		
    //mygrid_G.init();
    return false;
}   

//BOTONERA  INGRESOS

var menuG = new dhtmlXMenuObject("iDivMenu",'dhx_black');
menuG.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
menuG.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
menuG.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
menuG.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
menuG.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
menuG.attachEvent("onClick", menuClick);

function menuClick(id) {
	switch(id)
		{
			case 'idNuevo':{	
	             try{
	             	var idCell=mygrid_G.getRowsNum();
	             }catch(e){
	             	
	             	var idCell=1;
	             }
	              
	             mygrid_G.addRow((new Date()).valueOf(),[''],idCell);
	             mygrid_G.selectRow(idCell);
			                              break;} 
			case 'idGuardar':{EnviarDatos(); break;}
			case 'idBorrar':{mygrid_G.deleteSelectedRows();break;}
			case 'idPrint':{alert('En Construccion');break;}
		}
	
	return true;
}

function EnviarDatos(){
	IProcess.sendData();
	mygrid_G.clearSelection();
}


//INSTANCIA DE GRILLA DE CONTACTOS 


mygrid_S = new dhtmlXGridObject('Egridbox');
    
mygrid_S.selMultiRows = true;
mygrid_S.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
var flds = "Nombre";

mygrid_S.setHeader(flds);

mygrid_S.setInitWidths("250");
mygrid_S.setColAlign("left");	

mygrid_S.setColTypes("ed");

var sColumnas="sNombre";
mygrid_S.setColumnIds(sColumnas);	

mygrid_S.setColSorting("str");

mygrid_S.setColumnColor("white")
mygrid_S.setMultiLine(false);

	
mygrid_S.setSkin("xp");	
mygrid_S.enableDragAndDrop(true);
mygrid_S.init();
mygrid_S.loadXML("xml.php?sType=MO");

//EProcess= new dataProcessor("processContactos.php?sType=C");
EProcess= new dataProcessor("process.php?sType=MO");
EProcess.enableDataNames('true');
EProcess.setUpdateMode("on");
EProcess.defineAction("error",myErrorHandlerS);
EProcess.setTransactionMode("GET");
EProcess.init(mygrid_S);


function myErrorHandlerS(obj){
    alert("Error occured.\n"+obj.firstChild.nodeValue);
    //document.getElementById('iDivMessageCustomer').innerHTML = obj.firstChild.nodeValue ;
    EProcess.stopOnError = true;
    //mygrid_S.clearSelection()
    mygrid_S.updateFromXMl("xml.php?sType=C"); 		
    mygrid_S.init();
    return false;
}

/*mygrid_S.gridToGrid = function(rowId, sgrid, tgrid) {
    var z = new Array();
    for (var i = 0; i < sgrid.hdr.rows[0].cells.length; i++);
    z[i + 1] = sgrid.cells(rowId, i).getValue();
    return z;
}*/
//BOTONERA  CONTACTOS

var menuS = new dhtmlXMenuObject("iDivmenuS",'dhx_black');
menuS.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
menuS.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
menuS.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
menuS.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
menuS.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
menuS.attachEvent("onClick", menuClickE);

//eFilas=mygrid_S.getRowsNum()+1;
function menuClickE(id) {
	switch(id)
		{
			case 'idNuevo':{	
				             //mygrid_S.clearSelection();
				             //eFilas++; 		          
				             try{
				             
				             	var EidCell=mygrid_S.getRowsNum();
				             }catch(e){
				             	
				             	var EidCell=1;
				             }
				              
				             mygrid_S.addRow((new Date()).valueOf(),[''],EidCell);
				             mygrid_S.selectRow(EidCell);
			                            
			                              break;} 
			case 'idGuardar':{EnviarDatosE(); break;}
			case 'idBorrar':{mygrid_S.deleteSelectedRows();break;}
			case 'idPrint':{alert('En Construccion');break;}
			
		}
	
	return true;
}

function EnviarDatosE(){
	EProcess.sendData();
}

//grilla de dependencias

mygrid_GS = new dhtmlXGridObject('gridboxCS'); 
mygrid_GS.selMultiRows = true;
mygrid_GS.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
var flds = "Modelo";

mygrid_GS.setHeader(flds);

mygrid_GS.setInitWidths("150");
mygrid_GS.setColAlign("left");	

mygrid_GS.setColTypes("ro");

var sColumnas="sEmail";
mygrid_GS.setColumnIds(sColumnas);	
mygrid_GS.setColSorting("str");
mygrid_GS.setColumnColor("white");
mygrid_GS.setMultiLine(false);
mygrid_GS.setSkin("xp");	
mygrid_GS.enableDragAndDrop(true);
mygrid_GS.init();
mygrid_GS.loadXML("xml.php");
mygrid_GS.attachEvent("onDrop", drag_in);

function drag_in(r1, r2) {   
	mygrid_S.updateFromXMl("xml.php?sType=MO"); 		
    mygrid_S.init();	
}

ProcessCS= new dataProcessor("process.php?sType=MAMO");
ProcessCS.enableDataNames('true');
ProcessCS.setUpdateMode("on");
ProcessCS.defineAction("error",myErrorHandlerCS);
ProcessCS.setTransactionMode("GET");
ProcessCS.init(mygrid_GS);

function myErrorHandlerCS(obj){
    alert("Error: .\n"+obj.firstChild.nodeValue);
    //document.getElementById('iDivMessageCustomer').innerHTML = obj.firstChild.nodeValue ;
    ProcessCS.stopOnError = true;
    mygrid_GS.clearSelection()
    return false;
}   

//BOTONERA  INGRESOS

var menuCS = new dhtmlXMenuObject("iDivMenuCS",'dhx_black');//
menuCS.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
menuCS.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
menuCS.addNewSibling(null, "idGuardar", "Guardar",false, "save.gif");
menuCS.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
menuCS.attachEvent("onClick", menuCSlickCS);
function menuCSlickCS(id) {
	switch(id)
		{
			case 'idNuevo':{	
				         //mygrid_GS.clearSelection();
				         //Filas++; 		          
			             try{
			             	//var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
			             	var idCell=mygrid_GS.getRowsNum();
			             }catch(e){
			             	
			             	var idCell=1;
			             }
			              
			             mygrid_GS.addRow((new Date()).valueOf(),[''],idCell);
			             mygrid_GS.selectRow(idCell);
		                              //mygrid.showRow(mygrid.getSelectedId());
		                              
		                              break;} 
			case 'idGuardar':{EnviarDatosCS(); break;}
			case 'idBorrar':{mygrid_GS.deleteSelectedRows();break;}
			case 'idPrint':{alert('En Construccion');break;}
			//case 'idActualizar':{mygrid.updateFromXMl('get.php');break;}
			
		}
	
	return true;
}

function EnviarDatosCS(){
	ProcessCS.sendData();
}
</script>