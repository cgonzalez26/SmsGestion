<!-- INCLUDE struct/xhtml.header -->

<!-- INCLUDE blocks/mainHeader -->

<!-- INCLUDE blocks/userMenu -->



<script type='text/javascript' src='jscript/popup.js'></script>

<div class='cuerpo'>

	<form id='form' method='post' class='centerForm' action='' onsubmit='return false;'>
	
	<h4 class='titulo'> 
		<a style='text-align: right; float: right; position: relative; top: 5px; font-size: 8pt' href='{VOLVER_URL}'>Volver</a> 
		{TITLE} 
	</h4>
	
	
	<!-- BLOCK ELEMENT -->
	<!-- INCLUDE verForms/{_FORM_PART_} -->
	<!-- END -->
	
	
	<fieldset>
		<div class='buttons'>
			<button type='button' onclick="location.href='{VOLVER_URL}'"> Volver </button>
		</div>
	
	</fieldset>
	</form>
	
	
</div>


<!-- INCLUDE struct/xhtml.foot -->