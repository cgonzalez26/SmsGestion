<div>
	

	<table>
	
		<tr>
		
			<th rowspan='2' style='padding-left: 50px; width: 235px'> 
				<input type='checkbox' id='{NAME}_CHECK' style='margin-right: 5px'/>
				<label for='{NAME}_CHECK' style='cursor:pointer'> {TITLE}: </label> 
			</th>


			<th style='width: 60px; padding: 5px 0'> <label> Desde: </label> </th>

			<td style='padding: 10px 0'>
			
				<!-- BLOCK PREFIJO --> <span class='prefijo'> {*} </span> <!-- END -->
				<input type='text' name='{NAME}[0]' class='numerico' style='width: 100px' id='{NAME}_DESDE'  value="<!-- CALL (float) "{VALUES[0]}"; -->"  />
				<!-- BLOCK SUFIJO --> <span class='sufijo'> {*} </span> <!-- END -->
			</td>
		</tr>
	
	
		<tr>
			<th style='width: 60px;  padding: 5px 0'> <label> Hasta: </label> </th>

			<td style='padding: 10px 0; '>
		
				<!-- BLOCK PREFIJO --> <span class='prefijo'> {*} </span> <!-- END -->
				<input type='text' name='{NAME}[1]' class='numerico' style='width: 100px' id='{NAME}_HASTA' value="<!-- CALL (float) "{VALUES[1]}"; -->" />
				<!-- BLOCK SUFIJO --> <span class='sufijo'> {*} </span> <!-- END -->
			</td>
		</tr>
	
	
	</table>
</div>



<script type='text/javascript'>


	document.getElementById('{NAME}_CHECK').onclick = function() {
		
		document.getElementById('{NAME}_HASTA').disabled = !this.checked;
		document.getElementById('{NAME}_DESDE').disabled = !this.checked;
	}


	<!-- DEFINE SELECTED_NUMBERS ({&VALUES[0]} || {&VALUES[1]}) ? true : false;  -->
	
	checked = false;
	
	<!-- BLOCK SELECTED_NUMBERS --> checked = true; <!-- END -->
	
	document.getElementById('{NAME}_CHECK').checked = checked;
	document.getElementById('{NAME}_CHECK').onclick();
	
	
	<!-- BLOCK DEFAULT_VALUES -->
	
	if(!checked) {
		
		document.getElementById('{NAME}_DESDE').value = '{0}';
		document.getElementById('{NAME}_HASTA').value = '{1}';
	}
	
	<!-- END -->
	
</script>
