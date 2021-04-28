
<div id="GrillaGeneral" style='padding-left:10px;padding-right:10px;'>
	<table cellpadding='0' cellspacing='0' width='80%' class='TablePermits'>
		<tr>
			<td class='title' width='100' style="height:30px;padding-left:20px"><img src="../includes/images/internas/icon-16-user.png" border="0" />&nbsp;&nbsp;<strong>Administrar Usuarios</strong></td>
		</tr>
	</table>	
	<table width="{ANCHO_GRILLA}" align="center" >
	<tbody>
			<tr>
	         
				<td align="center">
				    <div style="width:{ANCHO_GRILLA};border:solid 1px #000000;"  id="iDivMenu"></div>
					<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:200px; font-size:20pt;"></div>
				</td>
			</tr>			
	</tbody>			
	</table>
</div>


<div id='divPermits' style='margin-left:10px;margin-right:10px;'>
	<form id="form" method="POST" action="" name='form'>
	<input type="hidden" id="idUsuario" name="idUsuario" value="{ID_USUARIO}" />
	<fieldset style="background:#F5F5F5;">
		<legend>Datos del Usuario:</legend>
	
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
				<td>(*)Apellido:</td>
				<td><input type='text' name='sApellido' id='sApellido' style='width:200px;'/></td>
			</tr>					
			<tr>
				<td>Direccion:</td>
				<td><input type='text' name='sDireccion' id='sDireccion' style='width:200px;'/></td>
			</tr>					
			<tr>
				<td>(*)E-mail:</td>
				<td><input type='text' name='sMail' id='sMail' style='width:200px;'/></td>
			</tr>					
			<tr>
				<td>Telefono:</td>
				<td><input type='text' name='sTelefono' id='sTelefono' style='width:200px;'/></td>
			</tr>					
			<tr>
				<td>Celular:</td>
				<td><input type='text' name='sMovil' id='sMovil' style='width:200px;'/></td>
			</tr>
			<tr>						
				<td align='left' colspan='2'>
					<input type='hidden' name='saveUser' id='saveUser' value=''>
					<input type='hidden' name='id' id='id' value='{id}'>
					<input type='hidden' name='permitUser' id='permitUser' value=''>
					
					<input type="button" id="cmd_Aceptar" name='cmd_Aceptar' id='cmd_Aceptar' value='Nuevo' style="width:80px" onclick="sendForm(this);" />
					<input type='button' name='cmd_Cancelar' id='cmd_Cancelar' value='Cancelar' onclick="resetDatosForm__();" style="display:none;width:80px" />
				</td>
			</tr>	
			</table>
		</td>
		<td valign='top'>
				
			<table cellpadding='0' cellspacing='5' width='100%' class='TablePermits'>
			<tr><td colspan="3">&nbsp;</td></tr>
			<tr>
				<td width='120'>(*)Login:</td>
				<td><input type='text' name='sLogin_' id='sLogin_' style='width:200px;'/></td>
				<td style="width:20px"></td>
			</tr>					
			<tr>
				<td>(*)Password:</td>
				<td><input type='password' name='sPassword_' id='sPassword_' style='width:200px;' value=''></td>
				<td style="width:20px"></td>
			</tr>
			<tr>
				<td>(*)Repetir Password:</td>
				<td><input type='password' name='sPasswordRepeat_' id='sPasswordRepeat_' style='width:200px;' value=''></td>
				<td style="width:20px"></td>
			</tr>						
			<tr>
				<td>Estado:</td>
				<td>
					<select name='sEstado' id='sEstado' style='width:200px;'>
						<option value='0'>Seleccionar...</option>
						<option value='AUTORIZADO'>AUTORIZADO</option>
						<option value='BLOQUEADO'>BLOQUEADO</option>
					</select>
				</td>
				<td style="width:20px"></td>
			</tr>
			<tr>
				<td>Tipo de Usuario:</td>
				<td>
					<select name='idTipoUsuario' id='idTipoUsuario' style='width:200px;'>
						{optionsTiposUsuarios}
					</select>
				</td>
				<td style="width:20px"><img src="../includes/images/search.png" id="imgSearch" onclick="openWindow();" style="cursor:pointer"/></td>
			</tr>
			</table>
				
		</td>
		<td valign='top'>
					<!--<div style="text-align:right;"><a href="javascript:alert(tree.getAllChecked());">Guardar Permisos</a></div>
					<br>-->
					<div id="treeboxbox_tree" style="width:350;height:200px;border:1px solid #CCC;"></div>			
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
	var flds = "Codigo,Nombre,Apellido,Direccion,E-Mail,Movil";
	mygrid.setHeader(flds);
	mygrid.setInitWidths("60,200,150,200,230,100");
	mygrid.setColAlign("center,left,left,left,left,left");
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro");
    var sColumnas="id,sNombre,sApellido,sDireccion,sMail,sMovil";
	mygrid.setColumnIds(sColumnas);
	mygrid.setColSorting("str,str,str,int,str");
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
		//alert("Rows with id: "+id+" was selected by user");
		xajax_DatosUser(id,'Usuarios');
	}
    
    function doOnRowSelected(id){
		//alert("Rows with id: "+id+" was selected by user");
		//tree.setCheck(0,false);
		cleanFormUser();
	}    
    
    function myErrorHandler(obj){
        alert("Sucedio un error: ."+obj.firstChild.nodeValue);
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
    
    function cleanFormUser(){
    	var Formu = document.forms['form'];
    	Formu.sLogin_.removeAttribute('disabled');    	
    	Formu.reset();
    	//document.getElementById('divNameUser').innerHTML = '';
    	//document.getElementById('treeboxbox_tree').innerHTML = '';
    }   


 
   /* tree=new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
    tree.setImagePath("../includes/grillas/dhtmlxTree/codebase/imgs/csh_bluebooks/");
    //enable checkboxes
    tree.enableCheckBoxes(1);
    tree.loadXML("tree.xml");
    ....
    //check item
    tree.setCheck(id,true);
    //uncheck item
    tree.setCheck(id,false);    
    //check branch
    tree.setSubChecked(id,true);
    //uncheck branch
    tree.setSubChecked(id,false);    
    //check item
    tree.setCheck(id,true);
    //return ids of checked items          
    
    var list=tree.getAllChecked();*/    

	tree = new dhtmlXTreeObject("treeboxbox_tree","100%","100%",0);
	
	tree.setImagePath("../includes/grillas/dhtmlxTree/codebase/imgs/csh_bluebooks/");
	
	tree.enableCheckBoxes(1);
			
	tree.enableThreeStateCheckboxes(true);

	tree.loadXML("xmlPermits.php");		
	
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
	function menuClick(id) {
		switch(id)
			{
				case 'idNuevo':{			          
					             try{
					             	var idCell=mygrid.getRowIndex(mygrid.getSelectedId());
					             }catch(e){
					             	var idCell=1;
					             }

					             mygrid.addRow((new Date()).valueOf(),['-','-'],idCell);

				    break;}
				case 'idGuardar':{saveDatos(); break;}
				case 'idBorrar':{mygrid.deleteSelectedRows();break;}
				case 'idPrint':{alert('En Construccion');break;}				
				
			}
		
		return true;
	}

	function saveDatos(){
		myDataProcessor.sendData();
	}
	
	function validarDatosForm(){
		var errores = "";
		var formu=document.forms['form'];
		with (formu){
			if (sNombre.value == ""){
				errores += "- El Nombre es requerido.\n";
			}	
			if (sApellido.value == ""){
				errores += "- El Apellido es requerido.\n";
			}				
			if (sMail.value == ""){
				errores += "- El E-mail es requerido.\n";
			}
			if(!eMail.test(sMail.value)){
				errores += '- E-Mail  Invalido \n';		
			}
				
			/*if (sTelefono.value == ""){
				errores += "- El Telefono es requerido.\n";
			}*/	
			if (sLogin_.value == ""){
				errores += "- El Usuario es requerido.\n";
			}
			if (sPassword_.value == ""){
				errores += "- La Contraseña  es requerida.\n";
			}
			if (sPasswordRepeat_.value == ""){
				errores += "- El campo Repetir Contraseña  es requerido.";
			}	
			if((sPassword_.value != "")||(sPasswordRepeat_.value!= ""))
				if(sPassword_.value != sPasswordRepeat_.value){
					errores += "- El campo Contraseña y Repetir Contraseña deben ser iguales.";
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
		var Formu = document.forms['form'];	
		Formu['permitUser'].value = tree.getAllChecked();
		//viewMessageLoad('divMessageUser');
		xajax_updateDatosUser(xajax.getFormValues('form'));
	}
	
	function DatosUserBasic(idTipoUsuario_,idUser_,sPermits_){	
		
		//alert(sPermits_);
		
		//document.getElementById('idOficina').value = idOficina_;

		document.getElementById('idTipoUsuario').value = idTipoUsuario_;	
		
        LoadTreePermitsUser(idUser_,sPermits_);
		
	}
	
	
   function LoadTreePermitsUser(idUser_,sPermits){
   	
		checkPermitsUser(sPermits);

   }
	
   function checkPermitsUser(sPermits){
   	

	   	var arrayPermits = sPermits.split(",");
	   	var sIdPermit = ''; 
	   	tree.setCheck(0,false);
	   	for(var i=0; i <= (arrayPermits.length -1); i++){  		
	
	   		id = arrayPermits[i];
	   		
	   		tree.setCheck(id,true);
	   		
	   	}
   }
   
   function setFormUser(){
	   	var Formu = document.forms['form'];
	   	
	   	Formu.sLogin_.value = '';
		document.getElementById('sLogin_').removeAttribute('disabled');   	
		Formu.sPassword_.value = '';
		Formu.sPasswordRepeat_.value = '';
	   	
		Formu.sEstado.value = 0;
		
		//tree.setCheck(0,false);
	
   }
   
   function resetDatosForm__(){
		resetDatosForm();		
		mygrid.updateFromXML("xml.php"); 
		mygrid.init();		
		mygrid.attachHeader("#text_filter,#text_filter,#text_filter");
		tree.enableCheckBoxes(true);  
		tree.deleteChildItems(0);
		tree.loadXML('xmlPermits.php');
	}
	
	function resetDatosForm(){
		var Formu = document.forms['form'];	
		Formu.reset();		
		Formu.idUsuario.value = 0;
		document.getElementById("sCodigo").innerHTML = "";	
		Formu.cmd_Cancelar.style.display = "none";//ocultamos el boton cancelar
		Formu.cmd_Aceptar.value = "Nuevo";//seteamos el boton nuevo
	}	
			
	function openWindow(){
		var idUsuario = document.getElementById('idUsuario').value;
		
		createWindows('../TiposUsuarios/TiposUsuarios.php?id='+idUsuario,'SMSGestion','1','1');
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
		    _popup_ = dhxWins1.createWindow(idWind, 250, 50, 640, 340);
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
	window.location ="Usuarios.php";
}
</script>

