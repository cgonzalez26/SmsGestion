<!-- DEFINE LISTA array_insert_arrays( {@ITEMS}, array('NAME' => '{NAME}', 'ONCHANGE' => '{ONCHANGE}')); -->
<!-- DEFINE LIST_HEIGHT {&HEIGHT} ? "{HEIGHT}":'100px'; -->
<!-- DEFINE SELECTED_ITEMS {@SELECTED}; -->

<div>
	<label class='middle' style='line-height: {LIST_HEIGHT}' id='LABEL_{NAME}'> {TITLE}: </label>
	
	<ul class='checks' style='height: {LIST_HEIGHT}; overflow-y: auto'>
	
		<!-- ARRAY LISTA -->
			<!-- INCLUDE formsInputs/checkboxListItem -->
		<!-- END -->
	
	</ul>
	
	<div>
	<label class='middle'> &nbsp; </label> Seleccionar: 
		<a href='javascript:void(0)' onclick="checksCheckAll(form, '{NAME}');">Todos</a> /
		<a href='javascript:void(0)' onclick="checksCheckNone(form, '{NAME}');">Ninguno</a>
	</div>			
</div>



<script type='text/javascript'> checksSetChecked(form, '{NAME}', [ <!-- ARRAY SELECTED_ITEMS SEPARATOR ',' --> '{*}' <!-- END --> ] ); </script>
	