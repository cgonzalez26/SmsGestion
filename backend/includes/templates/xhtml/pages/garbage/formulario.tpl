<!-- INCLUDE struct/xhtml.header -->

<!-- INCLUDE blocks/mainHeader -->

<!-- INCLUDE blocks/userMenu -->

<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<div class='cuerpo'>

	<script type='text/javascript' src='jscript/forms.js'></script>
	<script type='text/javascript' src='jscript/dom.js'></script>
		
	<form id='form' method='post' class='centerForm' enctype='multipart/form-data' name='form'>
	
	
	<h4 class='titulo'> 
		<a style='text-align: right; float: right; position: relative; top: 5px; font-size: 8pt' href='javascript:volver();' id='linkVolver'>Volver</a> 
		{TITLE} 
	</h4>
	{HIDDEN}
	<ul class='errores'>
		<!-- ARRAY ERRORES --> <li> - {*}</li><!-- END -->
	</ul> 
	
	{DATOS_ARRAY}
	<script type='text/javascript'>
	
		function actualizar() {
			
			form['confirmarDatos'].value = '0';
			form.submit();
			
		}
		
		function volver() {
			
			{VOLVER_JSCRIPT_CODE}
		}
		
		
		var form = document.forms['form'];
	
	</script>

	
	<!-- INCLUDE formsParts/{FORM_PART} -->
	
	
	<input type='hidden' name='confirmarDatos' value='1' />
	<input type='hidden' name='confirmarSubmit' value='1' />
	
	
	<!-- BLOCK AGREGAR_OTRO --> 

	<br />
	<fieldset style='text-align: center' class='border'>
	
		<!-- DEFINE AGREGAR_CHECKED $_REQUEST['_agregarOtro'] ? " checked='checked'" : '' -->

		<input type='checkbox' name='_agregarOtro' value='1' id='_agregarOtro' style='margin-right: 10px'{AGREGAR_CHECKED} />
		<label for='_agregarOtro'> Luego de agregar el elemento, agregar otro </label>
		
	</fieldset>

	<!-- END -->

	
	
	<fieldset>
	
		<!-- BLOCK INFO_CAMPOS_OBLIGATORIOS --> <span class='info'> {*} </span> <!-- END -->
	
		<div class='buttons'>
			<button type='submit' id='formSubmitButton'> {SUBMIT_BUTTON_TEXT} </button>
			<button type='button' onclick='volver()' id='botonVolver'> Volver </button>
		</div>
	
	</fieldset>

	</form>

	
	<script type='text/javascript'>
	
	var i;
	
	for(i=0; i < form.elements.length; i++)
	
		if(form.elements[i].type && (form.elements[i].type == 'text') && !form.elements[i].disabled) {
			
			form.elements[i].focus();
			break;
		}
		
		
	
	
	<!-- BLOCK ONLY_UPDATE --> form.onsubmit = function() { actualizar(); } <!-- END -->
		
	
	{ADDITIONAL_JAVASCRIPT_CODE}
	
	</script>
	
</div>





<!-- INCLUDE struct/xhtml.foot -->