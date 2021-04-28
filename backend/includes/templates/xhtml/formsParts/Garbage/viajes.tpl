<!-- DEFINE LISTA_AGENCIAS getListaAgencias(); -->


<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<span class='title'> Datos Agencia </span>

<fieldset class='border'>

	<!-- BLOCK AGENCIA --><!-- END -->
	
	<div>
		<label class='middle'> Agencia: </label>	
	
	<select id='idAgencia' name='idAgencia' style='width: auto; margin-right: 5px'>
		
		<option value='0'> Seleccionar...</option>		
		
		<!-- ARRAY LISTA_AGENCIAS --> <!-- INCLUDE formsInputs/option --> <!-- END -->	
	
	</select>
	</div>
	
	

</fieldset>


<br />


<span class='title'> Datos Viaje </span>

<fieldset class='border'>

	<!-- BLOCK VIAJE -->
	
	<div>
		<label class='middle'> Estado: </label>
		<strong> {Estado} </strong>
	</div>
	
	<div>
		<label class='middle'> Destino: </label>
		<strong> {Destino} </strong>
	</div>
	
	<input type='hidden' name='idDestino' value='{idDestino}' />
	
	
	<!-- END -->

	
	<!-- BLOCK DESTINOS -->
	
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
	
	<!-- END -->
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='IdiomaExtranjero'> Idioma Extranjero: </label>
		<select id='IdiomaExtranjero' name='IdiomaExtranjero'>
			<option value='0'> No </option>
			<option value='1'> Sí </option>
		
		</select>
	</div>


</fieldset>


<br />


<!-- BLOCK VIAJE_REGULAR -->

<fieldset class='border'>
	<div>
		<label for='ViajeRegular_PrecioPasaje' class='middle'> Precio Pasaje (*): </label>
		<span class='prefijo'> $ </span> <input type='text' class='numerico' name='ViajeRegular[PrecioPasaje]' id='ViajeRegular_PrecioPasaje' />
	</div>

</fieldset>

<!-- END -->



<!-- BLOCK VIAJE_PRIVADO -->

<span class='title'> Datos Viaje Privado </span>

<fieldset class='border'>
	
	<!-- BLOCK CLIENTES -->

	<div>
		<label class='middle' style='line-height: 100px'> Cliente (*): </label>
		
		<ul class='radios'>
		
			<!-- ARRAY LISTA_CLIENTES -->
			
			<!-- DEFINE TEXT '{RazonSocial}' -->
			<!-- DEFINE VALUE '{idPersona}' -->
			<!-- DEFINE NAME 'ViajePrivado[idPersona]' -->
			
			<!-- INCLUDE formsInputs/radioListItem -->
			
			<!-- END -->
		
		</ul>
	
	</div>
	
	<!-- END -->
	
	
	<!-- BLOCK CLIENTE -->
	
	<div>
		<label class='middle'> Cliente: </label>
		<strong> {Nombre} </strong>
	</div>
	
	<input type='hidden' name='ViajePrivado[idPersona]' value='{idPersona}' />
	
	
	<!-- END -->
	
	<div class='division'></div>

	
	<div>
	
	<label class='middle' for='ViajePrivado_Monto'> Monto (*): </label>
			
		<span class='prefijo'> $ </span> <input type='text' name='ViajePrivado[Monto]' id='ViajePrivado_Monto' class='numerico' />
	</div>
			
			
	<div>
		<label class='middle' for='ViajePrivado_idFormaPagoViaje'> Forma de Pago (*): </label>
		<select id='ViajePrivado_idFormaPagoViaje' name='ViajePrivado[idFormaPagoViaje]'>
		
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
		
			
			<!-- DEFINE FORMAS_PAGOS getListaFormasPagosViajes(); -->
			
			<option value='cuentaCorriente'> Cuenta Corriente </option>
			<option value='0'></option>
			
			<optgroup label='Cobro Inmediato'>
			<!-- ARRAY FORMAS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
			
			</optgroup>
		
		</select>
	</div>
	
	
	<div id='divDatosPago' style='display: none'>
		<div>
			<label class='middle' for='ViajePrivado_Comprobante'> Comprobante: </label>
			<input type='text' name='ViajePrivado[Comprobante]' id='ViajePrivado_Comprobante' />
		
		</div>
				
				
		
		
		<div>
			<label class='middle' for='ViajePrivado_Detalles'> Detalles: </label>
			<input type='text' name='ViajePrivado[Detalles]' id='ViajePrivado_Detalles' />
		
		</div>
	</div>
	
	
	<div id='divDatosAdelanto' style='display: none'>
	
		<div>
			<input style='vertical-align: middle; margin-right: 10px; margin-left: 50px' type='checkbox' name='ViajePrivado[incluirAdelanto]' id='incluirAdelanto' value='1' /> 
			<label for='incluirAdelanto' style='cursor: pointer; text-decoration: underline; color: #559'> Incluir Adelanto </label>
		</div>
	
		
		<div id='divAdelanto' style='display: none'>
		
			<div class='division'></div>
	
			<!-- DEFINE VIAJE_PRIVADO_PAGO array('TITLE' => 'Adelanto', 'TITLE_TYPE' => 'Forma de Pago Adelanto', 'NAME' => 'ViajePrivado[Adelanto]', 'DATOS' => {@ADELANTO}  ); -->

			<!-- INCLUDE formsParts/pagoViaje VIAJE_PRIVADO_PAGO -->
		
		</div>
	
	</div>
		

</fieldset>

<!-- END -->


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
		<label class='middle' for='FechaLlegada_BUTTON'> Fecha Finalizacion (*): </label>
		
		<span class='fechaHora' id='FechaLlegada_TEXT'>  </span>
		
		
		<button type='button' id='FechaLlegada_BUTTON'>...</button>
		
		<input type='hidden' name='FechaLlegada' id='FechaLlegada_HIDDEN' />
	
	</div>

</fieldset>

<br />
<span class='title'> Otros Datos </span>

<fieldset class='border'>

	
	<div>
		<label class='middle' for='FechaVencimiento_BUTTON'> Fecha Vencimiento (*): </label>
		
		<span id='FechaVencimiento_TEXT' class='fecha'></span>
				
		<button type='button' id='FechaVencimiento_BUTTON'>...</button>
		
		<input type='hidden' name='FechaVencimiento' id='FechaVencimiento_HIDDEN' />
	
	</div>
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' id='Observaciones' name='Observaciones' />
	</div>

</fieldset>

<br />


<span class='title'> Datos Km Recorridos </span>

<fieldset class='border'>
	<div>
		<label for='KM' class='middle'> KM (*): </label>
		<input type='text' name='KM' id='KM' />
	</div>

</fieldset>




<!-- BLOCK CANCELAR_ENABLED -->
	
	<br />
	<fieldset class='border' style='text-align: center; padding: 10px 0'>
	 
	<div>
	<input type='checkbox' name='Cancelado' value='1' id='Cancelado' style='margin-right: 10px' onclick="if( this.checked ) { if(!confirm('¿Está seguro que desea cancelar el Viaje?')) this.checked = false; }" />
	<label for='Cancelado' style='color: #E22; cursor: pointer'> Cancelar Viaje </label>
	</div>
	
	</fieldset>

<!-- END -->


<!-- BLOCK REDIRECT_URL_CHECK --> 

	<fieldset style='text-align: center'>

	<input type='checkbox' name='redirectVehiculos' value='1' id='redirectVehiculos' style='margin-right: 10px' checked='checked' />
	<label for='redirectVehiculos'> Luego de agregar el Viaje, administrar el Personal y los Vehículos </label>
	
	</fieldset>

<!-- END -->


<input type='hidden' name='VolverTipo' value='0' />
<input type='hidden' name='Tipo' id='Tipo' value='0' />



<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript'>

<!-- BLOCK VIAJE_PRIVADO -->
	document.getElementById('ViajePrivado_idFormaPagoViaje').onchange = function() {
		
		var value = this.value;
		var displayAdelanto = 'none';
		var displayPago = 'none';
		
		if(value == 'cuentaCorriente') displayAdelanto = 'block';
		else if( Number(value) > 0) displayPago = 'block';
		
		document.getElementById('divDatosPago').style.display = displayPago;
		document.getElementById('divDatosAdelanto').style.display = displayAdelanto;
		
	}

	
	document.getElementById('incluirAdelanto').onclick = function(){
		
		document.getElementById('divAdelanto').style.display = this.checked ? 'block' : 'none';
	}
<!-- END -->
	
	var fechaSalida = new Date();
	var fechaLlegada = new Date();
	var fechaVencimiento = new Date();
	
	fechaSalida.setHours(0,0);
	fechaLlegada.setHours(0,0);
	
	
	<!-- BLOCK DATOS --> 
		
		<!-- BLOCK FechaSalida --> fechaSalida = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		<!-- BLOCK FechaLlegada --> fechaLlegada = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		<!-- BLOCK FechaVencimiento --> fechaVencimiento = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
			
		radiosSetValue( form, 'idDestino', '{idDestino}' );
		
		document.getElementById('Tipo').value = '{Tipo}';
		document.getElementById('Observaciones').value = '{Observaciones}';
		document.getElementById('IdiomaExtranjero').value = '{IdiomaExtranjero}';
		document.getElementById('idAgencia').value = '{idAgencia}';
		document.getElementById('KM').value = '{KM}';
				
		if(document.getElementById('redirectVehiculos'))
			document.getElementById('redirectVehiculos').checked = {&redirectVehiculos};
	
		if(document.getElementById('Cancelado'))
			document.getElementById('Cancelado').checked = {&Cancelado};
	
			
		
		<!-- BLOCK ViajeRegular -->
			document.getElementById('ViajeRegular_PrecioPasaje').value = '{PrecioPasaje}';
		<!-- END -->
		
		<!-- BLOCK ViajePrivado -->
			
			radiosSetValue(form, 'ViajePrivado[idPersona]', '{idPersona}');
			document.getElementById('ViajePrivado_Monto').value = '{Monto}';
			document.getElementById('ViajePrivado_idFormaPagoViaje').value = '{idFormaPagoViaje}';
			document.getElementById('ViajePrivado_Detalles').value = '{Detalles}';
			document.getElementById('ViajePrivado_Comprobante').value = '{Comprobante}';
			document.getElementById('incluirAdelanto').checked = {&incluirAdelanto};
			
			document.getElementById('ViajePrivado_idFormaPagoViaje').onchange();
			document.getElementById('incluirAdelanto').onclick();
		<!-- END -->
		
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
	
	
	
	<!-- BLOCK DISABLE_VIAJE_PRIVADO -->
		
	//document.getElementById('FechaSalida_BUTTON').style.display = 'none';
	//document.getElementById('FechaSalida_TEXT').style.color = '#666';
		
	//document.getElementById('FechaLlegada_BUTTON').style.display = 'none';
	//document.getElementById('FechaLlegada_TEXT').style.color = '#666';
		
	//radiosSetDisabled(form, 'idDestino', true, true);
	//radiosSetDisabled(form, 'ViajePrivado[idPersona]', true, true);
		
	//disableFormElement(document.getElementById('ViajePrivado_Monto'));
	disableFormElement(document.getElementById('ViajePrivado_idFormaPagoViaje'));
	disableFormElement(document.getElementById('incluirAdelanto'));
	disableFormElement(document.getElementById('ViajePrivado[Adelanto]_Monto'));
	disableFormElement(document.getElementById('ViajePrivado[Adelanto]_idFormaPagoViaje'));
	
	<!-- END -->
				
</script>