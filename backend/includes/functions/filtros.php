<?

	function xhtmlFilterReportCar($aDatos){
		global $oMysql;
		
		$array = $aDatos;
		
		$concat = "CONCAT(sCodigo,\" - \", sMarca, sModelo)";
		
		$options = $oMysql->consultaSel("CALL usp_getSelect('Vehiculos','id','$concat','')");	
		$array['options'] = arrayToOptions($options,$array['idVehiculo']);
		
		$array['ImgBuscar'] = "<img src='".IMAGES_DIR."/search.png' align='middle' title='Filtrar' hspace='4' border='0'>";
		
		return parserTemplate( TEMPLATES_XHTML_DIR . "/searchForms/ReportesMoviles.tpl", ($array == null) ? false : $array );		
	}

	function xhtmlFilterReportTareas($aDatos){
		global $oMysql;
		
		$array = $aDatos;
		
		$concat = "CONCAT(sCodigo,\" - \", sMarca, sModelo)";

		$sConditions = "tareas.sEstado<>'B'";
		//$options = $oMysql->consultaSel("CALL usp_getTareas(\"$sConditions\",\"\",\"\",\"\");");

		$options = $oMysql->consultaSel("CALL usp_getSelect('tareas','id','sDescripcionCorta',\"$sConditions\")");	
		$array['options'] = arrayToOptions($options,'');
		
		$array['ImgBuscar'] = "<img src='".IMAGES_DIR."/search.png' align='middle' title='Filtrar' hspace='4' border='0'>";
		
		return parserTemplate( TEMPLATES_XHTML_DIR . "/searchForms/ReporteMovimientos.tpl", ($array == null) ? false : $array );		
	}


?>
