<form id="form" method="POST" action="" name='form'>

<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Busqueda Simple</td></tr>
<tr><td style="height:5px"></td></tr>
<tr><td>
	<table cellpadding="0" cellspacing="0" border="0">
	<tr><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Marca/Modelo</td><td style="width:5px"></td><td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">A&ntilde;o</td></tr>
	<tr>
		<td>
		<table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
		<tr>
			<td>Marca:</td>
			<td>Modelo:</td>
		</tr>
		<tr>
			<td><select name='idMarca' id='idMarca' style='width:120px;'>
				{OPCIONES_MARCAS}
			</select></td>
			<td><select name='idModelo' id='idModelo' style='width:120px;'>
				{SCRIPT_MODELOS}
			</select></td>
		</tr>
		</table>
		</td>
		<td style="width:5px"></td>
		<td>
		<table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
		<tr>
			<td>Desde:</td>
			<td>Hasta:</td>
		</tr>
		<tr>
			<td><input type="text" name='iAnioDesde' id='dFechaDesde' style='width:120px;'></td>
			<td><input type="text" name='iAnioHasta' id='dFechaHasta' style='width:120px;'></td>
		</tr>
		</table>
		</td>
	</tr>
	</table>
</td>
</tr>
<tr><td align="left"><input type="button" id="cmd_buscar" name="cmd_buscar" value="Buscar" onclick="buscarVehiculos()" /></td></tr>
<tr><td style="height:5px"></td></tr>
<tr><td align='left' style='background: url(backend/includes/images/sitio/BarraGrisCentro.jpg) repeat-x;height:25px;color:red;padding-left:10px;font-size:16px;font-weight:bold;'>Busqueda Avanzada</td></tr>
<tr><td style="height:5px"></td></tr>
<tr>
	<td><table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
		<tr>
			
			<td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Combustible:</td>
			<td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Kilometraje</td>
			<td align="left" style="background: url(backend/includes/images/sitio/BarraRojaCentro.jpg) repeat-x;height:20px;color:#FFF;padding-left:10px">Precio</td>
		</tr>
		<tr>			
			<td>
			<table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
			<tr>
				<td>Tipo de Combustible:</td>
			</tr>
			<tr>
				<td><select name='idCombustible' id='idCombustible' style='width:195px;'>
					{OPCIONES_COMBUSTIBLES}
				</select></td>
			</tr>
			</table>	
			</td>
			<td>
			<table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
			<tr>
				<td>Desde:</td>
				<td>Hasta:</td>
			</tr>
			<tr>
				<td><input type="text" name='dFechaDesde' id='dFechaDesde' style='width:100px;'></td>
				<td><input type="text" name='dFechaHasta' id='dFechaHasta' style='width:100px;'></td>
			</tr>
			</table>
			</td>
			<td>
			<table cellpadding="0" cellspacing="5" border="0" style="text-align:left">
			<tr>
				<td>Desde:</td>
				<td>Hasta:</td>
			</tr>
			<tr>
				<td><input type="text" name='dFechaDesde' id='dFechaDesde' style='width:100px;'></td>
				<td><input type="text" name='dFechaHasta' id='dFechaHasta' style='width:100px;'></td>
			</tr>
			</table>
			</td>
		</tr>
		</table>
	</td>	
</tr>
<tr><td align="left"><input type="button" id="cmd_buscar" name="cmd_buscar" value="Buscar"/></td></tr>
<tr><td><div id='divVehiculos' style='overflow:scroll; overflow-x:hidden;width:100%; border:solid 1px #000000; background-color:white;height:250px; font-size:20pt;'></div></td></tr>	
</table>
</form>
<script>
function validarForm(){
	var errores = "";
	var Formu = document.forms['form'];
	if((Formu.idMarca.value == '0')&&(Formu.idModelo.value == '0')&&(Formu.iAnioDesde.value == '')&&(Formu.iAnioHasta.value == '')){
		alert("Debe proporcionar algun filtro para realizar la busqueda.");
		return false;
	}
		else return true;
}

function buscarVehiculos(){
	if(!validarForm()){
		return;
	}
	xajax_buscarVehiculos(xajax.getFormValues('form'));
}
</script>