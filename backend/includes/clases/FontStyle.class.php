<?php //------------------------------------------------

@ include_once( dirname(__FILE__) . './Color.class.php' );


define('FONTSTYLE_ALIGN_LEFT', 0);
define('FONTSTYLE_ALIGN_CENTER', 1);
define('FONTSTYLE_ALIGN_RIGHT', 2);

define('FONTSTYLE_VALIGN_TOP', 0);
define('FONTSTYLE_VALIGN_CENTER', 1);
define('FONTSTYLE_VALIGN_BOTTOM', 2);



class FontStyle {
	
	private static $_defaultFamily = 'times';
	private static $_defaultSize = 10;
	private static $_defaultColor = '0';
	private static $_defaultBold = false;
	private static $_defaultItalic = false;

	private static $_defaultRectangleBackgroundColor = null;
	private static $_defaultRectangleLineWidth = 0;
	private static $_defaultRectangleLineColor = '0';
	
	private static $_defaultAlign = FONTSTYLE_ALIGN_LEFT;
	private static $_defaultVAlign = FONTSTYLE_VALIGN_CENTER;
	
	private static $_defaultRectangleWidth = 0;
	private static $_defaultRectangleHeight = 0;
	
	private static $_defaultPadding = array(0,0,0,0); // top, right, bottom, left
	
	//------------------------------------------------------
	
	
	private $family;
	private $size;
	private $color;
	private $bold;
	private $italic;
	
	private $rectangleBackgroundColor;
	private $rectangleLineWidth;
	private $rectangleLineColor;
	
	private $align;
	private $vAlign;
	
	private $padding;
	
	private $rectangleWidth;
	private $rectangleHeight;
	
	
	public function __construct( $font = null, $size = null, $color = null, $bold = null, $italic = null ) {
		
		$this->setFont( $font == null ? self::$_defaultFamily : $font );
		$this->setSize( $size == null ? self::$_defaultSize : $size );
		$this->setColor( $color == null ? self::$_defaultColor : $color );
		$this->setBold( $bold == null ? self::$_defaultBold : $bold );
		$this->setItalic( $italic == null ? self::$_defaultItalic : $italic );
		
		
		$this->setBackgroundColor( self::$_defaultRectangleBackgroundColor );
		$this->setLineWidth( self::$_defaultRectangleLineWidth);
		$this->setLineColor( self::$_defaultRectangleLineColor);
		
		$this->setAlign( self::$_defaultAlign);
		$this->setVerticalAlign( self::$_defaultVAlign);
		
		$this->setPadding( self::$_defaultPadding );
		$this->setWidth( self::$_defaultRectangleWidth );
		$this->setHeight( self::$_defaultRectangleHeight );
	}
	
	
	
	//----------------------------------------------------------
	
	public function setFont( $font ) { $this->family = $font; }
	
	public function setSize( $size ) { $this->size = abs($size); }
	
	public function setColor( $color ) { $this->color = new Color($color); }
	
	public function setBold( $boolean ) { $this->bold = $boolean; }
	
	public function setItalic( $boolean ) { $this->italic = $boolean; }
	
	
	public function setBackgroundColor( $color ) { $this->rectangleBackgroundColor = $color == null ? null : new Color($color); }
	
	public function setLineWidth( $width ) { $this->rectangleLineWidth = $width; }
	
	public function setLineColor( $color ) { $this->rectangleLineColor = $color == null ? null : new Color($color); }
	
	public function setLine( $color = null, $width = 0 ) {
		
		$this->setLineColor( $color );
		$this->setLineWidth( $width );
	}
	
	
	public function setAlign( $align ) { $this->align = $align; }
	
	public function setVerticalAlign( $valign ) { $this->vAlign = $valign; }
	
	
	public function setWidth( $width, $align = null ) { 
		
		$this->rectangleWidth = abs($width); 
	
		if($align != null) $this->setAlign($align);
	}
	
	public function setHeight( $height, $align = null ) { 
		
		$this->rectangleHeight = abs($height); 
	
		if($align != null) $this->setVerticalAlign($align);
	}
	
	
	public function setPadding( $padding ) {
		
		if(is_array($padding)) call_user_method_array( 'setPadding', $this, $padding );
		
		else {
			
			$args = func_get_args();
			$numArgs = count($args);
			
			
			$top = $args[0];
			
			if( $numArgs == 1 ) {
				
				$right = $top;
				$bottom = $top;
				$left = $top;
				
			} else if( $numArgs == 2 ) {
				
				$bottom = $top;
				
				$right = $args[1];
				$left = $right;
				
			} else if( $numArgs == 3 ) {
				
				$right = $args[1];
				$left = $right;
				
				$bottom = $args[2];
								
			} else {
				
				$right = $args[1];
				$bottom = $args[2];
				$left = $args[3];
			}
			
			$this->setPaddingTop( $top );
			$this->setPaddingRight( $right );
			$this->setPaddingBottom( $bottom );
			$this->setPaddingLeft( $left );
		}
		
	}
	
	
	
	public function setPaddingTop( $padding ) { $this->padding[0] = abs( $padding ); }
	
	public function setPaddingRight( $padding ) { $this->padding[1] = abs( $padding ); }
	
	public function setPaddingBottom( $padding ) { $this->padding[2] = abs( $padding ); }
	
	public function setPaddingLeft( $padding ) { $this->padding[3] = abs( $padding ); }
	
	
	public function setPaddingHeight( $padding ) {
		
		$this->setPaddingTop( $padding );
		$this->setPaddingBottom( $padding );
	}
	
	
	public function setPaddingWidth( $padding ) {
		
		$this->setPaddingLeft( $padding );
		$this->setPaddingRight( $padding );
	}
	//---------------------------------------------------
	
	
	public function getFont() { return $this->family; }
	
	public function getSize() { return $this->size; }
	
	public function getColor() { return $this->color; }
	
	public function getBold() { return $this->bold; }
	
	public function getItalic() { return $this->italic; }
	
	
	public function getBackgroundColor() { return $this->rectangleBackgroundColor; }
	
	public function getLineWidth() { return $this->rectangleLineWidth; }
	
	public function getLineColor() { return $this->rectangleLineColor; }
	
	
	public function getAlign() { return $this->align; }
	
	public function getVerticalAlign() { return $this->vAlign; }
	
	
	public function getWidth() { return $this->rectangleWidth; }
	
	public function getHeight() { return $this->rectangleHeight; }
	
	
	
	public function getPadding() { return $this->padding; }
	
	
	public function getPaddingTop() { return $this->padding[0]; }
	
	public function getPaddingRight() { return $this->padding[1]; }
	
	public function getPaddingBottom() { return $this->padding[2]; }
	
	public function getPaddingLeft() { return $this->padding[3]; }
}


//----------------------------------------------------- ?>