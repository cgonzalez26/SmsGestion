
<center>
<div id='divFilter'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='reports.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='TableFilter' cellpadding='4' cellspacing='4' align='left'>
			<tr>
			<td align='right' width='100' class='title'>Fecha Desde</td>			
			<td align='left'>
				<input type='text' name='dFechaDesde' id='dFechaDesde' style='width:150px;' value='{dFechaDesde}'>
				<br /><span style='font-size:9px;color:#FF0000;'>Ej: 20/10/2009</span>
			</td>
			<td align='right' width='100' class='title'>Fecha Hasta</td>
			<td align='left'>
				<input type='text' name='dFechaHasta' id='dFechaHasta' style='width:150px;' value='{dFechaHasta}'>
				<br /><span style='font-size:9px;color:#FF0000;'>Ej: 20/10/2009</span>
			</td>			
			</tr>
			<tr>
			<td align='right' class='title'>Vehiculo</td>
			<td align='left' colspan='3'>
				<select name='idVehiculo' id='idVehiculo' style='width:150px;'>
					<option value='0'>Selecccionar...</option>
					{options}
				</select>
			</td>
			</tr>
			<tr>
			<td align='center' colspan="4">
				<input type='hidden' name='type' id='type' value='search'>
				<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Buscar' style='width:100px;'>
			</td>
			</tr>
			</table>
		</form>
	</fieldset>
</div>
</center>

<script language="JavaScript">

	{JAVASCRIPT_ADICIONAL}

	InputMask('dFechaDesde',"99/99/9999");
	InputMask('dFechaHasta',"99/99/9999");

</script>
<div class="espacio"></div>