
<form action='Localidades.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='tableInformation' class='tableInformation' cellpadding='2' cellspacing='2' style='border:4px solid #000;' align='left'>
<tr>	
	<td class='LetraBig' align='left' colspan='4'>		
			<div id="imgLogo"> 
				<img src='../includes/images/BotonClick.gif' id='imgLogo' width='130' height='65' align="absmiddle">
				<!--[LOGO]-->
				<span><em><strong>Motos - Seguro Costo Cero</strong></em></span>
			</div>		
	</td>	
</tr>

<tr>
	<th align='right'>Num. Ref.:</th>
	<td class='LetraBig' align='left' colspan='3'>
		&nbsp;&nbsp;<strong>{polizas_costocero_num_ref}</strong>
	</td>	
</tr>
<tr>
	<th width='100' align='right'>Nombre: &nbsp;</th>
	<td width='180'>
		{polizas_costocero_nom}
	</td>	
	<th width='100' align='right'>Apellido: &nbsp;</th>
	<td width='180'>{polizas_costocero_ape}</td>		
</tr>
<tr>
	<th align='right'>{tipos_dni_nom}: &nbsp;</th>
	<td colspan='3'>
		{polizas_costocero_dni}
	</td>	
</tr>
<tr>
	<th align='right'>Tipo: &nbsp;</th>
	<td colspan='3'>
		{tipos_vehiculos_nom}
	</td>			
</tr>
<tr>
	<th align='right'>Premio: &nbsp;</th>
	<td>$ {polizas_costocero_premio}</td>
	<th align='right'>Dominio: &nbsp;</th>
	<td>{polizas_costocero_dominio}</td>
</tr>
<tr>
	<th align='right'>Marca: &nbsp;</th>
	<td>
		{polizas_costocero_marca}
	</td>	
	<th align='right'>Modelo: &nbsp;</th>
	<td>{polizas_costocero_modelo}</td>		
</tr>
<tr>
	<th align='right'>Motor: &nbsp;</th>
	<td>
		{polizas_costocero_motor}
	</td>	
	<th align='right'>Chasis: &nbsp;</th>
	<td>{polizas_costocero_chasis}</td>		
</tr>
<tr>	
	<td colspan='4' style='border:0px !important;'>&nbsp;
		<input type='hidden' name='Operations' id='Operations' value='New'>
		<input type='hidden' name='id' id='id' value='0'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;border:0px !important;'>
		<!--<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return true;">-->
	</td>
</tr>
</table>
</form>
