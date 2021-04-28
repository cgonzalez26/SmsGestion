
<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<span class='title'> Movimiento de Caja </span>
<fieldset class='border'>

	<div>
		<label for='CodigoTipoMovimientoCaja' class='middle'> Tipo de Movimiento (*) </label>
		<select id='CodigoTipoMovimientoCaja' name='CodigoTipoMovimientoCaja' onchange='onchangeTipoMovimiento()'>
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
			<option value='ingreso'> Ingreso </option>
			<option value='egreso'> Egreso </option>
		</select>
	</div>
	
	
	<div>
		<label class='middle' style='line-height: 100px'> Concepto (*): </label>
		
		
		<span style='line-height: 100px' class='info' id='block_0'> Seleccione un Tipo de Movimiento </span>
		
		
		<!-- DEFINE LISTA_TIPOS_EGRESOS getListaTiposEgresosCaja() -->
		
		<ul class='radios' id='block_egreso' style='display: none'>
			
			<!-- ARRAY LISTA_TIPOS_EGRESOS -->
				<!-- DEFINE NAME 'idTipoMovimientoCaja' -->
				<!-- INCLUDE formsInputs/radioListItem -->
			<!-- END -->
	
		</ul>
		
		
		<!-- DEFINE LISTA_TIPOS_INGRESOS getListaTiposIngresosCaja() -->
		
		<ul class='radios' id='block_ingreso' style='display: none'>
			
			<!-- ARRAY LISTA_TIPOS_INGRESOS -->
				<!-- DEFINE NAME 'idTipoMovimientoCaja' -->
				<!-- INCLUDE formsInputs/radioListItem -->
			<!-- END -->
	
		</ul>
			
	
	
	</div>

	
	<div class='division'></div>
	
	<div>
		<label for='Importe' class='middle'> Importe (*): </label>
		<span class='prefijo'>$</span>  <input type='text' name='Importe' id='Importe' class='numerico' />
	
	</div>
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Comprobante'> Comprobante: </label>
		<input type='text' name='Comprobante' id='Comprobante' />
	
	</div>
	
	
	<div>
		<label class='middle' for='Detalles'> Detalle: </label>
		<input type='text' name='Detalles' id='Detalles' />
	
	</div>


</fieldset>

<script type='text/javascript'>



	function onchangeTipoMovimiento() {
		
		var value = form['CodigoTipoMovimientoCaja'].value;
				
		document.getElementById('block_' + actualBlock).style.display = 'none';
		document.getElementById('block_' + value).style.display = 'block';
		
		actualBlock = value;
		
		radiosSetNone( form, 'idTipoMovimientoCaja' );
	}

	
	var actualBlock = '0';
	
	<!-- BLOCK DATOS -->
	
		document.getElementById('CodigoTipoMovimientoCaja').value = '{CodigoTipoMovimientoCaja}';
		document.getElementById('CodigoTipoMovimientoCaja').onchange();
		
		document.getElementById('Importe').value = '{Importe}';
		document.getElementById('Comprobante').value = '{Comprobante}';
		document.getElementById('Detalles').value = '{Detalles}';
		
		radiosSetValue( form, 'idTipoMovimientoCaja', '{idTipoMovimientoCaja}' );
		
	
	<!-- END -->
	
	

</script>