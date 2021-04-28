<span class='title'> Cambio de Viaje </span>
<fieldset class='border'>


	<table class='titles'>
	
		<tr>
			<th class='check'> * </th>
			<th style='width: 50px;'> Agencia </th>
			<th style='width: 200px;'> Direccion </th>
			<th style='width: 50px;'> Telefono </th>			
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_AGENCIAS -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='radio' name='idVehiculo' value='{idVehiculo}' id='idVehiculo_{idVehiculo}' onchange="onchangeRadioTable( this, '{_INDEX_PARITY_}' );" /> </th>
	 			<td style='width: 200px;' onclick="radioSelect('idViaje_{idViaje}')" class='left'> {RazonSocial} </td>
	 			<td onclick="radioSelect('idViaje_{idViaje}')" class='left'> {Direccion} </td>
	 			<td style='width: 50px;' onclick="radioSelect('idViaje_{idViaje}')"> {Telefono} </td>	 			
	 			</tr>
	 		<!-- END -->
	 
		</tbody>
		
	</table>
	
	</div>