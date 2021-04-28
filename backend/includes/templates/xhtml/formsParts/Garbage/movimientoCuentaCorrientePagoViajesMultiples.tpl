
<!-- BLOCK LISTA_VIAJES -->

<span class='title'> Viaje </span>
<fieldset class='border'>

<table class='titles'>
	
	<tr>
		<th class='check' onclick="checksInvertChecked(form, 'Viajes')"> * </th>
		<th style='width: 150px;'> Destino </th>
		<th style='width: 100px;'> Sale </th>
		<th style='width: 100px'> Saldo </th>
		<th> Ver </th>
					
	</tr>

</table>

<div class='tableContenedor' style='height: 120px;'>

<table class='border'>
			 
 	<tbody> 
 	
 	<!-- ARRAY _SELF_ -->
		<tr class='{_INDEX_PARITY_}'> 
		<th class='check'> <input type='checkbox' name='Viajes[]' value='{idViaje}' id='Viajes_{idViaje}' onchange="this.parentNode.parentNode.className = this.checked ? 'checked' : '{_INDEX_PARITY_}'; actualizarMonto('{Saldo_}', this.checked);" /> </th>
		<td style='width: 150px;' onclick="checkSelect('Viajes_{idViaje}')" class='left'> {Destino} </td>
		<td style='width: 100px;' onclick="checkSelect('Viajes_{idViaje}')"> {FechaSalida} </td>
		<td style='width: 100px' onclick="checkSelect('Viajes_{idViaje}')"> $ {Saldo} </td>
		<th> <a href='ver/viajes/{idViaje}/' target='_blank'> Ver </a> </th>
	
		
		</tr>
	<!-- END -->
 	
 	</tbody>
	
</table>

</div>

</fieldset>

<!-- END -->

<br />

<span class='title'> Datos del Pago </span>
<fieldset class='border'>


	<!-- DEFINE DATOS_PAGO array('TITLE' => 'Monto', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->

	<!-- INCLUDE formsParts/pagoViaje DATOS_PAGO -->

	
</fieldset>


<input type='hidden' name='Tipo' value='{DATOS[Tipo]}' />

<script type='text/javascript' src='jscript/strings.js'></script>

<script type='text/javascript'>

	document.getElementById('Pago_Monto').readOnly = true;

	function actualizarMonto( monto, checked ) {
	
		monto = stringParseNumber( monto );
		
		if(!checked) monto = -1 * monto;
		
		montoActual += monto;
		
		document.getElementById('Pago_Monto').value = stringFormatNumber( montoActual, 2 );
	
	}

	var montoActual = 0;
	
	<!-- BLOCK DATOS --> 
	
		<!-- BLOCK Viajes --> checksSetChecked(form, 'Viajes', <!-- INCLUDE jscript/variables/array * -->);  <!-- END -->
		montoActual = 0;
	<!-- END -->
	

	<!-- BLOCK LISTA_VIAJES -->
	actualizarMonto(0,true);
	<!-- END -->

</script>