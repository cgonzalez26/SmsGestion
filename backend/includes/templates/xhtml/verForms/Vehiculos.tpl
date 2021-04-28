
	<div id="GrillaGeneral">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:40px"><strong>Administrar Vehiculos</strong></td>
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
		<input type="hidden" id="idVehi" name="idVehi" value="{ID_VEHICULO}" />
		<input type="hidden" id="sImagen" name="sImagen" value="" />		
		
		<fieldset style="background:#F5F5F5;">
		<legend>Datos del Vehiculo:</legend>	
		<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
		<tr>
			<td valign='top'>
				<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
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
				<tr>
					<td>(*)Puertas:</td>
					<td><input type='text' name='iPuertas' id='iPuertas' style='width:200px;'/></td>
				</tr>
				<tr>
					<td>(*)A&ntilde;o:</td>
					<td><input type='text' name='iAnio' id='iAnio' style='width:200px;'/></td>
				</tr>
				<tr>
					<td>(*)Precio:</td>
					<td><input type='text' name='fPrecio' id='fPrecio' style='width:200px;'/></td>
				</tr>	
				</table>
			</td>
			<td valign="top">
				<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
				<tr>
					<td>(*)Vendedor:</td>
					<td><select name='idAgencia' id='idAgencia' style='width:200px;'>
							{OPCIONES_AGENCIAS}
						</select></td>
				</tr>	
				<tr>
					<td>(*)Color:</td>
					<td><select name='idColor' id='idColor' style='width:200px;'>
							{OPCIONES_COLORES}
						</select></td>
				</tr>
				<tr>
					<td>(*)Combustible:</td>
					<td><select name='idCombustible' id='idCombustible' style='width:200px;'>
							{OPCIONES_COMBUSTIBLES}
						</select>
					</td>
				</tr>		
				<tr>
					<td width='100'>Direcci&oacute;n:</td>
					<td><select name='idDireccion' id='idDireccion' style='width:200px;'>
							{OPCIONES_DIRECCIONES}
						</select>
					</td>
				</tr>	
				<tr>
					<td>Transmisi&oacute;n:</td>
					<td><select name='idTransmision' id='idTransmision' style='width:200px;'>
							{OPCIONES_TRANSMISIONES}
						</select>
					</td>
				</tr>		
				<tr>
					<td>Kms:</td>
					<td><input type='text' name='iKms' id='iKms' style='width:200px;'/></td>
				</tr>		
			
				</table>
			</td>
			<td>
				<table cellpadding='0' cellspacing='0' style="width:100%;height:160px"  border='0' class='TablePermits'>					
					<tr>
				    	<th align="left"> Imagen: </th>  				
					</tr>    
					<tr>
						<td style="border:1px solid #000" align="center">
							<img id='imgVehiculo' name='imgVehiculo' src="../includes/images/internas/no_image.gif" alt="" style="border:0px;width:220px;height:120px" />
						</td>
					</tr>
					<tr>
						<td>
							<input type='button' name='cmd_Upload' value='Subir Imagen' onclick="uploadImagen('sImagen','vehiculos');" />
						</td>
					</tr>				
			    </table>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<fieldset style="background:#F5F5F5;">
			<legend>Confort:</legend>	
			<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits'>
				<tr>
					<td width="33%"><input type="checkbox" id="confort_1" name="confort_1" value="1"/>Aire acondicionado</td>
					<td width="33%"><input type="checkbox" id="confort_2" name="confort_2" value="1"/>Alarma de luces encendidas </td>
					<td><input type="checkbox" id="confort_3" name="confort_3" value="1"/>Apertura remota de ba&uacute;l</td>
				</tr>	
				<tr>
					<td width="33%"><input type="checkbox" id="confort_4" name="confort_4" value="1"/>Asiento conductor regulable en altura</td>
					<td><input type="checkbox" id="confort_5" name="confort_5" value="1"/>Asiento trasero rebatible</td>
					<td><input type="checkbox" id="confort_6" name="confort_6" value="1"/>Asientos el&eacute;ctricos</td>
				</tr>	
				<tr>
					<td width="33%"><input type="checkbox" id="confort_7" name="confort_7" value="1"/>Cierre centralizado de puertas</td>
					<td><input type="checkbox" id="confort_8" name="confort_8" value="1"/>Climatizador autom&aacute;tico</td>
					<td><input type="checkbox" id="confort_9" name="confort_9" value="1"/>Computadora de abordo</td>
				</tr>	
				<tr>
					<td width="33%"><input type="checkbox" id="confort_10" name="confort_10" value="10"/>Control de velocidad de crucero</td>
					<td><input type="checkbox" id="confort_11" name="confort_11" value="11"/>Cristales el&eacute;ctricos</td>
					<td><input type="checkbox" id="confort_12" name="confort_12" value="1"/>Espejos el&eacute;ctricos</td>
				</tr>	
				<tr>
					<td width="33%"><input type="checkbox" id="confort_13" name="confort_13" value="13"/>Faros regulables desde el interior</td>
					<td><input type="checkbox" id="confort_14" name="confort_14" value="14"/>GPS</td>
					<td><input type="checkbox" id="confort_15" name="confort_15" value="1"/>Sensor de estacionamiento</td>
				</tr>	
				<tr>
					<td><input type="checkbox" id="confort_16" name="confort_16" value="1"/>Sensor de lluvia</td>
					<td><input type="checkbox" id="confort_17" name="confort_17" value="1"/>Sensor de luz</td>
					<td><input type="checkbox" id="confort_18" name="confort_18" value="1"/>Tapizado de cuero</td>
				</tr>	
				<tr>					
					<td><input type="checkbox" id="confort_19" name="confort_19" value="1"/>Techo corredizo</td>
					<td></td>
					<td></td>		
				</tr>				
			</table>	
		    </fieldset>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<fieldset style="background:#F5F5F5;">
			<legend>Seguridad:</legend>	
			<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits'>			
			<tr>
				<td width="33%"><input type="checkbox" id="seg_1" name="seg_1" value="1"/>Airbag conductor</td>
				<td width="33%"><input type="checkbox" id="seg_2" name="seg_2" value="2"/>Airbag de cortina</td>
				<td><input type="checkbox" id="seg_3" name="seg_3" value="3"/>Airbag laterales</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="seg_4" name="seg_4" value="1"/>Airbag pasajero</td>
				<td><input type="checkbox" id="seg_5" name="seg_5" value="2"/>Alarma</td>
				<td><input type="checkbox" id="seg_6" name="seg_6" value="3"/>Apoya cabeza en asientos traseros</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="seg_7" name="seg_7" value="1"/>Blindado</td>
				<td><input type="checkbox" id="seg_8" name="seg_8" value="1"/>Control de estabilidad</td>
				<td><input type="checkbox" id="seg_9" name="seg_9" value="1"/>Control de tracci&oacute;n</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="seg_10" name="seg_10" value="1"/>Doble tracci&oacute;n</td>
				<td><input type="checkbox" id="seg_11" name="seg_11" value="1"/>Faros antinieblas delanteros</td>
				<td><input type="checkbox" id="seg_12" name="seg_12" value="1"/>Faros antinieblas traseros</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="seg_13" name="seg_13" value="1"/>Frenos ABS</td>
				<td><input type="checkbox" id="seg_14" name="seg_14" value="1"/>Inmovilizador de motor</td>
				<td><input type="checkbox" id="seg_15" name="seg_15" value="1"/>Isofix</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="seg_16" name="seg_16" value="1"/>Repartidor electr&oacute;nico de fuerza de frenado</td>
				<td><input type="checkbox" id="seg_17" name="seg_17" value="1"/>Tercer stop</td>
				<td></td>
			</tr>			
			</table>
		</td>
		</tr>			
		<tr>
			<td colspan="3">
			<fieldset style="background:#F5F5F5;">
			<legend>Exterior:</legend>	
			<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits'>			
			<tr>
				<td width="33%"><input type="checkbox" id="ext_1" name="ext_1" value="1"/>Paragolpes pintados</td>
				<td width="33%"><input type="checkbox" id="ext_2" name="ext_2" value="1"/>Vidrios polarizados</td>
				<td></td>
			</tr>
			</table>
			</td>
		</tr>
		<tr>
			<td colspan="3">
			<fieldset style="background:#F5F5F5;">
			<legend>Sonido:</legend>	
			<table cellpadding='0' cellspacing='0' width='100%' class='TablePermits'>			
			<tr>
				<td width="33%"><input type="checkbox" id="sonido_1" name="sonido_1" value="1"/>Radio AM/FM</td>
				<td width="33%"><input type="checkbox" id="sonido_2" name="sonido_2" value="1"/>Cargador de CD</td>
				<td><input type="checkbox" id="sonido_3" name="sonido_3" value="1"/>Comando satelital de stereo</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="sonido_4" name="sonido_4" value="1"/>DVD</td>
				<td><input type="checkbox" id="sonido_5" name="sonido_5" value="1"/>Entrada auxiliar</td>
				<td><input type="checkbox" id="sonido_6" name="sonido_6" value="1"/>Entrada USB</td>
			</tr>
			<tr>
				<td><input type="checkbox" id="sonido_7" name="sonido_7" value="1"/>MP3</td>
				<td><input type="checkbox" id="sonido_8" name="sonido_8" value="1"/>Pasacassette</td>
				<td><input type="checkbox" id="sonido_9" name="sonido_9" value="1"/>Tarjeta SD</td>
			</tr>
			</table>
			</td>
		</tr>		
		<tr>						
			<td align='left' colspan='3'>
				<input type='hidden' name='id' id='id' value='{id}'>
				<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
				<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
			</td>
		</tr>	
		</table>		
		</fieldset>
	</div>	
	<script>
	{JAVASCRIPT_ADICIONAL}
   mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Modelo,Marca,Kms,Combustible,Precio";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("200,150,100,100,150");
	mygrid.setColAlign("left,left,center,center,left");
	
	mygrid.setColTypes("ro,ro,ro,ro,ro");
	
    var sColumnas="sModelo,sMarca,iKms,sCombustible,fPrecio";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,str");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	mygrid.setMultiLine(false);
	
	//mygrid.setMathRound(2);
    //mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlVehiculos.php");
	   	
	myDataProcessor = new dataProcessor("processVehiculos.php");
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
		xajax_cargarDatosVehiculo(id);	
	}
	
    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_black');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	menu.addNewSibling(null,"idNuevo", "", false, "");	
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	menu.attachEvent("onClick", menuClick);
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
	
	function validarDatosForm(form){
		var errores = "";
		with (form){
			if (idVehiculo.value == "0"){
				errores += "- El campo Vehiculo es requerido.\n";
			}	
			if (idTipoVehiculo.value == "0"){
				errores += "- El campo Tipo es requerido.\n";
			}	
			if (idMarca.value == "0"){
				errores += "- El campo Marca es requerido.\n";
			}
			if (idModelo.value == "0"){
				errores += "- El campo Modelo es requerido.\n";
			}
			if (iPuertas.value == ""){
				errores += "- El campo Puertas es requerido.\n";
			}        
			if (iAnio.value == ""){
				errores += "- El campo Año es requerido.\n";
			} 
			if (fPrecio.value == ""){
				errores += "- El campo Precio es requerido.\n";
			} 
			if (idAgencia.value == "0"){
				errores += "- El campo Vendedor es requerido.\n";
			} 
			if (idColor.value == "0"){
				errores += "- El campo Color es requerido.\n";
			} 
			if (idCombustible.value == "0"){
				errores += "- El campo Combustible es requerido.\n";
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
		//viewMessageLoad('divMessageOperacion');		
		//alert('paso');
		xajax_updateDatosVehiculo(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xmlVehiculos.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idVehi.value = 0;
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
	    document.getElementById("imgVehiculo").src = "../includes/images/internas/no_image.gif";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}

	function chooseLocation(idMarca,idMarcaModelo){
		//alert(idMarcaModelo);
		document.getElementById('idMarca').value = idMarca;
		document.getElementById('idMarca').onchange();
		document.getElementById('idModelo').value = idMarcaModelo;
	}
	
	function uploadImagen(sTipo,sTabla){
    	  var Formu = document.forms['form'];	
    	  var id = Formu.idVehi.value;    	 
    	  var win = new Window(
			    	  {className: "alphacube", 
					  title:'<b>Subir Imagen</b>', 
					  width:350, 
					  height:200, 
					  top:50, 
					  left:60, 
					  url:'upImagen.php?idT='+id+'&tipo='+sTipo+'&sTabla='+sTabla,
					  showEffect:Element.show,
					  hideEffect:Element.hide
					  }); 
		  win.toFront();	 
		  win.showCenter(); 		  
		  return;	
    }    
	</script>