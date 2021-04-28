<body style="background-color:#FFFFFF">
<div id="GrillaGeneral">
	<table width="{ANCHO_GRILLA}" align="center">
	<tbody>
			<tr>
	         
				<td align="center">
				    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
					<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #000000; background-color:white;height:400px; font-size:20pt;"></div>
					<div style="background:#000000;" align="left"> 
				</div>
				</td>
			</tr>
			<tr>
			 <td id="recinfoArea" >&nbsp;</td>
			</tr>
	</tbody>		
			
	</table>
</div>

<script>

	
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "Proyecto,Modulo,Descripcion,Estado";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("150,200,400,80");
	
	mygrid.setColAlign("left,left,left,left");	
	
	mygrid.setColTypes("co,ed,ed,co");
	
    var sColumnas="idProyecto,sNombre,sDescripcion,sEstado";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("int,str,str,int");
	
	{optionsProyectos}
	
    mygrid.getCombo(3).put(0,'ALTA');
    mygrid.getCombo(3).put(1,'BAJA');

	mygrid.setColumnColor("#DAEBEB,white")
	
	mygrid.setMultiLine(false);	
	
	mygrid.setMathRound(2);
    mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlModulosProyectos.php");
	   	
	myDataProcessor = new dataProcessor("processModulosProyectos.php");
    
    myDataProcessor.enableDataNames('true');
  
    myDataProcessor.setUpdateMode("on");
    
    myDataProcessor.defineAction("error",myErrorHandler);
   
    myDataProcessor.setTransactionMode("GET");

    myDataProcessor.init(mygrid);

    
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
	
	menu.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	
	//menu.addNewSibling("idBorrar", "idPrint", "Imprimir", false,"print.gif");
	//menu.addNewSibling("idPrint", "idActualizar", "Actualizar", false,"");
	
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
	

	/*shortcut.add("F8",function (){menuClick('idNuevo')},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});
	
	shortcut.add("Delete+Shift",function (){menuClick('idBorrar')},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});
	
	shortcut.add("F9",function (){
			saveDatos();
	},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});
	
	
	shortcut.add("Ctrl+Shift",function (){
			mygrid.selectRow(mygrid.getRowIndex(mygrid.getSelectedId()));
			
	},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});
	shortcut.add("Ctrl+Z",function (){
			mygrid.doUndo();
	},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});
	shortcut.add("Shift+Z",function (){
			mygrid.doRedo();
	},{
		'type':'keydown',
		'propagate':true,
		'target':document
	});		*/		
	
</script>