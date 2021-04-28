


<fieldset class='border'>

	<div>
		<label class='middle' for='PassActual'> Contraseña Actual: </label>
		<input type='password' name='PassActual' id='PassActual' />
	
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='PassNueva'> Contraseña Nueva: </label>
		<input type='password' name='PassNueva' id='PassNueva' />
	</div>
	
	
	
	<div>
		<label class='middle' for='PassNuevaRepetir'> Repetir Contraseña Nueva: </label>
		<input type='password' id='PassNuevaRepetir' />
		
		<div class='info'> 
			La contraseña debe tener entre 6 y 15 caracteres, y sólo puede contener
			caracteres alfanuméricos
		</div>
	</div>
	
		

</fieldset>


<script type='text/javascript'>

	form.onsubmit = function() {
		
		if( this['PassNueva'].value != this['PassNuevaRepetir'].value ) {
			
			alert('Las contraseñas en ambos campos no coinciden');
			return false;
		} else return true;
	}

</script>