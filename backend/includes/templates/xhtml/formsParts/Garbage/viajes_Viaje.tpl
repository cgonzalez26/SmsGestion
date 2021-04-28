
<!-- DEFINE LISTA_TIPOS_PAGOS getListaTiposPagosViajes(); -->
<!-- DEFINE LISTA_TIPOS_ESTADOS_VIAJES getListaTiposEstadosViajes(); -->

<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<!-- BLOCK DATOS -->

	<!-- ARRAY Vehiculos --> <input type='hidden' name='Vehiculos[]' value='{*}' />  <!-- END -->
	<!-- ARRAY Choferes --> <input type='hidden' name='Choferes[]' value='{*}' />  <!-- END -->
	<!-- ARRAY Asistentes --> <input type='hidden' name='Asistentes[]' value='{*}' />  <!-- END -->
	<input type='hidden' name='idCliente' value='{idCliente}' />
	
	<!-- ARRAY Pasajeros -->
				
		<!-- DEFINE HIDDENS array('DATA' => {@*}, 'NAME_PREFIX' => 'Pasajeros[{_INDEX_}]' ) -->
		<!-- INCLUDE formsInputs/hiddenArray HIDDENS -->

	<!-- END -->
	
<!-- END -->
	




<span class='title'> Viaje </span>

<fieldset class='border'>

	<div>
		<label class='middle' style='line-height: 100px'> Destino (*): </label>
		
		<ul class='radios'>
		
			<!-- ARRAY LISTA_DESTINOS -->
			
			<!-- DEFINE TEXT '{Nombre}' -->
			<!-- DEFINE VALUE '{idDestino}' -->
			<!-- DEFINE NAME 'idDestino' -->
			
			<!-- INCLUDE formsInputs/radioListItem -->
			
			<!-- END -->
		
		</ul>
	
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Tipo'> Tipo de Viaje (*): </label>
		<select id='Tipo' name='Tipo'>
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
			
			<option value='propio'> Propio </option>
			<option value='tercero'> Tercierizado </option>
		
		</select>
	
	</div>


</fieldset>

<br />
<span class='title'> Horarios </span>

<fieldset class='border'>

	<div>
		<label class='middle' for='FechaSalida_BUTTON'> Fecha Salida (*): </label>
		
		
		<span class='fechaHora' id='FechaSalida_TEXT'>  </span>
		
		<button type='button' id='FechaSalida_BUTTON'>...</button>
		
		<input type='hidden' name='FechaSalida' id='FechaSalida_HIDDEN' />
	
	</div>
	
	
	<div>
		<label class='middle' for='FechaLlegada_BUTTON'> Fecha Llegada (*): </label>
		
		<span class='fechaHora' id='FechaLlegada_TEXT'>  </span>
		
		
		<button type='button' id='FechaLlegada_BUTTON'>...</button>
		
		<input type='hidden' name='FechaLlegada' id='FechaLlegada_HIDDEN' />
	
	</div>

</fieldset>

<br />
<span class='title'> Datos Administrativos </span>

<fieldset class='border'>

	<div>
		<label class='middle' for='idTipoEstadoViaje'> Estado (*): </label>
		<select id='idTipoEstadoViaje' name='idTipoEstadoViaje'>
		
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
		
			<!-- ARRAY LISTA_TIPOS_ESTADOS_VIAJES --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		
		</select>
	</div>
	
	<div>
		<label class='middle' for='FechaVencimiento_BUTTON'> Fecha Vencimiento (*): </label>
		
		<span id='FechaVencimiento_TEXT' class='fecha'></span>
				
		<button type='button' id='FechaVencimiento_BUTTON'>...</button>
		
		<input type='hidden' name='FechaVencimiento' id='FechaVencimiento_HIDDEN' />
	
	</div>
	
	<div class='division'></div>
	

	<div>
		<label class='middle' for='Monto'> Monto (*): </label>
		
		<span class='prefijo'> $ </span> <input type='text' name='Monto' id='Monto' class='numerico' />
	</div>
	
	
	<div>
		<label class='middle' for='idTipoPagoViaje'> Forma de Pago (*): </label>
		<select id='idTipoPagoViaje' name='idTipoPagoViaje'>
		
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
		
			<!-- ARRAY LISTA_TIPOS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		
		</select>
	</div>
	
	
	<div>
		<label class='middle' for='Adelantado'> Adelantado: </label>
		
		<span class='prefijo'> $ </span> <input type='text' name='Adelantado' id='Adelantado' class='numerico' />
	</div>
	

	<div class='division'></div>
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' id='Observaciones' name='Observaciones' />
	</div>

</fieldset>


<input type='hidden' name='segundaParte' value='1' />




<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript'>

	var fechaSalida = new Date();
	var fechaLlegada = new Date();
	var fechaVencimiento = new Date();
	
	<!-- BLOCK DATOS --> 
		
		<!-- BLOCK FechaSalida --> fechaSalida = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		<!-- BLOCK FechaLlegada --> fechaLlegada = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		<!-- BLOCK FechaVencimiento --> fechaVencimiento = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
			
		radiosSetValue( form, 'idDestino', '{idDestino}' );
		
		document.getElementById('Tipo').value = '{Tipo}';
		document.getElementById('Monto').value = '{Monto}';
		document.getElementById('idTipoPagoViaje').value = '{idTipoPagoViaje}';
		document.getElementById('Adelantado').value = '{Adelantado}';
		document.getElementById('idTipoEstadoViaje').value = '{idTipoEstadoViaje}';
		document.getElementById('Observaciones').value = '{Observaciones}';
	
	<!-- END --> <!-- END -->
	
	
	Calendar.setup ( {
		
		inputField:		'FechaSalida_HIDDEN',
		button:			'FechaSalida_BUTTON',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'FechaSalida_TEXT',
		showsTime:		true,
		date: fechaSalida
	} );
	
	
	Calendar.setup ( {
		
		inputField:		'FechaLlegada_HIDDEN',
		button:			'FechaLlegada_BUTTON',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'FechaLlegada_TEXT',
		showsTime:		true,
		date: fechaLlegada
	} );
	
	Calendar.setup ( {
		
		inputField:		'FechaVencimiento_HIDDEN',
		button:			'FechaVencimiento_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'FechaVencimiento_TEXT',
		date: fechaVencimiento
	} );
				
</script>