<body style="background-color:#FFFFFF">

<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-contact.png" border="0" />&nbsp;&nbsp;<strong>Administrar Contactos</strong></td>
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
	<input type="hidden" id="idContacto" name="idContacto" value=0 />
	<input type="hidden" id="sImagen" name="sImagen" value="" />		

	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Contacto:</legend>

	<table cellpadding='0' cellspacing='0' class='TablePermits' border="0" style="width:950px">
	<tr>
	<td valign="top">	  	 
            <div class="form">
            <table cellpadding="0" class='TablePermits' cellspacing="5" border="0">
                <tr>
                    <td style="width:80px">(*)Nombre:</td>
                    <td>
                        <input type="text" id="sNombre" name="sNombre" style="width:250px" />
                    </td>
                    <td>(*)Apellido:</td>
                    <td>                            
                        <input type="text" id="sApellido" name="sApellido" style="width:250px" />
                    </td>
                </tr>
                <tr>
                	<td>(*)Movil:</td>
                    <td>
                        <input type="text" id="sMovil" name="sMovil" style="width:250px" />
                    </td>
                    <td>Telefono:</td>
                    <td>
                        <input type="text" id="sTelefono" name="sTelefono" style="width:150px" />
                    </td>
                </tr>      
                <tr>
                	<td>Direcci&oacute;n :</td>
                    <td>
                        <input type="text"  id="sDireccion" name="sDireccion" style="width:250px" />
                    </td>
                    <td>E-Mail:</td>
                    <td>
                        <input type="text" id="sMail" name="sMail" style="width:250px" />
                    </td>
                </tr>
                <tr>
					<td>Grupo:</td>
					<td>
						<select name='idGrupo' id='idGrupo' style='width:200px;'>
							{optionsGrupos}
						</select>
					</td>
					<td>Fecha Nacimiento:</td>
					<td>
						<input type="text" id="dFechaNacimiento" name="dFechaNacimiento" style="width:150px" />
					</td>
				</tr>          
				<tr>	
					<td colspan='4' align='left'>
					<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
					</td> 
				</tr>
			</table>
		</td>
		<td align="left">
			<table cellpadding='0' cellspacing='0' class='TablePermits' style="width:150px;height:150px"  border='0'>							
			<tr>
			   	<th align="left"> Foto: </th>  				
				</tr>    
				<tr>
					<td style="border:1px solid #000" align="center">
						<img id='imgFoto' name='imgFoto' src="../includes/images/internas/sin_foto.jpg" alt="" style="border:0px;width:100px;height:100px" />
					</td>
				</tr>
				<tr>
					<td>
						<input type='button' name='cmd_Upload' value='Subir Imagen' onclick="uploadImagen();" />
					</td>
				</tr>
			</tr>	
		    </table>
		</td>
	</tr>
	</table>
	</fieldset>
	</form>
</div>

<script>	
	InputMask('dFechaNacimiento',"99/99/9999");

    mygrid = new dhtmlXGridObject('gridbox');    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");	
	var flds = "Codigo,Nombre,Apellido,Direccion, Mail, Telefono, Movil, Grupo";	
	mygrid.setHeader(flds);
	mygrid.setInitWidths("50,150,120,200,180,100,100,150");	
	mygrid.setColAlign("left,left,left,left,left,left,left,left");		
	mygrid.setColTypes("ed,ed,ed,ed,ed,ed,ed,co");	
    var sColumnas="id,sNombre,sApellido,sDireccion, sMail, sTelefono, sMovil, sNombreGrupoUsuario";    
	mygrid.setColumnIds(sColumnas);	
	mygrid.setColSorting("str,str,str,str,str,str,str,int");
	mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,#text_filter,#select_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white,#B5D6DF,white,#B5D6DF");
	
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
		//alert("Rows with id: "+id+" was selected by user");
		xajax_getDatosContacto(id);
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
	menu.addNewSibling("idBorrar", "idImportar", "Importar", false,"settings.gif");
	
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
				case 'idImportar':{
					createWindows('Importar.php','Importar Contactos','1','1');
					break;
				}	
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
			if(sNombre.value == ""){
				errores += "- El campo Nombre es requerido.\n";
			}	
			if(sApellido.value == ""){
				errores += "- El campo Apellido es requerido.\n";
			}	
			if(sMovil.value == ""){
				errores += "- El campo Movil es requerido";
			}
			if(sMail.value != ""){					
				if(!eMail.test(sMail.value)){
					smsError += '- E-Mail  Invalido \n';		
				}
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
		xajax_updateDatosContacto(xajax.getFormValues('form'));
	}	
	
	function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xml.php"); 
		mygrid.init();				
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,#text_filter,,#text_filter,#select_filter");
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idContacto.value = 0;		
		//document.getElementById("divMessageOperacion").innerHTML = "- Mensaje Operacion";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}
	
	
function doOnLoad() {
    dhxWins1 = new dhtmlXWindows();
    dhxWins1.enableAutoViewport(false);
    dhxWins1.attachViewportTo("dhtmlx_wins_body_content");
    dhxWins1.setImagePath("../../codebase/imgs/");
}
var dhxWins1;
function createWindows(sUrl,sTitulo,idProyecto_,tipo_){
    var idWind = "window_"+idProyecto_+"_"+tipo_;
	//if(!dhxWins.window(idWind)){
     	dhxWins1 = new dhtmlXWindows();     	
	    dhxWins1.setImagePath("../includes/grillas/dhtmlxWindows/sources/imgs/");	  
	    _popup_ = dhxWins1.createWindow(idWind, 350, 100, 550, 340);
	    _popup_.setText(sTitulo);
	    ///_popup_.center();
	    _popup_.button("close").attachEvent("onClick", closeWindows);
		_url_ = sUrl;
	    _popup_.attachURL(_url_);
	//}
} 

function closeWindows(_popup_){
	_popup_.close();
	recargar();
	//parent.dhxWins.close(); // close a window
}  	

function recargar(){
	window.location ="Contactos.php";
}

 function uploadImagen(){
    	  var Formu = document.forms['form'];	
    	  var id = Formu.idContacto.value;    	 
    	  createWindows('upImagen.php?id='+id,'Subir Foto','1','1');
    	  
    	  /*var win = new Window(
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
		  return;	*/
    }    
</script>