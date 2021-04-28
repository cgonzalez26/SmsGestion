<div style='text-align:center;width:300px;border:0px solid #000;'>
	<form action='OperationsAccess.php' method='POST' name='formFieldsRead' id='formFieldsRead' enctype='multipart/form-data' style='display:inline;'>
		<center>
			<table align='center' width='300' cellpadding='0' cellspacing='0'>
			<tr>
				<td align='left' valign='middle' bgcolor='#F0F0F0' style='' height='30'>
					
					<strong>Campos de LECTURA</strong>
					
				</td>	
			</tr>			
			<tr>
				<td id='tdFields' align='left' valign='top' bgcolor='#F0F0F0' height='150' width='300' style='border-left:2px solid #666666;border-top:2px solid #666666;border-right:1px solid #CCC;border-bottom:1px solid #CCC;width:300px;height:150px;overflow: auto;'>
					
					{FIELDS_REMOTES}		
					
				</td>	
			</tr>
			<tr>
				<td align='left'>
					<span style='font-family:Tahoma;font-size:10px;'>Seleccionar: </span>
					<a href='javascript:void(0)'; onclick="CheckAll(document.forms['formFieldsRead']['Fields[]'])">[Todos]</a> / 
					<a href='javascript:void(0);' onclick="UnCheckAll(document.forms['formFieldsRead']['Fields[]'])">[Ninguno]</a>
				</td>
				
			<!--</tr>
			<tr>
				<td>&nbsp;</td>
			</tr>-->
			<tr>
				<td align="left">&nbsp;<span style='font-family:Tahoma;font-size:10px;'>Elementos Seleccionados: </span> <img src='{IMAGES_DIR}/delete16.png' align='absmiddle'> <a href='javascript:void(0);' onclick='javascript: return deleteField();'>[Eliminar]</a></td>
			</tr>
			<tr>
				<td align='center'>
					<input type='hidden' name='type' id='type' value='NewField'>
				</td>
			</tr>
			</table>
			
			<div class='espacio'></div><div class='espacio'></div>
			
			<table width='350' align='center' cellspacing='0' cellpadding='0'>
				<tr>
					<td align='center' style='border-left:1px solid #CCC;border-right:1px solid #CCC;border-top:1px solid #CCC;' height='25'>Campos</td>
					<td bgcolor="#FFFFFF" style='border-bottom:1px solid #CCC;' align='right'><a href='javascript:void(0);' onclick='javascript:newField({idTabla});'>[Nuevo Campo]</a></td>
				</tr>	
				<tr bgcolor="#f0f0f0">
					<td height='50' style='border-left:1px solid #CCC;'>Nombre</td>
					<td style='border-right:1px solid #CCC;'><input type='text' name='sCampo' id='sCampo' value=''></td>
				</tr>	
				<tr bgcolor="#f0f0f0">
					<td height='50' style='border-left:1px solid #CCC;border-bottom:1px solid #CCC;'>Etiqueta</td>
					<td style='border-right:1px solid #CCC;border-bottom:1px solid #CCC;'><input type='text' name='sNombre' id='sNombre' value=''></td>
				</tr>							
				<tr>			
					<td colspan='2'>
						<input type='hidden' name='id' id='id' value=''>
						<input type='hidden' name='idTabla' id='idTabla' value='{ID_TABLE}'>						
					</td>
				</tr>
				<tr>			
					<td colspan='2' align='center'>
						<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' style='width:120px;height:25px;'>
					</td>		
			</table>			
		</center>
	</form>
</div>
