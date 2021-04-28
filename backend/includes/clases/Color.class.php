<?php //-----------------------------------------

final class Color {
	
	
	private static $maxColorValue = 255;
	private static $minColorValue = 0;
	
	
	
	private static function _truncateColorValue( $value ) {

		
		$cant = (integer) $value;
		
		if($cant < self::$minColorValue) $cant = self::$minColorValue;
		else if($cant > self::$maxColorValue) $cant = self::$maxColorValue;
	
		return $cant;
	}
	
	
	
	private static function _getHex( $red = 0, $green = 0, $blue = 0 ) {
		
		
		$rgb = array($red, $green, $blue);
		$hex = '';
		
		foreach( $rgb as $color ) 
			
			$hex.= str_pad( (string) dechex( self::_truncateColorValue( $color ) ), 2, '0', STR_PAD_LEFT );
						
		return strtoupper($hex);
	}
	
	
	
	private static function _getRGB( $hex ) {
		
		if(strlen($hex) == 6) {
		
			list($redHex, $greenHex, $blueHex) = str_split( $hex, 2 );
			return array( (integer) hexdec($redHex), (integer) hexdec($greenHex), (integer) hexdec($blueHex) );
		
		} else if( strlen($hex) == 3 ) {
			
			list($redHex, $greenHex, $blueHex) = str_split( $hex, 1 );
			return self::_getRGB( str_pad( $redHex, 2, $redHex ) . str_pad( $greenHex, 2, $greenHex ) . str_pad( $blueHex, 2, $blueHex ) );
			
		} else if( strlen($hex) == 1 ) {	
			
			return self::_getRGB( str_pad( $hex, 6, $hex ) );
			
		} else return array(0,0,0);
		
		
		
		
	}
	
	//-------------------------------------------------------------------
	
	
	private $red = 0;
	private $green = 0;
	private $blue = 0;
	
	private $alpha = 0;
	
		
	
	public function __construct() {
		
		$args = func_get_args();
		$numArgs = count($args);
		
		if($numArgs > 0 ) {
			
			if( $numArgs == 1 || $numArgs == 2 ) {
				
				$firstArgument = $args[0];
				$secondArgument = $args[1];
				
				if( is_string( $firstArgument ) || is_array($firstArgument) ||  get_class( $firstArgument ) == get_class($this) ) {
				
					if(is_string($firstArgument)) $this->setHex( $firstArgument );
					
					else if(get_class( $firstArgument ) == get_class($this)) {
						
						$this->setRGB( $firstArgument->getRGB() );
						$this->setAlpha( $firstArgument->getAlpha() );
						
					}
					else $this->setRGB( $firstArgument );
					
					if($numArgs == 2) $this->setAlpha($secondArgument);
					
				} else {
					
					$this->setRed( $firstArgument );
					if($numArgs == 2) $this->setGreen($secondArgument);
				}
				
				
			
			} else {

				$this->setRGB( $args[0], $args[1], $args[2] );
				$this->setAlpha( $args[3] );
			}
			
			
		} 		
	}
	
	
	public function __clone() {}
	
	//---------------------------------------------------------------------
	
	public function setRed( $red ) { $this->red = self::_truncateColorValue( $red ); }
	
	public function setGreen( $green ) { $this->green = self::_truncateColorValue( $green ); }
	
	public function setBlue( $blue ) { $this->blue = self::_truncateColorValue( $blue ); }
	
	
	public function setAlpha( $percent ) { 
		
		$percent = (float) $percent;
		
		if($percent < 0) $percent = 0;
		else if($percent > 100) $percent = 100;
		
		$this->alpha = ($percent * self::$maxColorValue) / 100;
	}
	
	
	public function getRed() { return $this->red; }
	
	public function getGreen() { return $this->green; }
	
	public function getBlue() { return $this->blue; }
	
	public function getAlpha() { return ( $this->alpha * 100 ) / self::$maxColorValue; }
	
	
	
	public function getRGB() { return array($this->getRed(), $this->getGreen(), $this->getBlue()); }
	
	
	public function setRGB( $red = 0, $green = 0, $blue  = 0 ) {
		
		if(is_array($red)) $this->setRGB( $red[0], $red[1], $red[2] );
		
		else {
			$this->setRed($red);
			$this->setGreen($green);
			$this->setBlue($blue);
		}
	}
	
	
	public function getHex() { return self::_getHex( $this->getRed(), $this->getGreen(), $this->getBlue() ); }
	
	public function setHex( $hex ) { $this->setRGB( self::_getRGB( $hex ) ); }
	
	
	
	
	//----------------------------------------------
	
	
	public function invertRGB() {
		
		$red = self::$maxColorValue - $this->getRed();
		$green = self::$maxColorValue - $this->getGreen();
		$blue = self::$maxColorValue - $this->getBlue();
		
		$this->setRGB($red, $green, $blue);
	}
	
	
	public function invertAlpha() { $this->setAlpha(100 - $this->getAlpha()); }
	
	//----------------------------------------------
	
	public function incrementRed( $inc ) { $this->setRed( $this->getRed() + (integer) $inc ); }
	
	public function incrementGreen( $inc ) { $this->setGreen( $this->getGreen() + (integer) $inc ); }

	public function incrementBlue( $inc ) { $this->setBlue( $this->getBlue() + (integer) $inc ); }
	
	public function incrementRGB( $inc ) {
		
		$this->incrementRed($inc);
		$this->incrementGreen($inc);
		$this->incrementBlue($inc);
	}
	
	
	public function incrementAlpha( $inc ) { $this->setAlpha( $this->getAlpha() + (integer) $inc ); }
	
	//---------------------------------------------------------------------
	
	
	public function __toString() { return implode(', ', array($this->getRed(), $this->getGreen(), $this->getBlue(), $this->getAlpha() . '%' ) ); }
}


//---------------------------------------------- ?>