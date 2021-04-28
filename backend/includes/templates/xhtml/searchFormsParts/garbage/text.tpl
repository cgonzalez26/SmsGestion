<div>
	

	<table>
	
		<tr>
		
			<th rowspan='2' style='padding-left: 50px; width: 235px'> 
				<input type='checkbox' id='{NAME}_CHECK' style='margin-right: 5px' onclick="document.getElementById('{NAME}').disabled = !this.checked;";/>
				<label for='{NAME}_CHECK' style='cursor:pointer'> {TITLE}: </label> 
			</th>


			<td>
		
			
				<input type='text' name='{NAME}' id='{NAME}' value="{VALUE}" />
			
			</td>
		</tr>
	
	
	</table>
</div>



<script type='text/javascript'>


	<!-- DEFINE CHECKED {&VALUE} -->
	
	checked = false;
	
	<!-- BLOCK CHECKED --> checked = true; <!-- END -->
	
	document.getElementById('{NAME}_CHECK').checked = checked;
	document.getElementById('{NAME}_CHECK').onclick();	
	
	
</script>
