<td class='left'> {FechaSalida} </td>
<td class='numerico'> {Destino} </td>
<td class='left'> {ApellidoNombre} </td>
<td class='left'> 
	<input type='text' id='Monto' name='Monto' style='width: 50px; padding: 2px 2px' value='{PrecioPasaje}'/>
</td>
<td class='left'> 
	<select id='Viajes_idFormaPagoViaje' name='Viajes[idFormaPagoViaje]'>
	
		<option value='0'>Seleccionar...</option>
		<option value='0'></option>
	
		
		<!-- DEFINE FORMAS_PAGOS getListaFormasPagosViajes(); -->
		
		<option value='6'> Cuenta Corriente </option>
		<option value='0'></option>
		
		<optgroup label='Cobro Inmediato'>
		<!-- ARRAY FORMAS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		
		</optgroup>
	
	</select>
</td>