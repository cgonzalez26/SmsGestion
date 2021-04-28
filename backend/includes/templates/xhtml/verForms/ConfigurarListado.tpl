<body>
   
    <div id="idConfArticulos">   
    {OPCIONES_PANEL} 
    </div>


	<div id='idConfPrecios' >
	    <style> 
				li ul {
					position: absolute;
					left:110px;
					top: 0;
					display: none;
					}
				ul li a {
					display: block;
					text-decoration: none;
					color: #999;
					background: #fff;
					padding:4px;
					border: 1px solid #ccc;
					border-bottom: 0;
					
					}
				li:hover ul, li.over ul { 
					display: block; }
				/* Fix IE. Hide from IE Mac \*/
				* html ul li { float: left; height: 1%; }
				* html ul li a { height: 1%; }
				/* End */	
	   </style>
				
	    <ul id="nav">

		<li><a href="?mod=usu"><img  src="../aula/includes/iconos/icono (496).ico" >Usuarios</a>
		
		</li>
		<li><a href="#"><img  src="../aula/includes/iconos/icono (169).ico" >Cursos</a>
		<ul>
		  <li><a href="?mod=admin&c=1"><img  src="../aula/includes/iconos/icono (169).ico" >Crear</a></li>
		  <li><a href="?mod=admin&c=2"><img  src="../aula/includes/iconos/icono (169).ico" >Config..</a></li>
		</ul>
		</li>
		
		<li><a href="./backupDB/dump_db.php"><img  src="../aula/includes/iconos/icono (929).ico" >Backup</a>
		</li>
		<li><a href="./backupDB/restore_db.php"><img  src="../aula/includes/iconos/icono (930).ico" >Restaurar</a>
		</li>
		<li><a href="#"><img  src="../aula/includes/iconos/icono (458).ico" >Recursos</a>
		<ul>
		  <li><a href="?mod=foro"><img  src="../aula/includes/iconos/icono (496).ico" >Foros</a></li>
		  <li><a href="http://<?php echo $lugar?>/aula/modulos/chat/"><img  src="../aula/includes/iconos/icono (410).ico" >Chats</a></li>
		</ul>
		</li>
		<li><a href="#"><img  src="../aula/includes/iconos/icono (88).ico" >Notas</a>
		</li>
		<li><a href="?mod=adios"><img  src="../aula/includes/iconos/icono (9).ico" >cerrar</a>
		</li>
		
		
		</ul>
  </div>
  
  
  
  
  
  <div id="idComparativas" >
  
      <form action="" method="POST" id="fomuComparativas"> 
	      <table class="formulario" align="center" style="width:315px;"> 
	      <tbody   style="border:solid 2px #B5CBDF;width:auto;" >
	      
		  <tr>
		  <th colspan="2"> <input type="checkbox" name="chkTodos" id="chkTodos"  onclick='tildar_checkboxs(this.checked);' > - Todos </th>
	      
	      </tr>	
	      <tr>
	      <td colspan="2">
	      <div id='idListaProveedor' style="border:solid 2px #000000; height:100px; Overflow-y:scroll;Overflow-x:hidden;">
	      {CAJA_PROVEEDORES}
	      </div> 
	      </td>
	      <td>&nbsp;</td>
	      </tr>
	      <tr><th>Rubro : </th><td><input type="text" name="sRubro" id="idRubroC"></td></tr>
	      <tr>
		  	<th>Rango:</th> 
			<td><input name="sRangoComp" value="" id="sRangoComp" size="25" maxlength="20" />  </td>
		  </tr>
	      <tr><th>Promedio : </th><td><input type="checkbox" name="chkPromedio" id="chkPromedio" value="1"></td></tr>
	      <!--<tr><th>Grafica : </th><td><input type="checkbox" name="chkGrafica" id="chkGrafica" value="1"></td></tr>-->
	      <tr><th colspan="2">&nbsp;</th></tr>      
	      <tr>
			<th colspan="2" >
			  
	          <div id="idMenuCompara">
	         
	          {BOTONERA_COMPARATIVAS_TOP}
	          </div>        
			</th>
			
			</tr>
	       <tr>
			<th colspan="2" >
			  
	          <div id="idMenuCompara">
	         
	          {BOTONERA_COMPARATIVAS_BOTTOM}
	          </div>        
			</th>
			
			</tr>
			
	      </tbody>
	      </table>
     </form>
  </div>
  <div id="idOculto" >
  
  
  </div>
   

<script language="javascript">

   var dhxLayout = new dhtmlXLayoutObject(document.body,'2U','dhx_blue')
   

   dhxLayout.cells("a").setWidth(310);
   dhxLayout.cells("a").setText("{BOTONERA_CABECERA}");//&nbsp;&nbsp;<a style='color:#055A78;cursor:pointer;' onclick='exitSesion();' >(Salir)<a>
   dhxLayout.cells("b").setText("");
   dhxLayout.cells("b").hideHeader();

   
   
   var cIzquierda=new dhtmlXLayoutObject(dhxLayout.cells('a'),'2E');
   cIzquierda.cells("a").hideHeader();
   cIzquierda.cells("a").setHeight(400);
   
   cIzquierda.cells("b").hideHeader();
   
   
   var dhxAccord = cIzquierda.cells('a').attachAccordion();
   //dhxAccord.enableMultiMode(true);

   //var dhxAccord = dhxLayout.cells("a").attachAccordion();
   
   dhxAccord.addItem("a1", "OPCIONES");
   dhxAccord.cells("a1").attachObject("idConfArticulos");
   //dhxAccord.setIcon("a1", "icon1.gif");

   
   dhxAccord.addItem("a2", "MENU");
   
   dhxAccord.cells("a2").attachObject("idConfPrecios");
   
   
   dhxAccord.addItem("a3", "COMPARATIVAS");
   dhxAccord.cells("a3").attachObject("idComparativas");
   //dhxAccord.addItem("a3", "Herramientas");
  // dhxAccord.addItem("a4", "LISTADO");
   dhxAccord.cells("a1").open();

    /* METODOS DE LA VERSION NUEVA ESTUDIAR Y SUBIR ESTA BUNA
    dhxAccord.attachEvent("onActive", function(id) {
        dhxAccord.moveOnTop(id);
    });*/

  

	function verListado(id) {
		   var formu=document.forms['fomuListado'];
		   var mensaje='';
		   if(formu['sRubro'].value=='') mensaje+="-Debe indicar un rubro o artiulo.\n";
		   if(formu['idProveedores'].value == 0) mensaje+="-Debe indicar un Proveedor.\n";
		   if (mensaje=='') {
		   	
		   	   var URL='';
		   	   URL="../Listados/ListaArticulos.php?c2="+formu['sFPlista'].value+"&c3="+formu['sFCosto'].value+"&c4="+formu['iMb'].value+"&c5="+formu['iAumento'].value+"&sRubro="+formu['sRubro'].value+"&idProv="+formu['idProveedores'].value+"&sRango="+formu['sRango'].value;
		   	   //alert(URL);
		   	   dhxLayout.cells('b').attachURL(URL);
		   	//xajax_verListado(xajax.getFormValues(id));		
		   }
		   else alert(mensaje);
		
	}
	
	
	function GuardarIndices()
	{
		var formu=document.forms['fomuListado'];
		var mensaje='';
		
		if (formu['sRubro'].value=='') mensaje+="-Debe indicar un rubro o artiulo.\n";
		if (formu['iMb'].value == '0.00') mensaje+="-Debe indicar el  MB.\n";
		if (formu['idProveedores'].value == 0) mensaje+="-Debe indicar un proveedor.\n";
		if (formu['sFCosto'].value=='0.00') mensaje+="-Debe indicar el Costo .\n";
		if (formu['sFPlista'].value=='0.00') mensaje+="-Debe indicar el Precio de lista.\n";
	
		if (mensaje=='') xajax_GuardarIndices(xajax.getFormValues('fomuListado'));
		else alert(mensaje);
	}
	
	function traerIndices(id){
	  var formu=document.forms[id];
	  var mensaje='';	
	  if (formu['sRubro'].value=='') mensaje+="-Debe indicar un rubro o artiulo.\n";
	  if (formu['idProveedores'].value == 0) mensaje+="-Debe indicar un proveedor.\n";
	  
	  if (mensaje=='') xajax_traerIndices(xajax.getFormValues(id));	
	  else alert(mensaje);
	  //if (formu['idProveedores'].value > 0) xajax_traerIndices(xajax.getFormValues(id));	
	  
	}
	//------------------------------------//
	
	function ComparaPrecio(){
	  var formu=document.forms['fomuComparativas']; 
	  var el = document.getElementById('idListaProveedor');
	  var imputs= el.getElementsByTagName('input');
	  var band=0;
	  var mensaje='';	
	  
	  for (var i=0; i<imputs.length; i++) 
	  {
	    if (imputs[i].type=='checkbox')	
	     if(!imputs[i].checked) 
	     {
	         band=0;
	     }
	     else{ band=1; break;}
	  }	
	  
	  if(formu['sRubro'].value=='') mensaje+="-Debe indicar un rubro.\n";
	  
	  if((band==1) && (mensaje==''))
	  {
	  	xajax_ComparaPrecio(xajax.getFormValues('fomuComparativas'));  
	  }else{
	  	
	  	if(band==0) alert('Debe Elegir al menos un Proveedor');
	  	else alert(mensaje);
	  	
	  }
		   	
   }

   function ExportarPrecio(){
   	
   	  var formu=document.forms['fomuComparativas']; 
	  var el = document.getElementById('idListaProveedor');
	  var imputs= el.getElementsByTagName('input');
	  var band=0;
		
	  for (var i=0; i<imputs.length; i++) 
	  {
	    if (imputs[i].type=='checkbox')	
	     if(!imputs[i].checked) 
	     {
	         band=0;
	     }
	     else{ band=1; break;}
	  }	
	  if(band==1)
	  {
	  	alert('En Construccion');
	  	//xajax_ExportarPrecio(xajax.getFormValues('fomuComparativas'));
	  	
		  
	  }else {alert('Debe Elegir al menos un Proveedor');}
   }
	
	function FinalizarListado(id){
		
		//xajax_FinalizarListado(xajax.getFormValues(id));
		dhxLayout.cells("b").attachURL('../Listados/ListaArticulos.php');
		
	}
 
    function AgregarListado(id){
    	
    	xajax_AgregarListado(xajax.getFormValues(id));
    }
	
    function tildar_checkboxs(check) 
    {
       
   	  var el = document.getElementById('idListaProveedor');
	  var imputs= el.getElementsByTagName('input');
	  var band=0;
		
	  for (var i=0; i<imputs.length; i++) 
	  {
	  	imputs[i].checked=check;
	    /*if (imputs[i].type=='checkbox')	
	     if(!imputs[i].checked) 
	     {
	         band=0;
	     }
	     else{ band=1; break;}*/
	  }	
	  /*var inputs = document.getElementsByTagName('input');
	  var i;
	
	  for( i=0; i<inputs.length;i++)
		if( inputs[i].className == 'check_poliza' ) {
			inputs[i].checked = check;
		}*/
	

    }
    
    function exitSesion(){
    	window.location.href="{BASE_URL}/logout.php";
    }
    
    function VerAyuda(){
    	
    	alert('En construccion');
    }
    
    function MiPerfil(){
    	
    	alert('Aqui podra ver su Perfil .En construccion');
    	
    }
    
    function CargarOpcion(iNum){
    	switch(iNum)
			{
				case 1:{dhxLayout.cells('b').attachURL('../Articulos/Articulos.php');break;} 
				case 2:{dhxLayout.cells('b').attachURL('../Importar/Importar.php'); break;}
				case 3:{dhxLayout.cells('b').attachURL('../Exportar/Exportar.php');break;}
				case 4:{dhxLayout.cells('b').attachURL('../Proveedores/Proveedores.php');break;}			
			}
  
    }
    
    function ArmarListado(){
    	
    	   var formu=document.forms['fomuListado'];
		   var mensaje='';
		   if(formu['sRubro'].value=='') mensaje+="-Debe indicar un rubro o artiulo.\n";
		   //if(formu['idProveedores'].value == 0) mensaje+="-Debe indicar un Proveedor.\n";
		   if (mensaje=='') {
		   	
		   	   var URL='';
		   	   URL="../Listados/ListadoPrecios.php?sRubro="+formu['sRubro'].value;
		   	  
		   	   dhxLayout.cells('b').attachURL(URL);
		   	   //alert('En Construccion');
		   }
		   else alert(mensaje);
    	
    }
    InputMask("sRango","999999999-999999999");
    InputMask("sRangoComp","999999999-999999999");
    
    function guardarGrilla(){
    	var iError=0;
    	try{
    		myDataProcessor.sendData();
    	}catch(e){
    		iError=1;
    		alert('-Debe Listar los Articulos');	
    	}
    	
    }
    
    function imprimirListado(){
    	var formu=document.forms['fomuComparativas']; 
    	var mensaje='';
    	 if(formu['sRubro'].value=='' && formu['sRangoComp'].value=='') mensaje+="-Debe indicar un rubro o rango de Articulos.\n";
    	 if (mensaje=='') {
    		xajax_printPrecios(xajax.getFormValues('fomuComparativas'));
    	 }else alert(mensaje);
    	/*document.getElementById('impresiones').innerHTML=document.getElementById('idComparativas').innerHTML
    	window.print();*/
    }
    
    function DescargarListado(){
    	
    	var formu=document.forms['fomuComparativas']; 
    	var mensaje='';
    	if(formu['sRubro'].value=='' && formu['sRangoComp'].value=='') mensaje+="-Debe indicar un rubro o rango de Articulos.\n";
    	if (mensaje=='') {
    		
    		URL="../Listados/ExportarListaPrecios.php?sRubro="+formu['sRubro'].value+'&sRangoComp'+formu['sRangoComp'].value;
    		window.location.href=URL;
    		
    	}else alert(mensaje);
    	
    }
    
</script>
<div id="impresiones">{ToPrint}</div>
	
</body>

</html>