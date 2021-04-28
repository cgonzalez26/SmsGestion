<!-- INCLUDE struct/xhtml.header -->

<!-- INCLUDE blocks/mainHeader -->


<!-- INCLUDE blocks/userMenu -->


<!-- ARRAY INCLUDE_JSCRIPT --> <script type='text/javascript' src='{*}'></script> <!-- END -->

<script type='text/javascript' src='jscript/popup.js'></script>

<div class='cuerpo'>


	<script type='text/javascript' src='jscript/forms.js'></script>
		
	{OTRO_ENLACE}
	<h4 id='titulo' class='titulo' style='border: 0; padding-bottom:0; margin-bottom: 0; margin-top: 20px; font-size: 12pt; padding-right: 20px'> 
		
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
	
	
	
	<div id='LineaDivisora' style= 'border-top:solid 1px #CCC; margin-top: 20px; clear: both'></div>
	
	
	<!-- BLOCK FILTER_OPTIONS --> <div style='padding-left: 40px; padding-top: 20px; padding-bottom: 10px' id='QUITAR_FILTRO'>  <strong style='padding-right: 20px'> Filtro: </strong> <a href='{LINK_REDEFINIR}'>Redefinir</a> <!-- BLOCK LINK_QUITAR --> <span style='padding: 0 5px'> - </span> <a href='{*}'>Quitar</a> <!-- END --> <h3 style='padding-top: 20px; text-decoration: underline'>Resultados de la Búsqueda</h3></div> <!-- END -->
	<!-- BLOCK SEARCH_LINK --> <div style='padding-left: 40px; padding-top: 20px; padding-bottom: 0px'>  <a href='{URL}'> {TITLE} </a> </div> <!-- END -->
	
	
	
	<form id='formTabla' method='post' class='centerForm' action='{FORM_TABLE_ACTION}' style='clear: both; margin: 20px auto; width: 730px' enctype='multipart/form-data'>
			
		{HIDDEN}
		<!-- BLOCK WARNING --> 	<div style='color: #F00; text-align: center; padding: 10px 0 15px; border-bottom: solid 1px #EEE; font-size: 10pt; margin-bottom: 10px; font-weight: bold'> {*} </div> <!-- END -->

		<!-- BLOCK CRITICAL_MESSAGE --> 	<div style='color: #F00; text-align: center; padding: 10px 0 15px; border-bottom: solid 1px #EEE; font-size: 10pt; margin-bottom: 10px'> {*} </div> <!-- END -->
						
		{INSERT_FORM_CODE}
		
		<!-- BLOCK MESSAGGE_ELEMENTS --> <div id='divMessageElements' style='width: 560px; margin: 15px auto 20px; font-size: 9pt; font-weight: bold; text-align: left'> {*} </div> <!-- END -->
		
		<!-- BLOCK PAGGING -->
			<div id='pagging_Up' class='pagging'> {BACK} <!-- ARRAY LINKS --> {*} <!-- END --> {NEXT} </div>
		<!-- END -->
		
		{BEFORE_TABLE_HTML}
	
		<table class='border' id='tablaABM' style='margin-bottom: 30px'>
				
			<thead class='{THEAD_CLASSNAME}'> 
			
			
				{FIRST_HEAD_ROWS}
			
				<tr class='titles'>  
				
				{FIRST_HEADER_CELL} 
				
				<!-- ARRAY TABLE_HEADERS --> 
				
					<th class='{CLASS}'> 
					
						<!-- BLOCK ORDER_LABEL --> <span style='padding-right: 10px'> {*} </span> <!-- END -->
						<a<!-- BLOCK ORDER --> onclick="orderColumn('{*}')" class='order'<!-- END -->> {TITLE}  </a>
					</th> 
					
				<!-- END --> 
				
					{HEADER_CELL_VER}
					
					{LAST_HEADER_CELL}
				
				</tr> 
				
			
				{LAST_HEAD_ROWS}	
				
			</thead>
			
			
			<tfoot class='{TFOOT_CLASSNAME}'>
			
			{FIRST_FOOT_ROWS}
			
			<!-- BLOCK DELETE_ENABLED -->
			
				<tr>
					
					<td style='padding-top: 25px;' colspan='<!-- CALL mathSum( {#TABLE_HEADERS}, 1) -->'> 
	
						<div style='border-top: solid 1px #EEE; padding-top: 20px'>
							Marcar: 
								&nbsp; <a href='javascript:void(0)' onclick='checksCheckAll(formTabla, "deleteKeys")'>Todos</a> &nbsp; / 
								&nbsp; <a href='javascript:void(0)' onclick='checksCheckNone(formTabla, "deleteKeys")'>Ninguno</a>
							
						</div>
					</td>
				</tr>
				
				
				<tr>
					
					<th colspan='<!-- CALL mathSum( {#TABLE_HEADERS}, 1) -->' style='padding-top: 15px'>
						
						Para los elementos marcados: 
							<a href='javascript:void(0)' onclick='eliminarElementos()' style='margin-left: 5px; text-decoration: none'> 
								<img src='images/remove.gif' style='vertical-align: middle' />
								<span style='text-decoration: underline'> Eliminar </span>
							</a>
							{CAMBIAR_VIAJE}
						
					</th>
				
				</tr>

				<tr>
					
					<th colspan='<!-- CALL mathSum( {#TABLE_HEADERS}, 1) -->' style='padding-top: 15px'>					
						{TIPOS_VIAJES}						
					</th>
				
				</tr>				
				
			<!-- END -->
			
			{LAST_FOOT_ROWS}
			</tfoot>
			
			<tbody class='{TBODY_CLASSNAME}'>
			
				{FIRST_BODY_ROWS}
						
				<!-- ARRAY ELEMENTS -->
					
					<tr class='{_CLASS_}'> 
						
						{_FIRST_ROW_CELL_} 
						
						<!-- INCLUDE {_ROW_TEMPLATE_} --> 
						
						{ADDITIONAL_ROW_XHTML}
						
						{BODY_CELL_VER}
						
						{_LAST_ROW_CELL_}
					</tr>
				
				<!-- END -->
			
				{LAST_BODY_ROWS}
			
			</tbody>
			
		</table>
		
				
		{AFTER_TABLE_HTML}
		
		<input type='hidden' name='action' value='' />
		<input type='hidden' name='key' value='' />
		
		<!-- BLOCK PAGGING -->
		<div id='pagging_Down' class='pagging'> {BACK} <!-- ARRAY LINKS --> {*} <!-- END --> {NEXT} </div>
		<!-- END -->
		
		
		<!-- BLOCK FORM_BUTTON -->
		
			<fieldset>
				<div class='buttons'>
					<button type='button' onclick="{ONCLICK}"> {TEXT} </button>
				</div>
			
			</fieldset>
		
		<!-- END -->
			
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
	
	
		<!-- BLOCK DELETE_ENABLED -->
		
		function eliminarElementos() {
		
			var anySelected = checksGetAnySelected( formTabla, 'deleteKeys' );
			var formSubmit = false;
			
			if( !anySelected ) alert('No ha seleccionado ningún elemento');
			else formSubmit = confirm('¿Está seguro?{ADDITIONAL_DELETE_MESSAGGE}');
			
			if(formSubmit) {
				
				formTabla['action'].value = 'delete';
				formTabla.submit();
			}
		}
		
		function carmbiarViaje() {
		
			var anySelected = checksGetAnySelected( formTabla, 'deleteKeys' );
			var formSubmit = false;
			
			if( !anySelected ) alert('No ha seleccionado ningún elemento');
			else formSubmit = confirm('¿Está seguro de Cambiar de Viaje a esto(s) Pasajeros?');
			
			if(formSubmit) {
				formTabla.action = "formulario/cambiarViaje";
				formTabla['action'].value = 'cambiarViaje';
				formTabla.submit();
			}
		}		
		
		<!-- END -->
	
		
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
		 	//document.getElementById('agregar').style.display = 'block';	
			if(typeof(document.getElementById('agregar')) != 'undefined'){document.getElementById('agregar').style.display = 'block';}				
			if(typeof(document.getElementById('QUITAR_FILTRO')) != 'undefined' && document.getElementById('QUITAR_FILTRO') != null){document.getElementById('QUITAR_FILTRO').style.display = 'block';}				
		}

		
		function Imprimir(){			
		
		 	document.getElementById('userMenu').style.display = 'none';
		 	document.getElementById('cabecera').style.display = 'none';
		 	//document.getElementById('agregar').style.display = 'none';
			if(typeof(document.getElementById('agregar')) != 'undefined'){document.getElementById('agregar').style.display = 'none';}				
			if(typeof(document.getElementById('QUITAR_FILTRO')) != 'undefined' && document.getElementById('QUITAR_FILTRO') != null){document.getElementById('QUITAR_FILTRO').style.display = 'none';}	
			
		 	window.print();
		 	setTimeout("Normalidad()",1000); 
		 	
		}
		
	
	</script>
	
	
	
</div>



<!-- INCLUDE struct/xhtml.foot -->