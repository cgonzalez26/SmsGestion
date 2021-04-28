<!-- INCLUDE struct/xhtml.header -->

<!-- INCLUDE blocks/mainHeader -->


<!-- INCLUDE blocks/userMenu -->


<!-- ARRAY INCLUDE_JSCRIPT --> <script type='text/javascript' src='{*}'></script> <!-- END -->

<script type='text/javascript' src='jscript/popup.js'></script>

<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>

<div class='cuerpo' id='cuerpox'>


	<script type='text/javascript' src='jscript/forms.js'></script>
		
	
	<h4 id='titulo' class='titulo' style='border: 0; padding-bottom:0; margin-bottom: 0; margin-top: 20px; font-size: 12pt; padding-right: 20px'> 
	{OTRO_ENLACE}	
		<!-- BLOCK VOLVER_URL --> <a id='back' style='text-align: right; float: right; position: relative; top: 5px; font-size: 9pt; ' href='{*}'>Volver</a> <!-- END -->
		
		<!-- BLOCK AGREGAR --> 
		
			<span style='text-align: right; float: right; position: relative; top: 4px; font-size: 10pt' id='agregar'> 
						
			<a href='{URL}' style='text-decoration: none'> 
				<!-- BLOCK IMG --> <img style='vertical-align: middle; margin-right: 10px' src='{*}' alt='Agregar' />  <!-- END -->

				<span style='text-decoration: underline'>{TEXT}</span> </a>
				
			<!-- BLOCK VOLVER_URL --> <span style='padding: 0 20px'> | </span> <!-- END -->	
			
			</span> 
		
		<!-- END -->
		
		{TITLE} 
	</h4>
	
	
	
	<div id='LineaDivisora' style= 'border-top:solid 1px #CCC; margin-top: 10px; clear: both'></div>
	
	
	<!-- BLOCK FILTER_OPTIONS --> <div style='padding-left: 40px; padding-top: 20px; padding-bottom: 10px' id='DIV_FILTRO'>  <strong style='padding-right: 20px'> Filtro: </strong> <a href='{LINK_REDEFINIR}'>Redefinir</a> <!-- BLOCK LINK_QUITAR --> <span style='padding: 0 5px'> - </span> <a href='{*}'>Quitar</a> <!-- END --> <h3 style='padding-top: 20px; text-decoration: underline'>Resultados de la Búsqueda</h3></div> <!-- END -->
	<!-- BLOCK SEARCH_LINK --> <div style='padding-left: 40px; padding-top: 20px; padding-bottom: 0px' id='DIV_FILTRO'>  <a href='{URL}'> {TITLE} </a> </div> <!-- END -->
	
	<form id='formTabla' method='post' class='centerForm' action='{FORM_TABLE_ACTION}' style='clear: both; margin: 20px auto; width: 670px' enctype='multipart/form-data'>
			
		{INSERT_FORM_CODE}	
		
		
		<!-- BLOCK PAGGING -->
			<div class='pagging'> {BACK} <!-- ARRAY LINKS --> {*} <!-- END --> {NEXT} </div>
		<!-- END -->
		
		{BEFORE_TABLE_HTML}
		
	
		<div style='text-align:left;'>{TABLA_INFORME}</div>						
		
		
		<input type='hidden' name='action' value='' />
		<input type='hidden' name='key' value='' />
		
		<!-- BLOCK PAGGING -->
		<div class='pagging'> {BACK} <!-- ARRAY LINKS --> {*} <!-- END --> {NEXT} </div>
		<!-- END -->
		
		
		<!-- BLOCK FORM_BUTTON -->
		
			<fieldset>
				<div class='buttons'>
					<button type='button' onclick="{ONCLICK}"> {TEXT} </button>
				</div>
			
			</fieldset>
		
		<!-- END -->
		
	<!-- ARRAY HIDDEN_VARS -->
		<input type='hidden' name="{$}" value="{*}" />
	<!-- END -->	
	<input type='hidden' name='_buscar' value='1' />
	
	</form>	
	
	
	<form id='formOrder' method='get' action='{FORM_ORDER_ACTION}'> 
	
		<input type='hidden' name='order' value='' />
		<input type='hidden' name='orderDesc' value='1' />
	</form>
		
 
	
	<script type='text/javascript'>
	
	
		function orderColumn( column ) {
			
			addFormQueryVars( formOrder );
			formOrder['order'].value = column;
			
			if(actualOrderColumn != column || ( actualOrderColumn == column && actualOrderDesc ) )
				formOrder.removeChild( formOrder['orderDesc'] );
						
						
			formOrder.submit();
		}
	
		
		var formTabla = document.forms['formTabla'];
		var formOrder = document.forms['formOrder'];
		var actualOrderColumn = '{ACTUAL_ORDER_COLUMN}';
		var actualOrderDesc = {&ACTUAL_ORDER_DESC};
		var tablaABM = document.getElementById('tablaABM');
		
		var numElements = {#ELEMENTS};
			
		if(!numElements) {
			
			document.getElementById('tablaABM').style.display = 'none';
			
			
		}
				
		{ADDITIONAL_JSCRIPT_CODE}
		
		function Normalidad(){
			document.getElementById('userMenu').style.display = 'block';
		 	document.getElementById('cabecera').style.display = 'block';
		 	document.getElementById('agregar').style.display = 'block';	
			//document.getElementById('DIV_FILTRO').style.display = 'block';
			document.getElementById('cuerpox').className = "cuerpo";
			document.getElementById('formTabla').style.display = "clear: both; margin: 20px auto; width: 730px";
			//document.getElementById('QUITAR_FILTRO').style.display = 'none';				
			//if(typeof(document.getElementById('DIV_FILTRO')) != 'undefined'){document.getElementById('DIV_FILTRO').style.display = 'block';}				
			//if(typeof(document.getElementById('QUITAR_FILTRO')) != 'undefined'){document.getElementById('QUITAR_FILTRO').style.display = 'block';}	
		}

		
		function Imprimir(){
		 	document.getElementById('userMenu').style.display = 'none';
		 	document.getElementById('cabecera').style.display = 'none';
		 	document.getElementById('agregar').style.display = 'none';	
			//alert(typeof(document.getElementById('QUITAR_FILTRO')));		
			//document.getElementById('DIV_FILTRO').style.display = 'none';
			//document.getElementById('cuerpox').style.display = "this.className='cuerpo1'";
			document.getElementById('cuerpox').className= "cuerpo1";
			document.getElementById('formTabla').style.display = "clear: both; margin: 20px auto; width: 670px";
			//document.getElementById('QUITAR_FILTRO').style.display = 'none';
			//if(typeof(document.getElementById('DIV_FILTRO')) != 'undefined'){document.getElementById('DIV_FILTRO').style.display = 'none';}				
			//if(typeof(document.getElementById('QUITAR_FILTRO')) != 'undefined'){document.getElementById('QUITAR_FILTRO').style.display = 'none';}				
		 	
		 	window.print();
		 	setTimeout("Normalidad()",1000); 
		 	
		}
		
	
	</script>
	
	
	
</div>



<!-- INCLUDE struct/xhtml.foot -->