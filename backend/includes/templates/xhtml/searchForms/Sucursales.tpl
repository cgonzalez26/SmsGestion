
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Sucursales.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Provincia</td>
			<td align='left'>&nbsp;
				<select name='idProvincia' id='idProvincia' style='width:150px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsProvincias}
				</select>
			</td>
			<td align='right'>Localidad</td>
			<td align='left' id='tdLocalidad'>&nbsp;
				<select name='idLocaldad' id='idLocalidad' style='width:150px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsLocalidades}
				</select>
			</td>
			<td width="200"></td>
			</tr>			
			<tr>
			<td align='right'>Nombre</td>
			<td align='left' colspan='3'>&nbsp;<input type='text' name='sNombre' id='sNombre' style='width:250px;' value='{sNombre}'></td>			
			
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

	var Provincia = document.getElementById('idProvincia');
	
	Provincia.onchange = function (){
		xajax_tagSelectLocalidades(document.forms['search'].idProvincia.value);
	}

	document.forms['search'].idProvincia.value = '{idProvincia}';
	document.forms['search'].idLocalidad.value = '{idLocalidad}';

{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>