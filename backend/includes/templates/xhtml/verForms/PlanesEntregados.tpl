<body style="background-color:#FFFFFF">

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

<form id='form_exportar' method='post' action='ExportarPedidosEntregados.php'>

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
	var flds = "Nro,Cliente,Nombre,Productos,Inicio,T,Cuota$,Cuotas,Adelanto,P.Contado,P.Proforma";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("70,70,200,250,80,80,80,80,80,80,80");//",195,170,150,300"
	mygrid.setColAlign("left,left,left,left,center,left,left,left,left,,left,left");
	
	mygrid.setColTypes("ed,ed,ed,ro,ro,ro,ro,ro,ro,ro,ro");
	
	{OPCIONES_ESTADOS}
	
    var sColumnas="sNroOperacion,sNroCliente,sApellido,sProductos,dFechaRegistro";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,int");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter,,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	mygrid.setMultiLine(false);

	mygrid.setMathRound(2);
    mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlPedidosEntregados.php");
	   	
	myDataProcessor = new dataProcessor("processPedidosEntregados.php");
    
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

	  
    mygrid.attachEvent("onRowSelect",doOnRowSelected);
    mygrid.attachEvent("onEnter",doOnRowSelected);
    
    function doOnRowSelected(id){
		xajax_CargarDatosPedidoEntregado(id);	
		//setDatosFormPedido(id);
	}
	
	var menu = new dhtmlXMenuObject("iDivMenu",'dhx_blue');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "", false, "");	
	menu.addNewSibling(null, "idGuardar", "",false, "");
	menu.addNewSibling("idGuardar","idPrint", "Exportar",false, "excel.png");
	menu.addNewSibling("idNuevo","idFinalizar", "Finalizar",false, "select_all.gif");
	menu.attachEvent("onClick", menuClick);
	
	function menuClick(id) {
		switch(id)
			{
				case 'idPrint':{
					exportar(3);
					break;
				}
				case 'idFinalizar':{
					 try{
		             	var idCell = mygrid.getRowIndex(mygrid.getSelectedId());
		             	
		             }catch(e){
		             	
		             	var idCell=1;
		             }
		             sCodigo = mygrid.cells2(idCell,0).getValue();
		             sTotalProforma= mygrid.cells2(idCell,10).getValue();
		             sNroCliente= mygrid.cells2(idCell,1).getValue();
		             ventanaDeuda(sCodigo,sTotalProforma,sNroCliente);
		             //FloatingWindow('FinalizarProforma.php?sCodigo='+sCodigo,'Datos de la Ficha');
					break;
				}
				
			}
		return true;
	}
	
	
	function ventanaDeuda(sCodigo,sTotalProforma,sNroCliente){
    	var win = new Window(
		    	  {className: "alphacube", 
				  title:'<b>Finalizar Proformma</b>', 
				  width:500, 
				  height:300, 
				  top:50, 
				  left:60, 
				  url:'FinalizarProforma.php?sCodigo='+sCodigo+'&sTotalProforma='+sTotalProforma+'&sNroCliente='+sNroCliente,
				  showEffect:Element.show,
				  hideEffect:Element.hide
				  }); 
		win.toFront();	 
		win.showCenter(); 		  
		return;	
    }   
    
    function resetListado(){
    	mygrid.updateFromXMl("xmlPedidosEntregados.php");
    	mygrid.attachHeader("#text_filter,#text_filter,#text_filter,,#text_filter");
    	mygrid.init();
    }
	
</script>	