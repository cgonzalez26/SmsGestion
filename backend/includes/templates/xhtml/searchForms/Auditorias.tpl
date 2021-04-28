
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Auditorias.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right' width='100'>Apellido Usuario</td>
			<td align='left'>&nbsp;<input type='text' name='sApellido' id='sApellido' style='width:150px;' value='{sApellido}'></td>
			</tr>
			<tr>
			<td align='right'>Nombre Usuario</td>
			<td align='left'>&nbsp;<input type='text' name='sNombre' id='sNombre' style='width:150px;' value='{sNombre}'></td>
			</tr>
			<tr>
			<td align='right'>Dia</td>
			<td align='left'>&nbsp;<input type='text' name='dFecha' id='dFecha' style='width:150px;' value='{dFecha}'><span style='font-family:Tahoma;font-size:10px;'>Ej.: 10/10/2008</span></td>
			</tr>			
			<tr>
			<td align='center' colspan="2"><input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Buscar' style='width:100px;'></td>
			</tr>
			</table>
		</form>
	</fieldset>
</div>
</center>

<script language="JavaScript">

{JAVASCRIPT_ADICIONAL}

</script>
<div class="espacio"></div>