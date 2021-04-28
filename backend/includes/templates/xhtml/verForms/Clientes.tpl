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

<div style='text-align:left;margin-left:5px;'>
<form id="form" method="POST" action="" name='form'>
<input type="hidden" id="idCliente" name="idCliente" value="{ID_CLIENTE}" />

<table width="100%" style='background:#FFF url(../includes/images/bg_lines.gif) repeat-x;'>
<tr>
<td width="100%">
	  	   <div class="titlePage">
               Administraci&oacute;n de Clientes
           </div>
           <div id='divMessageOperacion' style='text-align:left;'>- Mensaje Operacion</div>	
            <div class="form">
            <table id="TableABM" cellpadding="0" cellspacing="5" border="0">
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
                    <td>(*)DNI:</td>
                    <td>
                        <input type="text" id="sDni" name="sDni" style="width:150px" />
                    </td>
                    <td>E-Mail:</td>
                    <td>
                        <input type="text" id="sMail" name="sMail" style="width:250px" />
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
                        <input type="text" id="sTelefono" name="sTelefono" style="width:150px" />
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
                	<td colspan="2">&nbsp;</td>
                </tr>
				<tr>	
					<td colspan='4' align='left'>
					<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
					</td> 
				</tr>
	</table>
	
	<input type="hidden"  value="0" name="idKey" id="idKey"/>
	<input type="hidden"  value="{sTABLA}" name="sTABLA" id="sTABLA"/>
	</form>
</td>
</tr>
</table>

</div>



<script>
{JAVASCRIPT_ADICIONAL}

	var mCal,cal1;
	window.onload = function() {
    	cal1 = new dhtmlxCalendarObject('calendar1');
    	cal1.setOnClickHandler(selectDate1);
    }
	function selectDate1(date) {
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
	var flds = "Codigo,Nombre,Apellido,Domicilio,Telefono,Barrio";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("50,200,130,200,80,130");
	mygrid.setColAlign("left,left,left,left,center,left");
	
	mygrid.setColTypes("ro,ed,ed,ed,ed,ed");
	
    var sColumnas="sCodigo,sNombre,sApellido,sDomicilioParticular,sTelefono,sBarrio";
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,str,str");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white");
	mygrid.setMultiLine(false);

	{SCRIPT_TIPOS_IVAS} //echo $sTiposIvas;
	
	//mygrid.setMathRound(2);
    //mygrid.enableMathEditing(true);
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xml.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    
    myDataProcessor.enableDataNames('true');
    
    /*myDataProcessor.setVerificator(0,checkIfNotZero);
    myDataProcessor.setVerificator(1,checkIfNotZero);
    myDataProcessor.setVerificator(2,checkIfNotZero);*/
    
  
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
	   	viewMessageLoad('divMessageOperacion');			
		xajax_CargarDatosCliente(id);	
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
		xajax_CargarDatosCliente(idCell);	
		/*myDataProcessor_.setUpdated(3,true);
		myDataProcessor_.setUpdated(4,true);
		myDataProcessor_.setUpdated(5,true);
		myDataProcessor_.setUpdated(9,true);
		myDataProcessor_.setUpdated(10,true);
		
		{SAVEDATA}*/
	}
	
	{KEYBOARD}

	function validarDatosForm(form){
		var errores = "";
		with (form){
			if (sNombre.value == ""){
				errores += "- El campo Nombre es requerido.\n";
			}	
			if (sApellido.value == ""){
				errores += "- El campo Apellido es requerido.\n";
			}	
			if (sDni.value == ""){
				errores += "- El campo DNI es requerido.\n";
			}
			if (sDomicilioParticular.value == ""){
				errores += "- El campo Direccion Particular es requerido.\n";
			}	
	        if (idLocalidad.value == "0"){
	        	errores += "- El campo Localidad es requerido.\n";
	        }
			if (sCredito.value == ""){
				errores += "- El campo Credito Total es requerido";
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
		xajax_updateDatosClientes(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		resetDatosForm();		
		//mygrid.setColTypes("ed,ed,ed,ed,ed");
		mygrid.updateFromXML("xml.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idProvincia.value = 8162;
		Formu.idLocalidad.value = 8163;
		Formu.idCliente.value = 0;		
		document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
	
	InputMask('dFechaNac',"99/99/9999");
	
	function showCredito(){
		
	}
</script>


