<!-- DEFINE LISTA_TIPOS_USUARIOS getListaTiposUsuarios() -->


<span class='title'> Datos Usuario </span>

<fieldset class='border'>
	
	<div>
		<label for='Nick' class='middle'> Nick (*): </label>
		<input type='text' id='Nick' />
		<div class='info'> 
			El nick debe tener entre 6 y 20 caracteres, y sólo puede contener
			caracteres alfanuméricos, guión medio (-), guión bajo (_) y punto (.)
		</div>
	</div>
	
	<div>
		<label class='middle' for='idTipoUsuario'> TipoUsuario (*): </label>
		<select id='idTipoUsuario' name='Usuario[idTipoUsuario]'>
			<option value='0'> Seleccionar... </option>
			<option value='0'> </option>
			<!-- ARRAY LISTA_TIPOS_USUARIOS --> <!-- INCLUDE formsInputs/option --> <!-- END -->
		</select>
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label for='Pass' class='middle'> Contraseña (*): </label>
		<input id='Pass' style='width: 100px' type='password' name='Usuario[Pass]'/>
		
		<span id='passCheckSpan'>
		
			<span style='border-right: solid 1px #CCC; font-size: 12pt; margin: 0 10px;'> &nbsp; </span> &nbsp;
			
			<input type='checkbox' name='modificarPass' id='modificarPass' onclick='setModificarPass(this.checked)' value='1' style='vertical-align: middle;  position:relative; top: -5px' /> 
			<label style='vertical-align: middle; text-decoration: underline;  position:relative; top: -5px' for='modificarPass' class='select'> Modificar </label>
			
		</span>
		
		<div class='info'> 
			La contraseña debe tener entre 6 y 15 caracteres, y sólo puede contener
			caracteres alfanuméricos
		</div>
	</div>
	
	
	<div class='division'></div>
	
	
	<div>
		<label class='middle' for='Usuario_Estado'> Estado Cuenta: </label>
		<select id='Usuario_Estado' name='Usuario[Estado]'>
		
			<option value='activado'> Activo </option>
			<option value='desactivado' > Desactivado </option> 
		
		</select>
	
	</div>
	
	
	
	<div id='divCausaDesactivacion' style='display: none'>
	
		<label class='middle' for='Usuario_CausaDesactivacion'> Causa Desactivación: </label>
		<input type='text' id='Usuario_CausaDesactivacion' name='Usuario[CausaDesactivacion]' />
	
	</div>
		
	
	

</fieldset>

<br />

<span class='title'> Datos Personales </span>

<fieldset class='border'> 

	<!-- DEFINE PERSONA array('NAME' => 'Persona', 'DATOS' => {@DATOS[Persona]}  ); -->

	<!-- INCLUDE formsParts/personas PERSONA -->

</fieldset>
	
<script type='text/javascript'>


	function setModificarPass( enabled ) {
		
		if(!enabled) {
			
			passInput.value = '';
			passInput.disabled = true;
			passInput.style.backgroundColor = '#EEE';
		
		} else {
			
			passInput.disabled = false;
			passInput.style.backgroundColor = '#FFF';
		}
	}
	
	
	
	var modificar = false;
	<!-- BLOCK MODIFICAR --> modificar = true; <!-- END -->
	
	var modificarPassEnabled = !modificar;		
	var passInput = form['Pass'];
	var nickInput = form['Nick'];
	var passModificarCheck = form['modificarPass'];
	
	
	if(modificar) {
		
		nickInput.readOnly = true;
		nickInput.style.backgroundColor = '#EEE';
		passModificarCheck.checked = modificarPassEnabled;
		setModificarPass(modificarPassEnabled);
				
	} else {
		
		document.getElementById('passCheckSpan').style.display = 'none';
		setModificarPass(true);
		passModificarCheck.checked = true;
		
		
		nickInput.name = 'Usuario[Nick]';
		
	}
		
	passInput.value = '';
	
	
	var estado = 'activado';
	var selectEstado = document.getElementById('Usuario_Estado');
	
	<!-- BLOCK DATOS -->
		<!-- BLOCK Usuario -->
		
			nickInput.value = '{Nick}';
			document.getElementById('idTipoUsuario').value = '{idTipoUsuario}';
			document.getElementById('Usuario_CausaDesactivacion').value = '{CausaDesactivacion}';
						
			estado = '{Estado}';
			
		<!-- END -->
	<!-- END -->
	
	
	selectEstado.value = estado;
		
	selectEstado.onchange = function() {
		
		document.getElementById('divCausaDesactivacion').style.display = this.value == 'activado' ? 'none' : 'block';
	}

	selectEstado.onchange();
	 
</script>