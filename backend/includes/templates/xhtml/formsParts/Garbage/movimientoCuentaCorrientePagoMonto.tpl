<span class='title'> Datos del Pago </span>
<fieldset class='border'>


	<!-- DEFINE DATOS_PAGO array('TITLE' => 'Monto', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->

	<!-- INCLUDE formsParts/pagoViaje DATOS_PAGO -->

	
</fieldset>


<br />

<fieldset class='border' style='text-align: center; padding: 10px 0'>
	 
	<div>
		<input type='checkbox' name='asignarViajes' value='1' id='asignarViajes' style='margin-right: 10px' checked='checked' />
		<label for='asignarViajes' style='cursor: pointer'> Asignar Automáticamente el Monto a los viajes pendientes de Pago </label>
	</div>
	
</fieldset>


<input type='hidden' name='Tipo' value='{DATOS[Tipo]}' />

<script type='text/javascript'>
	<!-- BLOCK DATOS --> document.getElementById('asignarViajes').checked = {&asignarViajes}; <!-- END -->
</script>