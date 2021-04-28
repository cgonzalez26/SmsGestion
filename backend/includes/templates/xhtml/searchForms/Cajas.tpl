
<center>
<div id='Filtro'>
	<fieldset>
		<legend>{ImgBuscar} Filtro</legend>
		<form action='Cajas.php' name='search' id='search' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table class='tableFiltro' cellpadding='2' cellspacing='4' align='left'>
			<tr>
			<td align='right'>Sucursal</td>
			<td align='left'>&nbsp;
				<select name='idSucursal' id='idSucursal' style='width:150px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsSucursales}
				</select>
			</td>
			<td align='right'>Oficina</td>
			<td align='left' id='tdOficina'>&nbsp;
				<select name='idOficina' id='idOficina' style='width:150px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsOficinas}
				</select>
			</td>
			<td width="200"><input type='hidden' name='Operations' id='Operations' value='search'></td>
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

	var Sucursal = document.getElementById('idSucursal');	
	
	Sucursal.onchange = function (){
		xajax_getTagSelectOficinas(document.forms['search'].idSucursal.value);
	}			
	
	document.forms['search'].idSucursal.value = '{idSucursal}';
	document.forms['search'].idOficina.value = '{idOficina}';	

	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>