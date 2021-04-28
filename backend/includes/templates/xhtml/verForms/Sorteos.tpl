<body style="background-color:#FFFFFF">

<form id="form" method="POST" action="" name='form'>
<input type="hidden" id="hdnDesde" name="hdnDesde" value="" />
<input type="hidden" id="hdnHasta" name="hdnHasta" value="" />
<input type="hidden" id="hdnTexto" name="hdnTexto" value="" />

<div id="GrillaGeneral" style='padding-left:10px;' align="left">
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/menu/icon-16-smsReceived.png" border="0" />&nbsp;&nbsp;<strong>Sorteos</strong></td>
		</tr>
	</table>	
	<table width="990" cellpadding="0" cellspacing="0" border="0">
	<!--<tr>
		<td align="left" colspan="2">
		
		</td>
	</tr>-->
	<tr>
		<td>
			<fieldset style="background:#F5F5F5;margin-bottom: 0px;width:690px">
			<legend>Filtrar Mensajes:</legend>
			  <table cellpadding="0" class='TablePermits' cellspacing="5" border="0" width="ANCHO_GRILLA">
			  <tr>
			  	<td>Desde:</td>
			  	<td><input type="text" id="dDesde" name="dDesde" value="" style="width:150px" /></td>
			  	<td>Hasta:</td>
			  	<td><input type="text" id="dHasta" name="dHasta" value="" style="width:150px" /></td>
			  	<td>Texto:</td>
			  	<td><input type="text" id="sTexto" name="sTexto" value="" style="width:150px" /></td>
			  	<td><input type="button" name='cmd_Buscar' id='cmd_Buscar' value='Buscar' style="width:80px" onclick="buscarMensajes();" class="button" /></td>
			  </tr>
			  </table>
			</fieldset>
			<table width="{ANCHO_GRILLA}" align="center">
				<tbody>
					<tr>         
						<td align="center">
						    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
							<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:400px; font-size:20pt;"></div>
							<div style="background:#000000;" align="left"> 
						</div>
						</td>
					</tr>
				</tbody>		
			</table>
		</td>
		<td style="width:10px"></td>
		<td style="width:330px" valign="top">
			<fieldset style="background:#F5F5F5;height:475px;">
			<legend>Sorteos :</legend>
			<input type="hidden" id="idContacto" name="idContacto" value="0" />
			<input type="hidden" id="idMensaje" name="idMensaje" value="0" />
			
				<div class="form">
		            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0" width="100%">
					<tbody>
						<tr>
							<td align="center" colspan="2" height="20"><input type="hidden" value="1" name="frm_enviorapido">
								<input type="button" name='cmd_Sortear' id='cmd_Sortear' value='Sortear' style="width:80px" onclick="sortear(this);" class="button"/>
								<input type="button" id="cmd_Agregar" name='cmd_Agregar' id='cmd_Agregar' value='Agregar Contacto' style="display:none;width:120px" onclick="abrirAgregarContacto()" />
								<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
							</td>
						</tr>
						<tr>
							<td>
							 <table id="tablaSorteo" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;" class='TablePermits'>
							 <thead>
							 <tr><td style="border:1px solid black">Contacto</td>
							 	<td style="border:1px solid black">Movil</td>
							 </tr>
							</thead>
							<tbody id="tbDetalle">
							</tbody>
							<!-- <tr>
							 	<td id="" colspan="2" style="border:1px solid black">
							 		<table id="tblGanadores" cellpadding="0" cellspacing="0" width="100%" style="border-collapse:collapse;">
							 		
							 		</table>
							 	</td>
							 </tr>-->
							 </table>
							</td>
						</tr>
					</tbody>
					</table>
		
		           </div>
	        </fieldset>  
		</td>
	</tr>
	</table>	
</div>
</form>
<script>
InputMask('dDesde',"99/99/9999");
InputMask('dHasta',"99/99/9999");

    mygrid = new dhtmlXGridObject('gridbox');
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	
	var flds = "id,idContacto,Apellido,Nombre,Movil,Fecha,Mensaje";
	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("1,1,100,150,120,130,200");	
	mygrid.setColAlign("left,left,left,left,left,left,left");		
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro,ro");
	
    var sColumnas="id,idContacto,sApellido,sNombre,sDestinatario,dFecha,sMensaje";
    
	mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("int,int,str,str,str,str,str");
	mygrid.attachHeader(",,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	
	mygrid.setMultiLine(false);	
	
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	//mygrid.loadXML("xmlRecibidos.php");
	   	
	myDataProcessor = new dataProcessor("process.php");
    myDataProcessor.enableDataNames('true');
    myDataProcessor.setUpdateMode("on");
    myDataProcessor.defineAction("error",myErrorHandler);
    myDataProcessor.setTransactionMode("GET");
    myDataProcessor.init(mygrid);

    mygrid.attachEvent("onEnter",doOnEnter);
    mygrid.attachEvent("onRowSelect",doOnEnter);
    
    function doOnEnter(id){
    	var idMensaje = mygrid.cells(id,0).getValue();
		var idContacto = mygrid.cells(id,1).getValue();
		var sMovil = mygrid.cells(id,4).getValue();
		var Formu = document.forms['form'];	
		Formu.idMensaje.value = idMensaje;
		Formu.cmd_Cancelar.style.display = "inline";//ocultamos el boton cancelar
		Formu.cmd_Enviar.style.display = "inline";//seteamos el boton nuevo
		Formu.cmd_Agregar.style.display = "inline";
		xajax_getDatosContacto(idContacto,sMovil);
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
	}
	
	function validarDatosForm(){
		var errores = "";
		var form = document.forms['form'];
		with (form){
			if (sMovil.value == ""){
				errores += "- El campo Numero es requerido.\n";
			}	
			if (sMensaje.value == ""){
				errores += "- El campo Mensaje es requerido.\n";
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
		xajax_enviarSMSRapido(xajax.getFormValues('form'));
	}	
	
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xmlRecibidos.php"); 
		mygrid.init();		
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		mygrid.attachHeader(",,#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idContacto.value = 0;		
		document.getElementById("sContacto").innerHTML = "";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Enviar.style.display = "none";//seteamos el boton nuevo
		Formu.cmd_Agregar.style.display = "none";//seteamos el boton nuevo
	}
	
	function refreshGrilla(){
		//alert();
		mygrid.updateFromXML("xmlRecibidos.php"); 
		mygrid.init();		
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		mygrid.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	}	
	//window.setInterval("refreshGrilla()",30000); //refresca la grilla cada 30seg, 1seg=1000
	
	function buscarMensajes(){
		
		var dDesde = document.getElementById("dDesde").value;
		var dHasta = document.getElementById("dHasta").value;
		var sTexto = document.getElementById("sTexto").value;

		document.getElementById("hdnDesde").value = dDesde,
		document.getElementById("hdnHasta").value = dHasta;
		document.getElementById("hdnTexto").value = sTexto;
		
		mygrid.clearAll();
		mygrid.loadXML("xmlRecibidos.php?dDesde="+dDesde+"&dHasta="+dHasta+"&sTexto="+sTexto); 
		mygrid.init();		
		mygrid.attachHeader(",#text_filter,#text_filter,#text_filter,#text_filter,#text_filter");
	}
	
	function sortear(){
		if( mygrid.getRowsNum() == undefined || mygrid.getRowsNum() ==0){
			alert("No hay contactos para sortear, revise por favor.");
			return;
		}
		xajax_obtenerGanador(xajax.getFormValues('form'));
	}
	
	/*jQuery(document).ready(function(){
	jQuery.fn.mifuncion = function(mensaje) {
    alert(mensaje);
	};
 
	jQuery('body').mifuncion ('imprimir mensaje');
	});*/
</script>