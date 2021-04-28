	<div id="GrillaGeneral">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:40px"><strong>Administrar Pedidos</strong></td>
		</tr>
	</table>	
	
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
	
	<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
		<form id="form" method="POST" action="" name='form'>
		<input type="hidden" id="idPedido" name="idPedido" value="{ID_PEDIDO}" />	
		<fieldset style="background:#F5F5F5;">
			<legend>Datos de la Persona:</legend>	
			<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
			<tr>
				<td valign='top'>
					<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
					<tr>
						<td width='100'>(*)Nombre:</td>
						<td><input type='text' name='sNombre' id='sNombre' style='width:200px;'/></td>
					</tr>
					<tr>
						<td>(*)Telefono/Celular:</td>
						<td><input type='text' name='sTelefono' id='sTelefono' style='width:200px;'/></td>
					</tr>
					</table>
				</td>
				<td valign='top'>
					<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
					<tr>
						<td width='100'>(*)Apellido:</td>
						<td><input type='text' name='sApellido' id='sApellido' style='width:200px;'/></td>
					</tr>
					<tr>
						<td>(*)E-mail:</td>
						<td><input type='text' name='sMail' id='sMail' style='width:200px;'/></td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
		</fieldset>
		<fieldset style="background:#F5F5F5;">
			<legend>Datos del Vehiculo:</legend>		
			<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
			<tr>
				<td valign="top">	
					<table cellpadding='5' cellspacing='5' class='TablePermits' border="0" width="100%">
					<tr>
						<td width='100'>(*)Vehiculo:</td>
						<td><select name='idVehiculo' id='idVehiculo' style='width:200px;'>
								{OPCIONES_VEHICULOS}
							</select>
						</td>
					</tr>
					<tr>
						<td width='100'>(*)Tipo:</td>
						<td><select name='idTipoVehiculo' id='idTipoVehiculo' style='width:200px;'>
								{OPCIONES_TIPOVEHICULOS}
							</select>
						</td>
					</tr>
					<tr>
						<td width='100'>(*)Marca:</td>
						<td><select name='idMarca' id='idMarca' style='width:200px;'>
								{OPCIONES_MARCAS}
							</select>
						</td>
					</tr>	
					<tr>
						<td>(*)Modelo:</td>
						<td><select name='idModelo' id='idModelo' style='width:200px;'>
								{SCRIPT_MODELOS}
							</select>
						</td>
					</tr>
					</table>
				</td>
				<td valign="top">	
					<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
					<tr>
						<td width='100'>(*)A&ntilde;o:</td>
						<td><input type='text' name='iAnio' id='iAnio' style='width:200px;'/></td>
					</tr>
					<tr>
						<td>(*)Precio:</td>
						<td><input type='text' name='fPrecio' id='fPrecio' style='width:200px;'/></td>
					</tr>	
					<tr>
						<td>(*)Puertas:</td>
						<td><input type='text' name='iPuertas' id='iPuertas' style='width:200px;'/></td>
					</tr>
					<tr>
						<td>(*)Color:</td>
						<td><select name='idColor' id='idColor' style='width:200px;'>
								{OPCIONES_COLORES}
							</select></td>
					</tr>				
					</table>
				</td>
			</tr>
			</table>
		</fieldset>
	</div>
<script>
	mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Nombre,Telefono,E-mail,Vehiculo,Marca,Modelo";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("200,100,150,150,150,150");
	mygrid.setColAlign("left,left,left,left,left,left");
	
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro");
	
    var sColumnas="sNombre,sTelefono,sEmail,sVehiculo,sMarca,sModelo";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,str,str");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
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
        //alert("Error occured.\n"+obj.firstChild.nodeValue);
        //document.getElementById('iDivMessageCustomer').innerHTML = obj.firstChild.nodeValue ;
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
	   	//viewMessageLoad('divMessageOperacion');			
		xajax_cargarDatosAgencia(id);	
	}
	
	 var menu = new dhtmlXMenuObject("iDivMenu",'dhx_black');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "", false, "");	
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");	
	
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
				case 'idGuardar':{
					var idCell=mygrid.getSelectedId();
					EnviarDatos(idCell); 
					break;
				}
				case 'idBorrar':{
					if(confirm('Realmente desea eliminar el/los registro/s seleccionados.?'))
					mygrid.deleteSelectedRows();
					
					break;}
				case 'idPrint':{alert('En Construccion');break;}
				//case 'idActualizar':{mygrid_.updateFromXMl('get.php');break;}				
			}
		
		return true;
	}

	function EnviarDatos(idCell){
		myDataProcessor.sendData();
		resetDatosForm();
		//xajax_cargarDatosCliente(idCell);	
	}
</script>	