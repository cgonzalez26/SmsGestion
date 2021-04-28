<!-- DEFINE LISTA_TIPOS_ESTADOS getListaTiposEstadosVehiculos() -->

<fieldset class='border'>
	
	<div>
		<label for='idTipoEstadoVehiculo' class='middle'> Concepto (*): </label>
		<select id='idTipoEstadoVehiculo' name='idTipoEstadoVehiculo'>
			<option value='0'> Seleccionar... </option>
			<option value='0'> </option>
			
			<!-- ARRAY LISTA_TIPOS_ESTADOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		
		</select>
	
	</div>

	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='FechaDesdeButton'> Desde: </label>
	
		<span class='fechaHora' id='FechaDesdeText'></span>
	
		<button type='button' id='FechaDesdeButton'>...</button>
	
		<input type='hidden' name='FechaDesde' id='FechaDesdeHidden' />
	</div>

	
	<div>
		<label class='middle' for='FechaHastaButton'> Hasta: </label>
	
		<span class='fechaHora' id='FechaHastaText'></span>
	
		<button type='button' id='FechaHastaButton'>...</button>
	
		<input type='hidden' name='FechaHasta' id='FechaHastaHidden' />
	</div>
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' name='Observaciones' id='Observaciones' />
	
	</div>

</fieldset>


<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript'>

	var fechaDesde = new Date();
	var fechaHasta = new Date();
	
	
	fechaDesde.setHours(0,0);
	fechaHasta.setHours(0,0);
	
	
	<!-- BLOCK DATOS -->
	
		<!-- BLOCK FechaDesde --> fechaDesde = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		<!-- BLOCK FechaHasta --> fechaHasta = Date.parseDate( '{*}', '%Y-%m-%d %k:%M:%S' ); <!-- END --> 
		document.getElementById('idTipoEstadoVehiculo').value = '{idTipoEstadoVehiculo}';
		document.getElementById('Observaciones').value = '{Observaciones}';
				
	<!-- END -->
		
		
	Calendar.setup ( {
		
		inputField:		'FechaDesdeHidden',
		button:			'FechaDesdeButton',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'FechaDesdeText',
		showsTime:		true,
		date: fechaDesde
		
	} );
	
	Calendar.setup ( {
		
		inputField:		'FechaHastaHidden',
		button:			'FechaHastaButton',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'FechaHastaText',
		showsTime:		true,
		date: fechaHasta
		
	} );
				
</script>
