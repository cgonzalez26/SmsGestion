<div style='text-align:center;width:460px;border:0px solid #000;'>
<form action="OperationsAccess.php" method='POST' name='formFields' id='formFields' enctype='multipart/form-data' style='display:inline;'>
<center>
	
	<div class='espacio'></div>
	<div class='espacio'></div>	
	<div style='text-align:right;'><a href='javascript:void(0);' onclick='javascript:newField();'>[Nuevo Campo]</a></div>
	<fieldset class='border'>
		
		<div>
			<label class='middle' for='sCampo'> Campo </label>
			<input type='text' name='sCampo' id='sCampo' size='30'>	
		</div>				
		
		<div>
			<label class='middle' for='sNombre'> Label: </label>
			<input type='text' name='sNombre' id='sNombre' size='30'>
		</div>	
		
		<div class='espacio'></div>	
	</fieldset>
	
	<div class='espacio'></div>	
	
	<div style='text-align:center;'>
		<input type='submit' name='cmd_Aceptar' id='cmd_Aceptar' value='Aceptar' style='width:120px;height:25px;' onclick="javascript:sendFormField();">
		<input type='hidden' name='id' id='id' value=''>
		<input type='hidden' name='idTabla' id='idTabla'>
		<input type='hidden' name='type' id='type' value='NewField'>
	</div>	

</center>
</form>
</div>

<script language="javascript">

	function sendFormField(){
		var Formu = document.getElementById('formFields');
		var sms = '';
		
		if(Formu.sCampo.value == ""){
			sms += "-Nombre de Campo Invalido" 
		}
		
		if(Formu.sNombre.value == ""){
			sms += "-Nombre de Etiqueta Invalido" 
		}		
		
		if(sms == ""){
			return true;
		}else{
			alert('Se produjeron los siguietnes errores: \n' + sms);
			return false;
		}
		
		
	}	

	
	{JAVASCRIPT_ADICIONAL}
	
</script>