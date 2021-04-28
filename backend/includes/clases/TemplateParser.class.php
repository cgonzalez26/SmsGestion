<?php //------------------------------------------------


@ include_once( dirname(__FILE__) . '/./../functions/strings.php' );
@ include_once( dirname(__FILE__) . '/./../functions/arrays.php' );




//--------------------------------------------------------

function mathSum() {
	
	$args = func_get_args();
	$result = 0;
	
	foreach($args as $arg) $result+= (float) $arg;
				
	return $result;
}

function mathProduct() {
		
	$args = func_get_args();
	$result = 1;
	
	foreach($args as $arg) $result = $result * $arg;
				
	return $result;
}

function mathDivision( $num1, $num2 ) { return $num1 / $num2; }

function mathModule( $num1, $num2 ) { return $num1 % $num2; }

function mathParity( $num ) { return $num % 2 == 0 ? 'PAR' : 'IMPAR'; }


//--------------------------------------------------------


function xhtmlTagStyle() {
	
	$args = func_get_args();
	$arrayStyle = array();
		
	foreach($args as $arg)
		if(is_array( $arg )) 
			$arrayStyle += $arg;

	$arrayStyle = array_transform_keys( $arrayStyle, 'return strtolower( "$key" );' );
	
	return array2string( $arrayStyle, 'return $key: $value', '; ' );
	
	
}

function xhtmlTagProperties(){
	
	$args = array_reverse( func_get_args() );
	$arrayProperties = array();
		
		
	foreach($args as $arg)
		if(is_array( $arg )) 
			$arrayProperties += $arg;

	$arrayProperties = array_transform_keys( $arrayProperties, 'return strtolower( "$key" );' );
				
	$booleanKeys = array('readonly', 'checked', 'selected', 'disabled', 'multiple');
	$literalKeys = array('class','id','name','maxlength','size','style','tabindex','title','type','usemap','value', 'for', 'label' );
	$jscriptKeys = array('onblur','onchange','onclick','ondblclick','onfocus','onkeydown','onkeypress','onkeyup','onmousedown','onmousemove','onmouseout','onmouseover','onmouseup','onselect');
	
	foreach($jscriptKeys as $jscriptKey)
		if( $arrayProperties[ $jscriptKey ] )
			$arrayProperties[ $jscriptKey ] = str_replace("'", '"', $arrayProperties[ $jscriptKey ] );
	
	foreach($booleanKeys as $booleaProperty)
		if( $arrayProperties[ $booleaProperty ] )
			$arrayProperties[ $booleaProperty ] = $booleaProperty;
		
	
	
	if( is_array($arrayProperties['style']) )	
		$arrayProperties['style'] = array2string( $arrayProperties['style'], 'return $key: $value', '; ' );
	
		
	$allowedKeys = array_merge_recursive( $booleanKeys, array_merge( $jscriptKeys, $literalKeys ) );
	$arrayProperties = array_filter( array_intersect_key( $arrayProperties, array_combine( $allowedKeys, $allowedKeys ) ) );
		
	
	$string = '';
	
	foreach($arrayProperties as $key => $value) 
		
		$string.= " $key='$value'";
	
	
	return $string;
}



//-----------------------------------------------------------------------------------------------


final class TemplateParser {
	
	
	/* Información de Sintaxis de un template ------------------------------------------------------
	
	
	Los templates son archivos de código html, que serán evaluados por esta clase, y reemplazará
	las variables que se designen.
	
	
	
		Asignación de Variables
		---------------------------
	
		A cada objeto se le deben asignar variables, para poder parsear luego el template.
		Las variables se designan de forma asociativo: NombreVariable => ValorVariable
	
		En el código HTML, la designación de dicha variable será: {NombreVariable}, y está cadena
		será reemplazada por el valor que se le asignó.
		
		
		Sentencias Especiales
		-------------------------
		
			1) Inclusión de otro template dentro del mismo <!-- INCLUDE archivo -->
				
			
				<!-- INCLUDE archivo VARIABLE -->
				
				incluye archivo usando VARIABLE como bloque
				
				
				<!-- INCLUDE archivo 'VALOR' -->
				
				incluye archivo usando el valor 'VALOR' como valor de bloque
			
				
			2) Llamar a funciones <!-- CALL function({param1}, {param2}.. ) -->
							
			
			<!-- DEFINE NOMBRE (codigo) -->
			definir una variable
			
			<!-- (codigo) ? (codigo_true) : (codigo_false) -->
				
			3) Iteración de un array 		
				
				<!-- ARRAY nombre -->
					...
				<!-- END -->
				
				
				#ARRAY nº elementos array
				
			
				{*} Valor del Array
				{$} Nombre de la clave del Array
				{_INDEX_} nº de elemento
				{_INDEX_PARITY_} paridad
				
			4) Bloques de templates
		
				<!-- BLOCK nombre -->

					...
					
				<!-- END -->			
			
	
	
	---------------------------------------------------------------------------------------------*/
	
	
	
	// Sección estática de la Clase - Valores y Métodos por defecto
	//------------------------------------------------
	
	private static $defaultRootDir = '.';
	private static $defaultExtension = '';
	
	private static $defaultVariables = array();

	private static $defaultVariableDelimiter = array('{', '}');
	private static $defaultStatementDelimiter = array('<!--', '-->');
	
	private static $autoVariablesPrefix = '_TEMPLATE_PARSER_AUTO_VARIABLE_';
	private static $rootDirVariableName = 'TEMPLATES_ROOT_DIR';
	
	
	
	public static function _setDefaultRootDir( $dir ) { self::$defaultRootDir = $dir; }
	
	public static function _setDefaultTemplatesExtension( $extension ) { self::$defaultExtension = $extension; }

	public static function _setDefaultVariableDelimiter( $left, $right ) {
		
		self::$defaultVariableDelimiter = array( $left, $right );
	}
		
	public static function _setDefaultStatementDelimiter( $left, $right ) {
		

		self::$defaultStatementDelimiter = array( $left, $right );
	}
		
	public static function _setDefaultVariable( $name, $value = null ) {
		
		self::$defaultVariables[ $name ] = $value;
	}	
	
		
	public static function _getDefaultRootDir() { return self::$defaultRootDir; }
	
	public static function _getDefaultTemplatesExtension() { return self::$defaultExtension; }


	public static function _addDefaultVariables( $variables ) {
		
		if(!is_array( $variables )) $variables = array();
		
		foreach($variables as $variable => $valor)
			self::_setDefaultVariable( $variable, $valor );
	}

	
	public static function _setDefaultCaseSensitive( $bool ) {
		
		self::$defaultCaseSensitive = (boolean) $bool;
	}
	
	
	
	
	
	private static function _getVariableValue( $variables, $variable ) {
		
				
		$realVariableName = str_remove_prefix( $variable, array('&', '#', '!', '?', '@') );
		
		if(str_ends_with( $realVariableName, ']' )) {
			
					
			$keys = array_filter_extended( preg_split( '#(\[|\])#', $realVariableName ), 'return strlen( (string) $value ) > 0;', false );
			
			$valor = $variables;
					
			foreach($keys as $key) {
				
				$valor = $valor[ $key ];
			}

		} else $valor = $variables[ $realVariableName ];

		
		
		
		if( str_starts_with( $variable, '&' ) ) $valor = $valor ? 'true' : 'false';
		else if( str_starts_with( $variable, '?' ) && $valor == null ) $valor = 'null';
		else if( str_starts_with( $variable, '@' ) && !is_array($valor) ) $valor = 'array()';
		else if( str_starts_with( $variable, array('#', '!') ) ) {
			
			if(!is_array( $valor )) $valor = array();
			
			if(str_starts_with( $variable, '#' )) $valor = count($valor);
			else {
				
				foreach($valor as $valorIndex => $valorValor) $valor[ $valorIndex ] = "'$valorValor'";
				$valor = implode(',', $valor);
				
			}
			
		} else if(is_array( $valor )) $valor = str_replace("\n", ' ', var_export( $valor, true ));
		
		else if( is_object( $valor ) && get_class( $valor ) == 'TemplateParser' ) $valor = $valor->__toString();
		
		else $valor = (string) $valor;
				
								
		return $valor;
	}
	
	
	// Sección no estático de la clase
	//-----------------------------------
	
	private $templatesRootDir;
	private $templatesExtension;
	
	private $variables = array();
	private $autoVariables = 0;
	private $string = '';
		
	private $patternVariable;
	private $patternInclude;
	private $patternIncludeBlock;
	private $patternBlock;
	private $patternEnd;
	private $patternCall;
	private $patternIncludeBlockVariable;
	private $patternDefine;
	private $patternIf;
	
	
	private $leftVariableDelimiter;
	private $rightVariableDelimiter;
	private $leftStatementDelimiter;
	private $rightStatementDelimiter;	
	
	
	private $blocks = array();
	private $arrays = array();
	private $defineVariables = array();
	private $callVariables = array();
	
	private $arraysSeparators = array();
	
	
	private $variablesArrayBlocks = array();
	
	private $lastIncludeDir;
		
	//-------------------------------------------------------------------------------------
	
	public function __construct( $template = null, $templatesRootDir = null, $templatesExtension = null, $statementDelimiter = null, $variableDelimiter = null ) {
		
		$this->templatesRootDir = $templatesRootDir ? $templatesRootDir : self::$defaultRootDir;
		$this->templatesExtension = $templatesExtension ? $templatesExtension : self::$defaultExtension;
		
		list( $leftStatementDelimiter, $rightStatementDelimiter ) = ( is_array($statementDelimiter ) && count( $statementDelimiter ) == 2 ) ? $statementDelimiter : self::$defaultStatementDelimiter;		
		list( $leftVariableDelimiter, $rightVariableDelimiter )  = ( is_array($variableDelimiter) && count( $variableDelimiter ) == 2 ) ? $variableDelimiter : self::$defaultVariableDelimiter;

		$this->leftVariableDelimiter = $leftVariableDelimiter;
		$this->rightVariableDelimiter = $rightVariableDelimiter;
		$this->leftStatementDelimiter = $leftStatementDelimiter;
		$this->rightStatementDelimiter = $rightStatementDelimiter;
		
		
		$leftStatementDelimiter = preg_quote( $leftStatementDelimiter );
		$rightStatementDelimiter = preg_quote( $rightStatementDelimiter );
		$leftVariableDelimiter = preg_quote( $leftVariableDelimiter );
		$rightVariableDelimiter = preg_quote( $rightVariableDelimiter );
		
		$this->patternVariable = "#$leftVariableDelimiter([\w\-\$\*\.\_\#\[\]\!\&\?\@]+)$rightVariableDelimiter#";
		$this->patternInclude = "#$leftStatementDelimiter +INCLUDE +([\w\-\.\/]+) +$rightStatementDelimiter#i";
		$this->patternEnd = "#$leftStatementDelimiter +END +$rightStatementDelimiter#i";
		$this->patternBlock = "#$leftStatementDelimiter +(BLOCK|ARRAY|BLOCK_DEFINE) +([\w\-\.\*]+) +(SEPARATOR +'(.+)' +)?$rightStatementDelimiter#i";
		$this->patternIncludeBlock = "#$leftStatementDelimiter +INCLUDE +([\w\-\.\/\{\}]+) +([\w\-\$\*\.\_\#]+) +$rightStatementDelimiter#i";
		$this->patternIncludeBlockVariable = "#$leftStatementDelimiter +INCLUDE +([\w\-\.\/]+) +'(.+)' +$rightStatementDelimiter#i";
		$this->patternCall = "#$leftStatementDelimiter +CALL +(.+) +$rightStatementDelimiter#i";
		$this->patternDefine= "#$leftStatementDelimiter +(DEFINE|DEFINE_GLOBAL) +([\w\-\.\_\[\]]+) +(.+) +$rightStatementDelimiter#i";
		$this->patternIf = "#$leftStatementDelimiter +(.+ +\? .+( +\: +(.+))?) +$rightStatementDelimiter#i";
		
		if($template != null)  $this->addTemplate( $template );

		
		$this->addVariable( self::$rootDirVariableName, $this->templatesRootDir );
		
		$this->lastIncludeDir = $this->templatesRootDir;
					
	}
	
	
	
	private function _getTemplateFileString( $template ) {

		
		if(str_starts_with($template, './')) {
			
			$template = str_remove_prefix( $template, './' );
			$template = $this->lastIncludeDir . '/' . $template;
		}
				
		$fileName = trim($template) . ( $this->templatesExtension ? ".{$this->templatesExtension}" : '' );
		
		
		if(!file_exists( $fileName )) 
			$fileName = $this->templatesRootDir . '/' . $fileName;
			
		$this->lastIncludeDir = dirname( $fileName );	
		@ $string = file_get_contents( $fileName );
		
		
		
		return $string;
	}
	
	
	//------------------------------------------------------------------------
	
	
	public function addTemplate( $template ) { $this->addString( $this->_getTemplateFileString( $template ) ); }
	
	
	public function addString( $string ) { 
		
		
		$string = (string) $string;
		
		
		while( preg_match( $this->patternIncludeBlockVariable, $string, $match, PREG_OFFSET_CAPTURE ) ) {
			
			$statement = $match[0][0];
			$file = $match[1][0];
			
			$variableValue = $match[2][0];
			$variableName = self::$autoVariablesPrefix . $this->autoVariables;
			
			$this->addVariable( $variableName, $variableValue );
			$this->autoVariables++;
						
			$replacement = "{$this->leftStatementDelimiter} BLOCK $variableName {$this->rightStatementDelimiter} {$this->leftStatementDelimiter} INCLUDE $file {$this->rightStatementDelimiter} {$this->leftStatementDelimiter} END {$this->rightStatementDelimiter} ";

			$string = str_replace( $statement, $replacement, $string );	
			
			break;
		}
		
		
		while( preg_match( $this->patternIncludeBlock, $string, $match, PREG_OFFSET_CAPTURE ) ) {
			
			$statement = $match[0][0];
			$file = $match[1][0];
			$variable = $match[2][0];
			
			
			
			$replacement = "{$this->leftStatementDelimiter} BLOCK $variable {$this->rightStatementDelimiter} {$this->leftStatementDelimiter} INCLUDE $file {$this->rightStatementDelimiter} {$this->leftStatementDelimiter} END {$this->rightStatementDelimiter} ";
			
						
			$string = str_replace( $statement, $replacement, $string );	
		}
		
		
		
	
		while( preg_match( $this->patternInclude, $string, $match, PREG_OFFSET_CAPTURE ) ) {
			
			$statement = $match[0][0];
			$file = $match[1][0];
										
			$string = str_replace( $statement, $this->_getTemplateFileString( $file ), $string );	
		}
		
		
		
		
		$offset = 0;
		
		while( preg_match( $this->patternBlock, $string, $match, PREG_OFFSET_CAPTURE, $offset  ) ) {
			
			$statement = $match[0][0];
			$offset = $match[0][1] + strlen( $statement );
			$name = $match[2][0];
			$type = strtoupper( $match[1][0] );
			
			
			if( ( $endMatchesNum = preg_match_all( $this->patternEnd, $string, $endMatches, PREG_OFFSET_CAPTURE, $offset ) ) ) {
				
				$blockMatchesNum = preg_match_all( $this->patternBlock, $string, $blockMatches, PREG_OFFSET_CAPTURE, $offset );
				
				$endMatches = $endMatches[0];
				$blockMatches = $blockMatches[0];
				
				$endMatchIndex = 0;
				
				for($i=0; $i < $endMatchesNum; $i++) {
					
					$endMatchPosition = $endMatches[ $i ][ 1 ];
					
					$auxEndMatchesNum = 0;
					$auxBlockMatchesNum = 0;
					
					for($j=0; $j < $blockMatchesNum; $j++)
					
						if( $blockMatches[$j][1] < $endMatchPosition ) $auxBlockMatchesNum++;
						else break;
						
						
					for($j=0; $j < $endMatchesNum; $j++)
					
						if( $endMatches[$j][1] < $endMatchPosition ) $auxEndMatchesNum++;
						else break;
						
						
					if($auxBlockMatchesNum == $auxEndMatchesNum) {
						
						$endMatchIndex = $i;
						break;
					}
				}
				
				$block = substr( $string, $match[0][1], ($endMatches[$endMatchIndex][1] + strlen($endMatches[$endMatchIndex][0])) - $match[0][1] );
				$templateString = substr( $string, $offset, $endMatches[$endMatchIndex][1] - $offset );
			
								
								
				
				if($type == 'BLOCK' || $type == 'ARRAY') {

					$uniqName = $name . '_' . uniqid();
					$this->variablesArrayBlocks[ $uniqName ] = $name;
			
					
					if($type == 'BLOCK') $this->blocks[ $uniqName ] = $templateString;
					else {
						
						$this->arrays[ $uniqName ] = $templateString;
						$this->arraysSeparators[ $uniqName ] = ($match[3][0] && $match[4][0]) ? $match[4][0] : '';
					}	
					
					$string = str_replace( $block, "{$this->leftVariableDelimiter}$uniqName{$this->rightVariableDelimiter}", $string );
						
				} else {
					
					$this->addVariable($name, $templateString);
					$string = str_replace( $block, '', $string );
				}
				
								
				
				
			} else $string = str_replace( $statement, '', $string );
		}
		
		
		$defineMatchesNum = preg_match_all( $this->patternDefine, $string, $defineMatches, PREG_OFFSET_CAPTURE );
		
		
		for( $i=0; $i < $defineMatchesNum; $i++ ) {
			
					
			$statement = $defineMatches[0][$i][0];
			$variableName = $defineMatches[2][$i][0];
			$code = $defineMatches[3][$i][0];
			
			$this->defineVariables[] = $variableName;
			$this->defineVariables[] = "!$variableName";
			$this->defineVariables[] = "#$variableName";
			$this->defineVariables[] = "&$variableName";
		}
		
		
		
		
		while(preg_match($this->patternCall, $string, $match, PREG_OFFSET_CAPTURE)) {
			
			$statement = $match[0][0];
			$code = $match[1][0];
			
			$variableName = self::$autoVariablesPrefix . $this->autoVariables;
			$this->callVariables[ $variableName ] = $code;
			$this->autoVariables++;
			
			$string = substr( $string, 0, $match[0][1] ) . "{$this->leftVariableDelimiter}$variableName{$this->rightVariableDelimiter}" . substr( $string, $match[0][1] + strlen( $statement ) );
		}
		
		
		$this->string.= $string; 
	}
	
	
	public function clean() { $this->string = ''; }
	
	
	
	public function setString($string) { 
		
		$this->clean();
		$this->addString($string); 
	}
		
	public function setTemplate( $template ) {
		
		$this->clean();
		$this->addTemplate($template);
	}
	
	
	public function getTemplateString() { return $this->string; }
		
	
	
	//------------------------------------------------------------------------
	
	
		
	public function addVariable( $name, $value = null ) { $this->variables[ $name ] = $value; }
	
	
	public function addVariables( $variablesArray ) {
		
		if(!is_array( $variablesArray )) $variablesArray = array();
		
		foreach($variablesArray as $name => $value)
			$this->addVariable( $name, $value );
	}
	
	
	public function getVariable( $name ) { return $this->variables[ $name ]; }
	
	
	public function getVariables() { return $this->variables; }
	
	
	public function removeVariables( $variable, $regex = false ) {
		
		if( is_array($variable) ) {
			
			foreach($variable as $variableName)
			
				$this->removeVariables( $variableName, $regex );
		
		
		} else {
			
			if( !$regex ) unset( $this->variables[ $variable ] );
		
			else {
			
				$variablesName = array();
			
				foreach($this->variables as $key => $value)
			
					if( !ereg( $variable, $key ) ) $variablesName[] = $key;
			
				
				$this->removeVariables( $variablesName, false );
			}
			
		}
	}
	
	
	public function removeVariablesAll() { $this->variables = array(); }
		
	
	
	public function appendVariable( $name, $value = null ) {
		
		if(is_object($value)) $value = (string) $value;
		
		else if( is_bool($value) ) $value = $value ? 'true' : 'false';
						
		
		if( is_array( $this->variables[ $name ] ) || is_array( $value ) ) {
			
			$oldValue = $this->variables[ $name ];
			
			if(!is_array( $oldValue )) $oldValue = array( $oldValue );
			if(!is_array( $value )) $value = array( $value );
			
			$this->addVariable( $name, array_merge( $oldValue, $value ) );
			
		} else $this->variables[$name].= $value;
	}
	
	
	public function appendVariables( $variablesArray ) {
		
		if(!is_array( $variablesArray )) $variablesArray = array();
		
		foreach($variablesArray as $name => $value)
			$this->appendVariable( $name, $value );
	}
	
	//------------------------------------------------------------------------
	
	
	public function getRootDir () { return $this->templatesRootDir; }
	
	public function getTemplatesExtension () { return $this->templatesExtension; }
	
	
	//------------------------------------------------------------------------
	
	public function getTemplateVariables() {
		
		preg_match_all( $this->patternVariable, $this->string, $matches );
		
		$variables = array();
		
		foreach($matches[1] as $match)
			$variables[] = $match;
			
		return $variables;
	}
	
	
	public function getString() {

		$variables = $this->variables + self::$defaultVariables;
		
		
		$blocks = $this->blocks;
		$arrays = $this->arrays;
		
		foreach($this->variablesArrayBlocks as $uniqVariableName => $variableName)
			
			if(!in_array($variableName, $this->defineVariables)) $variables[ $uniqVariableName ] = $variables[ $variableName ];
			
			else {
				
				unset( $blocks[ $uniqVariableName ] );
				unset( $arrays[ $uniqVariableName ] );
				
				$variables[ $uniqVariableName ] = "{$this->leftVariableDelimiter}$uniqVariableName{$this->rightVariableDelimiter}";
			}
				
						
		
		foreach( $blocks as $name => $templateString ) {
									
			if( $variables[ $name ] != null ) {
				
				$template = new TemplateParser( null, $this->templatesRootDir, $this->templatesExtension, array($this->leftStatementDelimiter, $this->rightStatementDelimiter), array($this->leftVariableDelimiter, $this->rightVariableDelimiter) );
				$template->setString( $templateString );
				
				$template->addVariables( $this->variables );
				
				if(is_array( $variables[ $name ] )) $template->addVariables( $variables[ $name ] );
				
				$template->addVariable( '*', $variables[ $name ] );
				$template->addVariable( '_SELF_', $variables[ $name ] );
								
				$variables[ $name ] = $template->getString();
				
				
			} else $variables[ $name ] = '';
			
		}
		
		
		foreach( $arrays as $name => $templateString ) {

			$array = is_array( $variables[ $name ] ) ? $variables[ $name ] : array();
			$valor = array();
			
			$index = 0;
				
			foreach( $array as $key => $value ) {
				
				$template = new TemplateParser( null, $this->templatesRootDir, $this->templatesExtension, array($this->leftStatementDelimiter, $this->rightStatementDelimiter), array($this->leftVariableDelimiter, $this->rightVariableDelimiter) );
				$template->setString( $templateString );
				
				if( is_array( $value ) ) $template->addVariables( $value );
				
				$template->addVariable( '$', $key );
				$template->addVariable( '*', $value );
				$template->addVariable( '_INDEX_', $index );
				$template->addVariable( '_SELF_', $array );
				
				$template->addVariable( '_INDEX_PARITY_', ($index % 2 == 0) ? 'PAR' : 'IMPAR' );
							
				$index++;
				
				$valor[] = $template->getString();
				
				
			}
			
			
			$variables[ $name ] = implode( $this->arraysSeparators[ $name ], $valor  );
			
		}
		
		$string = $this->string;
		preg_match_all( $this->patternVariable, $this->string, $matches );
		
				
		$variables['_SELF_'] = $variables;
		
		
		foreach($matches[0] as $index => $match) {
			
			$variable = $matches[1][$index];
						
			if( in_array( $variable, $this->defineVariables ) || array_key_exists( $variable, $this->callVariables ) ) continue;
			else $valor = self::_getVariableValue( $variables, $variable );
						
			$string = str_replace( $match, $valor, $string );
		}
		
		
		while( preg_match( $this->patternDefine, $string, $match, PREG_OFFSET_CAPTURE ) ) {
			
			$statement = $match[0][0];
			$type = $match[1][0];
			$variableName = $match[2][0];
			$code = $match[3][0];
			
			$valor = '';
			$valor = call_user_func(create_function( '', '@ $value = ' . str_put_sufix( $code, ';') . ' return $value;' ));
			
			
			if(strtoupper($type) == 'DEFINE_GLOBAL') TemplateParser::_setDefaultVariable( $variableName, $valor );
			else $this->addVariable( $variableName, $valor );
			$string = str_replace( $statement, '', $string );	
		}	
		
		$this->defineVariables = array();

		
		while( preg_match( $this->patternIf, $string, $match, PREG_OFFSET_CAPTURE ) ) {
			
			$statement = $match[0][0];
			$code = '@ $valor = ' . str_put_sufix( $match[1][0], ';');

			$valor = '';
			@ eval($code);
			
						
			$string = str_replace( $statement, $valor, $string );	
		}	
			
		
		foreach( $this->callVariables as $variableName => $code ) {
			
			preg_match_all( $this->patternVariable, $code, $matches );
		
			foreach($matches[0] as $index => $match) {
				
				$variable = $matches[1][$index];
				
				$valor = self::_getVariableValue( $variables, $variable );
				
				if( $valor == '' ) $valor = 'null';
			
				$code = str_replace( $match, $valor, $code );	
			}
		
			$code = '@ $callValue = ' . str_put_sufix( $code, ';');

			$callValue = '';
			@ eval($code);
			
			$string = str_replace( "{$this->leftVariableDelimiter}$variableName{$this->rightVariableDelimiter}", $callValue, $string );
		}
				
		
		
		if( preg_match($this->patternBlock, $string) || preg_match($this->patternInclude, $string) || preg_match($this->patternVariable, $string) || preg_match($this->patternIncludeBlock, $string) || preg_match($this->patternIncludeBlockVariable, $string) ) {
			
			$this->setString($string);
			return $this->getString();
			
		} else return $string;
				
	}	
	
	public function __toString() { return $this->getString(); }
	
}

//----------------------------------------------------- ?>