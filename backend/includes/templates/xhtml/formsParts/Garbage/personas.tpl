<!-- DEFINE LISTA_TIPOS_DOCUMENTOS getListaTiposDocumentos(); -->

<div>
	<label class='middle' for='{NAME}_Apellido' id='LABEL_{NAME}_Apellido'> Apellido (*): </label>
	<input type='text' id='{NAME}_Apellido' name='{NAME}[Apellido]' />
</div>


<div>
	<label  class='middle'  for='{NAME}_Nombre' id='LABEL_{NAME}_Nombre'> Nombre (*): </label>
	<input type='text' id='{NAME}_Nombre' name='{NAME}[Nombre]' />
</div>


<div>
	<label  class='middle'  for='{NAME}_Email'> E-Mail: </label>
	<input type='text' id='{NAME}_Email' name='{NAME}[Email]' />
</div>



<!--<div>
	<label class='middle' for='{NAME}_FechaNacimientoButton'> Fecha Nacimiento: </label>
	
	<span class='fecha' id='{NAME}_FechaNacimiento'></span>
	
	<button type='button' id='{NAME}_FechaNacimientoButton'>...</button>
	
	<input type='hidden' name='{NAME}[FechaNacimiento]' id='{NAME}_FechaNacimiento_HIDDEN' />
</div>-->


<div>

	<label for='{NAME}_Documento' class='middle' id='LABEL_{NAME}_Documento'> Documento: </label>
	
	<select id='{NAME}_idTipoDocumento' name='{NAME}[idTipoDocumento]' style='width: auto; margin-right: 5px'>
		
		<option value='0'> Seleccionar...</option>
		<option value='0'></option>
		
		<!-- ARRAY LISTA_TIPOS_DOCUMENTOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->	
	
	</select>
	
	
	<input type='text' name='{NAME}[Documento]' id='{NAME}_Documento' style='width: 100px' />

</div>


<div class='division'></div>

<div>
	<label  class='middle'  for='{NAME}_Direccion'> Dirección: </label>
	<input type='text' id='{NAME}_Direccion' name='{NAME}[Direccion]' />
</div>


<!--<div>
	<label  class='middle'  for='{NAME}_Telefono'> Teléfono: </label>
	<input type='text' id='{NAME}_Telefono' name='{NAME}[Telefono]' />
</div>-->


<div>
	<label  class='middle'  for='{NAME}_Celular'> Celular: </label>
	<input type='text' id='{NAME}_Celular' name='{NAME}[Celular]' />
</div>


<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>


<script type='text/javascript'>

	var fechaNacimiento = new Date();
	var prefijoCamposPersona = '{NAME}';
	
	<!-- BLOCK DATOS -->
		
		<!-- BLOCK FechaNacimiento --> fechaNacimiento = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
	
		document.getElementById( prefijoCamposPersona + '_Apellido').value = '{Apellido}';
		document.getElementById( prefijoCamposPersona + '_Nombre').value = '{Nombre}';
		document.getElementById( prefijoCamposPersona + '_Email').value = '{Email}';
		document.getElementById( prefijoCamposPersona + '_Documento').value = '{Documento}';
		document.getElementById( prefijoCamposPersona + '_idTipoDocumento').value = '{idTipoDocumento}';
		document.getElementById( prefijoCamposPersona + '_Direccion').value = '{Direccion}';
		document.getElementById( prefijoCamposPersona + '_Telefono').value = '{Telefono}';
		document.getElementById( prefijoCamposPersona + '_Celular').value = '{Celular}';
			
	<!-- END -->
	
	
	<!-- ARRAY INPUTS_PROPERTIES_ALL -->

		document.getElementById( prefijoCamposPersona + '_Apellido').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Nombre').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Email').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Documento').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_idTipoDocumento').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Direccion').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Telefono').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_Celular').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_FechaNacimientoButton').{$} = {*};
		document.getElementById( prefijoCamposPersona + '_FechaNacimiento').{$} = {*};
	
	<!-- END -->
		
	Calendar.setup ( {
		
		inputField:		'{NAME}_FechaNacimiento_HIDDEN',
		button:			'{NAME}_FechaNacimientoButton',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'{NAME}_FechaNacimiento',
		date: fechaNacimiento
		
	} );
				
</script>
