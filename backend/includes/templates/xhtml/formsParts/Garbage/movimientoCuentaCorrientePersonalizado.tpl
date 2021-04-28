<span class='title'> Datos Movimiento </span>

<fieldset class='border'>

	<br />

	<div>
		<label for='Descripcion' class='middle'> Descripción (*): </label>
		<input type='text' name='Descripcion' id='Descripcion' />
	</div>
	
	<div class='division'></div>
	
	<div>
		<label for='Debe' class='middle'> Debe: </label>
		<span class='prefijo'> $ </span> <input type='text' name='Debe' id='Debe' class='numerico' />
	</div>
	
	<div>
		<label for='ConceptoDebe' class='middle'> Concepto: </label>
		<input type='text' name='ConceptoDebe' id='ConceptoDebe' />
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label for='Haber' class='middle'> Haber: </label>
		<span class='prefijo'> $ </span> <input type='text' name='Haber' id='Haber' class='numerico' />
	</div>
	
	<div>
		<label for='ConceptoHaber' class='middle'> Concepto: </label>
		<input type='text' name='ConceptoHaber' id='ConceptoHaber' />
	</div>
	
</fieldset>
<br />

<span class='title'> Otros Datos </span>

<fieldset class='border'>

	<div>
		<label for='Comprobante' class='middle'> Comprobante: </label>
		<input type='text' name='Comprobante' id='Comprobante' />
	</div>
	
	
	<div>
		<label for='Detalles' class='middle'> Detalles: </label>
		<input type='text' name='Detalles' id='Detalles' />
	</div>
	

</fieldset>

<input type='hidden' name='Tipo' value='{DATOS[Tipo]}' />


<script type='text/javascript'>

	
	var debeText = document.getElementById('Debe');
	var haberText = document.getElementById('Haber');
	
	var conceptoDebeText = document.getElementById('ConceptoDebe');
	var conceptoHaberText = document.getElementById('ConceptoHaber');

	
	
	
	<!-- BLOCK DATOS -->
	
		document.getElementById('Descripcion').value = '{Descripcion}';
		
		debeText.value = '{Debe}';
		haberText.value = '{Haber}';
		
		conceptoDebeText.value = '{ConceptoDebe}';
		conceptoHaberText.value = '{ConceptoHaber}';
		
		document.getElementById('Comprobante').value = '{Comprobante}';
		document.getElementById('Detalles').value = '{Detalles}';
	<!-- END -->

	
	
</script>