<!-- INCLUDE struct/xhtml.header -->


<!-- INCLUDE blocks/mainHeader -->


<!-- INCLUDE blocks/userMenu -->


<script type='text/javascript' src='jscript/popup.js'></script>


<div class='cuerpo'>

	<h4 class='titulo'> Bienvenido, {USUARIO[Nombre]} </h4>
	

	<form class='centerForm' onsubmit='return false;'>
	
		<table class='labels' style='margin-bottom: 0'>
			<caption> <span> Datos Cuenta </span> </caption>
			
			
			
			<tr> 
				<th> Usuario: </th> <td> {USUARIO[Nick]}</td>  
				<th> Tipo de Usuario: </th> <td> {USUARIO[TipoUsuario]} </td>  
			</tr>
				
			<tr class='division'> <td colspan='4'></td> </tr>
			
			<tr> 
				<th colspan='2'> Último Acceso al Sistema: </th> 
				<td colspan='2'> {ULTIMO_ACCESO} </td>  
			</tr>
			
			
			<tr class='division'> <td colspan='4'></td> </tr>
			
			<tr class='link'> <th colspan='4' class='link'>  <a href='javascript:void(0)' onclick='mostrarDatosPersonales()' id='linkMostrarDatosPersonales'> Mostrar datos Personales </a> </th>  </tr>
			
			
		</table>
		
		<div id='divDatosPersonales'>
			<!-- DEFINE PERSONA_BLOCK {@USUARIO[Persona]} -->
			<!-- INCLUDE verFormsParts/persona PERSONA_BLOCK -->
		</div>

		<br /> <br /> <br />
		
		<table class='labels'>
			
			<caption> <span> Caja Diaria </span> </caption>
			
			<tbody class='simple'>
			
			<!-- BLOCK CAJA_CERRADA -->
				<tr> <th class='mensaje' colspan='2'> No Existe ninguna Caja Abierta </th> 	</tr>
			<!-- END -->
			
			<!-- BLOCK CAJA_ABIERTA -->
				<tr> 
					<th> Caja Abierta: </th>
					<td> {*} </td>
				</tr>			
			<!-- END -->
			
			<!-- BLOCK CAJA_MENSAJE -->
			
				<tr> 
					<td colspan='2' style='border: solid 1px #CCC; text-align: center' class='info'> 
						No existe una caja abieta con la fecha actual, por lo que no se pueden efectuar operaciones
						de cobro o pagos de viajes.
					</td>
				</tr>			
			
			<!-- END -->
				
				
			</tbody>
			
		</table>
		
		
		<!-- BLOCK VIAJES -->
		
		<br /> <br /> <br />
		
		<table class='labels'>
	
			<caption> <span> Próximos Viajes </span> </caption>
			
			<tbody class='simple'>
			
				<tr class='division'> 
					
					<th colspan='2'>
					
						<table class='titles'>
								
							<tr>
								<th style='width: 190px;'> Destino </th>
								<th style='width: 160px;'> Sale </th>
								<th style='width: auto'> Tipo </th>
								
											
							</tr>
						
						</table>
						
						<div class='tableContenedor' style='height: 120px;'>
							
						<table class='border'>
									 
						 	<tbody> 
						 	
						 	<!-- ARRAY _SELF_ -->
								<tr class='{_INDEX_PARITY_}'> 
									<td style='width: 190px;' onclick="openWindow('ver/viajes/{idViaje}/');" class='left' onmouseover="this.parentNode.className='onmouseover'" onmouseout="this.parentNode.className='{_INDEX_PARITY_}'"> {Destino} </td>
									<td style='width: 160px;' onmouseover="this.parentNode.className='onmouseover'" onmouseout="this.parentNode.className='{_INDEX_PARITY_}'"> {FechaSalida} - {HoraSalida} </td>
									<td style='width: auto;' onmouseover="this.parentNode.className='onmouseover'" onmouseout="this.parentNode.className='{_INDEX_PARITY_}'"> {Tipo} </td>
								</tr>
							<!-- END -->
						 	
						 	</tbody>
							
						</table>
						
						</div>
				
					</th>
				</tr>
					
			</tbody>
				
		</table>
		
		<!-- END -->
		
	</form>

</div>


<script type='text/javascript'>

	function mostrarDatosPersonales() {
		
		if(divDatosPersonales.style.display == 'none') {
			
			divDatosPersonales.style.display = 'block';
			linkMostrarDatosPersonales.innerHTML = 'Ocultar Datos Personales';
		
		} else {
			
			divDatosPersonales.style.display = 'none';
			linkMostrarDatosPersonales.innerHTML = 'Mostrar datos Personales';
		}
	}
	
	var linkMostrarDatosPersonales = document.getElementById('linkMostrarDatosPersonales');
	var divDatosPersonales = document.getElementById('divDatosPersonales');
	
	divDatosPersonales.style.display = 'none';
	document.getElementById('captionPersona').parentNode.style.display = 'none';
	document.getElementById('tablaPersona').style.marginTop = '0px';

</script>

<!-- INCLUDE struct/xhtml.foot -->