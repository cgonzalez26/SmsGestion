<center>
<form action='Provincias.php' method='POST' name='form' id='form' class='FormGeneric' enctype='multipart/form-data' style='display:inline;'>
<table id='Formulario' class='Formulario' cellpadding='6' cellspacing='6' bgcolor='#F9F9F9' style='border-left:2px solid #9a9a9a;border-top: 2px solid #CCC;'>
<tr>
<td class='TituloFormulario' height='30' colspan='4'>
	<span style='margin-left:25px;font-weight:bold;'>&nbsp;Provincia</span>
</td>
</tr>
<tr>
	<th>Nombre</th>
	<td><input type='text' name='sNombre' id='sNombre' value='{sNombre}' size='40'><span id='tdMessage' align='left'></span></td>	
	<td></td>
	<td></td>		
</tr>
<tr>
	<th>Zona Horaria</th>
	<td>
		<select name='sHora' id='sHora' style='width:300px;height:25px;'>
			<option value='(GMT-03:00) Buenos Aires, Georgetown'> (GMT-03:00) Buenos Aires, Georgetown</option>
			<option value='(GMT-03:30) Terranova'> (GMT-03:30) Terranova</option>
			<option value='(GMT-04:00) Santiago'> (GMT-04:00) Santiago</option>
		</select>
		<!--<input type='text' name='sHora' id='sHora' value='{sHora}' size='40'>-->
	</td>	
	<th></th>
	<td></td>		
</tr>
<tr>	
	<td colspan='4'>&nbsp;
		<input type='hidden' name='oldProvincia' id='oldProvincia' value=''>
		<input type='hidden' name='Operations' id='Operations' value='New'>
		<input type='hidden' name='id' id='id' value='0'>
	</td>
</tr>
<tr>
	<td colspan='4' align='center' style='text-align:center !important;'>
		<input type='submit' name='Aceptar' id='Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript: return checkProvincia();">&nbsp;&nbsp;
		<input type='reset' name='Cancelar' id='Cancelar' value='Cancelar' style='width:120px;height:25px;' onclick="javascript:void(0);">
	</td>
</tr>
</table>
</form>
</center>

<script language="JavaScript">
	var zonaHorariaArgentina = "(GMT-03:00) Buenos Aires, Georgetown";
	var EstaProvincia = true;
	
	function setFormGeneric(idProvincia,nombreProvincia,zonaHoraria){
		var Formu = document.forms['form'];
		Formu.sNombre.value = nombreProvincia;
		Formu.oldProvincia.value = nombreProvincia;
		Formu.sHora.value = zonaHoraria;
		Formu.id.value = idProvincia;		
		Formu.Operations.value = "Edit";
		Formu.sNombre.focus();
	}
	
	function resetFormGeneric(){
		var Formu = document.forms['form'];
		Formu.sNombre.value = "";
		Formu.sHora.value = "";	
		Formu.Operations.value = "New";
		Formu.sNombre.focus();
	}
	
	function nameProvinciaChecked(booleano){
		EstaProvincia = booleano;
	}
	
	function checkProvincia(){
		var Formu = document.forms['form'];
		var typeOperation = Formu.Operations.value;
		
		if(typeOperation ==  "New"){
			if(Formu.sNombre.value != ""){
				
				xajax_checkNameProvincia(Formu.sNombre.value);
				
				if(!EstaProvincia){
					return verificaDatosProvincia();
				}else{
					alert('Nombre de Provincia Existente. Por favor cambie');
					return false;
				}			
			}else{
					alert('Nombre de Provincia Existente. Por favor cambie');
					return false;			
			}
			
		}else{
			
				if(Formu.oldProvincia.value != Formu.sNombre.value){
					xajax_checkNameProvincia(Formu.sNombre.value);
				}else{
					EstaProvincia = false;
				}					
				
				if(!EstaProvincia){
					return verificaDatosProvincia();
				}else{
					alert('Nombre de Provincia Existente. Por favor cambie');
					return false;
				}
		}
	}	
	
	
	{JAVASCRIPT_ADICIONAL}
	
</script>