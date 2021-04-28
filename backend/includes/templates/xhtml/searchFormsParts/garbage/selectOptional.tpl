<div>
	<label for='{NAME}' id='LABEL_{NAME}' class='middle'> {TITLE}: </label>
	
	<select id='{NAME}' onchange="this.name = this.selectedIndex > 1 ? '{NAME}' : ''; {ONCHANGE}">
	
		<option value=''> No especificar </option>
		<option value=''> </option>
		
		<!-- ARRAY ITEMS --> <option value='{VALUE}'> {TEXT} </option> <!-- END -->
		
	</select>

</div>


<script type='text/javascript'> selectSetValue('{NAME}', '{SELECTED}'); </script>