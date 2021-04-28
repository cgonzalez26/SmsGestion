<div>
	

	<table>
	
		<tr>
		
			<th rowspan='2' style='padding-left: 50px; width: 230px'> 
				<input type='checkbox' id='{NAME}_CHECK' style='margin-right: 5px'/>
				<label for='{NAME}_CHECK' style='cursor:pointer'> {TITLE}: </label> 
			</th>


			<th style='width: 60px; padding: 5px 0'> <label> Desde: </label> </th>

			<td style='padding: 10px 0'>
				<span class='fecha' id='{NAME}DESDE_TEXT'></span>
				<button type='button' id='{NAME}DESDE_BUTTON'>...</button>
				<input type='hidden' name='{NAME}[0]' id='{NAME}DESDE_HIDDEN'/>
			</td>
		</tr>
	
	
		<tr>
			<th style='width: 60px;  padding: 5px 0'> <label> Hasta: </label> </th>

			<td style='padding: 10px 0'>
		
				<span class='fecha' id='{NAME}HASTA_TEXT'></span>
				<button type='button' id='{NAME}HASTA_BUTTON'>...</button>
				<input type='hidden' name='{NAME}[1]' id='{NAME}HASTA_HIDDEN' />
			</td>
		</tr>
	
	
	</table>
</div>



<script type='text/javascript'>


	document.getElementById('{NAME}_CHECK').onclick = function() {
		
		var checked = this.checked;
		var buttonsVisibles = checked ? 'visible' : 'hidden';
		var textColors = checked ? '#222' : 'InactiveCaption';
		var backgroundColor = checked ? 'Menu' : 'InactiveCaption';
		var hiddensDisabled = !checked;
		
		document.getElementById('{NAME}HASTA_BUTTON').style.visibility = buttonsVisibles;
		document.getElementById('{NAME}DESDE_BUTTON').style.visibility = buttonsVisibles;
		
		document.getElementById('{NAME}HASTA_TEXT').style.color = textColors;
		document.getElementById('{NAME}DESDE_TEXT').style.color = textColors;
		
		document.getElementById('{NAME}HASTA_TEXT').style.backgroundColor = backgroundColor;
		document.getElementById('{NAME}DESDE_TEXT').style.backgroundColor = backgroundColor;
		
		document.getElementById('{NAME}HASTA_HIDDEN').disabled = hiddensDisabled;
		document.getElementById('{NAME}DESDE_HIDDEN').disabled = hiddensDisabled;

		<!-- BLOCK ON_CHECK --> try { {*} } catch(e) {} <!-- END -->
	}


	fecha1 = new Date();
	fecha2 = new Date();
	checked = false;
	
	<!-- DEFINE SELECTED_DATES ({&SELECTED[0]} && {&SELECTED[1]}) ? {@SELECTED} : false;  -->
	
	
	<!-- BLOCK SELECTED_DATES -->
	
		fecha1 = Date.parseDate( '{0}', '%Y-%m-%d' ); 
		fecha2 = Date.parseDate( '{1}', '%Y-%m-%d' ); 
		
		checked = true;
	<!-- END -->
	
	document.getElementById('{NAME}_CHECK').checked = checked;
	document.getElementById('{NAME}_CHECK').onclick();	
	
	Calendar.setup ( {
		
		inputField:		'{NAME}DESDE_HIDDEN',
		button:			'{NAME}DESDE_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'{NAME}DESDE_TEXT',
		date: fecha1
		
	} );
	
	
	Calendar.setup ( {
		
		inputField:		'{NAME}HASTA_HIDDEN',
		button:			'{NAME}HASTA_BUTTON',
		ifFormat:		'%Y-%m-%d',
		daFormat:		"%d / %m / %Y",
		displayArea:	'{NAME}HASTA_TEXT',
		date: fecha2
		
	} );
	
	
	
	
</script>
