<body style="background-color:#FFFFFF">
<div id="GrillaGeneral">
	<table width="{ANCHO_GRILLA}" align="center">
	<tbody>
			<tr>
	         
				<td align="center">
				    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
					<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #000000; background-color:white;height:200px; font-size:20pt;"></div>
					<div style="background:#000000;" align="left"> 
				
				<table style="color:#FFFFFF;font-size:9pt;font-family:Sans-serif;">
				<tr><th>&nbsp;&nbsp;|&nbsp;&nbsp;[F8]-Nuevo  &nbsp;&nbsp;| &nbsp;&nbsp; </th>
				   <th>[F9]-Guardar   &nbsp;&nbsp;|&nbsp;&nbsp;  </th>
				   <th>[SHIFT+SUPR]-Borrar   &nbsp;&nbsp;|&nbsp;&nbsp;</th>
				   <th>[Ctrl+Shift]-Detalle   &nbsp;&nbsp;|&nbsp;&nbsp;</th>
				</tr> 
				</table>
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
    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_blue');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/codebase/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/codebase/images/");	
	
	menu.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	
	//menu.addNewSibling("idBorrar", "idPrint", "Imprimir", false,"print.gif");
	//menu.addNewSibling("idPrint", "idActualizar", "Actualizar", false,"");
	
	menu.attachEvent("onClick", menuClick);
	//var id=mygrid.uid(); mygrid.addRow(id,'',0); mygrid.showRow(id);
	function menuClick(id) {
		switch(id)
			{
				case 'idNuevo':{			          
					             try{
					             	var idCell=mygrid.getRowIndex(mygrid.getSelectedId());					             	
					             }catch(e){					             	
					             	var idCell=1;
					             }
					              
					             mygrid.addRow((new Date()).valueOf(),['-','-'],idCell);
				                              
				    break;} 
				case 'idGuardar':{saveDatos(); break;}
				case 'idBorrar':{if(confirm('Realmente desea eliminar el/los registro/s seleccionados.?'))
					mygrid.deleteSelectedRows();break;}
				case 'idPrint':{alert('En Construccion');break;}				
				
			}
		
		return true;
	}

	function saveDatos(){
		myDataProcessor.sendData();
	}
	
shortcut.add("F8",function (){menuClick('idNuevo')},{
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
		enviar();
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
});			
</script>