<!-- DEFINE LISTA_AGENCIAS getListaAgencias(); -->

<span class='title'> Datos Personales </span>
<fieldset class='border'>
	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->
	<!-- INCLUDE formsParts/personas PERSONA -->

</fieldset>

<br />

<span class='title'> Datos Pasaje </span>
<fieldset class='border'>

	<div id='divDatosAdelanto' style='display: block'>
	
		<div>
			<input style='vertical-align: middle; margin-right: 10px; margin-left: 50px' type='checkbox' name='Traspaso[incluirTraspaso]' id='incluirTraspaso' value='1' /> 
			<label for='incluirTraspaso' style='cursor: pointer; text-decoration: underline; color: #559'> Pasajeros Enviados por Otra Agencia </label>
		</div>
	
		<div class='division'></div>
		<div id='divAdelanto' style='display: none'>
		
			<div>
				<label class='middle'> Agencia: </label>	
			
			<select id='idAgencia' name='Traspaso[idAgencia]' style='width: auto; margin-right: 5px'>
				
				<option value='0'> Seleccionar...</option>		
				
				<!-- ARRAY LISTA_AGENCIAS --> <!-- INCLUDE formsInputs/option --> <!-- END -->	
			
			</select>
			</div>					
			<div>
				<label class='middle' for='Traspaso_idFormaPagoViaje'> Forma de Pago (*): </label>
				<select id='Traspaso_idFormaPagoViaje' name='Traspaso[idFormaPagoViaje]'>
				
					<option value='0'>Seleccionar...</option>
					<option value='0'></option>
				
					
					<!-- DEFINE FORMAS_PAGOS getListaFormasPagosViajes(); -->
					
					<option value='6'> Cuenta Corriente </option>
					<option value='0'></option>
					
					<optgroup label='Cobro Inmediato'>
					<!-- ARRAY FORMAS_PAGOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
					
					</optgroup>
				
				</select>
			</div>
			
				<div>	
					<label class='middle' for='MontoTraspaso' style='width: 225px'> Precio Acorde: </label>
					<span class='prefijo'> $ </span> <input type='text' id='MontoTraspaso' name='Traspaso[MontoTraspaso]' style='width: 150px' />			
				</div>
				<div>	
					<label class='middle' for='Traspaso_CantPasajes' style='width: 245px'> Cantidad Pasajes: </label>
					 <input type='text' id='Traspaso_CantPasajes' name='Traspaso[CantPasajes]' style='width: 150px' />			
				</div>		
			
			<div id="DetallePago" style="display:'none'">	
				<div>
					<label class='middle' for='Traspaso_Comprobante'> Comprobante: </label>
					<input type='text' name='Traspaso[Comprobante]' id='Traspaso_Comprobante' />
				
				</div>			
				<div>
					<label class='middle' for='Traspaso_Detalles'> Detalles: </label>
					<input type='text' name='Traspaso[Detalles]' id='Traspaso_Detalles' />
				
				</div>			
	       </div>
		
       </div>
	
	</div>

	

	<div id="PasajeroNormal" style="display:block;">
		<!-- DEFINE PAGO_VARS array('TITLE' => 'Monto (*)', 'TITLE_TYPE' => 'Forma de Pago (*)', 'NAME' => 'Pago', 'DATOS' => {@DATOS[Pago]}  ); -->
	
		<!-- INCLUDE formsParts/pagoViaje PAGO_VARS -->
		
		<div>
			<label class='middle' for='CantPasajes' style='width: 240px'> Cantidad de Pasajes: </label>
			<input type='text' id='CantPasajes' name='CantPasajes' style='width: 150px' value="1" onblur="javascript:calculaMonto();"/>					
		</div>	
	</div>
</fieldset>

<br />
<span class='title'> Datos Hotel </span>
<fieldset class='border'>


	<div>
		<label class='middle' for='BusHotel' style='width: 150px'> Hotel: </label>
		<input type='text' id='BusHotel' name='BusHotel' onfocus='onFocusBuscarHotelInput()' onblur='onBlurBuscarHotelInput()' style='width: 150px' />
		&nbsp; &nbsp; <button type='button' onclick='buscarHoteles()' id='ButtonBusHotel'> Buscar </button>
		
		<span style='padding: 0 10px'> | </span>
		
		<button type='button' onclick="BusHotel.value=''; buscarHoteles();"> Limpiar </button>
		
	</div>
	
	<div style='text-align: center; font-weight: bold; color: #666'> 
		
		<div id='divTablaHoteles' style='padding-left: 20px'> Introduzca un Nombre para Buscar </div>
		<div id='divMensajeBuscandoHoteles' style='display: none'> <img src='images/loading.gif' alt='loading' style='vertical-align: middle; margin-right: 10px' /> Buscando... </div>
	
	</div>
	
	
	<div class='info' style='border-top: solid 1px #EEE; margin: 10px 40px; padding: 20px 0; text-align: center; line-height: 20px'>
	
		Los Hoteles considerados para búsqueda son aquellos que estén en <strong> {NombreLocalidad} </strong>, ya que es el destino
		del viaje en cuestión
	
	</div>
	
	
	
	<div class='division'></div>
	
	<div>
		<label class='middle' for='Habitacion'> Habitación: </label>
		<input type='text' name='Habitacion' id='Habitacion' />
	
	</div>


</fieldset>

<br />

<span class='title'> Datos Agencia </span>
<fieldset class='border'>


	<div>
		<label class='middle' for='BusAgencia' style='width: 150px'> Agencia: </label>
		<input type='text' id='BusAgencia' name='BusAgencia' onfocus='onFocusBuscarAgenciaInput()' onblur='onBlurBuscarAgenciaInput()' style='width: 150px' />
		&nbsp; &nbsp; <button type='button' onclick='buscarAgencias()' id='ButtonBusAgencia'> Buscar </button>
		
		<span style='padding: 0 10px'> | </span>
		
		<button type='button' onclick="BusAgencia.value=''; buscarAgencias();"> Limpiar </button>

	</div>
	
	<div style='text-align: center; font-weight: bold; color: #666'> 
		
		<div id='divTablaAgencias' style='padding-left: 20px'> Introduzca un Nombre para Buscar </div>
		<div id='divMensajeBuscandoAgencias' style='display: none'> <img src='images/loading.gif' alt='loading' style='vertical-align: middle; margin-right: 10px' /> Buscando... </div>
	
	</div>
		
</fieldset>

<script type='text/javascript' src='jscript/dom.js'></script>
<script type='text/javascript' src='jscript/ajax.class.js'></script>
<script type='text/javascript' src='jscript/strings.js'></script>

<script type='text/javascript'>

/*CODIGO AGREGADO PARA PODER TRABJAR CON LA OPCION DE QUE UN PASAJERO ES INTERCAMBIO CON OTRA AGENCIA*/
	document.getElementById('Traspaso_idFormaPagoViaje').onchange = function() {
		
		var value = this.value;
		var displayAdelanto = 'none';
		var displayPago = 'none';
		
		/*if(value == 6) displayPago = 'none';
		else if( Number(value) > 0) displayPago = 'block';*/
		
		/*document.getElementById('DetallePago').style.display = displayPago;*/
		//document.getElementById('divDatosAdelanto').style.display = displayAdelanto;
		
	}

	
	document.getElementById('incluirTraspaso').onclick = function(){
		
		document.getElementById('divAdelanto').style.display = this.checked ? 'block' : 'none';
		document.getElementById('PasajeroNormal').style.display = this.checked ? 'none' : 'block';
	}


/*****************************************************************************************************/



	function onFocusBuscarHotelInput() { form.onsubmit = function () { buscarHoteles(); return false; } }
		
	function onBlurBuscarHotelInput() { form.onsubmit = null; }
	
	function onFocusBuscarAgenciaInput() { form.onsubmit = function () { buscarAgencias(); return false; } }
		
	function onBlurBuscarAgenciaInput() { form.onsubmit = null; }
	
	
	
	function buscarAgencias() {
		
		var cadena = stringTrim( BusAgencia.value );
		if(cadena == ''){cadena = "Silvia Magno Viajes Y Turismo" ;}
		
		
		if(cadena != lastBusAgenciaValue && cadena) {
		
			var ajax = new Ajax('ajax/buscarAgencias.php', true);
			ajax.addVar('cadena', cadena);
			
			ButtonBusAgencia.disabled = true;
			BusAgencia.readOnly = true;
			divTablaAgencias.innerHTML = '';
			divMensajeBuscandoAgencias.style.display = 'block';
			lastBusAgenciaValue = cadena;
				
			ajax.onLoad = function( html ) {
				
				ButtonBusAgencia.disabled = false;
				BusAgencia.readOnly = false;
				
				divTablaAgencias.innerHTML = html;
				divMensajeBuscandoAgencias.style.display = 'none';
				
				var tablaAgencias = document.getElementById('tablaAgencias');
				
				if(tablaAgencias) {
					
					var tablaAgenciasContenedor = document.getElementById('tablaAgenciasContenedor');
					
					if(tablaAgenciasContenedor.offsetHeight > tablaAgencias.offsetHeight)
						tablaAgenciasContenedor.style.height = 'auto';
				}
				
				if(firstIdAgenciaValue != null) {
					
					radiosSetValue( form, 'idAgencia', firstIdAgenciaValue);
					firstIdAgenciaValue = null;
				}
				
				BusAgencia.focus();
				
			}
			
			
			ajax.open();
		
		} else if( cadena != lastBusAgenciaValue ) {
			
			lastBusAgenciaValue = cadena;
			
			divTablaAgencias.innerHTML = 'Introduzca un Nombre para Buscar';
			divMensajeBuscandoAgencias.style.display = 'none';
		}
		
	}
	
	function buscarHoteles() {
		
		var cadena = stringTrim( BusHotel.value );
				
		if(cadena != lastBusHotelValue && cadena) {
			
			var ajax = new Ajax('ajax/buscarHoteles.php', true);
			ajax.addVar('idLocalidad', idLocalidad);
			ajax.addVar('cadena', cadena);
			
			ButtonBusHotel.disabled = true;
			BusHotel.readOnly = true;
			divTablaHoteles.innerHTML = '';
			divMensajeBuscandoHoteles.style.display = 'block';
			lastBusHotelValue = cadena;
			
				
			ajax.onLoad = function( html ) {
				
				ButtonBusHotel.disabled = false;
				BusHotel.readOnly = false;
				
				divTablaHoteles.innerHTML = html;
				divMensajeBuscandoHoteles.style.display = 'none';
				
				
				var tablaHoteles = document.getElementById('tablaHoteles');
				
				if(tablaHoteles) {
					
					var tablaHotelesContenedor = document.getElementById('tablaHotelesContenedor');
					
					if(tablaHotelesContenedor.offsetHeight > tablaHoteles.offsetHeight)
						tablaHotelesContenedor.style.height = 'auto';
				}
				
				if(firstIdHotelValue != null) {
					
					radiosSetValue( form, 'idHotel',firstIdHotelValue);
					firstIdHotelValue = null;
				}
				
				BusHotel.focus();
				
			}
			
			
			ajax.open();
		
		} else if( cadena != lastBusHotelValue ) {
			
			lastBusHotelValue = cadena;
			divTablaHoteles.innerHTML = 'Introduzca un Nombre para Buscar';
			divMensajeBuscandoHoteles.style.display = 'none';
		}
	}
	
	
	
	var idLocalidad = '{idLocalidad}';
	
	
	
	var divTablaHoteles = document.getElementById('divTablaHoteles');
	var divTablaAgencias = document.getElementById('divTablaAgencias');
	
	var BusHotel = document.getElementById('BusHotel');
	var BusAgencia = document.getElementById('BusAgencia');
	
	var ButtonBusHotel = document.getElementById('ButtonBusHotel');
	var ButtonBusAgencia = document.getElementById('ButtonBusAgencia');
	
	var divMensajeBuscandoHoteles = document.getElementById('divMensajeBuscandoHoteles');
	var divMensajeBuscandoAgencias = document.getElementById('divMensajeBuscandoAgencias');
	
	
	var lastBusHotelValue = '';
	var lastBusAgenciaValue = '';
	
	var firstIdHotelValue = null;
	var firstIdAgenciaValue = null;
			
		
	<!-- BLOCK DATOS --> 
	
	document.getElementById('Habitacion').value = '{Habitacion}';
	document.getElementById('CantPasajes').value = '{CantPasajes}';
	
	BusHotel.value = '{BusHotel}';
	BusAgencia.value = '{BusAgencia}';
	
	firstIdHotelValue = '{idHotel}';
	firstIdAgenciaValue = '{idAgencia}';	
	
	
	
	buscarHoteles();
	buscarAgencias();
		
	<!-- END --> 
		

	
	
</script>