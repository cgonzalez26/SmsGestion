<?php

final class ListObject {	
	
	public $Object = '';
	public $aHeaders = array();
	public $aStylesColumns = array();
	public $aWidthColumn = array();
	public $aOperations = array();
	public $Conditions = '';
	public $Order = '';
	public $offset = 0;
	public $limitNum = PAGGING_NUM;
	public $xhtmlTable = '';
	public $xhtmlFootPage = '';
	public $enablePagging = true;
	public $numElements = 0;
	public $sClassTable = 'TableList';
	public $CountElements = 0;
	private $namePagging = '';
	private $imageFirtsColumn = "";
	private $graphicReportCar = false;
	private $aDatosReportCar = array();
	
	
	public function __construct($Object){		
		
		if(!is_array($Object)) return;
		
		$this->Object = $Object['_OBJECT_'];	
		$this->aHeaders = $Object['_HEADERS_'];
		$this->aStylesColumns = $Object['_STYLE_COLUMN_'];
		$this->aWidthColumn = $Object['_WIDTH_COLUMN_'];
		$this->sClassTable = ($Object['_CLASS_TABLE_']) ? $Object['_CLASS_TABLE_'] : "TableList";
		$this->xhtmlFootPage = ($Object['_FOOT_PAGE_']) ? $Object['_FOOT_PAGE_'] : "";
		
		$this->namePagging = $Object['_NAME_PAGGING_'];
		
		if(isset($Object['_CONDITIONS_']) && sizeof($Object['_CONDITIONS_']) > 0 ){ $this->Conditions = implode(" AND ",$Object['_CONDITIONS_']); }else{ $this->Conditions = ""; }
		if( $Object['_ORDER_BY_'] ){ $this->Order = implode(",",$Object['_ORDER_BY_']); }else{ $this->Order = $this->Object.".id"; }	
		if( $Object['_NUM_'] ){ $this->limitNum = $Object['NUM']; }else{/* $this->limitNum = 3;*/}
		if( $Object['_OPERATIONS_'] ){ $this->aOperations = $Object['_OPERATIONS_']; }		
		if( $Object['IMAGE_FIRTS_COLUMN'] ){ $this->imageFirtsColumn = $Object['IMAGE_FIRTS_COLUMN']; }
		
		$this->xhtmlHeaders();
	}
	
	public function setGraphicReportCar($boolean){
		$this->graphicReportCar = $boolean;
	}
	
	public function setEnablePagging($boolean){
		$this->enablePagging = $boolean;
	}
	
	private function xhtmlHeaders(){
		
		$this->xhtmlTable .= "<div id='ObjectList'><center><table id='$this->sClassTable' cellpadding='0' cellspacing='0' align='center'>";
		$this->xhtmlTable .= "<thead><tr>";
		$i=0;
		
		foreach($this->aHeaders as $sColumn){
			$this->xhtmlTable .= "<th width='".$this->aWidthColumn[$i]."'>$sColumn</th>";
			$i++;
		}
		$Colspan=sizeof($this->aOperations);
		if($Colspan != 0){$this->xhtmlTable .= "<th colspan='$Colspan'>Operaciones</th>";}		
		$this->xhtmlTable .= "</tr></thead>";
			
		
	}
		
	public function getxhtmlHeaders(){
		return $this->xhtmlTable;
	}
	
	
	public function xhtmlLista(){
		global $oMysql ;
		
		//:::Determino la cantidad Total de Registro, para paginacion(las condiciones de filtro incluidas), si esta Habilitado		
		
		if($this->enablePagging){			
			$this->numElements = sizeof($oMysql->consultaSel("CALL usp_get".$this->Object."(\"$this->Conditions\",\"$this->Order\",\"\",\"\");"));
		}
		
		#:::Ahora Realizo la consulta con los parametros con parametros de paginacion				
		$this->offset = $_SESSION[$this->namePagging] * $this->limitNum;
		
		$arrayDatos = $oMysql->consultaSel("CALL usp_get".$this->Object."(\"$this->Conditions\",\"$this->Order\",\"$this->offset\",\"$this->limitNum\");");
		
		//var_export($this->Conditions);die();
		$this->CountElements = sizeof($arrayDatos);
		#Para determinar Num ::: Hasta donde se muesta
		if($this->CountElements < $this->limitNum){
			$Num = $this->offset + $this->CountElements ;
		}else{
			$Num = $this->offset + $this->limitNum ;
		}
		
		$PosterCantRegister = "<center><div style='width:660px;text-align:left;margin-left:5px;font-size:12px;'>Cantidad de Registros Encontrados: <strong>$this->numElements</strong>. Mostrando del <strong>$this->offset - $Num</strong></div><br /></center>";
		
		$table = $PosterCantRegister.$this->getxhtmlHeaders();
		
		$Colspan = sizeof($this->aHeaders) + sizeof($this->aOperations);
		
		if(sizeof($arrayDatos) == 0){
			$table .= "<tr><td colspan='".$Colspan."' align='left' style='border-left:1px solid #DDD;border-bottom:1px solid #DDD;'><p class='fuente'>NO SE ENCONTRARON RESULTADOS</p></td></tr>";			
		}else{
			$table .= "<tbody>";
			
			foreach ( $arrayDatos as $aDatos){
				
				if($this->imageFirtsColumn) $aDatos['IMAGE_FIRTS_COLUMN'] = $this->imageFirtsColumn;
				
				//$table .= "<tr onmouseover=\"changeColor(this,'#F7F8E0')\" onmouseout=\"changeColor(this,'#FFFFFF')\">";				
				$table .= parserTemplate( TEMPLATES_XHTML_DIR . "/tableRows/".$this->Object.".tpl", $aDatos);
				
				if($this->graphicReportCar){ $this->setDatosGraphicCar($aDatos); }
				
			}
			$table .= "</tbody>";
		}		
		
		$table .= "<tfoot></tfoot></table></center></div>";
		
		$table .= $this->xhtmlFootPage;
		
		
		return $table;
		
	}
	
	
	private function arrayPagging(){
		
		$actualPage = (integer) $_SESSION[$this->namePagging];
		
		$limitOffset = $actualPage * $this->limitNum;			
		$pagging = array();			
		
		if($this->enablePagging && $this->limitNum < $this->numElements) {			
				
			$arrayHREF = $_GET;
			$url = array_shift( array_filter( explode( '?', $_SERVER['REQUEST_URI']) ) );
			
			
			
			$pagging['NUM_PAGES'] = ceil( $this->numElements / $this->limitNum );
			$pagging['LINKS'] = array();
			
			for($i = 0; $i < $pagging['NUM_PAGES']; $i++) {
				
				$page = $i + 1;
				
				if($i == $actualPage) {
					
					$pagging['LINKS'][] = "<a class='selected'>$page</a>";
					
				} else {
				
					$arrayHREF['p'] = $i;
					$href = $url . '?' . http_build_query( $arrayHREF );
				
					$pagging['LINKS'][] = "<a href='$href'>$page</a>";
					
				}
			}
			
			if($actualPage > 0) {
				
				$arrayHREF['p'] = $actualPage - 1;
				$href = $url . '?' . http_build_query( $arrayHREF );
						
				$pagging['BACK'] = "<a href='$href' class='anterior'>� Anterior</a>";
			}
			
			if($actualPage < $pagging['NUM_PAGES'] - 1) {
			
				$arrayHREF['p'] = $actualPage + 1;
				$href = $url . '?' . http_build_query( $arrayHREF );
			
				$pagging['NEXT'] = "<a href='$href' class='siguiente'>Siguiente �</a>";
			}
		}
	
		return $pagging;
	}

	function xhtmlPagging(){
		$aPagging = $this->arrayPagging();
		$sLinks = "";		
		if(sizeof($aPagging['LINKS']) > 1){
			foreach ($aPagging['LINKS'] as $Link){$sLinks .= $Link;}		
			$table = "<div id='pagging_Down' class='pagging'> {$aPagging['BACK']} $sLinks {$aPagging['NEXT']} </div>";
		}else{
			$table = "";
		}
		return $table;
	}

	private function setDatosGraphicCar($array){
		$this->aDatosReportCar[] = $array;
	}
	
	public function paintGraphicReportCar(){
		
		
		
		$TagSet = "";
		
		$colorBarra[0] = "EA1000";
		$colorBarra[1] = "6D8D16";
		$colorBarra[2] = "FFBA00";
		$colorBarra[3] = "FFBA00";
		$colorBarra[4] = "FFBA00";
		$colorBarra[5] = "FFBA00";
		$colorBarra[6] = "FFBA00";
		$colorBarra[7] = "FFBA00";
		
		$strXML = "";

		$strXML = "<chart caption = 'Reporte de Venta Por Vehiculos' bgColor='#CDDEE5' baseFontSize='12' showValues='1' xAxisName='Productos' yAxisName='Ingresos ($)'>";
		$i = 0;
		foreach ($this->aDatosReportCar as $aProduct){
			
			 $TagSet .= "<set label = '{$aProduct['sDescripcion']}' value = '{$aProduct['fSubTotal']}' color = '$colorBarra[$i]' />";
			 $i++;
		}
		
		$strXML .= $TagSet;
		
		$strXML .= "</chart>";
		
		
		
		$graphic = renderChartHTML("Column3D.swf", "",$strXML, "Grafico", 500, 400, false);
		
		return $graphic;
	}
	
}

?>