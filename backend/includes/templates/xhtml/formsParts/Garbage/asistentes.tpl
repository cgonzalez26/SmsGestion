


<!-- DEFINE LISTA_TIPOS_ASISTENTE array_insert_arrays( getListaTiposAsistentes(), array('NAME' => 'Asistente[TiposAsistente]')); -->
<!-- DEFINE LISTA_DESTINOS array_insert_arrays( getListaDestinos(), array('NAME' => 'Asistente[Destinos]')); -->
<!-- DEFINE LISTA_IDIOMAS array_insert_arrays( getListaIdiomas(), array('NAME' => 'Asistente[Idiomas]')); -->
	
<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<span class='title'> Datos Personales </span>

<fieldset class='border'> 
	
	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->

	<!-- INCLUDE formsParts/personas PERSONA -->
	
</fieldset>
		

<span class='title'> Datos Asistente </span>


<fieldset class='border'> 

	<div>
		<label style='line-height: 100px' class='middle'> Tipos Asistente: </label>
		
		<ul class='checks' style='height: auto'>
		
			<!-- ARRAY LISTA_TIPOS_ASISTENTE --> <!-- INCLUDE formsInputs/checkboxListItem --> <!-- END -->
		
		</ul>
		
		<div></div>
		
		<label class='middle'> &nbsp; </label> Seleccionar: 
			<a href='javascript:void(0)' onclick="checksCheckAll('form', 'Asistente[TiposAsistente]');">Todos</a> /
			<a href='javascript:void(0)' onclick="checksCheckNone('form', 'Asistente[TiposAsistente]');">Ninguno</a>
				
		
	</div>
	


	<div class='division'></div>

	<div>
		<label for='Arancel' class='middle'> Arancel: </label>
		<span class='prefijo'> $ </span> <input type='text' class='numerico' name='Asistente[Arancel]' id='Arancel' />
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label style='line-height: 100px' class='middle'> Destinos: </label>
		
		<ul class='checks'>
		
			<!-- ARRAY LISTA_DESTINOS --> <!-- INCLUDE formsInputs/checkboxListItem --> <!-- END -->
		
		</ul>
	
		
		<label class='middle'> &nbsp; </label> Seleccionar: 
			<a href='javascript:void(0)' onclick="checksCheckAll('form', 'Asistente[Destinos]');">Todos</a> /
			<a href='javascript:void(0)' onclick="checksCheckNone('form', 'Asistente[Destinos]');">Ninguno</a>
				
		
	</div>
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' style='line-height: 100px'> Idiomas: </label>
		
		<ul class='checks'>
		
			<!-- ARRAY LISTA_IDIOMAS --> <!-- INCLUDE formsInputs/checkboxListItem --> <!-- END -->
		
		</ul>
		
		<label class='middle'> &nbsp; </label> Seleccionar: 
			<a href='javascript:void(0)' onclick="checksCheckAll('form', 'Asistente[Idiomas]');">Todos</a> /
			<a href='javascript:void(0)' onclick="checksCheckNone('form', 'Asistente[Idiomas]');">Ninguno</a>
				
		
	</div>

</fieldset>


<script type='text/javascript'>

	
	<!-- BLOCK DATOS --> <!-- BLOCK Asistente -->
	
	
		document.getElementById('Arancel').value = '{Arancel}';
	
		checksSetChecked(form, 'Asistente[Destinos]', [{!Destinos}] );
		checksSetChecked(form, 'Asistente[Idiomas]', [{!Idiomas}] );
		checksSetChecked(form, 'Asistente[TiposAsistente]', [{!TiposAsistente}] );
	
	<!-- END --> <!-- END -->
	
			
	
</script>