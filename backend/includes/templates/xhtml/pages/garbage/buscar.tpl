<!-- INCLUDE struct/xhtml.header -->

<!-- INCLUDE blocks/mainHeader -->

<!-- INCLUDE blocks/userMenu -->

<script type='text/javascript' src='jscript/ul.radios.checks.functions.js'></script>

<style type='text/css'> @import url(jscript/jscalendar/calendar-blue.css); </style>
<script type='text/javascript' src='jscript/jscalendar/calendar.js'></script>
<script type='text/javascript' src='jscript/jscalendar/calendar-setup.js'></script>
<script type='text/javascript' src='jscript/jscalendar/lang/calendar-es.js'></script>



<div class='cuerpo'>

	<script type='text/javascript' src='jscript/forms.js'></script>
	<script type='text/javascript' src='jscript/dom.js'></script>
		
	<form id='form' method='get' class='centerForm' enctype='multipart/form-data' action='{ACTION_URL}'>
	
	<h4 class='titulo'>  Buscar {TITLE}  </h4>
	
	<script type='text/javascript'>
		
		var form = document.forms['form'];
		var fecha1;
		var fecha2;
		var checked;
	
	</script>

	
	<!-- INCLUDE searchForms/{FORM_PART} -->
	
	<input type='hidden' name='_buscar' value='1' />
	
	<!-- ARRAY HIDDEN_VARS -->
		<input type='hidden' name="{$}" value="{*}" />
	<!-- END -->
	
	<fieldset>
	
		<div class='buttons'>
			<button type='submit' id='formSubmitButton'> Buscar </button>
			<button type='button' onclick='formReset(form)'> Limpiar </button>
		</div>
	
	</fieldset>

	</form>

	
	<script type='text/javascript'>
	
	var i;
	
	for(i=0; i < form.elements.length; i++)
	
		if(form.elements[i].type && (form.elements[i].type == 'text') && !form.elements[i].disabled) {
			
			form.elements[i].focus();
			break;
		}
		
		
	
	</script>
	
</div>





<!-- INCLUDE struct/xhtml.foot -->