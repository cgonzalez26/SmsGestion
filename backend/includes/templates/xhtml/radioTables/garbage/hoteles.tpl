<table class='titles'>
	
	<tr>
		<th class='check'> * </th>
		<th style='width: 250px;'> Nombre </th>
		<th> Tipo </th>
					
	</tr>

</table>

<div class='tableContenedor' style='height: 120px;' id='tablaHotelesContenedor'>

<table class='border' id='tablaHoteles'>
			 
 	<tbody> 
 	
 	<!-- ARRAY LISTA_HOTELES -->
		<tr class='{_INDEX_PARITY_}'> 
		<th class='check'> <input type='radio' name='idHotel' value='{idHotel}' id='idHotel_{idHotel}' onchange="onchangeRadioTable( this, '{_INDEX_PARITY_}' );" /> </th>
		<td style='width: 250px;' onclick="radioSelect('idHotel_{idHotel}')" class='left'> {Nombre} </td>
		<td style='text-align: left;' onclick="radioSelect('idHotel_{idHotel}')" class='left'> {TipoHotel} </td>
		</tr>
	<!-- END -->
 	
 	</tbody>
	
</table>

</div>
