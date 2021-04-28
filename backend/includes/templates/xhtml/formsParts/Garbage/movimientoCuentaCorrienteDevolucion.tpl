<span class='title'> Datos de la Devolución </span>


<fieldset class='border'>


	<div id='divSaldo'>
		<label class='middle'> Saldo a Favor del Cliente: </label>
		<div> <strong> $ {SALDO} </strong> </div>
	</div>

	
	<!-- DEFINE DATOS_PAGO array('TITLE' => 'Monto', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->

	<!-- INCLUDE formsParts/pagoViaje DATOS_PAGO -->
	
</fieldset>


<input type='hidden' name='Tipo' value='{DATOS[Tipo]}' />


<script type='text/javascript'>

	<!-- BLOCK MODIFICAR -->
	
		document.getElementById('Pago_Monto').readOnly = true;
		document.getElementById('divSaldo').style.display = 'none';
	
	<!-- END -->

</script>