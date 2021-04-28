

<!--  DEFINE CAPTION_TITLE {&TITLE} ? "{TITLE}" : 'Datos Personales' -->
<!--  DEFINE DOCUMENTO_BLOCK {&Documento} && {&TipoDocumento} ? array( 'Tipo' => "{TipoDocumento}", 'Numero' => "{Documento}") : false -->

<table class='labels' id='tablaPersona'>

	<caption> <span id='captionPersona'> {CAPTION_TITLE} </span> </caption>
		
	<tbody class='simple' id='tableBodyPersona'>
		
		<tr> <th> Apellido y Nombre: </th> <td  class='importante'> {Apellido}, {Nombre}</td></tr>
	
		<tr class='division'> <td colspan='2'> </td> </tr>
	
	
		<!-- BLOCK DOCUMENTO_BLOCK -->
		
			<tr> <th> {Tipo}: </th> <td> {Numero} </td> </tr>
					
		<!-- END -->
	
		<tr> <th> Fecha Nacimiento: </th> <td> {FechaNacimiento} <span style='padding: 0 20px'> - </span> ({Edad} años) </td> </tr>
		
		
		<!-- DEFINE DIVISION_PERSONA_DETALLES {&Direccion} || {&Email} || {&Telefono} || {&Celular} -->
		
		<!--  BLOCK DIVISION_PERSONA_DETALLES -->
			<tr class='division'> <td colspan='2'> </td> </tr>
		<!--  END -->
		
		<!-- BLOCK Direccion --> <tr> <th> Dirección: </th> <td> {*} </td></tr> <!-- END -->
		
		<!-- BLOCK Email --> <tr> <th> E-Mail: </th> <td>  <a href='mailto:{*}'> {*} </a> </td></tr> <!-- END -->
		
		<!-- BLOCK Telefono --> <tr> <th> Teléfono: </th> <td> {*} </td></tr> <!-- END -->
		
		<!-- BLOCK Celular --> <tr> <th> Celular: </th> <td> {*} </td></tr> <!-- END -->
		

	</tbody>

</table>

