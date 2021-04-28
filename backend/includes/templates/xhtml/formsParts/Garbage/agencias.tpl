<!-- DEFINE LISTA_TIPOS_IVA getListaTiposIVA(); -->

<span class='title'> Datos Agencia </span>
<fieldset class='border'> 
	
	<div>
		<label class='middle' for='RazonSocial' id='LABEL_RazonSocial'> Razón Social (*): </label>
		<input type='text' id='RazonSocial' name='Agencia[RazonSocial]' />
	
	</div>
	
	
	<div>
		<label class='middle'  for='idTipoIVA' id='LABEL_idTipoIVA'> Situación I.V.A. (*): </label>
		
		<select id='idTipoIVA' name='Agencia[idTipoIVA]'>
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
			
			<!-- ARRAY LISTA_TIPOS_IVA --> <!-- INCLUDE formsInputs/option --> <!-- END -->
			
		</select>
	
	</div>
	
	
	<div>
		<label for='CUIT' class='middle' > CUIT: </label>
		<input type='text' id='CUIT' name='Agencia[CUIT]' />
	
	</div>
	
	<div class='division'></div>
	
	
	<div>
		<label for='Comision' class='middle' > Comisión: </label>
		<input type='text' id='Comision' name='Agencia[Comision]' class='numerico_corto'/> <span class='sufijo'> % </span>
	
	</div>			
	
			
	<div class='division'></div>
	
	<div>
		<label for='Direccion' class='middle' > Dirección: </label>
		<input type='text' id='Direccion' name='Agencia[Direccion]' />
		
	</div>

	
	<div>
		<label for='Telefono' class='middle' > Teléfono: </label>
		<input type='text' id='Telefono' name='Agencia[Telefono]' />
	</div>
	

</fieldset>



<br />

<span class='title'> Datos Contacto </span>


<fieldset class='border'>
	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->
	<!-- INCLUDE formsParts/personas PERSONA -->

</fieldset>


<script type='text/javascript'>

	<!-- BLOCK DATOS --> <!-- BLOCK Agencia -->
	
	document.getElementById('RazonSocial').value = '{RazonSocial}';
	document.getElementById('idTipoIVA').value = '{idTipoIVA}';
	document.getElementById('CUIT').value = '{CUIT}';
	document.getElementById('Comision').value = '{Comision}';
	document.getElementById('Telefono').value = '{Telefono}';
	document.getElementById('Direccion').value = '{Direccion}';
	
	
	
	<!-- END --> <!-- END -->

</script>