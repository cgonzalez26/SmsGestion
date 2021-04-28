<body style="background-color:#FFFFFF">
<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' border="0">
	<tr>
		<td class='title' width='300'><strong>Planes Finalizados</strong></td>
	</tr>
</table>

<div id="GrillaGeneral">
<table width="{ANCHO_GRILLA}" align="center" style=''>
<tbody>
		<tr>         
			<td align="center">
			    <div style="width:{ANCHO_GRILLA};"  id="iDivMenu"></div>
				<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:400px; font-size:20pt;"></div>
			</td>
		</tr>
</tbody>		
		
</table>
</div>

<div id='divPermits' style='margin-left:5px;background:#F5F5F5;'>

<form id='form_exportar' method='post' action='ExportarPedidosFinalizados.php'>

</form>

</div>

<script>
	function exportar( tipo ) {

	var formulario = document.forms['form_exportar'];
	//formulario.tipo.value = tipo;
	formulario.submit();
}

{JAVASCRIPT_ADICIONAL}
			
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Nro,Nombre,Productos,Plan,Cuota$,Cuotas,Adelanto,P.Proforma,Total Pago";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("70,180,180,70,60,60,60,70,70");
	mygrid.setColAlign("left,left,left,left,center,left,left,left,left");
	
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro,ro,ro");
	
	{OPCIONES_ESTADOS}
	
    var sColumnas="sNroOperacion,sApellido,sProductos,dFechaRegistro";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,int");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	mygrid.setMultiLine(false);

	mygrid.setNumberFormat("0.00",8);
    mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	mygrid.attachFooter("Totales,#cspan,#cspan,#cspan,#cspan,#cspan,#cspan,<div id='total_1'>0</div>,<div id='total_2'>0</div>",["text-align:left;"]);
	
	mygrid.init();
    
   	mygrid.loadXML("xmlPlanesFinalizados.php",calculateFooterValues);
	myDataProcessor = new dataProcessor("processPlanesFinalizados.php");
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
            value="---";
            return false
        }else
            return true;
    }    
  
    //mygrid.attachEvent("onRowSelect",doOnRowSelected1);
    ///mygrid.attachEvent("onEnter",doOnRowSelected);
    
    function doOnRowSelected1(id){	
		mygrid.loadXML("xmlClientesCuotas.php?idProforma="+id,calculateFooterValues); 				mygrid.init();		
		mygrid.attachHeader(",#text_filter,");
		mygrid.attachFooter("Total,#cspan,<div id='total_1'>0</div>",["text-align:left;"]);
		mygrid.attachEvent("onEnter",calculateFooterValues);
	}	
	
    function calculateFooterValues(){
        var t1 = document.getElementById("total_1");
        t1.innerHTML = sumColumn(7);
        var t2 = document.getElementById("total_2");
        t2.innerHTML = sumColumn(8);
    }
    
    function sumColumn(ind){
        var out = 0;
        try{
        	indices_grilla = mygrid.getAllItemIds().split(",");
			for(var k = 0; k < indices_grilla.length ; k++){						
				fValor = parseFloat(mygrid.cells(indices_grilla[k],ind).getValue());
				if(fValor == 'undefined' || isNaN(fValor) ){ fValor = 0; }	
				out+= parseFloat(fValor);
			}
		}catch(e){
			//alert('Hola');
		}       
        return out;
    }
    
    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_blue');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "", false, "");	
	menu.addNewSibling(null, "idGuardar", "",false, "");
	menu.addNewSibling("idGuardar","idPrint", "Exportar",false, "excel.png");
	menu.attachEvent("onClick", menuClick);
	
	function menuClick(id) {
		switch(id)
			{
				case 'idPrint':{
					exportar(3);
					break;
				}
				
				
			}
		return true;
	}
	
</script>