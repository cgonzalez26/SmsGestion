
<center>
<table class='tableFiltro' border='0' style='margin-right:50px;'>
<tr>
<td style='border-bottom:1px solid #CCC;'></td>
<td></td>
<td align="left" style='border-bottom:1px solid #CCC;'></td>
</tr>
<tr>
<td align="center">	
		<!--<form action='OperationsAccess.php' name='searchTable' id='searchTable' method='POST' enctype='multipart/form-data' style='display:inline'>
			<table cellpadding='2' cellspacing='4' align='center'>
			<tr>
			<td align='right' width='100'>Tabla</td>
			<td align='left'>&nbsp;
				<input type='text' name='sTabla' id='sTabla' style='width:150px;' value=''>
				<input type='hidden' name='idTabla' id='idTabla' value=''>
				<input type='hidden' name='Link' id='Link' value=''>
			</td>
			</tr>			
			<tr>
			<td align='center' colspan="2">&nbsp;</td>
			</tr>			
			<tr>
			<td align='center' colspan="2">
				<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' style='width:100px;' onclick='javascript: return checkDatosTable();'>
				<input type='hidden' name='type' id='type' value='New'>
			</td>
			</tr>
			</table>
		</form>-->
</td>
<td width="130">&nbsp;</td>
<td align="center">				
			<!--<form action='OperationsAccess.php' name='searchField' id='searchField' method='POST' enctype='multipart/form-data' style='display:inline'>
				<table cellpadding='2' cellspacing='4' align='left'>			
				<tr>
				<td align='right' width='100'>Campo</td>
				<td align='left'>&nbsp;
					<input type='text' name='sCampo' id='sCampo' style='width:150px;' value=''>
					<input type='hidden' name='idCampo' id='idCampo' value=''>
				</td>
				</tr>
				<tr>
				<td align='right' width='100'>Objeto</td>
				<td align='left'>&nbsp;
					<input type='text' name='sObjeto' id='sObjeto' style='width:150px;' value=''>				
				</td>
				</tr>
				<tr>
				<td align='center' colspan="2">&nbsp;</td>
				</tr>			
				<tr>
				<td align='center' colspan="2">
					<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' style='width:100px;' onclick="javascript: return checkDatosRule();">
					<input type='hidden' name='type' id='type' value='New'>
				</td>
				</tr>
				</table>
			</form>-->

</td>
</tr>
</table>
</center>

<script language="JavaScript">

	function resetFormTypeUser(){
		var Formu = document.forms['searchTypeUser'];
		Formu.sNombreUsuario.value = "";
		Formu.idTipoUsuario.value = 0;
		Formu.type.value = "New";
	}
	
	function resetFormRule(){
		var Formu = document.forms['searchRule'];
		Formu.idRegla.value = 0;
		Formu.sNombreRegla.value = '';
		Formu.sObjeto.value = '';		
		Formu.type.value = "New";
	}
	
	
	function setFormTypeUser(nameTypeUser , idTypeUser){
		var Formu = document.forms['searchTypeUser'];
		Formu.sNombreUsuario.value = nameTypeUser;
		Formu.idTipoUsuario.value = idTypeUser;		
		Formu.type.value = "Edit";		
	}

	function setFormRule(nameRule,nameObject,idRule){
		var Formu = document.forms['searchRule'];
		Formu.idRegla.value = idRule;
		Formu.sNombreRegla.value = nameRule;
		Formu.sObjeto.value = nameObject;		
		Formu.type.value = "Edit";		
	}

	
	{JAVASCRIPT_ADICIONAL}

</script>

<div class="espacio"></div>