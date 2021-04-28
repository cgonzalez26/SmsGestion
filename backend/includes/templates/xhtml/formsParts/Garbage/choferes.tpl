<!-- DEFINE LISTA_CAPACIDADES_CHOFERES getListaCapacidadesChoferes(); -->

<span class='title'> Datos Personales </span>
<fieldset class='border'> 


	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->

<!-- INCLUDE formsParts/personas PERSONA -->

</fieldset>

<br />

<span class='title'> Datos Chofer </span>
<fieldset class='border'> 

	<div>
		<label class='middle' for='CHOFER_FechaAltaEmpresa'> Fecha Alta Empresa (*): </label>
		
		<span class='fecha' id='CHOFER_FechaAltaEmpresa'></span>
		<button type='button' id='CHOFER_FechaAltaEmpresa_BUTTON'>...</button>
		<input type='hidden' name='Chofer[FechaAltaEmpresa]' id='CHOFER_FechaAltaEmpresa_HIDDEN' />
	</div>

	
	<div class='division'> </div>

	
	<div>
		<label class='middle' for='CHOFER_FechaAltaCarnet'> Fecha Alta Carnet CNRT (*): </label>
		
		<span class='fecha' id='CHOFER_FechaAltaCarnet'></span>
		<button type='button' id='CHOFER_FechaAltaCarnet_BUTTON'>...</button>
		<input type='hidden' name='Chofer[FechaAltaCarnet]' id='CHOFER_FechaAltaCarnet_HIDDEN' />
	</div>

	
	<div>
		<label class='middle' for='CHOFER_FechaVencimientoCarnet'> Fecha Vencimiento Carnet (*): </label>
		
		<span class='fecha' id='CHOFER_FechaVencimientoCarnet'></span>
		
		<button type='button' id='CHOFER_FechaVencimientoCarnet_BUTTON'>...</button>
		
		<input type='hidden' name='Chofer[FechaVencimientoCarnet]' id='CHOFER_FechaVencimientoCarnet_HIDDEN' />
	</div>
	
	<div class='division'> </div>

	<div>
		<label class='middle' for='CHOFER_FechaAltaCarnetSalta'> Fecha Alta Carnet Salta(*): </label>
		
		<span class='fecha' id='CHOFER_FechaAltaCarnetSalta'></span>
		<button type='button' id='CHOFER_FechaAltaCarnetSalta_BUTTON'>...</button>
		<input type='hidden' name='Chofer[FechaAltaCarnetSalta]' id='CHOFER_FechaAltaCarnetSalta_HIDDEN' />
	</div>

	
	<div>
		<label class='middle' for='CHOFER_FechaVencimientoCarnetSalta'> Fecha Venc. Carnet Salta (*): </label>
		
		<span class='fecha' id='CHOFER_FechaVencimientoCarnetSalta'></span>
		
		<button type='button' id='CHOFER_FechaVencimientoCarnetSalta_BUTTON'>...</button>
		
		<input type='hidden' name='Chofer[FechaVencimientoCarnetSalta]' id='CHOFER_FechaVencimientoCarnetSalta_HIDDEN' />
	</div>	
	
	<div class='division'> </div>

	
	
	<div>
		<label class='middle' for='CHOFER_idTipoCapacidadChofer' id='LABEL_CHOFER_idTipoCapacidadChofer'> Capacidad Manejo (*): </label>
		
		<select id='CHOFER_idTipoCapacidadChofer' name='Chofer[idTipoCapacidadChofer]'>
			<option value='0'> Seleccionar... </option>
			<option value='0'></option>
			<!-- ARRAY LISTA_CAPACIDADES_CHOFERES --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		</select>
	
	</div>
			
	<div class='division'> </div>
	
	<div>	
		<label  class='middle' for='CHOFER_CUIL'> CUIL: </label>
		<input type='text' id='CHOFER_CUIL' name='Chofer[CUIL]' />
	
	</div>
	
</fieldset>




<fieldset class='border'> <legend> Foto </legend>

	<div id='divFoto' style='display:none'>
	
		<span style='text-align: center; display: block'>
			
			<span class='info' style='display: block; font-weight: bold;'> Foto Actual </span>
			<img id='imgFoto' alt='Foto' style='border: solid 1px #CCC; margin: 10px auto ' />
		
	
			<span style='display: block'>
				<input type='checkbox' id='eliminarFoto' name='ELIMINAR_FOTO' value='1' onclick="this.onchange();" onchange="this.form['FOTO'].disabled = this.checked" style='vertical-align: middle' /> 
				<label for='eliminarFoto' class='middle' style='display: inline; float: none; padding: 0; margin-left: 10px'> Eliminar Foto </label>
			</span>
		
		<div class='division'> </div>
	
	</div>

	
	
	<div>
		<label for='datosChoferFoto' id='labelFoto' class='middle' style='width: 150px'> </label>
		<input type='file' name='FOTO' id='datosChoferFoto' />
	
	</div>

</fieldset>


<script type='text/javascript'>

	var fechaVencimientoCarnet = new Date();
	var fechaAltaCarnet = new Date();
	var fechaAltaEmpresa = new Date();
	var fechaAltaCarnetSalta = new Date();
	var fechaVencimientoCarnetSalta = new Date();
	
	var tieneFoto = false;
	var fotoSrc;
	
	<!-- BLOCK DATOS --> 
		
		<!-- BLOCK Chofer --> 
		<!-- BLOCK FechaVencimientoCarnet --> fechaVencimientoCarnet = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
		<!-- BLOCK FechaAltaCarnet --> fechaAltaCarnet = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
		<!-- BLOCK FechaAltaEmpresa --> fechaAltaEmpresa = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
		<!-- BLOCK FechaVencimientoCarnetSalta --> fechaVencimientoCarnetSalta = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 
		<!-- BLOCK FechaAltaCarnetSalta --> fechaAltaCarnetSalta = Date.parseDate( '{*}', '%Y-%m-%d' ); <!-- END --> 	
		
		document.getElementById('CHOFER_idTipoCapacidadChofer').value = '{idTipoCapacidadChofer}';
		document.getElementById('CHOFER_CUIL').value = '{CUIL}';
		
		tieneFoto = Boolean({TieneFoto});
		fotoSrc = 'fotoChofer.php?id={idPersona}';
		
			
	<!-- END --> <!-- END -->
	
	
	var labelFoto = document.getElementById('labelFoto');
	
	if(!tieneFoto) {
		
		labelFoto.innerHTML = 'Foto del Chofer:';
		
	} else {
		
		labelFoto.innerHTML = 'Elegir otra Foto:';
		
		var divFoto = document.getElementById('divFoto');
		divFoto.style.display = 'block';
		
		var imgFoto = document.getElementById('imgFoto');
		imgFoto.src = fotoSrc;
		
	}

	
	Calendar.setup ( {
		
		inputField:		'CHOFER_FechaVencimientoCarnet_HIDDEN',
		button:			'CHOFER_FechaVencimientoCarnet_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'CHOFER_FechaVencimientoCarnet',
		date: fechaVencimientoCarnet
		
	} );
	

	Calendar.setup ( {
		
		inputField:		'CHOFER_FechaAltaCarnet_HIDDEN',
		button:			'CHOFER_FechaAltaCarnet_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'CHOFER_FechaAltaCarnet',
		date: fechaAltaCarnet
		
	} );
	
	

	Calendar.setup ( {
		
		inputField:		'CHOFER_FechaAltaEmpresa_HIDDEN',
		button:			'CHOFER_FechaAltaEmpresa_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'CHOFER_FechaAltaEmpresa',
		date: fechaAltaEmpresa
		
	} );
	
	Calendar.setup ( {
		
		inputField:		'CHOFER_FechaVencimientoCarnetSalta_HIDDEN',
		button:			'CHOFER_FechaVencimientoCarnetSalta_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'CHOFER_FechaVencimientoCarnetSalta',
		date: fechaVencimientoCarnetSalta
		
	} );

	Calendar.setup ( {
		
		inputField:		'CHOFER_FechaAltaCarnetSalta_HIDDEN',
		button:			'CHOFER_FechaAltaCarnetSalta_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'CHOFER_FechaAltaCarnetSalta',
		date: fechaAltaCarnetSalta
		
	} );
	
</script>