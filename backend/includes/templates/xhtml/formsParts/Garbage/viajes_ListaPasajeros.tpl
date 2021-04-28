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
	
<!-- END -->


<input type='hidden' name='segundaParte' value='0' /> 


<span class='title'> Pasajeros </span>


<fieldset class='border'>


	<div id='divTablaPasajeros'>
	
		<table class='titles'>
			
			<tr>
				<th class='check' onclick="checksInvertChecked(form, 'borrarPasajeros');"> * </th>
				<th style='width: 120px'> Nombre </th>
				<th style='width: 90px'> Fecha Nac. </th>
				<th style='width: 100px'> Documento </th>
				<th style='width: 60px'> Editar </th>
			</tr>
	
		</table>
	
		<div class='tableContenedor' style='height: 100px'>
		
			<table class='border'>
			
				<tbody id='tbodyPasajeros'>
					<!-- BLOCK DATOS --> <!-- ARRAY Pasajeros -->
				
					<tr class='{_INDEX_PARITY_}'>
						<th class='check'> <input type='checkbox' name='borrarPasajeros[]' value='{_INDEX_}' id='borrarPasajeros_{_INDEX_}' onchange="this.parentNode.parentNode.className = this.checked ? 'checked' : '{_INDEX_PARITY_}';" /> </th>
						<td style='width: 120px' onclick="checkSelect('borrarPasajeros_{_INDEX_}')"> {Apellido}, {Nombre} </td>
						<td style='width: 93px' onclick="checkSelect('borrarPasajeros_{_INDEX_}')"> {FechaNacimiento_FORMAT} </td>
						<td style='width: 100px' onclick="checkSelect('borrarPasajeros_{_INDEX_}')"> {TipoDocumento} {Documento} </td>
						<td class='img' style='cursor: auto; padding: 0; width: 60px'> <a href="javascript: editarPasajero('{_INDEX_}');"> <img style='margin: 2px auto' src='images/edit.gif' /> </a> </td>
						
						<!-- DEFINE HIDDENS array('DATA' => {@*}, 'NAME_PREFIX' => 'Pasajeros[{_INDEX_}]' ) -->
						<!-- INCLUDE formsInputs/hiddenArray HIDDENS -->

					</tr>
				
					<!-- END --> <!-- END -->
				</tbody>
			
			</table>
		
		</div>
		
			
		<div style='padding: 0; padding-left: 40px;'>
		
		Seleccionar: &nbsp;
			<a href='javascript:void(0)' onclick="checksCheckAll(form, 'borrarPasajeros');">Todos</a> /
			<a href='javascript:void(0)' onclick="checksCheckNone(form, 'borrarPasajeros');">Ninguno</a>
			
		<br /> <br />
		
		Para los elementos marcados: 
			<a href='javascript:void(0)' onclick='eliminarPasajeros()' style='margin-left: 5px; text-decoration: none'> 
				<img src='images/remove.gif' style='vertical-align: middle' />
				<span style='text-decoration: underline'> Eliminar </span>
			</a>
			
		</div>
		
	</div>
	
	<div class='division'></div>
	
	<div style='padding-bottom: 30px'>
		<a style='margin-left: 30px; color: #333; font-size: 9pt;' href='javascript: mostrarFormPasajero();' id='labelFormPasajero'> Agregar Pasajero </a>
	</div>
	
	
	<script type='text/javascript'>


		function onFocusPasajeroInput() { form.onsubmit = function () { confirmarPasajeroForm(); return false; } }
	
		function onBlurPasajeroInput() { form.onsubmit = null; } 
		
		function confirmarPasajeroForm() {
		
			form['confirmarPasajero'].value = '1';
			actualizar();
		}
	</script>
		
	
	<div id='divFormPasajero' style='display: none'>
	
		<!-- DEFINE PASAJERO array('NAME' => 'Pasajero', 'DATOS' => {@DATOS[Pasajero]}, 'INPUTS_PROPERTIES_ALL' => array('onfocus' => 'onFocusPasajeroInput', 'onblur' => 'onBlurPasajeroInput') ); -->
		<!-- INCLUDE formsParts/personas PASAJERO -->
		
		
		<div class='division'> </div>
		
		<div style='text-align: center;'>
			<button style='width: 150px; margin: 0 auto; line-height: 20px;' type='button' onclick='confirmarPasajeroForm()' id='buttonConfirmarPasajero'> Agregar </button>
		</div>
		
		<input type='hidden' name='confirmarPasajero' value='0' />
		<input type='hidden' name='confirmarEliminarPasajeros' value='0' />
		<input type='hidden' name='editarPasajero' value='' />

	</div>
	
</fieldset>


<script type='text/javascript'>

	function mostrarFormPasajero( mostrar ) {
		
		var divFormPasajero = document.getElementById('divFormPasajero');
		
		if(mostrar == null) mostrar = divFormPasajero.style.display == 'none';
				
		divFormPasajero.style.display =  mostrar ? 'block' : 'none';
	}

	function eliminarPasajeros() {
		
		var anySelected = checksGetAnySelected( form, 'borrarPasajeros' );
		var formSubmit = false;
			
		if( !anySelected ) alert('No ha seleccionado ningún Pasajero');
		else formSubmit = confirm('¿Está seguro?');
			
		if(formSubmit) {
				
			form['confirmarEliminarPasajeros'].value = '1';
			actualizar();
		}
	}
	
	
	function editarPasajero( indexPasajero ) {
		
		form['editarPasajero'].value = indexPasajero;
		actualizar();
		
	}
	
	
	mostrarFormPasajero( {&MOSTRAR_FORM_PASAJERO} );
	
	
	//-----------------------------------------------------------------
	
	if(document.getElementById('tbodyPasajeros').rows.length == 0) 
		
		document.getElementById('divTablaPasajeros').innerHTML = "<h3 style='text-align: center; padding: 20px 0'> No existen pasajeros </h3> ";
	
					
</script>
