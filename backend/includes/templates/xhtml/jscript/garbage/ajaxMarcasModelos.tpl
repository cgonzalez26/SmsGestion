<!-- DEFINE LISTA_MARCAS getListaMarcasVehiculos() -->

<script type='text/javascript' src='jscript/dom.js'></script>
<script type='text/javascript' src='jscript/ajax.class.js'></script>

<script type='text/javascript'>

	function asignarAccionesSelectMarcasModelos( selectMarcas, selectModelos, idMarca, idModelo, defaultText ) {
		
		selectMarcas = getElementById(selectMarcas);
		selectModelos = getElementById(selectModelos);
		
		defaultText = defaultText == null ? 'Seleccionar...' : defaultText;
				
		var imageModelos = new Image();
		imageModelos.src = 'images/loading.gif';
		imageModelos.style.visibility = 'hidden';
		imageModelos.className = 'loading';
		insertNodes( selectModelos.parentNode, imageModelos );
		
		insertNodes(selectMarcas, [new Option(defaultText, 0), new Option('', 0)] );
		insertNodes(selectMarcas, <!-- INCLUDE jscript/variables/arrayOptions LISTA_MARCAS -->);
		
		selectMarcas.onchange = function() {
			
			if(this.value == 0) {
				
				removeNodes(selectModelos);
				insertNodes(selectModelos, new Option('Seleccione una Marca', 0) );
				
				selectModelos.disabled = true;

						
			} else {
				
				var ajax = new Ajax('ajax/getModelosVehiculos.php', true);
				ajax.addVar('idMarca', this.value);
				
				
				ajax.onLoad = function( arrayModelos ) {
					
					if(arrayModelos.length > 0) {
						
						selectModelos.disabled = false;
						
						removeNodes(selectModelos);
						
						insertNodes(selectModelos, [new Option(defaultText, 0), new Option('', 0)]);
						insertNodes(selectModelos, arrayModelos);
						
						selectModelos.selectedIndex = 0;
						
						selectModelos.disabled = false;
						
						if(idModelo) {
							
							selectModelos.value = idModelo;
							idModelo = false;
						}
						
					} else {
						
						removeNodes(selectModelos);
						insertNodes(selectModelos, new Option('No existen Modelos', 0) );
				
						selectModelos.disabled = true;
					}
					
					
					imageModelos.style.visibility = 'hidden';
					
				}
				
				imageModelos.style.visibility = 'visible';
				ajax.open();
				selectModelos.disabled = true;
				
			}
		}
	
		
		if(idMarca) selectMarcas.value = idMarca;
		
		selectMarcas.onchange();
	}
	
</script>