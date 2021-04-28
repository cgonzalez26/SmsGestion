
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Provincias.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Provincia</td>
			<td align='left'>&nbsp;<input type='text' name='sNombre' id='sNombre' style='width:150px;' value='{sNombre}'></td>
			<td width="200"></td>
			</tr>
			<tr>
			<td align='center' colspan="3">
				<input type='hidden' name='Operations' id='Operations' value='search'>
				<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Buscar' style='width:100px;'>
			</td>
			</tr>
			</table>
		</form>
	</fieldset>
</div>
</center>
<a name='#Formu'></a>
<script language="JavaScript">	

	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>