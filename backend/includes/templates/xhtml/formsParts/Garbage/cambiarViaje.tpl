<span class='title'> Datos de Viaje </span>
<fieldset class='border'>
	<table class='titles'>
	
		<tr>
			<th class='check'> * </th>			
			<th style='width: 200px;'> Agencia </th>
			<th> Direccion </th>
			<th style='width: 50px;'> Telefono </th>
		</tr>

	</table>

	<div class='tableContenedor'>

	<table class='border'>
				 
	 	<tbody>
	 	
	 		<!-- ARRAY LISTA_AGENCIAS -->
	 			<tr class='{_INDEX_PARITY_}'>
	 			<th class='check'> <input type='radio' name='idAgencia' value='{idAgencia}' id='idAgencia_{idAgencia}' onchange="onchangeRadioTable( this, '{_INDEX_PARITY_}' );" /> </th>	 			
	 			<td style='width: 200px;' onclick="radioSelect('idAgencia_{RazonSocial}')" class='left'> {RazonSocial} </td>
	 			<td  onclick="radioSelect('idAgencia_{Direccion}')" class="left"> {Direccion} </td>
	 			<td style='width: 50px;' onclick="radioSelect('idAgencia_{Telefono}')" class='left'> {Telefono} </td>
	 			</tr>
	 		<!-- END -->	 		
 		
	 
		</tbody>
		
	</table>
	
	</div>	
	
	<a href='javascript:void(0);' style='margin-left: 50px' onclick="radiosSetNone(form, 'idAgencia')"> Seleccionar Ninguno </a>	
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='MontoTraspaso'> Precio de Traspaso (*): </label>
		<span class='prefijo'> $ </span> <input type='text' class='numerico' id='MontoTraspaso' name='MontoTraspaso' value="{Monto}" />
	</div>
	
</fieldset>	


<script type='text/javascript'>

	<!-- BLOCK DATOS --> 
		
		radiosSetValue(form, 'idAgencia', '{idAgencia}' );
		
		//document.getElementById('Nombre').value = '{Nombre}';
		
		var radioViajeSelected = radiosGetSelected(form, 'idAgencia');
		if(radioViajeSelected) 
			radioViajeSelected.parentNode.parentNode.parentNode.parentNode.parentNode.scrollTop = radioViajeSelected.parentNode.parentNode.offsetTop;
	
	<!-- END --> 
	
	
				
</script>