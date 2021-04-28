
<!-- DEFINE LISTA_TIPOS_PAGOS getListaFormasPagosViajes(); -->

<div>
	<label class='middle' for='{NAME}_Monto'> {TITLE}: </label>
			
	<span class='prefijo'> $ </span> <input type='text' name='{NAME}[Monto]' id='{NAME}_Monto' class='numerico' onblur='javascript:calculaMonto();'/>
</div>
		
		
<div>
	<label class='middle' for='{NAME}_idFormaPagoViaje'> {TITLE_TYPE}: </label>
	<select id='{NAME}_idFormaPagoViaje' name='{NAME}[idFormaPagoViaje]'>
	
		<option value='0'>Seleccionar...</option>
		<option value='0'></option>
	
		<!-- ARRAY LISTA_TIPOS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
	
	</select>
</div>


<div>
	<label class='middle' for='{NAME}_Comprobante'> Comprobante: </label>
	<input type='text' name='{NAME}[Comprobante]' id='{NAME}_Comprobante' />

</div>
		
		


<div>
	<label class='middle' for='{NAME}_Detalles'> Detalles: </label>
	<input type='text' name='{NAME}[Detalles]' id='{NAME}_Detalles' />

</div>


<script type='text/javascript'>


	document.getElementById( '{NAME}_Monto').value = '{DATOS[Monto]}';
	document.getElementById( '{NAME}_idFormaPagoViaje').value = '{DATOS[idFormaPagoViaje]}';
	document.getElementById( '{NAME}_Comprobante').value = '{DATOS[Comprobante]}';
	document.getElementById( '{NAME}_Detalles').value = '{DATOS[Detalles]}';
	
	
	var MontoOriginal = {DATOS[Monto]};
	
	
	function calculaMonto(){		
		var CantPasajes = document.getElementById('CantPasajes').value;		
		montoTotal = MontoOriginal * CantPasajes;		
		document.getElementById('{NAME}_Monto').value = montoTotal;
	}
</script>
