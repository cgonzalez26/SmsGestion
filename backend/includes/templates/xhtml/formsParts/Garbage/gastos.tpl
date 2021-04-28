
<style type='text/css'>

	table#tablaDetalles td.numerico { 
		white-space: nowrap; 
		font-size: 8pt; 
	}
	
</style>

<!-- DEFINE LISTA_TIPOS_GASTOS getListaTiposGastos() -->

<span class='title'> Datos Gasto </span>

<fieldset class='border'> 

	<div>
		<label class='middle' for='idTipoGasto'> Tipo Gasto (*) : </label>
		<select name='idTipoGasto' id='idTipoGasto'>
		<option value='0'>Seleccionar... </option>
		<option value='0'></option>
		<!-- ARRAY LISTA_TIPOS_GASTOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->

		</select>
	</div>
	
	<div>
		<label class='middle' for='Descripcion'> Descripcion: </label>
		<input type='text' name='Descripcion' id='Descripcion'/>
	</div>
	
	<div>
		<label class='middle' for='Fecha_BUTTON'> Fecha: </label>
	
		<span class='fecha' id='Fecha'></span>
	
		<button type='button' id='Fecha_BUTTON'>...</button>
	
		<input type='hidden' name='Fecha' id='Fecha_HIDDEN' />
	</div>
	
	<div class='division'></div>
			
	
	<div>
		<label class='middle' for='Importe'> Importe (*): </label>
		<span class='prefijo'> $ </span> <input type='text' name='Importe' id='Importe' class='numerico' />
	</div>
	
	
	<div>
		<label class='middle' for='Descuento'> Descuento: </label>
		<span class='prefijo'> $ </span> <input type='text' name='Descuento' id='Descuento' class='numerico' />
	</div>
	
	
	<div>
		<label class='middle' for='Factura'> Factura: </label>
		<input type='text' name='Factura' id='Factura' />
	</div>
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' name='Observaciones' id='Observaciones' />
	</div>

</fieldset>

<br />
<span class='title'> Detalles </span>

<fieldset class='border'> 
		
	<h3 id='messageDetalles' style='text-align:center; color: #888; padding: 25px 0; '> No existen detalles para mostrar </h3>
	
	<table class='border' id='tablaDetalles' style='margin-bottom: 20px; width: 460px; display: none'>
	
		<thead>
		
			<tr>
				
				<th> Cant. </th>
				<th> $ / U </th>
				<th> Total </th>
				<th> Descuento </th>
				<th> Descripcion </th>
				<th> Eliminar </th>
			
			</tr>
		
		</thead>
		
		<tbody id='tbodyDetalles'> </tbody>
		
	</table>
	
	
	<div style='border-top: solid 1px #CCC'> </div>
	
	<div>
		<label style='text-decoration: underline; margin-left: 30px'> Agregar Detalle </label> <div></div>		
	</div>
				
	<div>
		<label class='middle' for='detalleCantidad'> Cantidad: </label>
		<input type='text' id='detalleCantidad' class='numerico' onfocus='onFocusDetalleInput()' onblur='onBlurDetalleInput()' />
	</div>
	
	
	<div>
		<label class='middle' for='detallePrecioUnitario'> Precio Unitario: </label>
		<span class='prefijo'> $ </span> <input type='text' id='detallePrecioUnitario' class='numerico'  onfocus='onFocusDetalleInput()' onblur='onBlurDetalleInput()'/>
	</div>
	
	<div>
		<label class='middle' for='detalleDescuento'> Descuento: </label>
		<span class='prefijo'> $ </span> <input type='text' id='detalleDescuento' class='numerico'  onfocus='onFocusDetalleInput()' onblur='onBlurDetalleInput()'/>
	</div>
	
	
	<div>
		<label class='middle' for='detalleDescripcion'> Descripcion: </label>
		<input type='text' id='detalleDescripcion'  onfocus='onFocusDetalleInput()' onblur='onBlurDetalleInput()'/>
	</div>
	
	
	<div class='buttons'>
		<button type='button' onclick='agregarDetalleDesdeForm()' onfocus='onFocusDetalleInput()' onblur='onBlurDetalleInput()'> Agregar Detalle </button>
	</div>

</fieldset>

<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript' src='jscript/strings.js'></script>

<script type='text/javascript'>


	function agregarDetalle( cantidad, precioUnitario, descuento, descripcion ) {
		
		
		
		
		cantidad = stringParseNumber( cantidad );
		precioUnitario = stringParseNumber( precioUnitario );
		descuento = stringParseNumber( descuento );
		descripcion = stringTrim( descripcion );
				
		var error = false;
		
		
		if(cantidad <= 0) error = 'La Cantidad debe ser válida';
		else if(precioUnitario <= 0) error = 'El Precio Unitario debe ser válido';
		else {
			
			
			if(tablaDetalles.style.display == 'none') {
				
				tablaDetalles.style.display = 'block';
				messageDetalles.style.display = 'none';
			}
			
			
			var row = document.createElement('TR');
						
			var cell = document.createElement('TD');
			cell.innerHTML = String( cantidad );
			cell.className = 'numerico';
			row.appendChild(cell);
			
			
			var cell = document.createElement('TD');
			cell.innerHTML = '$ ' + stringFormatNumber( precioUnitario, 2 );
			cell.className = 'numerico';
			row.appendChild(cell);
			
			
			
			var cell = document.createElement('TD');
			cell.innerHTML = '$ ' + stringFormatNumber( precioUnitario * cantidad, 2 );
			cell.className = 'numerico';
			row.appendChild(cell);
			
			
			var cell = document.createElement('TD');
			cell.innerHTML = '$ ' + stringFormatNumber( descuento, 2 );
			cell.className = 'numerico';
			row.appendChild(cell);
			
			
			var cell = document.createElement('TD');
			cell.innerHTML = descripcion;
			row.appendChild(cell);
			
			
			
			var imgEliminar = new Image();
			imgEliminar.src = 'images/remove.gif';
			imgEliminar.style.cursor = 'pointer';
			imgEliminar.onclick = function() { eliminarDetalle(row); };
			
			
			var inputCantidad = document.createElement('INPUT');
			inputCantidad.type = 'hidden';
			inputCantidad.name = 'Detalles[' + numDetalles + '][Cantidad]';
			inputCantidad.value = cantidad;
			
			var inputPrecioUnitario = document.createElement('INPUT');
			inputPrecioUnitario.type = 'hidden';
			inputPrecioUnitario.name = 'Detalles[' + numDetalles + '][PrecioUnitario]';
			inputPrecioUnitario.value = precioUnitario;
			
			
			var inputDescuento = document.createElement('INPUT');
			inputDescuento.type = 'hidden';
			inputDescuento.name = 'Detalles[' + numDetalles + '][Descuento]';
			inputDescuento.value = descuento;
			
			
			var inputDescripcion = document.createElement('INPUT');
			inputDescripcion.type = 'hidden';
			inputDescripcion.name = 'Detalles[' + numDetalles + '][Descripcion]';
			inputDescripcion.value = descripcion;
			
			var cell = document.createElement('TD');
			cell.appendChild(imgEliminar);
			cell.appendChild(inputCantidad);
			cell.appendChild(inputPrecioUnitario);
			cell.appendChild(inputDescuento);
			cell.appendChild(inputDescripcion);
			row.appendChild(cell);
			
			
			
			tbodyDetalles.appendChild(row);
			numDetalles++;
			
			
			
		}
				
		if(error) {
			alert(error);
			return false;
		} else return true;
		
	}
	
	
	function eliminarDetalle( tableRow ) {

		if(confirm('¿Está seguro?')) {
			
			removeNodes( tbodyDetalles, tableRow );
			
			
			if(tbodyDetalles.rows.length == 0) {
				
				tablaDetalles.style.display = 'none';
				messageDetalles.style.display = 'block';
				
			}
			
		}
	}
	
	
	function agregarDetalleDesdeForm() {
		
		var cantidad = document.getElementById('detalleCantidad');
		var precioUnitario = document.getElementById('detallePrecioUnitario');
		var descuento = document.getElementById('detalleDescuento');
		var descripcion = document.getElementById('detalleDescripcion');
		
		
		if(agregarDetalle(cantidad.value, precioUnitario.value, descuento.value, descripcion.value)) {
			
			cantidad.value = '';
			precioUnitario.value = '';
			descuento.value = '';
			descripcion.value = '';
		}
	}
	
	
	
	function onFocusDetalleInput() {
		
		form.onsubmit = function () { agregarDetalleDesdeForm(); return false; }
		
	}
	
	
	
	function onBlurDetalleInput() {
		
		form.onsubmit = null;
		
	}
	
	
	var tablaDetalles = document.getElementById('tablaDetalles');
	var tbodyDetalles = document.getElementById('tbodyDetalles');
	var messageDetalles = document.getElementById('messageDetalles');
	var numDetalles = 0;

	var fecha = new Date();
	
	<!-- BLOCK DATOS --> 
		
		<!-- BLOCK Fecha --> fecha = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
	
		document.getElementById('idTipoGasto').value = '{idTipoGasto}';
		document.getElementById('Descripcion').value = '{Descripcion}';
		document.getElementById('Importe').value = '{Importe}';
		document.getElementById('Descuento').value = '{Descuento}';
		document.getElementById('Factura').value = '{Factura}';
		document.getElementById('Observaciones').value = '{Observaciones}';
		
		
		<!-- ARRAY Detalles --> 
		agregarDetalle( '{Cantidad}', '{PrecioUnitario}', '{Descuento}', '{Descripcion}' );
		<!-- END -->
		
	<!-- END --> <!-- END -->
	
	
	Calendar.setup ( {
		
		inputField:		'Fecha_HIDDEN',
		button:			'Fecha_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'Fecha',
		date: fecha
		
	} );
				
</script>