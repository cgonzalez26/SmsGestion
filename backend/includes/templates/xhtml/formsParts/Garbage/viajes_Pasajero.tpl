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


<input type='hidden' name='terceraParte' value='0' /> 
<input type='hidden' name='confirmarEditarPasajero' value='1' /> 

<span class='title'> Editar Pasajero </span>

<fieldset class='border'>

	<!-- DEFINE PASAJERO array('NAME' => 'Pasajero', 'DATOS' => {@DATOS[Pasajero]} ); -->
	<!-- INCLUDE formsParts/personas PASAJERO -->
		
	<input type='hidden' name='indexPasajero' value='{INDEX_PASAJERO}' />

</fieldset>


					

