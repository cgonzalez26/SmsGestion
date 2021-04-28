
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Oficinas.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Sucursal</td>
			<td align='left'>&nbsp;
				<select name='idSucursal'>
					<option value='0'>[-Seleccionar-]</option>
					{Options}
				</select>
			</td>
			<td align='right'>Oficina</td>
			<td align='left'>&nbsp;<input type='text' name='sApodo' id='sApodo' style='width:150px;' value='{sApodo}'></td>
			<td width="200"></td>
			</tr>			
			<tr>
			<td align='right' width='100'>Apellido Responsable</td>
			<td align='left'>&nbsp;<input type='text' name='sApellido' id='sApellido' style='width:150px;' value='{sApellido}'></td>

			<td align='right'>Nombre Responsable</td>
			<td align='left'>&nbsp;<input type='text' name='sNombre' id='sNombre' style='width:150px;' value='{sNombre}'></td>
			<td width="200"></td>
			</tr>
			<tr>
			<td align='center' colspan="5"><input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Buscar' style='width:100px;'></td>
			</tr>
			</table>
		</form>
	</fieldset>
</div>
</center>

<script language="JavaScript">

	document.forms['search'].idSucursal.value = '{idSucursal}';

	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>