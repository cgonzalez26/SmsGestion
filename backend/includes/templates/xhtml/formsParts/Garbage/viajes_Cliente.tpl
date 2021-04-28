<input type="hidden" name="idDestino" value="{DATOS[idDestino]}" />
<input type="hidden" name="Tipo" value="{DATOS[Tipo]}" />
<input type="hidden" name="FechaSalida" value="{DATOS[FechaSalida]}" />
<input type="hidden" name="FechaLlegada" value="{DATOS[FechaLlegada]}" />
<input type="hidden" name="idTipoEstadoViaje" value="{DATOS[idTipoEstadoViaje]}" />
<input type="hidden" name="FechaVencimiento" value="{DATOS[FechaVencimiento]}" />
<input type="hidden" name="Monto" value="{DATOS[Monto]}" />
<input type="hidden" name="idTipoPagoViaje" value="{DATOS[idTipoPagoViaje]}" />
<input type="hidden" name="Adelantado" value="{DATOS[Adelantado]}" />
<input type="hidden" name="Observaciones" value="{DATOS[Observaciones]}" />

<!-- BLOCK DATOS -->

	<!-- ARRAY Vehiculos --> <input type='hidden' name='Vehiculos[]' value='{*}' />  <!-- END -->
	<!-- ARRAY Choferes --> <input type='hidden' name='Choferes[]' value='{*}' />  <!-- END -->
	<!-- ARRAY Asistentes --> <input type='hidden' name='Asistentes[]' value='{*}' />  <!-- END -->
	
	<!-- ARRAY Pasajeros -->
				
		<!-- DEFINE HIDDENS array('DATA' => {@*}, 'NAME_PREFIX' => 'Pasajeros[{_INDEX_}]' ) -->
		<!-- INCLUDE formsInputs/hiddenArray HIDDENS -->

	<!-- END -->
<!-- END -->


<input type='hidden' name='segundaParte' value='0' />

<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<span class='title'> Cliente </span>

<fieldset class='border'>

	<div>
		<label class='middle' style='line-height: 100px'> Cliente (*): </label>
		
		<ul class='radios'>
		<!-- ARRAY LISTA_CLIENTES -->
			<!-- DEFINE NAME 'idCliente' -->
			<!-- DEFINE VALUE '{idPersona}' -->		
			<!-- DEFINE TEXT '{RazonSocial}' --> 
			<!-- INCLUDE formsInputs/radioListItem -->
			
		<!-- END -->
		
		</ul>
	
	</div>

</fieldset>

<script type='text/javascript'>

	<!-- BLOCK DATOS --> 		
		radiosSetValue( form, 'idCliente', '{idCliente}' );
	<!-- END -->
</script>
		
