<div style='text-align:center;width:880px;border:0px solid #000;'>
<center>
<table id='Formulario' align='center' width='780' cellpadding='0' cellspacing='0'>
<tr>
	<td valign='top' align='left' colspan='3'>
		
		{TABLE_INFORMATION}		
		
	</td>
</tr>
<tr>
	<td id='tdTablesRemotes' valign='top' width='350' align='center'>
		
		{TABLES_REMOTES}		
		
	</td>
	<td width='60' valign='middle' align='center'>&nbsp;</td>
	<td id='tdTablesFieldsRemotes' align='center' valign='top' width='350'>
	
		{TABLES_FIELDS}
		
	</td>
</tr>

<tr>
	<td colspan='3'>&nbsp;</td>
</tr>
</table>
</center>
</div>

<script languaje='JavaScript'>


	
	function uploadFields(idRelation){			
		
		if(idRelation != 0){
			/*viewMessageLoad('tdCampoLocal');
			viewMessageLoad('tdCampoForeign');*/
			viewMessageLoad('tdRelacion');
			xajax_uploadFields(idRelation);	
		}
		
	}	
	
	function onlyOneCheck(idTable){
		var Formu = document.forms['form'];		
		var checkTables = document.forms['form']['tables[]'];
		var sizeChekTables = checkTables.length - 1;		
		
		for(i=0;i <= sizeChekTables; i++){		
			if(checkTables[i].value != idTable){ checkTables[i].checked = false;  }
		}		
		
	}
	
	function CheckAll(chk){
		for (i = 0; i < chk.length; i++) chk[i].checked = true ;
	}
	
	function UnCheckAll(chk){
		for (i = 0; i < chk.length; i++) chk[i].checked = false ;
	}	

	function editField(id,sCampo,sNombre,idTable){
		var Formu = document.forms['formFieldsRead'];
		Formu.type.value = "EditField";
		Formu.sCampo.value = sCampo;
		Formu.sNombre.value = sNombre;
		Formu.idTabla.value = idTable;
		Formu.id.value = id;
	}	

	function newField(idTasble){
		var Formu = document.forms['formFieldsRead'];
		Formu.type.value = "NewField";
		Formu.sCampo.value = "";
		Formu.sNombre.value = "";
		Formu.id.value = 0;
	}
	
	function newTableRemote(sNombre){
		viewMessageLoad('TablasRemotas');
		xajax_newTableRemote(sNombre);
	}
	
	function deleteField(){
		var Formu = document.forms['formFieldsRead'];
		
		var ok = confirm("Esta seguro de Eliminar estos campos?");
		
		if(ok){
			Formu.type.value = "DeleteField";	
			Formu.submit();
		}else{
			return false;	
		}
		
	}
	
	{JAVASCRIPT_ADICIONAL}
	
</script>