
<!-- DEFINE LISTA_TIPOS_PAGOS getListaFormasPagosViajes(); -->

<div>
	<label class='middle' for='CtaCte_Monto'> Saldo: </label>
			
	<span class='prefijo'> $ </span> {SALDO_CTA_CTE}
</div>

<div>
	<label class='middle' for='CtaCte_Monto'> Monto: </label>
			
	<span class='prefijo'> $ </span> <input type='text' name='CtaCte[Monto]' id='CtaCte_Monto' class='numerico' />
</div>

<div>
	<label class='middle' for='CtaCte_Concepto'> Concepto: </label>			
	<input type='text' name='CtaCte[Concepto]' id='CtaCte_Concepto' />
</div>

<div>
	<label class='middle' for='CtaCte_idTipoMovimiento'> Tipo Movimiento: </label>
	<select id='CtaCte_idTipoMovimiento' name='CtaCte[idTipoMovimiento]' style="width:150px;">	
		<option value='0'>Seleccionar...</option>
		<option value='0'></option>
		<option value='1'>Debe</option>
		<option value='2'>Haber</option		
	
	</select>
</div>		
		
<div>
	<label class='middle' for='CtaCte_idFormaPagoViaje'> Forma Pago: </label>
	<select id='CtaCte_idFormaPagoViaje' name='CtaCte[idFormaPagoViaje]'>
	
		<option value='0'>Seleccionar...</option>
		<option value='0'></option>
	
		<!-- ARRAY LISTA_TIPOS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
	
	</select>
</div>


<div>
	<label class='middle' for='CtaCte_Comprobante'> Comprobante: </label>
	<input type='text' name='CtaCte[Comprobante]' id='CtaCte_Comprobante' />

</div>
		
		


<div>
	<label class='middle' for='CtaCte_Detalles'> Detalles: </label>
	<input type='text' name='CtaCte[Detalles]' id='CtaCte_Detalles' />
	
</div>

<script type='text/javascript'>

	var selectTipoMovimiento = document.getElementById('CtaCte_idTipoMovimiento');
	var selectFormaPago = document.getElementById('CtaCte_idFormaPagoViaje');
	
	/*selectTipoMovimiento.onchange = function() {
		if(selectTipoMovimiento.value == "1"){
			selectFormaPago.disabled = false;
		}else{
			selectFormaPago.disabled = true;
		}
		
	}

	selectTipoMovimiento.onchange();*/

</script>