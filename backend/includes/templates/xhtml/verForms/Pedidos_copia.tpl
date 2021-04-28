<body style="background-color:#FFFFFF">

<div id="GrillaGeneral">
<table width="{ANCHO_GRILLA}" align="center" style=''>
<tbody>
		<tr>         
			<td align="center">
			    <div style="width:{ANCHO_GRILLA};"  id="iDivMenu"></div>
				<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>
			</td>
		</tr>
</tbody>		
		
</table>
</div>

<div id='divPermits' style='margin-left:5px;background:#F5F5F5;'>

<form id="form" method="POST" action="" name='form'>
<input type="hidden" id="idPedido" name="idPedido" value="{ID_PEDIDO}" />
<input type="hidden" id="idCliente" name="idCliente" value="0" />
<input type="hidden" id="hdnNroCliente" name="hdnNroCliente" value="0" />
<input type="hidden" name="type" id="type" value="NEW"> 

<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' border="0">
	<tr>
		<td class='title' width='300'><strong>Orden de Pedido</strong></td>
	</tr>
</table>
    
<div id='divMessageOperacion' style='text-align:left;'>- Mensaje de la operacion</div>	

<table width="100%" style='background:#FFF url(../includes/images/bg_lines.gif) repeat-x;'>
<tr>
<td width="100%">
 	<fieldset>
       <legend>&nbsp;Datos del Pedido</legend>
       <table class="TableABM" cellpadding="0" cellspacing="5" border="0">
            <tr>
                <td style="width:140px">Nro. Operaci&oacute;n:</td>
                <td>
                    <input type="text" id="sNroOperacion" name="sNroOperacion" style="width:250px" readonly />
                </td>
            </tr>
            <tr>
                <td style="width:140px">Nro. de Cliente:</td>
                <td>
                    <input type="text" id="sNroCliente" name="sNroCliente" style="width:250px" readonly  />
                </td>
            </tr>
            <tr>
                <td style="width:140px">(*)Vendedor:</td>
                <td>
                    <input type="text" id="sVendedor" name="sVendedor" style="width:250px" />
                </td>
            </tr>
            <tr>
                <td style="width:140px">(*)Responsable:</td>
                <td>
                    <input type="text" id="sResponsable" name="sResponsable" style="width:250px" />
                </td>
            </tr>
		</table>	
    </fieldset>
           
    <fieldset>
       <legend>&nbsp;Datos del Cliente</legend>
      
        <div class="form">
        <table class="TableABM" cellpadding="0" cellspacing="5" border="0">
        	<tr>
        		<td>Buscar Cliente:</td>
        		<td colspan="3">
        			<select name='idClienteSearch' id='idClienteSearch' style="width:250px">						
					{OPCIONES_CLIENTES}
					</select>
				</td>
        <!--<input type="button" name="btnBuscar" value="Buscar" onclick="BuscarCliente()" />-->
        	</tr>
        	<tr><td>&nbsp;</td></tr>
            <tr>
                <td style="width:140px">(*)Nombre:</td>
                <td>
                    <input type="text" id="sNombre" name="sNombre" style="width:250px" />
                </td>
                <td>(*)Apellido:</td>
                <td>                            
                    <input type="text" id="sApellido" name="sApellido" style="width:250px" />
                </td>
            </tr>
            <tr>
                <td>Dni:</td>
                <td>
                    <input type="text" id="sDni" name="sDni" style="width:150px" />
                </td>
                <td>E-Mail:</td>
                <td>
                    <input type="text" id="sMail" name="sMail" style="width:200px" />
                </td>
            </tr>              
            <tr>
              	<td>Fecha de Nacimiento:</td>
                <td>
                    <div style="position: relative; border: 1px solid navy;width:150px">
						<input type="text" id="dFechaNac" name="dFechaNac" value="" style="width:130px;float: left;border-width: 0px;" />
						<img src="../includes/images/calendar.gif"  title="Elegir Fecha" onclick="showCalendar();" style="cursor: pointer;" />
						<div style="position: absolute;top: 20px; display: none;" id="calendar1">
					</div>
                </td>     
                <td>Telefono:</td>
                <td>
                    <input type="text" id="sTelefono" name="sTelefono" style="width:100px" />
                </td>
                                           
            </tr>
            <tr>
                <td>(*)Direcci&oacute;n Particular:</td>
                <td>
                    <input type="text"  id="sDomicilioParticular" name="sDomicilioParticular" style="width:250px" />
                </td>
                <td>Direcci&oacute;n Comercial:</td>
                <td>
                    <input type="text"  id="sDomicilioComercial" name="sDomicilioComercial" style="width:250px" />
                </td>
            </tr>                
            <tr>
                <td>Provincia:</td>
                <td>
                  <select id="idProvincia" name="idProvincia" style="width:150px;">{OPCIONES_PROVINCIAS}</select>
                </td>
                <td>(*)Localidad:</td>
                <td>
                  <select id="idLocalidad" name="idLocalidad" style="width:150px;">{SCRIPT_LOCALIDADES}</select>
                </td>
            </tr>
            <tr>
            	<td>Barrio:</td>
                <td>
                    <input type="text" id="sBarrio" name="sBarrio" style="width:250px" />
                </td> 
            	<td>Conyuge:</td>
                <td>
                    <input type="text" id="sConyuge" name="sConyuge" style="width:250px" />
                </td> 
            </tr>    
            <tr>                            
                <td>Rubro:</td>
                <td>
                    <input type="text" id="sRubro" name="sRubro" style="width:250px" />
                </td>
                <td>Nombre del Local:</td>
                <td>
                    <input type="text" id="sNombreLocal" name="sNombreLocal" style="width:250px" />
                </td> 
            </tr>
			<tr>
                	<td>(*)Cr&eacute;dito Total($):</td>
                	<td><input type="text" id="sCredito" name="sCredito" style="width:250px" /></td>
                	<td><img id="imgUpdateCredito" src="../includes/images/search.png"  title="Modificar Credito Total" onclick="showVentana();" style="cursor: pointer;display:none" /></td>
                	<td>&nbsp;</td>
            </tr>
</table>
</fieldset>

	<fieldset>
	    <legend>&nbsp;Lista de productos</legend>
		<div style="width:700px;"  id="iDivMenuProductos"></div>		    
		<div id="Productos" style="width:700px; border:solid 1px #000000; background-color:white;height:200px; font-size:20pt;"></div>
		<div id="divTotal" style="width:700px; border:solid 1px #000000; background-color:white;height:20px; font-size:20pt;">
		 <table cellpadding='0' cellspacing='0' width='100%' class='TablePermits' border="0">
		<tr>
			<td class='title' width='450' align="right"><strong>Total</strong></td>
			<td class='title' width='100' align="right" style="padding-right:10px"><input type="text" id="sTotal" name="sTotal" value="0" style="width:80px"/></td>
		</tr>
		</table>
		</div>
		
	</fieldset>
	<fieldset>
	    <legend>&nbsp;Forma de Pago</legend>
	    <table class="TableABM" cellpadding="0" cellspacing="5" border="0">
	    <tr>
            <td style="width:150px">Adelanto($):</td>
            <td>
               <input type="text" id="fAdelanto" name="fAdelanto" style="width:250px" />
            </td>
        </tr>
        <tr>
            <td style="width:150px">(*)Plan de Pago:</td>
            <td>
                <select id="idPlanPago" name="idPlanPago" style="width:250px">
                {OPCIONES_PLANESPAGOS}
                </select>
            </td>
        </tr>
        <tr>
            <td style="width:150px">(*)Monto($):</td>
            <td>
                <input type="text" id="fMonto" name="fMonto" style="width:250px" />
            </td>
        </tr>
        <tr>
            <td style="width:150px">(*)Cantidad de Cuotas:</td>
            <td>
                <input type="text" id="iCuotas" name="iCuotas" style="width:250px" />
            </td>
        </tr>
        </table>
	</fieldset>
    </form>
</td>
</tr>

<tr>	
	<td align='left'>
	<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />	
	<input type="button" id="cmd_Aprobar" name='cmd_Aprobar' value='Guardar y Aprobar' style="width:140px;" onclick="aprobarProforma(this);" />
	<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
	</td> 
</tr>
</table>

</div>


</div>

<script>
window.dhx_globalImgPath="../includes/grillas/dhtmlxCombo/imgs/"; 

var z = dhtmlXComboFromSelect("idClienteSearch");
z.enableFilteringMode(true);
z.attachEvent("onChange",BuscarCliente); 
//z.attachEvent("onKeyPressed",BuscarCliente); 
//z.attachEvent("onSelectionChange",BuscarCliente); 
//z.attachEvent("onSelectionChange",BuscarCliente(z.getSelectedValue())); 


{JAVASCRIPT_ADICIONAL}
	var mCal,cal1;
	window.onload = function() {
    	cal1 = new dhtmlxCalendarObject('calendar1');
    	cal1.setOnClickHandler(selectDate);
	}

	function selectDate(date) {
		var dateformat = "%d/%m/%Y";
	    document.getElementById('dFechaNac').value = cal1.getFormatedDate(dateformat, date);
	    document.getElementById('calendar1').style.display = 'none';
	    return true;
	}
	
	function showCalendar() {
	    document.getElementById('calendar1').style.display = 'block';
	}
			
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Nro.Operacion,Fecha,Cliente,Domicilio,Barrio,Estado";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("80,80,200,200,150,80");//",195,170,150,300"
	mygrid.setColAlign("left,left,left,center,left,center");
	
	mygrid.setColTypes("ed,ed,ed,ed,ed,ro");
	
	{OPCIONES_ESTADOS}
	
    var sColumnas="sNroOperacion,dFecha,sApellido,sDomicilioParticular,sBarrio,idEstadoPedido";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,str,int");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter,,,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white");
	mygrid.setMultiLine(false);


	//mygrid.setMathRound(2);
    //mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xml.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    
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

	  
    mygrid.attachEvent("onRowSelect",doOnRowSelected1);
    ///mygrid.attachEvent("onEnter",doOnRowSelected);
    
    function doOnRowSelected1(id){
		xajax_CargarDatosPedido(id);	
		//document.getElementById('iDivMessageCustomer').innerHTML = "";	
	}


    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_blue');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "", false, "");	
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	{BUTTON_CUSTOMER}
	
	//menu.addNewSibling("idBorrar", "idPrint", "Imprimir", false,"print.gif");
	//menu.addNewSibling("idPrint", "idActualizar", "Actualizar", false,"");
	
	menu.attachEvent("onClick", menuClick);
	//var id=mygrid_.uid(); mygrid_.addRow(id,'',0); mygrid_.showRow(id);
	function menuClick(id) {
		switch(id)
			{
				case 'idNuevo':{			          
					             try{
					             	var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
					             	
					             }catch(e){
					             	
					             	var idCell=1;
					             }
					              
					             mygrid.addRow((new Date()).valueOf(),[],idCell);
				                              //mygrid_.showRow(mygrid_.getSelectedId());
				                              
				                              break;} 
				case 'idGuardar':{EnviarDatos(); break;}
				case 'idBorrar':{
					if(confirm('Realmente desea eliminar el/los registro/s seleccionados.?'))
					mygrid.deleteSelectedRows();
					
					break;}
				case 'idPrint':{alert('En Construccion');break;}
				//case 'idActualizar':{mygrid_.updateFromXMl('get.php');break;}
				
			}
		
		return true;
	}

	function EnviarDatos(){
		myDataProcessor.sendData();
	}
	
	function validarDatosForm(form){
		var errores = "";
		with (form){
			
			/*if (sNroOperacion.value == ""){
				errores += "- El campo Nro. Operacion es requerido.\n";
			}	
			if (sNroCliente.value == ""){
				errores += "- El campo Nro. de Cliente es requerido.\n";
			}*/				
			if (sVendedor.value == ""){
				errores += "- El campo Vendedor es requerido.\n";
			}	
			if (sResponsable.value == ""){
				errores += "- El campo Responsable es requerido.\n";
			}	
			if (sNombre.value == ""){
				errores += "- El campo Nombre del Cliente es requerido.\n";
			}	
			if (sApellido.value == ""){
				errores += "- El campo Apellido del Cliente es requerido.\n";
			}	
			if (sDomicilioParticular.value == ""){
				errores += "- El campo Direccion Particular del Cliente es requerido.\n";
			}	
	        if (idLocalidad.value == "0"){
	        	errores += "- El campo Localidad del Cliente es requerido.\n";
	        }
	        if (idPlanPago.value == "0"){
	        	errores += "- El campo Plan de Pago es requerido.\n";
	        }
	        if (fMonto.value == ""){
	        	errores += "- El campo Monto es requerido.\n";
	        }
	        if (iCuotas.value == ""){
	        	errores += "- El campo Cantidad de Cuotas es requerido.\n";
	        }

	        if (parseFloat(sTotal.value.replace(",",".")) > parseFloat(sCredito.value.replace(",","."))){
	        	errores += "- El Cliente no dispone de Credito.";
	        }
	        
        }
		if (errores){
			alert("Por favor, revise los siguientes errores:\n"+ errores);
			return false;
		}
		else return true;
	}

	
	function sendForm(form){
		if(!validarDatosForm(form))
		{
			return;
		}
		viewMessageLoad('divMessageOperacion');	
		var Formu = document.forms['form'];			
		switch(Formu.type.value){
		case "NEW":
			mygrid_.parentFormOnSubmit(); //enviamos la lista para que guarde los datos			
			break;
		case "EDIT":		
		    myDataProcessor_.sendData();
		    break;			  				
		}
			
		xajax_updateDatosPedidos(xajax.getFormValues('form'),'1');
	}
	
	function resetDatosForm__(){
		resetDatosForm();		
		
		mygrid.updateFromXMl("xml.php"); 		
		mygrid.init();
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter,,,#text_filter");
		mygrid_.updateFromXMl("xmlProductos.php"); 		
		mygrid_.init();
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idPedido.value = 0;		
		Formu.type.value = "NEW";
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.style.display = "inline";
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
	
	InputMask('dFechaNac',"99/99/9999");
	
	/********************** Grilla: Productos  ***********************/
	/*function calculateFooterValues(stage) {
		//alert(stage);
	    if (stage && stage != 2);
	    return true;
	    var nrQ = document.getElementById("nr_q");
	    nrQ.innerHTML = sumColumn(3);
	}
	function sumColumn(ind) {
	    var out = 0;
	    alert(ind);
	    for (var i = 0; i < mygrid_.getRowsNum(); i++) {
	        out += parseFloat(mygrid_.cells(i, ind).getValue());
	    }
	    return out;
	}*/
	
	mygrid_ = new dhtmlXGridObject('Productos');
    
	mygrid_.selMultiRows = true;
	
	mygrid_.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "Descripcion,Cantidad,Precio,Totales";
	
	mygrid_.setHeader(flds);

	mygrid_.setInitWidths("400,100,100,100");
	
	mygrid_.setColAlign("left,left,left,left");	
	
	mygrid_.setColTypes("ed,ed,ed,math");

	mygrid_.enableCellIds(true);

    var sColumnas="sDescripcion,iCantidad,fPrecio,fSubTotal";
    
	mygrid_.setColumnIds(sColumnas);
	
	mygrid_.setColSorting("str,str,int,ro");
	
	mygrid_.setColumnColor("#DAEBEB,white,#DAEBEB,white");
	
	mygrid_.setMultiLine(false);	
	
	mygrid_.setSkin("xp");
	//mygrid_.attachEvent("onEditCell", calculateFooterValues);
	mygrid_.submitOnlyChanged(false);
	
	mygrid_.setMathRound(2);
    
	mygrid_.enableMathEditing(true);
    
	mygrid_.init();
	
	//mygrid_.attachFooter("Total,<div id='nr_q'>0</div>", ["text-align:left;"]);
	
	mygrid_.loadXML("xmlProductos.php");

	myDataProcessor_ = new dataProcessor("processProductos.php");
    
    myDataProcessor_.enableDataNames('true');
  
    myDataProcessor_.setUpdateMode("on");
    
    myDataProcessor_.defineAction("error",myErrorHandler_);
   
    myDataProcessor_.setTransactionMode("GET");

    myDataProcessor_.init(mygrid_);

    function myErrorHandler_(obj){
        alert("Ocurrio un error durante la operacion: \n " + obj.firstChild.nodeValue);
        myDataProcessor_.stopOnError = true;
        return false;
    }
    
    var menu_ = new dhtmlXMenuObject("iDivMenuProductos",'dhx_blue');//
	menu_.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu_.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu_.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	menu_.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");	
	menu_.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	
	menu_.attachEvent("onClick", menuClickProductos);
	
	mygrid_.attachEvent("onEnter",onEnter_);
	mygrid_.attachEvent("onRowCreated",onEnter_);
    
    /*function onEnter_(id_){      	    	
    	var iCantPedida = 0;
    	var fPrecio = 0;
    	var fSubTotal = 0;
    	var iFilas = mygrid_.getRowsNum() + 1;
    	
    	fTotal = 0;
    	for(i=1; i<iFilas; i++){   
    		alert(i); 		
    		iCantPedida = parseFloat(mygrid_.cells(i,1).getValue());
    		
	    	fPrecio = parseFloat(mygrid_.cells(i,2).getValue().replace(",","."));
	    	
	    	fSubTotal = iCantPedida*fPrecio;
	    	mygrid_.cells(i,3).setValue(fSubTotal.toString());
    		fTotal = fTotal + fSubTotal;
    	}
		//var fTotal = parseFloat(document.getElementById("sTotal").value) ;
		document.getElementById("sTotal").value = fTotal.toString();
	}*/
	 function onEnter_(id_){      	    	
    	var iCantPedida = 0;
    	var fPrecio = 0;
    	var fSubTotal = 0;
    	var fTotal = 0;
    	try{
    		indices_grilla = mygrid_.getAllItemIds().split(",");

			for(var k = 0; k < indices_grilla.length ; k++){						
					
					//### voy sumando el subtotal sin iva
	 				iCantPedida = parseFloat(mygrid_.cells(indices_grilla[k],1).getValue());
	 				if(iCantPedida == 'undefined' || isNaN(iCantPedida) ){ iCantPedida = 0; }

	 				fPrecio = parseFloat(mygrid_.cells(indices_grilla[k],2).getValue());	 				
					if(fPrecio == 'undefined' || isNaN(fPrecio) ){ fPrecio = 0; }								
					fSubTotal = parseFloat(fPrecio * iCantPedida);
					
					if(fSubTotal == 'undefined' || isNaN(fSubTotal) ){ fSubTotal = 0; }

					fTotal = fTotal + fSubTotal;
					mygrid_.cells(indices_grilla[k],3).setValue(fSubTotal.toString());
			}
    	}catch(e){
			//alert('Hola');
		}	
		document.getElementById("sTotal").value = fTotal.toString();
	}
	
	function menuClickProductos(id) {
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
			             mygrid_.addRow(Filas,['','0','0','0.0'],idCell);					           						 mygrid_.selectRow(idCell);			
			             /*var bCompleto = true;
			            
			             if(idCell>=1){
			             	idCellAnterior = idCell;
			             	alert(idCellAnterior);
			             	var sDesc = mygrid_.cells(idCellAnterior,0).getValue();
			             	 alert(sDesc);
			             	var iCantAnt = mygrid_.cells(idCellAnterior,1).getValue();
			             	var fPrecioAnt = mygrid_.cells(idCellAnterior,2).getValue();
			             	if((sDesc == "")||(iCantAnt == "")||(fPrecioAnt == ""))
			             		bCompleto = false;
			             	else
			             		bCompleto = true;
			             }
			             
			             if(bCompleto){			              
			             	mygrid_.addRow(Filas,['','0','0','0.0'],idCell);					             					mygrid_.selectRow(idCell);					          
			             }else{
			             	alert("Complete los datos del Articulo");
			             }*/
					             
				    break;} 
				case 'idGuardar':{saveDatos_(); break;}
				case 'idBorrar':{ mygrid_.deleteSelectedRows(); break; }
				case 'idPrint':{alert('En Construccion');break;}				
				
			}
		
		return true;
	}

	
	function BuscarCliente(){
		var sBuscar = z.getSelectedValue();
		xajax_buscarCliente(sBuscar);
	}
	
	function saveDatos_(){
		myDataProcessor_.sendData();
	}
	
	
	function setDatosFormPedido(idPedido_){
		var Formu = document.forms['form'];			
		Formu.idPedido.value = idPedido_;		
		Formu.type.value = "EDIT";
		mygrid_.loadXML("xmlProductos.php?idPedido=" + idPedido_); 		
		mygrid_.init();
	}
	
	function calcularTotal(){
		fTotal = 0;
		var iFilas = mygrid_.getRowsNum() + 1;
		
    	for(i=1; i<iFilas; i++){    		
	    	fSubTotal = parseFloat(mygrid_.cells(i,3).getValue().replace(",","."));
	    	//alert(fSubTotal);
    		fTotal = fTotal + fSubTotal;
    	}
		document.getElementById("sTotal").value = fTotal.toString();
	}
	
	 function showVentana(){
    	  var idCliente = document.getElementById("idCliente").value;
    	  var sCredito = document.getElementById("sCredito").value;
    	  //alert(idCliente);
    	  var win = new Window(
    	  {className: "alphacube", 
		  title:'<b>Modificacon del Credito del Cliente</b>', 
		  width:400, 
		  height:130, 
		  top:400, 
		  left:200, 
		  url:'updateCredito.php?idCliente='+idCliente+'&sCredito='+sCredito,
		  showEffect:Element.show,
		  hideEffect:Element.hide
		  }); 
		  win.toFront();
		 
		  win.show();  
    }
    
    function guardar_aprobarProforma(){
		if(!validarDatosForm(form))
		{
			return;
		}
		viewMessageLoad('divMessageOperacion');	
		var Formu = document.forms['form'];			
		switch(Formu.type.value){
		case "NEW":
			mygrid_.parentFormOnSubmit(); //enviamos la lista para que guarde los datos			
			break;
		case "EDIT":		
		    myDataProcessor_.sendData();
		    break;			  				
		}
			
		xajax_updateDatosPedidos(xajax.getFormValues('form'),'2');
    }
    
    function aprobarProforma(){
    	if(confirm("¿Desea Aprobar la Proforma del Cliente?")){
    		var Formu = document.forms['form'];			
			
			if(Formu.type.value == "EDIT"){    		
    			xajax_cambiarEstadoProforma(xajax.getFormValues('form'),'2');
			}else{
    		
	    		if(!validarDatosForm(form))
				{
					return;
				}
				viewMessageLoad('divMessageOperacion');	
				var Formu = document.forms['form'];			
				switch(Formu.type.value){
				case "NEW":
					mygrid_.parentFormOnSubmit(); //enviamos la lista para que guarde los datos			
					break;
				case "EDIT":		
				    myDataProcessor_.sendData();
				    break;			  				
				}
					
				xajax_updateDatosPedidos(xajax.getFormValues('form'),'2');
    		}
    	}
    }
    
</script>


