<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Empresas.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Condicion Iva</td>
			<td align='left' colspan='3'>&nbsp;
				<select name='idTipoIva' id='idTipoIva' style='width:200px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsTiposIvas}
				</select>
			</td>
			<td width="200"></td>
			</tr>			

			<tr>
			<td align='right'>Razon Social</td>
			<td align='left' colspan='3'>&nbsp;<input type='text' name='sRazonSocial' id='sRazonSocial' style='width:250px;' value='{sRazonSocial}'></td>						
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

	document.forms['search'].idTipoIva.value = '{idTipoIva}';	

	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>