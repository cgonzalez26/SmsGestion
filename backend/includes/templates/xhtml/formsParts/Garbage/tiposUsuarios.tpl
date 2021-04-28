


<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<fieldset class='border'>

	<div>
		<label for='Nombre' class='middle'> Nombre (*): </label>
		<input type='text' id='Nombre' name='Nombre' />
	</div>
	
</fieldset>

<br />
<span class='title'> Permisos </span>

<fieldset class='border'>

	<div class='info' style='padding: 20px'> 
		Para definir los Permisos de este tipo de usuario, seleccione un objeto sobre el cuál definir permisos de la lista de la izquierda,
		y luego seleccione las acciones que estarán autorizados a realizar sobre el tipo de objeto elegido.
	</div>
	
	
	<table style='width: 100%; margin-bottom: 30px'>
		
		<tr>
			<th style='text-align: center; padding: 20px 0;'> Objeto: </th>
			<th style='text-align: center; padding: 20px 0;'> <span id='titlePermisos' style='visibility: hidden'> Permisos: </span> </th>
		</tr>
		
		<tr>
		
			<td style='text-align: center; padding-left: 20px; border-right: solid 1px #CCC; padding-right: 10px'>
				
				<ul class='radios' style='height: 300px;'>
				
					<!-- DEFINE LISTA_TIPOS_OBJETOS_PERMISOS getListaTiposObjetosPermisos(); -->
					
					<!-- ARRAY LISTA_TIPOS_OBJETOS_PERMISOS -->
					
						<!-- DEFINE LISTA_OBJETOS_PERMISOS getListaObjetosPermisos('{VALUE}'); -->
						
						<li class='group'> {TEXT} </li>
						
						<!-- ARRAY LISTA_OBJETOS_PERMISOS --> 
						
							<!-- DEFINE NAME 'ObjetoPermiso' -->
							<!-- DEFINE ONCHANGE "mostrarUlPermisos('{VALUE}');" -->
							<!-- INCLUDE formsInputs/radioListItem -->
							
						<!-- END -->
						
					<!-- END -->
				</ul> 
			</td>
			
			<td style='text-align: center; width: 260px'>
			
				<!-- DEFINE LISTA_TIPOS_OBJETOS_PERMISOS_TODOS getListaObjetosPermisos(); -->
			
				<!-- ARRAY LISTA_TIPOS_OBJETOS_PERMISOS_TODOS -->
				
					<div id='divPermisos_{VALUE}' style='display: none;'>
					
						<div style='text-align: left; width: 190px; margin: 0 auto 20px; color: #666; font-size: 9pt; line-height: 18px'> {DESCRIPCION} </div>
					
					
						<ul class='checks' id='ulPermisos_{VALUE}' style='height: auto; width: 190px; margin: 0 auto; overflow-y: hidden'>
						
						<!-- DEFINE LISTA_TIPOS_PERMISOS_ACTUAL array_insert_arrays( getListaTiposPermisos('{VALUE}'), array('NAME' => 'Permisos[{VALUE}]', 'ONCHANGE' => "if(this.value == tipoPermisoPivot) controlarListaPermisos('{VALUE}'); ")); -->
						
						<!-- ARRAY LISTA_TIPOS_PERMISOS_ACTUAL -->
						
							<!-- INCLUDE formsInputs/checkboxListItem -->
						
						<!-- END -->	
						
						</ul>
						
						<br />
						
						
						<div style='text-align: left; width: 190px; margin: 10px auto'>
							<strong style='padding-right: 10px'> Seleccionar: </strong> 
								<a href='javascript:void(0);' onclick="checksCheckAll(form, 'Permisos[{VALUE}]')">Todos</a> 
								<span style='padding: 0 5px'> /  </span>
								<a href='javascript:void(0);' onclick="checksCheckNone(form, 'Permisos[{VALUE}]')">Ninguno</a>
						</div>
					</div>
										
				<!-- END -->
			
			</td>
		
		</tr>
		
	</table>

</fieldset>

<script type='text/javascript'>
	

	function mostrarUlPermisos( nombreObjeto ) {
		
		if(ulPermisosActual != null) ulPermisosActual.style.display = 'none';
		
		ulPermisosActual = document.getElementById( 'divPermisos_' + nombreObjeto );
		ulPermisosActual.style.display = 'block';
		
		if(tituloUlPermisos.style.visibility == 'hidden') tituloUlPermisos.style.visibility = 'visible';
		
	}


	var ulPermisosActual = null;
	var tituloUlPermisos = document.getElementById('titlePermisos');
	
	//-----------------------------------------
	

	var arrayObjetosPermisos = new Array();
	var arrayTiposPermisos = new Array();
	var tipoPermisoPivot = 'acceder';
	
	<!-- ARRAY LISTA_TIPOS_PERMISOS --> arrayTiposPermisos.push('{VALUE}'); <!-- END -->
	<!-- ARRAY LISTA_TIPOS_OBJETOS_PERMISOS_TODOS --> arrayObjetosPermisos.push('{VALUE}'); <!-- END -->

	
	<!-- BLOCK DATOS -->
	
		document.getElementById('Nombre').value = '{Nombre}';
		
		<!-- ARRAY Permisos -->
			checksSetChecked(form, 'Permisos[{$}]', [{!*}] );
		<!-- END -->
	
	<!-- END -->
	
	
	
	
	
	function controlarListaPermisos( codigoObjetoPermiso ) {
		
		var checkboxPivot = document.getElementById( 'Permisos[' + codigoObjetoPermiso + ']_' + tipoPermisoPivot );
		var checkboxs = getGroupFormElements( form, checkboxPivot.name );
		var checked = checkboxPivot.checked;
		
		var i;
		
		for(i=0; i < checkboxs.length; i++)
		
			if(checkboxs[i].value != tipoPermisoPivot) {
				
				if(!checked) checkSelect( checkboxs[i], false );
				checkboxs[i].disabled = !checked;
			}
	}
	
	
	function aplicarControlListasPermisos() {
		
		var i;
		for(i=0; i < arrayObjetosPermisos.length; i++) {
			
			controlarListaPermisos( arrayObjetosPermisos[i] );
			document.getElementById( 'Permisos[' + arrayObjetosPermisos[i] + ']_' + tipoPermisoPivot ).parentNode.style.fontWeight = 'bold';
		}
		
	}

	aplicarControlListasPermisos();
	
	

	
</script>