<body style="background-color:#FFFFFF">

<div id="GrillaGeneral">
<table width="{ANCHO_GRILLA}" align="center">
<tbody>
		<tr>
         
			<td align="center">
			    <div style="width:{ANCHO_GRILLA};"  id="iDivMenu"></div>
				<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #000000; background-color:white;height:250px; font-size:20pt;"></div>
			</td>
		</tr>
	
</tbody>		
		
</table>
</div>


<div style='text-align:left;margin-left:5px;'>
<form id="form" method="POST" action="" name='form'>
<input type="hidden" id="idProveedor" name="idProveedor" value="{ID_PROVEEDOR}" />

<table width="100%" style='background:#FFF url(../includes/images/bg_lines.gif) repeat-x;'>
<tr>
<td width="100%">
	  	   <div class="titlePage">
               Administraci&oacute;n de Proveedores
           </div>
           <div id='divMessageOperacion' style='text-align:left;'>- Mensaje Operacion</div>	
            <div class="form">
            <table id="TableABM" cellpadding="0" cellspacing="5" border="0">
                <tr>
                    <td style="width:140px">(*)Nombre:</td>
                    <td>
                        <input type="text" id="sNombre" name="sNombre" style="width:250px" />
                    </td>
                     <td>CUIT:</td>
                    <td>
                        <input type="text" id="sCuit" name="sCuit" style="width:250px" />
                    </td>
                </tr>                          
                <tr>
                    <td>Direcci&oacute;n:</td>
                    <td>
                        <input type="text"  id="sDomicilio" name="sDomicilio" style="width:250px" />
                    </td> 
                    <td>Telefono:</td>
                    <td>
                        <input type="text" id="sTelefono" name="sTelefono" style="width:250px" />
                    </td>
                </tr>   
                 <tr>
                    <td>Tipo IVA:</td>
                    <td>
                      <select id="idTipoIva" name="idTipoIva" style="width:150px;">{TIPOS_IVA}</select>
                    </td>
                    <td>E-Mail:</td>
                    <td>
                        <input type="text" id="sMail" name="sMail" style="width:250px" />
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

    mygrid = new dhtmlXGridObject('gridbox');
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Codigo,Nombre,CUIT,Domicilio,Telefono";
	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("80,300,100,200,100");
	mygrid.setColAlign("left,left,left,left,left");
	
	mygrid.setColTypes("ed,ed,ed,ed,ed");
	mygrid.setColumnIds("sCodigo,sNombre,sCuit,sDomicilio,sTelefono");

	mygrid.setColSorting("str,str,str,str,str");

	mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	mygrid.setMultiLine(false);
	mygrid.setSkin("xp");
	mygrid.init();
   	mygrid.loadXML("get.php");
	   	
	myDataProcessor = new dataProcessor("update.php");
    
    myDataProcessor.enableDataNames('true');
    
    //myDataProcessor.setVerificator(1)
    
    //myDataProcessor.setVerificator(3,checkIfNotZero)
    myDataProcessor.setUpdateMode("on");
    
    myDataProcessor.defineAction("error",myErrorHandler);
   
    myDataProcessor.setTransactionMode("GET");

    myDataProcessor.init(mygrid);

    function myErrorHandler(obj){
        alert("Error occured.\n"+obj.firstChild.nodeValue);
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
    
    
    
    function doOnRowSelected(id){
		viewMessageLoad('divMessageOperacion');			
		xajax_CargarDatosProveedor(id);	
	}

    var menu = new dhtmlXMenuObject("iDivMenu",'dhx_blue');//
	menu.setImagePath("../includes/grillas/dhtmlxMenu/sources/imgs/");
	menu.setIconsPath("../includes/grillas/dhtmlxMenu/sources/images/");	
	
	menu.addNewSibling(null,"idNuevo", "Nuevo", false, "new.gif");
	//menu.addNewSeparator("idRegistro", "s1");
	menu.addNewSibling("idNuevo", "idGuardar", "Guardar",false, "save.gif");
	menu.addNewSibling("idGuardar","idBorrar", "Borrar",false, "close2.gif");
	
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
					              
					             mygrid.addRow((new Date()).valueOf(),[],idCell);
				                              //mygrid.showRow(mygrid.getSelectedId());
				                              
				                              break;} 
				case 'idGuardar':{EnviarDatos(); break;}
				case 'idBorrar':{if(confirm('Realmente desea eliminar el/los registro/s seleccionados.?'))
					mygrid.deleteSelectedRows();break;}
				case 'idPrint':{mygrid.printViewLex('LISTADO DE PROVEEDORES');break;}
				//case 'idActualizar':{mygrid.updateFromXMl('get.php');break;}
				
			}
		
		return true;
	}

	function EnviarDatos(){
		myDataProcessor.sendData();
		/*myDataProcessor.setUpdated(3,true);
		myDataProcessor.setUpdated(4,true);
		myDataProcessor.setUpdated(5,true);
		myDataProcessor.setUpdated(9,true);
		myDataProcessor.setUpdated(10,true);
		
		{SAVEDATA}*/
	}

	function validarDatosForm(form){
		var errores = "";
		with (form){
			if (sNombre.value == ""){
				errores += "- El campo Nombre es requerido.\n";
			}	
	        if (idLocalidad.value == "0"){
	        	errores += "- El campo Localidad es requerido.\n";
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
		xajax_updateDatosProveedores(xajax.getFormValues('form'));
	}
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("get.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idProvincia.value = 8162;
		Formu.idLocalidad.value = 8163;
		Formu.idProveedor.value = 0;		
		document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
</script>


