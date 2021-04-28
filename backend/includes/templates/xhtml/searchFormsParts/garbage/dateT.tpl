	<table class='center'>
	
		<tr>
		
			<th rowspan='2' style='padding-left: 30px; width: 220px'> 
				<input type='checkbox' id='{NAME}_CHECK' style='margin-right: 5px'/>
				<label for='{NAME}_CHECK' style='cursor:pointer'> {TITLE}: </label> 
			</th>


			<th style='padding: 0px 0; padding-right: 10px'> <label> Desde: </label> </th>

			<td style='padding: 0px 0'>
				<span class='fechaHora' id='{NAME}DESDE_TEXT'></span>
				<button type='button' id='{NAME}DESDE_BUTTON'>...</button>
				<input type='hidden' name='{NAME}[0]' id='{NAME}DESDE_HIDDEN'/>
			</td>
		</tr>
	
	
		<tr>
			<th style='padding: 0px 0'> <label> Hasta: </label> </th>

			<td style='padding: 0px 0'>
		
				<span class='fechaHora' id='{NAME}HASTA_TEXT'></span>
				<button type='button' id='{NAME}HASTA_BUTTON'>...</button>
				<input type='hidden' name='{NAME}[1]' id='{NAME}HASTA_HIDDEN' />
			</td>
		</tr>
	
	
	</table>




<script type='text/javascript'>


	document.getElementById('{NAME}_CHECK').onclick = function() {
		
		var checked = this.checked;
		var buttonsVisibles = checked ? 'visible' : 'hidden';
		var textColors = checked ? '#222' : '#CCC';
		var hiddensDisabled = !checked;
		
		document.getElementById('{NAME}HASTA_BUTTON').style.visibility = buttonsVisibles;
		document.getElementById('{NAME}DESDE_BUTTON').style.visibility = buttonsVisibles;
		
		document.getElementById('{NAME}HASTA_TEXT').style.color = textColors;
		document.getElementById('{NAME}DESDE_TEXT').style.color = textColors;
		
		document.getElementById('{NAME}HASTA_HIDDEN').disabled = hiddensDisabled;
		document.getElementById('{NAME}DESDE_HIDDEN').disabled = hiddensDisabled;

		<!-- BLOCK ON_CHECK --> try { {*} } catch(e) {} <!-- END -->
	}


	fecha1 = new Date();
	fecha2 = new Date();
	
	fecha1.setHours(0,0);
	fecha2.setHours(0,0);
	
	
	checked = false;
	
	<!-- DEFINE SELECTED_DATES ({&SELECTED[0]} && {&SELECTED[1]}) ? {@SELECTED} : false;  -->
	
	
	<!-- BLOCK SELECTED_DATES -->
	
		fecha1 = Date.parseDate( '{0}', '%Y-%m-%d %k:%M:%S' ); 
		fecha2 = Date.parseDate( '{1}', '%Y-%m-%d %k:%M:%S' ); 
		
		checked = true;
	<!-- END -->
	
	document.getElementById('{NAME}_CHECK').checked = checked;
	document.getElementById('{NAME}_CHECK').onclick();	
	
	Calendar.setup ( {
		
		inputField:		'{NAME}DESDE_HIDDEN',
		button:			'{NAME}DESDE_BUTTON',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'{NAME}DESDE_TEXT',
		showsTime:		true,
		date: fecha1
		
	} );
	
	
	Calendar.setup ( {
		
		inputField:		'{NAME}HASTA_HIDDEN',
		button:			'{NAME}HASTA_BUTTON',
		ifFormat:		'%Y-%m-%d %H:%M',
		daFormat:		"<span class='fecha'>%d / %m / %Y </span> <span class='hora'> %H : %M </span>",
		displayArea:	'{NAME}HASTA_TEXT',
		showsTime:		true,
		date: fecha2
		
	} );
	
	
	
	
</script>
