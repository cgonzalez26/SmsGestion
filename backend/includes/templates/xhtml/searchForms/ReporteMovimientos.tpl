
<center>
<div id='divFilter'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action="javascript:sendFormFiltro();" name='Formsearch' id='Formsearch' method='POST' enctype='multipart/form-data' style='display:inline'>
		<table class='TableFilter' cellpadding='5' cellspacing='5' align='left'>
		<tr>
			<td align='right' style="width:110px">Usuarios:</td>
			<td align='left' colspan='3'>
				<select name='idUsuario' id='idUsuario' style='width:100%;'>					
					{OPCIONES_USUARIOS}
				</select>
			</td>
		</tr>
		<tr>
			<td align='right'>Proyectos:</td>
			<td align='left' colspan='3'>
				<select name='idProyecto' id='idProyecto' style='width:100%;'>					
					{OPCIONES_PROYECTOS}
				</select>
			</td>
		</tr>
		<tr>
			<td align='right'>Modulos:</td>
			<td align='left' colspan='3'>
				<select name='idModulo' id='idModulo' style='width:100%;'>					
					{SCRIPT_MODULOS}
				</select>
			</td>
		</tr>
		<tr>
			<td align='right'>Tareas:</td>
			<td align='left' colspan='3'>
				<select name='idTarea' id='idTarea' style='width:100%;'>
					<option value='0'>Selecccionar...</option>
					{optionsTareas}
				</select>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align='right'>Fecha Desde:</td>
			<td align='left'>
				<input type="text" id="dFechaDesde" name="dFechaDesde" value="" />
			</td>
			<td align='right'  style="width:110px">Fecha Hasta:</td>			
			<td align='right'>
				<input type="text" id="dFechaHasta" name="dFechaHasta" value="" />
			</td>		
			<td align='center'>
				<input type='hidden' name='type' id='type' value='search'>
				<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Buscar' style='width:100px;'>
			</td>
		</tr>
		</table>			
		
		</form>
	</fieldset>
</div>
<br>


<div id="GrillaGeneral" >
<table width="{ANCHO_GRILLA}" align="center" style='width:750px;'>
<tbody>
	<tr>
	<td>
		<div style="height:30px">
		    <div id="a_1" ><h4 style="color:red">Loading</h4></div>
		</div>   
	</td>
	</tr>
	<tr>         
		<td align="center">
			<div id="recinfoArea"></div>
			<div id="gridbox" style="width:{ANCHO_GRILLA}; border:solid 1px #DDD; background-color:white;height:290px; font-size:20pt;"></div>
			<div id="pagingArea"></div>
		</td>
	</tr>
</tbody>		
		
</table>
</div>
</center>

<script type="text/javascript">
	document.getElementById('idUsuario').value;
	 
	function sendFormFiltro(){
		
		var idUsuario = document.getElementById('idUsuario').value;
		var idProyecto = document.getElementById('idProyecto').value;
		var idTarea = document.getElementById('idTarea').value;
		var idModulo = document.getElementById('idModulo').value;
		var dFechaDesde = document.getElementById('dFechaDesde').value;
		var dFechaHasta = document.getElementById('dFechaHasta').value;
		
		var sUrl = "idUsuario=" + idUsuario + "&idProyecto=" + idProyecto + "&idModulo=" + idModulo+ "&idTarea=" + idTarea + "&dFechaDesde=" + dFechaDesde +"&dFechaHasta=" + dFechaHasta;
		//alert(sUrl);
		//mygrid.loadXML("xmlMovimientos.php?"+sUrl);
		
		mygrid.updateFromXMl("xmlMovimientos.php?"+sUrl,true,true);
		//mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,&nbsp;,#select_filter");
		mygrid.init();
		//xajax_fitrarTareas(xajax.getFormValues('Formsearch'));
		
	}
	
	InputMask('dFechaDesde',"99/99/9999");
	InputMask('dFechaHasta',"99/99/9999");
	
    mygrid = new dhtmlXGridObject('gridbox');
    
	mygrid.selMultiRows = true;
	mygrid.setImagePath("../includes/grillas/dhtmlxGrid/imgs/");
	var flds = "Proyecto,Tarea,Asignador,Asignado,Fecha,Estado";
	
	mygrid.setHeader(flds);

	mygrid.setInitWidths("100,255,120,120,80,80");
	mygrid.setColAlign("left,left,left,left,center,center");
	
	mygrid.setColTypes("ro,ro,ro,ro,ro,ro");	
	
	//mygrid.setColTypes("{PERMISOS_COLUMNAS_CUSTOMER}");
	
    //var sColumnas="sProyecto,sTarea,sAsignador,sAsignado,sEstado,dFechaRegistro";
	//mygrid.setColumnIds(sColumnas);
	
	mygrid.setColSorting("str,str,str,str,date,str");

	//mygrid.attachHeader("#text_filter,#text_filter,#text_filter,#text_filter,&nbsp;,#select_filter");
	mygrid.setColumnColor("#B5D6DF,white,#B5D6DF,white,#B5D6DF,white");
	mygrid.setMultiLine(false);
	//mygrid.filterBy('Pendiente',5);
	
	mygrid.setMathRound(2);
    mygrid.enableMathEditing(true);
    /*	 if (mygrid.setColspan);
    mygrid.attachEvent("onBeforeSorting", customColumnSort);
    mygrid.attachEvent("onBeforePageChanged", function() {
        if (!this.getRowsNum());
        return false;
        return true;
    });*/
     //this code enables paging and sets its skin;
    mygrid.enablePaging(true, 50, 10, "pagingArea", true);
    //mygrid.setPagingSkin("toolbar", "dhx_skyblue");
    mygrid.setPagingSkin("bricks");
    //code below written to support standard edtiton;
    //it written especially for current sample and may not work;
    //in other cases, DON'T USE it if you have pro version;
    mygrid.sortField_old = mygrid.sortField;
    mygrid.sortField = function() {
        mygrid.setColSorting("str,str,str");
        if (customColumnSort(arguments[0]));
        mygrid.sortField_old.apply(this, arguments);
    }
    mygrid.sortRows = function(col, type, order) {}
 
     mygrid.attachEvent("onXLS", function() {
        document.getElementById("a_1").style.display = "block";
    });
    mygrid.attachEvent("onXLE", function() {
        document.getElementById("a_1").style.display = "none";
    });
    //setOnLoadingStart(function(){showLoading(true)});
    mygrid.loadXML("xmlMovimientos.php?un=" + Date.parse(new Date()));
   
	mygrid.setSkin("xp");
	mygrid.enableSmartRendering(true);
	
	mygrid.init();
	
   	mygrid.loadXML("xmlMovimientos.php");
	   	
	myDataProcessor = new dataProcessor("processMovimientos.php");
    
    myDataProcessor.enableDataNames('true');
    
    myDataProcessor.setUpdateMode("on");
    
    myDataProcessor.defineAction("error",myErrorHandler);
   
    myDataProcessor.setTransactionMode("GET");

    myDataProcessor.init(mygrid);

    function myErrorHandler(obj){
        //alert("Error occured.\n"+obj.firstChild.nodeValue);
        document.getElementById('iDivMessageCustomer').innerHTML = obj.firstChild.nodeValue ;
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
		//xajax_datosCustomer(id);			
		//xajax_CargarDatosTareas(id);		
	}

	function EnviarDatos(){		
		myDataProcessor.sendData();
		/*myDataProcessor_.setUpdated(3,true);
		myDataProcessor_.setUpdated(4,true);
		myDataProcessor_.setUpdated(5,true);
		myDataProcessor_.setUpdated(9,true);
		myDataProcessor_.setUpdated(10,true);
		
		{SAVEDATA}*/
	}
</script>