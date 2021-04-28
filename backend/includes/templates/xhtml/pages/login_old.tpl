
<div id='cuerpo'>

	<script type='text/javascript' src='jscript/forms.js'></script>

		
	<form id='form' name='form' method='post' class='centerForm' enctype='multipart/form-data'>	
	
		<ul class='errores'>
			{ERRORES}
		</ul> 
	
	
	<span class='title'> Iniciar Sesi&otilde;n </span>
	<br /><br /> 
	<fieldset class='border'>		
	
		<div>
			<label class='middle' for='Nick'> Nombre de Usuario: </label>
			<input type='text' name='Nick' id='Nick'/>
		</div>
		
		
		<div>
			<label class='middle' for='Pass'> Contrase&ntilde;a: </label>
			<input type='password' name='Pass' id='Pass'/>
		</div>
		
		<input type='hidden' name='Confirmar' value='1' />
	
	</fieldset>
	
	
	<fieldset>
		<div class='buttons'>
			<button type='submit'> Aceptar </button>
			<button type='button' onclick='this.form.reset()'> Limpiar </button>
		</div>
	
	</fieldset>

	</form>

	
	<script type='text/javascript'>			
			
			/*document.getElementById('Nick').value = '{Nick}';		*/
			document.forms['form'].Nick.focus();
	
	</script>
	
</div>

