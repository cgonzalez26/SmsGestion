<div class='espacio'>&nbsp;</div>
<table id='Cobranzas' class='Cobranzas' align='center' width='850'>
<tr>
<td align='center' width='500' valign='top'>
	<div id='ListaCobros'>
	<table class='ListaCobranzas' align='center' cellpading='0' cellspacing='0'>
	<thead>
	<tr><th width=''>&nbsp;</th><th width='170'>Concepto</th><th width='170'>Detalle</th><th width='80'>Egreso</th><th width='80'>Ingreso</th></tr>
	</thead>
	<tbody>
		{TABLEROWS}
		<tr><td colspan='5' align='left'><strong>Saldo de Caja Diaria: $ </strong> <span class='moneda'>{SALDO_BRUTO_CAJA_DIARIA}</span></td></tr>
		<tr><td colspan='5' align='left'><strong>SALDO NETO: $ </strong> <span class='moneda'>{SALDO_NETO_CAJA_DIARIA}</span></td></tr>
	</tbody>
	</table>			
	</div>		
</td>
<td>{FORM_AGREGAR_MOVIMIENTO}</td>
</tr>
</table>