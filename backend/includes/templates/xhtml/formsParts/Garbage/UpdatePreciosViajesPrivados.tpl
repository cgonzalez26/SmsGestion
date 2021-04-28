<span class='title'> Datos Precio Pasaje </span>
<fieldset class='border'> 
	
	<table cellspacing='5' cellpadding='2' border='0'>
	<tr>
	<td class='center' width='90'><strong>Fecha Salida: </strong> </td>
	<td class='center' id='FechaSalida_{idViaje}' width='150' style='border-bottom:1px solid #000;'>{FechaSalida}</td>
	<td class='center'><strong>Destino: </strong> </td>
	<td class='left' id='Destino_{idViaje}' style='border-bottom:1px solid #000;'>&nbsp; {Destino} </td>
	</tr>
	
	<tr>
	<td class='center'><strong>Cliente: </strong> </td>
	<td class='left' colspan='3' id='ApellidoNombre_{idViaje}' style='border-bottom:1px solid #000;'> {ApellidoNombre}</td>
	</tr>
	
	<tr>
	<td class='center'><strong>Monto: </strong> </td>
	<td class='left'> 
		<input type='text' id='Monto_{idViaje}' name='Monto_{idViaje}' style='width: 80px; padding: 2px 2px' class='numerico'/>
	</td>
	<td class='center'><strong>Tipo Pago: </strong> </td>
	<td class='left'> 
		<select id='idFormaPagoViaje_{idViaje}' name='idFormaPagoViaje_{idViaje}'>
		
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
		
			
			<!-- DEFINE FORMAS_PAGOS getListaFormasPagosViajes(); -->
			
			<option value='6'> Cuenta Corriente </option>
			<option value='0'></option>
			
			<optgroup label='Pago Inmediato'>
			<!-- ARRAY FORMAS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
			
			</optgroup>
		
		</select>
	</td>
	</tr>
</table>	
	
	<div id='trIncluirAdelanto' style='display:none'>				
			<input type='checkbox' name='incluirAdelanto_{idViaje}' id='incluirAdelanto_{idViaje}' value='1' style='vertical-align: middle; margin-right: 10px; margin-left: 50px'>&nbsp;<label for='incluirAdelanto' style='cursor: pointer; text-decoration: underline; color: #559;width:250px !important;'>Incluir adelanto</label> 							
	</div>
	
	<div id='divAdelanto' style='display: none'>
		<div>
		&nbsp;&nbsp;<strong>Monto : </strong><input type='text' id='Adelanto_{idViaje}' name='Adelanto_{idViaje}' style='width: 100px;margin-left:50px;' class='numerico'/>
		&nbsp;&nbsp;&nbsp;&nbsp;<strong>Forma Pago: </strong>
			<select id='idFormaPagoViajeAdelanto_{idViaje}' name='idFormaPagoViajeAdelanto_{idViaje}'>
			
				<option value='0'>Seleccionar...</option>
				<option value='0'></option>		
				
				<!-- DEFINE FORMAS_PAGOS getListaFormasPagosViajes(); -->		
				
				<optgroup label='Pago Inmediato'>
				<!-- ARRAY FORMAS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->				
				</optgroup>
			
			</select>				
		</div>	
		<div>
			&nbsp;&nbsp;<strong> Comprobante: </strong>
			<input type='text' name='Comprobante_{idViaje}' id='Comprobante_{idViaje}' style='width:100px;margin-left:15px;'/>		
			&nbsp;&nbsp;<strong> Detalles: </strong>
			<input type='text' name='Detalles_{idViaje}' id='Detalles_{idViaje}' style='width:100px;margin-left:15px;'/>			
		</div>				
	
	</div>
</fieldset>

<script type='text/javascript'>

	<!-- BLOCK DATOS1 -->
		
		var prefijoCamposPasaje = '{idViajePrivado}';
	
		document.getElementById('Monto_' + prefijoCamposPasaje).value = '{PrecioPasaje}';						
		document.getElementById('idFormaPagoViaje_' + prefijoCamposPasaje).value = '{FormaPagoViaje}';
		//alert('{idFormaPagoViaje}');	
		document.getElementById('FechaSalida_' + prefijoCamposPasaje).innerHTML = '{FechaSalida}';	
		document.getElementById('Destino_' + prefijoCamposPasaje).innerHTML = '{Destino}';	
		document.getElementById('ApellidoNombre_' + prefijoCamposPasaje).innerHTML = '{ApellidoNombre}';	
		
		
		document.getElementById('idFormaPagoViaje_' + prefijoCamposPasaje).onchange = function() {
			
			var value = this.value;
			var displayAdelanto = 'none';
			var displayPago = 'none';
			
			if(value == 6) displayIncluirAdelanto = 'block';
			else if( Number(value) > 0) displayIncluirAdelanto = 'none';
			
			document.getElementById('trIncluirAdelanto_' + prefijoCamposPasaje).style.display = displayIncluirAdelanto;
			//document.getElementById('divDatosAdelanto').style.display = displayAdelanto;
			
		}
	
		
		document.getElementById('incluirAdelanto_' + prefijoCamposPasaje).onclick = function(){			
			document.getElementById('divAdelanto_' + prefijoCamposPasaje).style.display = this.0.checked ? 'block' : 'none';			
		}
	
	
		<!-- END -->
	
	
</script>


