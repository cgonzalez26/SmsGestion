
<!-- BLOCK LISTA_PASAJEROS -->

<span class='title'> Pasajero </span>
<fieldset class='border'>

<table class='titles'>
	
	<tr>
		<th class='check' onclick="radiosSetNone(form, 'idViajeRegularPasajero')"> * </th>
		<th style='width: 210px;'> Nombre </th>
		<th style='width: 130px;'> Monto </th>
		<th> Ver </th>
		
					
	</tr>

</table>

<div class='tableContenedor' style='height: 120px;'>

<table class='border'>
			 
 	<tbody> 
 	
 	<!-- ARRAY _SELF_ -->
		<tr class='{_INDEX_PARITY_}'> 
		<th class='check'> <input type='radio' name='idViajeRegularPasajero' value='{idViajeRegularPasajero}' id='idViajeRegularPasajero_{idViajeRegularPasajero}' onclick="onchangeRadioTable( this, '{_INDEX_PARITY_}' ); if(this.checked) document.getElementById('Pago_Monto').value = '{Monto}';"/> </th>
		<td style='width: 210px;' onclick="radioSelect('idViajeRegularPasajero_{idViajeRegularPasajero}')" class='left'> {ApellidoNombre} </td>
		<td style='width: 130px;' onclick="radioSelect('idViajeRegularPasajero_{idViajeRegularPasajero}')"> $ {Monto} </td>
		<th> <a href='ver/viajePasajeros/{idViajeRegularPasajero}/' target='_blank'> Ver </a> </th>
		
		</tr>
	<!-- END -->
 	
 	</tbody>
	
</table>

</div>

</fieldset>

<!-- END -->


<br />

<span class='title'> Datos de la Devolución </span>
<fieldset class='border'>


	<!-- DEFINE DATOS_PAGO array('TITLE' => 'Monto', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->

	<!-- INCLUDE formsParts/pagoViaje DATOS_PAGO -->

	
</fieldset>


<script type='text/javascript'>
document.getElementById('Pago_Monto').readOnly = true;

<!-- BLOCK DATOS --> radiosSetValue(form, 'idViajeRegularPasajero', '{idViajeRegularPasajero}'); <!-- END -->

</script>