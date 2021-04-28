
<!-- BLOCK LISTA_VIAJES -->

<span class='title'> Viaje </span>
<fieldset class='border'>

<table class='titles'>
	
	<tr>
		<th class='check' onclick="radiosSetNone(form, 'idViaje')"> * </th>
		<th style='width: 150px;'> Destino </th>
		<th style='width: 90px;'> Sale </th>
		<th style='width: 100px'> Saldo </th>
		<th> Ver </th>
		
					
	</tr>

</table>

<div class='tableContenedor' style='height: 120px;'>

<table class='border'>
			 
 	<tbody> 
 	
 	<!-- ARRAY _SELF_ -->
		<tr class='{_INDEX_PARITY_}'> 
		<th class='check'> <input type='radio' name='idViaje' value='{idViaje}' id='idViaje_{idViaje}' onclick="onchangeRadioTable( this, '{_INDEX_PARITY_}' ); if(this.checked) document.getElementById('Pago_Monto').value = '{Saldo}';"/> </th>
		<td style='width: 150px;' onclick="radioSelect('idViaje_{idViaje}')" class='left'> {Destino} </td>
		<td style='width: 90px;' onclick="radioSelect('idViaje_{idViaje}')"> {FechaSalida} </td>
		<td style='width: 100px' onclick="radioSelect('idViaje_{idViaje}')"> $ {Saldo} </td>
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



<script type='text/javascript'>
document.getElementById('Pago_Monto').readOnly = true;

<!-- BLOCK DATOS --> radiosSetValue(form, 'idViaje', '{idViaje}'); <!-- END -->

</script>