<div style='text-align:center;width:470px;border:1px solid #CCC;background:#F9F9F9;'>
<form action='OperationsAccess.php' method='POST' name='formRelations' id='formRelations' enctype='multipart/form-data' style='display:inline;'>
<center>
<table align='center' width='460' cellpadding='0' cellspacing='0' cellpadding="5" cellspacing="5">
<tr>
<td colspan="3" height='30' style='border-bottom:1px solid #CCC;'>
	<span style='font-style:italic;'>Dependencias</span>	
</td>
</tr>
<tr>
	<th height='30' align='left'> 
		<span style='margin-left:5px;'>Tabla:</span> {Tabla_Local} (Relacion)
		&nbsp;&nbsp;
		<img src='{IMAGES_DIR}/next32.png' align="absmiddle">
	</th>
	<th height='30'>&nbsp;</th>
	<th height='30' align='center'>
		<select name='idTableDependiente' id='idTableDependiente' style='width:200px;' onchange="javascript:uploadFields(this.value);">	
			<option value='0'>[-Seleccionar Tabla-]</option>
			{OptionsTablasDependientes}
		</select>
	</th>
</tr>
<tr>
	<td id='tdCampoLocal' align='left' valign='top' width='200'>
	{Tabla_Local}.<input type='text' name='sCampoLocal' id='sCampoLocal' size='20'>
	</td>
	<td align="center"> = </td>
	<td id='tdCampoForeign' align='left' valign='top' width='200'>
		<span id='sTabla'>Tabla</span>.<input type='text' name='sCampoForeign' id='sCampoForeign' size='20'>
	</td>
</tr>
<tr>
	<td align='left' colspan='3'>
		<!--<span style='font-family:Tahoma;font-size:10px;'>Seleccionar: </span>
		<a href='javascript:void(0)'; onclick="CheckAll(document.forms['formFields']['Fields[]'])">[Todos]</a> / 
		<a href='javascript:void(0);' onclick="UnCheckAll(document.forms['formFields']['Fields[]'])">[Ninguno]</a>-->
	</td>	
</tr>

<tr>
	<td align='left' colspan='3'>
		<!--<input type='button' name='cmd_Add' id='cmd_Add' value='Agregar' style='width:60px;height:25px;'>
		<input type='button' name='cmd_Delete' id='cmd_Delete' value='Quitar' style='width:60px;height:25px;'>-->
		Dependencias habilitadas
	</td>
</tr>

<tr>
	<td align='center' colspan='3' id='tdRelacion'>
		<select name="idRelacion" id="idRelacion" size='10' multiple style='width:460px;text-align:center;'>			
			{OptionsRelaciones}
		</select>
	</td>
</tr>

<tr>
	<td align='center' colspan='3'>
		<input type='button' name='cmd_Add' id='cmd_Add' value='Agregar' style='width:40px;height:25px;' onchange="javascript:changeTypeOperations('AddRelations');">
		<input type='button' name='cmd_Delete' id='cmd_Delete' value='Quitar' style='width:40px;height:25px;' onchange="javascript:changeTypeOperations('DeleteRelations');">
		<input type='hidden' name='type' id='type' value='New'>
	</td>
</tr>
</table>
</center>
</form>
</div>

