
<span class='title'> Abrir Caja Nueva </span>

<fieldset class='border'>
	<div style='padding: 20px 20px'>
		<label class='middle' for='Fecha_BUTTON'> Fecha: </label>
		
		<span class='fecha' id='Fecha_TEXT'></span>
		
		<button type='button' id='Fecha_BUTTON'>...</button>
		
		<input type='hidden' name='Fecha' id='Fecha_HIDDEN' />
	</div>

</fieldset>

<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript'>

	var fecha = new Date();
	
	<!-- BLOCK DATOS -->
		
		<!-- BLOCK Fecha --> fecha = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
			
	<!-- END -->
	
	
	Calendar.setup ( {
		
		inputField:		'Fecha_HIDDEN',
		button:			'Fecha_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'Fecha_TEXT',
		date: fecha
		
	} );
				
</script>
