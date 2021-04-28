
<!--  DEFINE CAPTION_TITLE {&TITLE} ? "{TITLE}" : 'Datos del Pago' -->

<table class='labels'>

	<caption> <span> {CAPTION_TITLE} </span> </caption>
	<tr><th style="border-bottom:1px solid #c0c0c0;">Cantitad de Pasajes: </th><td colspan='3' style="border-bottom:1px solid #c0c0c0;font-weight:bold;color:#0000FF;">{CantPasajes}</td></tr>	
	<tr> 
		<th<!-- BLOCK Fecha --> rowspan='2'<!-- END -->>Monto: </th> <td<!-- BLOCK Fecha --> rowspan='2'<!-- END --> class='numerico_importante_azul'> $ {Monto} </td>		
		<th> Forma de Pago: </th> <td> {FormaPago} </td>
	</tr>
	
	
	<!-- BLOCK Fecha -->
		<tr> 
			
			<th> Fecha: </th> <td> {*} </td>	
		</tr>
		
	<!-- END -->
	
	<!-- DEFINE DIVISION_PAGO_DETALLES {&Detalles} || {&Comprobante} -->
	
	<!-- BLOCK DIVISION_PAGO_DETALLES -->
		<tr class='division'> <td colspan='4'> </td> </tr>
	<!-- END -->
		
	<!-- BLOCK Comprobante --> <tr> <th> Comprobante: </th> <td colspan='3' class='info'> {*} </td></tr> <!-- END -->
		
	<!-- BLOCK Detalles --> <tr> <th> Detalles: </th> <td colspan='3' class='info'> {*} </td></tr> <!-- END -->
		
	
</table>

