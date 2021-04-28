<table class='titles'>
	
	<tr>
		<th class='check'> * </th>
		<th style='width: 290px;'> Nombre </th>
		<th> Comisión </th>
					
	</tr>

</table>

<div class='tableContenedor' style='height: 120px' id='tablaAgenciasContenedor'>

<table class='border' id='tablaAgencias'>
			 
 	<tbody> 
 	
 	<!-- ARRAY LISTA_AGENCIAS -->
		<tr class='{_INDEX_PARITY_}'> 
		<th class='check'> <input type='radio' name='idAgencia' value='{idAgencia}' id='idAgencia_{idAgencia}' onchange="onchangeRadioTable( this, '{_INDEX_PARITY_}' );" /> </th>
		<td style='width: 290px; text-align: left' onclick="radioSelect('idAgencia_{idAgencia}')" class='left'> {RazonSocial} </td>
		<td onclick="radioSelect('idAgencia_{idAgencia}')" style='text-align: right; padding-right: 30px'> {Comision} %  </td>
		</tr>
	<!-- END -->
 	
 	</tbody>
	
</table>

</div>
