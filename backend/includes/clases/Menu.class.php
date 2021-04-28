<?

final class Menu{
	
	private $idUser = 0;
	private $aMenu = array();	
	
	
	public function __construct($idUsuario){
		if($idUsuario <= 0 || is_null($idUsuario)) return ;
		
		$this->idUser = $idUsuario;		
	}
	
	public function ButtonHeaderMenu(){
		
		$oBtnHeader = new aToolBar();
		$oBtnHeader->setAnchoBotonera('auto');
		$oBtnHeader->addBoton("idBtnExit","onclick","exitSesion();","Salir",false,false,false,false,"#FFFFFF");		
		
		return $oBtnHeader->getBotoneraToolBar('L');
		
	}	
	
	
	public function printMenu(){
		global $oMysql;
		
		$array = $this->getObjectUser();		
		
		$sDiv = "";
		$optionTocase = "";
		$scriptToTopMenu = "";
		$i = 0;
		
		$oBtnArticulos = new aToolBar();
		$oBtnArticulos->setAnchoBotonera('auto');
		
		foreach ($array as $key => $elements){
			
			$i = $i + 1;
			
			$scriptToTopMenu .= "
								dhxAccord.addItem(\"a$i\", \"$key\");
								dhxAccord.cells(\"a$i\").attachObject(\"div_$key\");
							   ";
			
			if($i == 1) $MenuToOpen .= " dhxAccord.cells(\"a$i\").open(); ";
			

			$oBtnArticulos->setRowsColumns();
			
			foreach ($elements as $aDatos){		
				

				$oBtnArticulos->addBoton("{$aDatos['CLASS']}","onclick","includeFile({$aDatos['CODE']});",false,"{$aDatos['TEXT']}","{$aDatos['IMAGE']}",false,9);
				
				$optionTocase .= $this->JavascriptToFile($aDatos['CODE'],"{$aDatos['URL']}");

			}
			
			$sDiv .= "<div id=\"div_$key\">";
			$sDiv .= $oBtnArticulos->getBotoneraToolBar('L',true)."<div class=\"salto\"></div>";			
			$sDiv .= "</div>";			
			
		}
		
		//$buttonHeader = $this->ButtonHeaderMenu();
		$buttonHeader = "<span style='font-size:11px'>User:{$_SESSION['USER']}</span>&nbsp;<a href='javascript:exitSesion();' style='color:#000;'><img src='".IMAGES_DIR."\/close2.gif' alt='' title='Salir' align='absmiddle'>Salir</a>";
		
		$string = "
					$sDiv
					<div id=\"idOculto\">

					</div>
					
					<div id=\"dhtmlxCalendar\">

					</div>

					<script type=\"text/javascript\">

				      var dhxLayout = new dhtmlXLayoutObject(document.body,\"2U\",\"dhx_blue\");

					   dhxLayout.cells(\"a\").setWidth(200);
					   dhxLayout.cells(\"a\").setText(\"$buttonHeader\");
					   dhxLayout.cells(\"b\").setText(\"\");
					   dhxLayout.cells(\"b\").hideHeader();



					   var cIzquierda = new dhtmlXLayoutObject(dhxLayout.cells(\"a\"),\"2E\",\"dhx_blue\");
					   cIzquierda.cells(\"a\").hideHeader();
					   cIzquierda.cells(\"a\").setHeight(400);

					   cIzquierda.cells(\"b\").hideHeader();


					   var dhxAccord = cIzquierda.cells(\"a\").attachAccordion();

					   $scriptToTopMenu

					   $MenuToOpen
		
					
						
					    function includeFile(iNum){
					    	switch(iNum){
								$optionTocase
							}

					    }

					    function exitSesion(){
					    	window.location.href=\"".BASE_URL."/logout.php\";
					    }

					</script>
				 ";		
	
		//var_export($string);die();
		return $string;
	}
	
	private function getObjectUser(){
		global $oMysql;
		//var_export($this->idUser); die();
		$array = $oMysql->consultaSel("CALL usp_getObjectUser(\"$this->idUser\");");
		
		if(!is_array($array)) $array = array();
				
		
		$newRows = array();
		$key = 'TYPE_OBJECT';
		
		foreach( $array as $row ) {			
				
			$keyData = $row[ $key ];
			unset( $row[ $key ] );
			if($keyData != '' && !is_null($keyData)){
				$newRows[ $keyData ][] =  $row ;	
			}			
				
		}
		
		return $newRows;		
		
	}

	public function JavascriptToFile($option,$url){

		
		$js = " case $option:{dhxLayout.cells(\"b\").attachURL(\"../$url\");break;} ";
		
		return $js;
		
	}	

	
}


?>