<span class='title'> Datos del Pago </span>

<fieldset class='border'>


	<div id='divSaldo'>
		<label class='middle'> Saldo: </label>
		<div> <strong> $ {SALDO} </strong> </div>
	</div>

	<!-- DEFINE DATOS_PAGO array('TITLE' => 'Monto', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->

	<!-- INCLUDE formsParts/pagoViaje DATOS_PAGO -->

	
</fieldset>

<script type='text/javascript'>

	<!-- BLOCK MODIFICAR -->
	
		document.getElementById('Pago_Monto').readOnly = true;
		document.getElementById('divSaldo').style.display = 'none';
	
	<!-- END -->

</script>