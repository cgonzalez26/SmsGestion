


<fieldset class='border'>

	<div>
		<label class='middle' for='PassActual'> Contrase�a Actual: </label>
		<input type='password' name='PassActual' id='PassActual' />
	
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='PassNueva'> Contrase�a Nueva: </label>
		<input type='password' name='PassNueva' id='PassNueva' />
	</div>
	
	
	
	<div>
		<label class='middle' for='PassNuevaRepetir'> Repetir Contrase�a Nueva: </label>
		<input type='password' id='PassNuevaRepetir' />
		
		<div class='info'> 
			La contrase�a debe tener entre 6 y 15 caracteres, y s�lo puede contener
			caracteres alfanum�ricos
		</div>
	</div>
	
		

</fieldset>


<script type='text/javascript'>

	form.onsubmit = function() {
		
		if( this['PassNueva'].value != this['PassNuevaRepetir'].value ) {
			
			alert('Las contrase�as en ambos campos no coinciden');
			return false;
		} else return true;
	}

</script>