
<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<span class='title'> Tipo de Viaje </span>

<fieldset class='border'>

	<div>
		<label class='middle' for='Tipo'> Tipo de Viaje (*): </label>
		<select id='Tipo' name='Tipo'>
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
			
			<option value='regular'>Regular</option>
			<option value='privado'>Privado</option>
		
		</select>
		
		
		
			
			
	</div>
	

</fieldset>


<!-- BLOCK DATOS -->
<script type='text/javascript'> document.getElementById('Tipo').value = '{Tipo}'; </script>
<input type='hidden' name='idDestino' value='{idDestino}' />
<input type='hidden' name='IdiomaExtranjero' value='{IdiomaExtranjero}' />
<input type='hidden' name='FechaVencimiento' value='{FechaVencimiento}' />
<input type='hidden' name='FechaLlegada' value='{FechaLlegada}' />
<input type='hidden' name='FechaSalida' value='{FechaSalida}' />
<input type='hidden' name='Observaciones' value='{Observaciones}' />
<input type='hidden' name='redirectVehiculos' value='{redirectVehiculos}' />

<!-- BLOCK ViajePrivado -->

	<input type='hidden' name='ViajePrivado[idPersona]' value='{idPersona}' />
	<input type='hidden' name='ViajePrivado[idFormaPagoViaje]' value='{idFormaPagoViaje}' />
	<input type='hidden' name='ViajePrivado[Detalles]' value='{Detalles}' />
	<input type='hidden' name='ViajePrivado[Monto]' value='{Monto}' />
	<input type='hidden' name='ViajePrivado[Comprobante]' value='{Comprobante}' />
	<input type='hidden' name='ViajePrivado[incluirAdelanto]' value='{incluirAdelanto}' />
	
	<!-- BLOCK Adelanto -->
	
		<input type='hidden' name='ViajePrivado[Adelanto][idFormaPagoViaje]' value='{idFormaPagoViaje}' />
		<input type='hidden' name='ViajePrivado[Adelanto][Detalles]' value='{Detalles}' />
		<input type='hidden' name='ViajePrivado[Adelanto][Monto]' value='{Monto}' />
		<input type='hidden' name='ViajePrivado[Adelanto][Comprobante]' value='{Comprobante}' />
	
	
	<!-- END -->
	
			
<!-- END -->

<!-- BLOCK ViajeRegular -->

	<input type='hidden' name='ViajeRegular[PrecioPasaje]' value='{PrecioPasaje}' />

<!-- END -->
<!-- END -->