
	<div id="GrillaGeneral">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:40px"><strong>Administrar Agencias</strong></td>
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
		<input type="hidden" id="idAgencia" name="idAgencia" value="{ID_AGENCIA}" />
		<input type="hidden" id="sImagen" name="sImagen" value="" />		
		
		<fieldset style="background:#F5F5F5;">
		<legend>Datos de la Agencia:</legend>	
		<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" width="100%">
		<tr>
			<td valign='top'>
				<table cellpadding='5' cellspacing='5' width='100%' class='TablePermits'>
				<tr>
					<td width='100'>(*)Nombre:</td>
					<td><input type='text' name='sNombre' id='sNombre' style='width:200px;'/></td>
				</tr>		
					<tr>
					<td>CUIT:</td>
					<td><input type='text' name='sCuit' id='sCuit' style='width:200px;'/></td>
				</tr>				
				<tr>
					<td>Direccion:</td>
					<td><input type='text' name='sDomicilio' id='sDomicilio' style='width:200px;'/></td>
				</tr>					
				<tr>
					<td>E-mail:</td>
					<td><input type='text' name='sMail' id='sMail' style='width:200px;'/></td>
				</tr>					
				<tr>
					<td>Telefono:</td>
					<td><input type='text' name='sTelefono' id='sTelefono' style='width:200px;'/></td>
				</tr>					
				<tr>						
					<td align='left' colspan='2'>
						<input type='hidden' name='id' id='id' value='{id}'>
						<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
					</td>
				</tr>	
				</table>
			</td>
			<td valign='top'>
				<table cellpadding='0' cellspacing='0' style="width:100%;height:160px"  border='0' class='TablePermits'>					
					<tr>
				    	<th align="left"> Imagen: </th>  				
					</tr>    
					<tr>
						<td style="border:1px solid #000" align="center">
							<img id='imgAgencia' name='imgAgencia' src="../includes/images/internas/no_image.gif" alt="" style="border:0px;width:290px;height:160px" />
						</td>
					</tr>
					<tr>
						<td>
							<input type='button' name='cmd_Upload' value='Subir Imagen' onclick="uploadImagen('sImagen','agencias');" />
						</td>
					</tr>				
			    </table>
			</td>
		</tr>			
		</table>
		</form>
		</fieldset>	
		
		</div>

<script>
   mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Nombre,Domicilio,Telefono,Cuit,E-mail";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("200,150,100,100,150");
	mygrid.setColAlign("left,left,center,center,left");
	
	mygrid.setColTypes("ro,ed,ed,ed,ed");
	
    var sColumnas="sNombre,sDomicilio,sTelefono,sCuit,sEmail";
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
	
	function sendForm(form){
		if(!validarDatosForm(form))
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');		
		//alert('paso');
		xajax_updateDatosAgencias(xajax.getFormValues('form'));
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
		Formu.idAgencia.value = 0;
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		document.getElementById("imgAgencia").src = "../includes/images/internas/no_image.gif";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
		
	function uploadImagen(sTipo,sTabla){
    	  var Formu = document.forms['form'];	
    	  var id = Formu.idAgencia.value;    	 
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