
<!-- DEFINE LISTA_TIPOS_IVA getListaTiposIVA(); -->

<span class='title'> Datos Cliente </span>

<fieldset class='border'> 

	<div>
		<label class='middle' for='RazonSocial' id='LABEL_RazonSocial'> Razón Social (*): </label>
		<input type='text' id='RazonSocial' name='Cliente[RazonSocial]' />
	
	</div>
	
	
	<div>
		<label class='middle'  for='idTipoIVA' id='LABEL_idTipoIVA'> Situación I.V.A. (*): </label>
		
		<select id='idTipoIVA' name='Cliente[idTipoIVA]'>
			<option value='0'>Seleccionar...</option>
			<option value='0'></option>
			
			<!-- ARRAY LISTA_TIPOS_IVA --> <!-- INCLUDE formsInputs/option --> <!-- END -->
			
		</select>
	
	</div>
	
	
	<div>
		<label for='CUIT' class='middle' > CUIT: </label>
		<input type='text' id='CUIT' name='Cliente[CUIT]' />
	
	</div>
	
	<div class='division'></div>
	
	
	<div>
	
		<label class='middle' for='Fax'> Fax: </label>
		<input type='text' id='Fax' name='Cliente[Fax]'/>
	
	</div>
	
	
	
	<div>
	
		<label class='middle' for='PaginaWeb'> Página Web: </label>
		<input type='text' id='PaginaWeb' name='Cliente[PaginaWeb]'/>
	
	</div>
	
	
	<div class='division'></div>
	
		<div>
		<label class='middle' for='Observaciones'> Observaciones: </label>
		<input type='text' id='Observaciones' name='Cliente[Observaciones]'/>
	</div>


</fieldset>

<br />

<span class='title'> Datos Contacto </span>

<fieldset class='border'> 

	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->

	<!-- INCLUDE formsParts/personas PERSONA -->

</fieldset>



<script type='text/javascript'>

	<!-- BLOCK DATOS --> <!-- BLOCK Cliente -->
	
	document.getElementById('RazonSocial').value = '{RazonSocial}';
	document.getElementById('idTipoIVA').value = '{idTipoIVA}';
	document.getElementById('CUIT').value = '{CUIT}';
	document.getElementById('Fax').value = '{Fax}';
	document.getElementById('PaginaWeb').value = '{PaginaWeb}';
	document.getElementById('Observaciones').value = '{Observaciones}';
		
	<!-- END --> <!-- END -->

</script>