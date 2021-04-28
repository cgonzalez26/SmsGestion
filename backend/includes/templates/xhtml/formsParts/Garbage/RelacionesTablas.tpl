<div style='text-align:center;width:880px;border:0px solid #000;'>
<center>
<form action='' method='POST' name='form' id='form' enctype="multipart/form-data" style='display:inline;'>
	<table id='Formulario' class='tableRelations' align='center' width='780' cellpadding='0' cellspacing='0'>
	<tr>
		<td valign='top' align='left'>
			
			{TABLE_INFORMATION}		
			
		</td>
	</tr>
	
	<tr>
		<td valign='top' align='left'>
			&nbsp;
		</td>
	</tr>
	<tr>
		<td valign='top' align='right'>
			<a href='javascript:void(0);' onclick="javascript: newRelation();">[Nueva Relacion]</a>
		</td>
	</tr>	
	<tr>
		<td align='left' id='tdRelaciones'>
			<fieldset>
				<legend>&nbsp;<img src='{IMAGES_DIR}/filenew.png' border='0' hspace='4' align="absmiddle">Relacion</legend>
				&nbsp;<select name='idTableLeft' id='idTableLeft' style='width:160px;height:25px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsTables}
				</select> <strong>.</strong>
				<input type='text' name='sCampoLocal' id='sCampoLocal'> = 
				
				<select name='idTableRight' id='idTableRight' style='width:160px;height:25px;'>
					<option value='0'>[-Seleccionar-]</option>
					{OptionsTables}
				</select> <strong>.</strong>
				<input type='text' name='sCampoForeign' id='sCampoForeign'>				
				&nbsp;
				<input type='button' name='cmd_Agregar' id='cmd_Agregar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript:checkRelations();">
			</fieldset>
		</td>
	</tr>
	<tr><td>Condicion : <a href='javascript:void(0);' onclick="javascript:firtsRelation({ID_ACCESO});">[Inicio]</a>&nbsp;&nbsp;<img src="{IMAGES_DIR}/stock_top.png" title='Tabla Arriba' border='0' haspace='0'></td></tr>
	<tr>
		<td>&nbsp;<br /><br /></td>
	</tr>	
	<tr>
		<td id='tdConditions' align='left'>
			<span class='titleCobranza'> Dependencias Disponibes </span><br />
			<select name='idRelacion' id='idRelacion' multiple size='4' style='width:780px;text-align:left;background:#f5f5f5;border:1px solid #CCC;' ondblclick="javascript:loadRelation();">
			{OptionsRelaciones}
			</select>
		</td>
	</tr>	
	<tr><td>
		<input type='hidden' name='type' id='type' value='NewRelation'>
		<input type='hidden' name='id' id='id' value=''>
	</td></tr>
	<tr>
		<td align='center'>						
			<input type='button' name='cmd_Quitar' id='cmd_Quitar' value='Quitar' style='width:120px;height:25px;' onclick="javascript: return deleteRelation();">			
		</td>
	</tr>		
	</table>
</form>	
</center>
</div>

<script language="JavaScript">	
	
	/*function beginConditions(idAcceso){
		var Formu = document.forms['form'];
		var idTable = Formu.idTableLeft.value;
		
		if(idTable != 0){
			var ok = confirm('Esta seguro de realizar esta accion? \n Tenga en cuenta que al definir como Primera Tabla, se iniciara nuevamente las condiciones');
			
			if(ok) viewMessageLoad('tdConditions');		
			else xajax_beginConditions(idAcceso,idTable);
		}else{
			alert('Lo siento pero debe seleccionar una tabla.');
		}

	}*/
	
	function newRelation(){
		var Formu = document.forms['form'];
		
		Formu.type.value = 'NewRelation';
		Formu.idTableLeft.value = 0;
		Formu.idTableRight.value = 0;
		
	}
	
	function loadRelation(){
		var Formu = document.forms['form'];
		
		
	}

	function checkRelations(){
		var Formu = document.forms['form'];
		
		if(Formu.idTableLeft.value == Formu.idTableRight.value || Formu.idTableRight.value == 0 || Formu.idTableLeft.value == 0){
			alert('Lo siento pero para dar de alta una relacion entre tablas, estas deben ser diferentes');
			return false;
		}else{
			Formu.submit();
			return true;
		}
	}
	
	function firtsRelation(idAcceso){
		
		var Formu = document.forms['form'];
		
		if(Formu.idTableLeft.value == 0){
			alert('Lo siento pero para establecer como inicio de condicion debes selecccionar una Tabla');
			return false;
		}else{
			var ok = confirm('Esta seguro de Realizar esta accion? \n Esto hara que se borren todas las condiciones que tiene.');
			if(ok){
				Formu.id.value = idAcceso;
				Formu.type.value = 'FirtsRelation';
				Formu.submit();
				return true;
			}else{
				return false;
			}

		}
	}
	
	function deleteRelation(){
		var Formu = document.forms['form'];		

			var ok = confirm('Esta seguro de Realizar esta accion? \n');
			if(ok){				
				Formu.type.value = 'DeleteRelation';
				Formu.submit();
				return true;
			}else{
				return false;
			}
	}

</script>
