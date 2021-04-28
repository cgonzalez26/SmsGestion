<?php

class tablaPag{

	public $sCabecera;
	public $sContador;
	public $sFilas;
	public $sPaginacion;
	public $sAltura;
	public $sAnchoTabla;
	public $sExtras;
    public $sBotonera;
    public $iFilas;
    public $iFilasTotal;
    public $iNumColumnas;
    public $iFilasMinimo;
    public $sDirectorioTemplate=TEMPLATES_HTML;
    
	public function __construct() {
		$this->iAltura='';
		$this->sCabecera='';
		$this->sFilas='';
        $this->sContador=''; 
        $this->sAnchoTabla='';
        $this->sExtras='';
        $this->sBotonera='';
        $this->iFilas=0;
        $this->iFilasTotal=0;
        $this->iNumColumnas=0;
        $this->iFilasMinimo=0;
	}
	public function setFilas($iNum){	
		$this->iFilas=$iNum;
	}
	public function setFilasTotal($iNum){	
		$this->iFilasTotal=$iNum;
	}
	
	public function setEstras($sCadena){
		$this->sExtras.=$sCadena;
	}
	public function setBotonera($sCadena){
		
		$this->sBotonera.=$sCadena;
		
	}
	public function setFilasMinimo($iNum){
		$this->iFilasMinimo=$iNum;
	}
	
	public function addContador($sContador){
		$this->sContador.=$sContador;
	}
	
	public function setAltura($sAltura){
		$this->sAltura=$sAltura;
	}
	public function setAnchoTabla($sAncho){
		$this->sAnchoTabla=$sAncho;
	}
	public function setColumnas($iNum){
		$this->iNumColumnas=$iNum;
	}
	
	public function setCabeceraTablaGeneral($CampoOrden,$TipoOrden,$arrListaCampos,$arrListaEncabezados,$aArray){
		
		$CantEncabezados = count($arrListaEncabezados);
		$this->setColumnas($CantEncabezados);
		$sCabesera.="";//<th><input type='checkbox' onchange='tildar_checkboxs( this.checked )' id='checkbox_principal' checked/></td>
		for($i=0; $i<$CantEncabezados; $i++){
				$sCabesera.="<th>";
				if($CampoOrden == $arrListaCampos[$i]){if ($TipoOrden == 'ASC') $NuevoTipoOrden = 'DESC'; else $NuevoTipoOrden = 'ASC';}
				else $NuevoTipoOrden = 'ASC';
				$aCam=array();
				$campos='&accion=1';
				$aCampos=$aArray;
				unset($aCampos['CampoOrden']);
				unset($aCampos['TipoOrden']);
			    foreach ($aCampos AS $key => $data) $aCam[]="$key=$data";  
				$campos.='&'.implode('&',$aCam);
				$sCabesera.="<a href=\"{$_SERVER['PHP_SELF']}?CampoOrden={$arrListaCampos[$i]}&TipoOrden={$NuevoTipoOrden}&{$campos}\"><b><small style='font-size:9pt;font-family:Tahoma;'>{$arrListaEncabezados[$i]}</small></b></a>";
			if($CampoOrden == $arrListaCampos[$i]){
					if ($TipoOrden == 'ASC') $sCabesera.=" &nabla;"; else $sCabesera.=" &Delta;";
			}
			
		$sCabesera.="</th>";
	   }
	
	  $this->sCabecera=$sCabesera;
    }
    
    
    //---------------------funcciones agregadas para el parseo del template----------------//
	public function parserString( $cadena, $vars = false) {
		If( !is_array( $vars ) ) $vars = array();
		$vars += get_defined_constants();
		if( !array_key_exists( 'BASE_URL', $vars ) ) 
			$vars['BASE_URL'] = 'http://' . $_SERVER['HTTP_HOST'] . '/';
		preg_match_all( '#(\{)([a-zA-Z0-9\_\.]+)(\})#', $cadena, $coincidencias );
		For( $i = 0; $i < count( $coincidencias[0] ); $i++ ) {
	
			$coincidencia = $coincidencias[2][$i];
			$reemplazo = $vars[ $coincidencia ];
			$cadena=str_replace($coincidencias[0][$i],trim( $reemplazo ),$cadena );
		}
		return $cadena;		
	}
	public function parserFilePag( $archivo, $vars = false ) {
		If( file_exists( $archivo ) )
		return $this->parserString( file_get_contents( $archivo ), $vars );
		
	}
    
	public function getTabla(){

		$sContador="Se muestran  ".$this->iFilas."   de un total de ".$this->iFilasTotal;
		$this->addContador($sContador);
		$sFilas='';
		if($this->iFilas < $this->iFilasMinimo){
			$sFilas="
				       <tr> 	
						<td colspan='".$this->iNumColumnas."' class='filaAncha'><small>&nbsp;&nbsp;</small></td>
					   </tr> 
				";
			$this->addFila($sFilas);
	    }
		
		$aVariables['CABESERA']=$this->sCabecera;
		$aVariables['CONTADOR']=$this->sContador;
		$aVariables['FILAS']=$this->sFilas;
		$aVariables['PAGINACION']=$this->sPaginacion;
		$aVariables['ALTURA']=$this->sAltura;
		$aVariables['ANCHO_TABLA']=$this->sAnchoTabla;
		$aVariables['EXTRAS']=$this->sExtras;
		$aVariables['BOTONERAS']=$this->sBotonera;
		
		$sTabla=$this->parserFilePag($this->sDirectorioTemplate.'TablaGeneral.tpl',$aVariables);
		
		
		return $sTabla;
	}
	
	public function addFila($sLinea){
		$this->sFilas.=$sLinea;
	}
	public function addColumnaCabecera($sCadena){
		$this->sCabecera.=$sCadena;
	}
	
	public function setPaginacion($Pagina,$CantReg,$RegPorPag,$sUrl,$sBusqueda){
		
		if (ceil($CantReg/$RegPorPag) >= 1){
		if ($Pagina > 1) $pag= "<a href=\"{$_SERVER['PHP_SELF']}?{$_SERVER['QUERY_STRING']}&Pagina=". ($Pagina-1) ."\">Anterior</a>";
		if ($Pagina >1 && $Pagina<ceil($CantReg/$RegPorPag))  $pag.=" - ";
		if ($Pagina<ceil($CantReg/$RegPorPag))  $pag.="<a href=\"{$_SERVER['PHP_SELF']}?{$_SERVER['QUERY_STRING']}&Pagina=". ($Pagina+1) ."\">Siguiente</a>";
		$pag.=" | P&aacute;ginas: ";
			$strPaginas = '';
			for($i=1;$i<=ceil($CantReg/$RegPorPag);$i++){
				if ($i == $Pagina) $strPaginas .= "<b>";
				else $strPaginas .= "<a href=\"{$_SERVER['PHP_SELF']}?{$_SERVER['QUERY_STRING']}&Pagina=". $i ."&nombre_u=".$nombre_u."&condic=".$condic1."\">";
				$strPaginas .= $i;
				if ($i == $Pagina) $strPaginas .= "</b> - ";
				else $strPaginas .= "</a> - ";
			}
			$pag.= substr($strPaginas, 0, strlen($strPaginas) - 3);
	  } 
	  
	  $this->sPaginacion=$pag;
	}
	
	public function getBotonera(){	
		$sCadena="<div style='background-color:#EFF7FF;width:{ANCHO_TABLA};height:30px;' >{BOTONERAS}</div>";
		$aOpciones['ANCHO_TABLA']=$this->sAnchoTabla;;
		$aOpciones['BOTONERAS']=$this->sBotonera;
		$sTabla=parser_cadena($sCadena,$aOpciones);
		return $sTabla;
		
	}
	
}

?>