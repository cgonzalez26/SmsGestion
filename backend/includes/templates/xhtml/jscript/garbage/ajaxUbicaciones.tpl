<!-- DEFINE LISTA_PAISES getListaPaises() -->


<script type='text/javascript' src='jscript/dom.js'></script>
<script type='text/javascript' src='jscript/ajax.class.js'></script>

<script type='text/javascript'>

	function asignarAccionesSelectUbicaciones( selectPaises, selectProvincias, selectLocalidades, idPais, idProvincia, idLocalidad, defaultText ) {
		
		selectPaises = getElementById(selectPaises);
		selectProvincias = getElementById(selectProvincias);
		selectLocalidades = getElementById(selectLocalidades);
		
		defaultText = defaultText == null ? 'Seleccionar...' : defaultText;
		
		var imageProvincias = new Image();
		imageProvincias.src = 'images/loading.gif';
		imageProvincias.style.visibility = 'hidden';
		imageProvincias.className = 'loading';
		insertNodes( selectProvincias.parentNode, imageProvincias );
		
		
		var imageLocalidades = new Image();
		imageLocalidades.src = 'images/loading.gif';
		imageLocalidades.style.visibility = 'hidden';
		imageLocalidades.className = 'loading';
		insertNodes( selectLocalidades.parentNode, imageLocalidades );
		
		
		insertNodes(selectPaises, [new Option(defaultText, 0), new Option('', 0)] );
		insertNodes(selectPaises, <!-- INCLUDE jscript/variables/arrayOptions LISTA_PAISES -->);
		
		
		selectPaises.onchange = function() {
			
			if(this.value == 0) {
				
				removeNodes(selectProvincias);
				insertNodes(selectProvincias, new Option('Seleccione un País', 0) );
				
				selectProvincias.disabled = true;
				
				selectProvincias.onchange();
			
			} else {
				
				var ajax = new Ajax('ajax/getProvincias.php', true);
				ajax.addVar('idPais', this.value);
				
				
				ajax.onLoad = function( arrayProvincias ) {
					
					if(arrayProvincias.length > 0) {
						
						selectProvincias.disabled = false;
						
						removeNodes(selectProvincias);
						
						insertNodes(selectProvincias, [new Option(defaultText, 0), new Option('', 0)]);
						insertNodes(selectProvincias, arrayProvincias);
						
						selectProvincias.selectedIndex = 0;
						selectProvincias.disabled = false;
						
						
						if(idProvincia) {
							
							selectProvincias.value = idProvincia;
							idProvincia = false;
						}
						
					} else {
						
						removeNodes(selectProvincias);
						insertNodes(selectProvincias, new Option('No existen Provincias', 0) );
				
						selectProvincias.disabled = true;
					}
					
					
					
					selectProvincias.onchange();
					imageProvincias.style.visibility = 'hidden';
					
				}
				
				
				selectProvincias.disabled = true;
				imageProvincias.style.visibility = 'visible';
				ajax.open();
				
				
			}
		}
		
		
		
				
		selectProvincias.onchange = function() {
			
			if(this.value == 0) {
				
				removeNodes(selectLocalidades);
				insertNodes(selectLocalidades, new Option('Seleccione una Provincia', 0) );
				
				selectLocalidades.disabled = true;
			
			} else {
				
				var ajax = new Ajax('ajax/getLocalidades.php', true);
				ajax.addVar('idProvincia', this.value);
				
				
				ajax.onLoad = function( arrayLocalidades ) {
					
					if(arrayLocalidades.length > 0) {
						
						selectLocalidades.disabled = false;
						
						removeNodes(selectLocalidades);
						
						insertNodes(selectLocalidades, [new Option(defaultText, 0), new Option('', 0)]);
						insertNodes(selectLocalidades, arrayLocalidades);
						
						selectLocalidades.selectedIndex = 0;
						
						if(idLocalidad) {
							
							selectLocalidades.value = idLocalidad;
							idLocalidad = false;
						}
						
						
						
					} else {
						
						removeNodes(selectLocalidades);
						insertNodes(selectLocalidades, new Option('No existen Localidades', 0) );
				
						selectLocalidades.disabled = true;
					}
					
					selectLocalidades.disabled = false;
					imageLocalidades.style.visibility = 'hidden';
					
				}
								
				
				selectLocalidades.disabled = true;
				
				imageLocalidades.style.visibility = 'visible';
				ajax.open();
				
			}
		}
		
		
		if(idPais) selectPaises.value = idPais;
		
		selectPaises.onchange();
	}
	
</script>