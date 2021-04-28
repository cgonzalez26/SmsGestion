<body style="background-color:#FFFFFF">
<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
	
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-grupo.png" border="0" style="width:16px;height:16px" />&nbsp;&nbsp;<strong>Administrar Grupos de Contactos</strong></td>
		</tr>
	</table>
	<table width="{ANCHO_GRILLA}" align="center">
	<tbody>
			<tr>
				<td align="center">
				    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
					<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>
					<div style="background:#000000;" align="left"> 
				</div>
				</td>
			</tr>
			
	</tbody>					
	</table>
</div>

<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idGrupo" name="idGrupo" value=0 />
	<fieldset style="background:#F5F5F5;">
	<legend>Datos del Grupo:</legend>
	
	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0">
		<tr>
		<td valign='top'>
			<table cellpadding='0' cellspacing='5' width='100%' class='TablePermits'>
			<tr>
				<td width='100'>Codigo:</td>
				<td><span id="sCodigo" name="sCodigo" /></td>
			</tr>
			<tr>
				<td>(*)Nombre:</td>
				<td><input type='text' name='sNombre' id='sNombre' style='width:200px;'/></td>
			</tr>					
			<tr>
				<td>Descripcion:</td>
				<td><textarea id="sDescripcion" name="sDescripcion" cols="90" rows="3"></textarea></td>
			</tr>					
			<tr>						
				<td align='left' colspan='2'>
					<input type='hidden' name='saveUser' id='saveUser' value=''>
					<input type='hidden' name='id' id='id' value='{id}'>
					<input type='hidden' name='permitUser' id='permitUser' value=''>
					
					<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm();" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
				</td>
			</tr>	
			</table>
		</td>
		</table>
				
		</td>
		</tr>
	</table>
	</fieldset>
	</form>

</div>
<script>

	
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "Codigo,Nombre,Descripcion";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("100,200,400");
	
	mygrid.setColAlign("left,left,left");	
	
	mygrid.setColTypes("ed,ed,co");
	
    var sColumnas="id,sNombre,sDescripcion";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,int");
	
	mygrid.attachHeader("#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	
	mygrid.setMultiLine(false);	
	
	mygrid.setMathRound(2);
    mygrid.enableMathEditing(true);
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

    mygrid.attachEvent("onEnter",doOnEnter);
    mygrid.attachEvent("onRowSelect",doOnEnter);
    
    function doOnEnter(id){
		xajax_getDatosGrupo(id);
	}
	
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
	
	menu.addNewSibling(null,"idNuevo", "", false, "");
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
		resetDatosForm__();
	}
	

	function validarDatosForm(){
		var errores = "";
		var form = document.forms['form'];
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

	
	function sendForm(){
		if(!validarDatosForm())
		{
			return;
		}
		//viewMessageLoad('divMessageOperacion');		
		xajax_updateDatosGrupo(xajax.getFormValues('form'));
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
		Formu.idGrupo.value = 0;		
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		document.getElementById("sCodigo").innerHTML = "";
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}

</script>