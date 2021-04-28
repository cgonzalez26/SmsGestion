
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Accesos.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Empresa</td>
			<td align='left' colspan='2'>&nbsp;
				<select name='idEmpresa' style='width:200px;'>
					<option value='0'>[-Seleccionar-]</option>
					{Options}
				</select>
			</td>			
			<td align='left'></td>
			<td width="200"></td>
			</tr>			
			<tr>
			<td align='right' width='100'>Host</td>
			<td align='left'>&nbsp;<input type='text' name='sHost' id='sHost' style='width:150px;' value='{sHost}'></td>

			<td align='right'>Base de Datos</td>
			<td align='left'>&nbsp;<input type='text' name='sNombreDB' id='sNombreDB' style='width:150px;' value='{sNombreDB}'></td>
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

	document.forms['search'].idEmpresa.value = '{idEmpresa}';

	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>