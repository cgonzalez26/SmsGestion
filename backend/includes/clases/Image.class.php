<?php //------------------------------------------------


@ include_once( dirname(__FILE__) . './Color.class.php' );
@ include_once( dirname(__FILE__) . './FontStyle.class.php' );
@ include_once( dirname(__FILE__) . '/./../functions/files.php' );


final class Image {
	
	
	private static $ttfFontsDir = TTF_FONTS_DIR;
	private static $ttfFontsExtension = 'ttf';
	
	
	private static $defaultLineColor = COLOR_HEX_NEGRO;
	private static $defaultBackgroundColor = COLOR_HEX_BLANCO;
		
	private static $defaultType = self::TYPE_PNG;
	private static $defaultQuality = 90;
	
	private static $defaultWidth = 100;
	private static $defaultHeight = 100;
		
	
	private static $fontSufixBold = 'bd';
	private static $fontSufixItalic = 'i';
	private static $fontSufixBoldItalic = 'bd';
	
	
	

	public static function createFromUploadedFile( $fileName, $index = null ) { 
		
		
		$tmp_name = $index == null ? $_FILES[ $fileName ]['tmp_name'] : $_FILES[ $fileName ]['tmp_name'][ $index ];
		
		if(is_uploaded_file( $tmp_name )) return new Image( $tmp_name );
		return false;
	}
	
	
	private static function _getFontFile( FontStyle $font ) {
		
		
		$file = strtolower( $font->getFont() );
		
		if( $font->getBold() && $font->getItalic() ) $file.= self::$fontSufixBoldItalic;
		else if( $font->getBold() ) $file.= self::$fontSufixBold;
		else if( $font->getItalic() ) $file.= self::$fontSufixItalic;
		
		if( self::$ttfFontsExtension ) $file.= '.' . self::$ttfFontsExtension;
		
		return self::$ttfFontsDir . '/' . $file;
	}
	
	
	
	//-------------------------------------------------------------
	
	
	public static function getTextSize( $text, FontStyle $style = null ) {
		
		if($style == null) $style = new FontStyle();
				
		$fontFile = self::_getFontFile( $style );
		
		// Guardamos en una variable '$p' información sobre las coordenadas
		// relativas del texto. El array $p tendrá la siguiente información:
		
		// $p[0] = esquina inferior izquierda, posición X
		// $p[1] = esquina inferior izquierda, posición Y
		// $p[2] = esquina inferior derecha, posición X
		// $p[3] = esquina inferior derecha, posición Y
		// $p[4] = esquina superior derecha, posición X
		// $p[5] = esquina superior derecha, posición Y
		// $p[6] = esquina superior izquierda, posición X
		// $p[7] = esquina superior izquierda, posición Y
		
		$pointsArray = imagettfbbox( $style->getSize(), 0, $fontFile, $text );
		
		$size = array();
		$size[0] = abs( max( $pointsArray[4], $pointsArray[2]) - min( $pointsArray[0], $pointsArray[6] ) );
		$size[1] = abs( max( $pointsArray[1], $pointsArray[3]) - min( $pointsArray[5], $pointsArray[7] ) );
		
		return $size;
	}
	
	public static function getTextWidth( $text, FontStyle $style = null ) {
		
		$size = self::getTextSize( $text, $style ); 
		return $size[0];
	}
	
	
	public static function getTextHeight( $text, FontStyle $style = null ) {
		
		$size = self::getTextSize( $text, $style ); 
		return $size[1];
	}
	
	
	//----------------------------------------------------
	
	const TYPE_JPEG = 'jpeg';
	const TYPE_GIF = 'gif';
	const TYPE_PNG = 'png';
	const TYPE_BMP = 'bmp';
		
	//----------------------------------------------------
	
	private $imagen;
	private $type;
	private $quality;
	
	private $colorResources = array();
	private $transparentColor;
		
	
	
	public function __construct( $file_width = null, $height = null  ) {
		
		if( $file_width != null && is_string( $file_width ) ) {
			
			
			if( is_file( $file_width ) ) {
				
				@ $string = file_get_contents( $file_width );
				@ $file = $file_width;
				@ $imageInfo = getimagesize( $file );
				
			} else {
				
				@ $string = $file_width;
				@ $tmpFile = file_create_temp( $string, 'image' );
				@ $imageInfo = getimagesize( $tmpFile );
				
				@ unlink( $tmpFile );
				
			}
			
						
			@ $this->imagen = imagecreatefromstring($string);
			$this->setType($imageInfo['mime']); 
			$this->setTransparentColor( self::$defaultBackgroundColor );
		
		
		} else $this->_create( $file_width == null ? self::$defaultWidth : (integer) $file_width, $height == null ? self::$defaultHeight : (integer) $height );
						
	
		$this->setQuality( self::$defaultQuality );
		
	}
	
	
	public function __destruct() { $this->destroy(); }
	
	
	private function _create( $width, $height, $type = null ) {
		
		
		$this->colorResources = array();
		
		@ $this->imagen = imagecreatetruecolor( $width, $height );
		$this->fill( self::$defaultBackgroundColor );
		$this->setTransparentColor( $this->transparentColor != null ? $this->transparentColor : self::$defaultBackgroundColor );
		$this->setType( $type == null ? self::$defaultType : $type );
	}
	
	//---------------------------------------------------------------------------
	
	
		
	
	public function setQuality( $quality ) { $this->quality = abs( $quality ); }
	
	
	public function getQuality() { return $this->quality; }
	
	
	public function getType() { return $this->type; }

	
	public function setType( $type ) { $this->type = str_replace( 'image/', '', $type );  }
	
	
	public function setTransparentColor( $color ) { 
		
		$this->transparentColor = $color; 
		@ imagecolortransparent( $this->imagen, $this->_getColorResource( $color  ) ); 
	}
	
	
	
	public function isValid() {
		
		$class = new ReflectionClass(get_class($this));
      	
		$constantsTypes = array();
		$constants = $class->getConstants();
		
		foreach($constants as $constant => $value) 
			
			if( strpos( $constant, 'TYPE_' ) === 0 ) array_push( $constantsTypes, $value );
		
		return in_array( $this->getType(), $constantsTypes );
	}
	
	//---------------------------------------------------------------------------
	
	private function _getColorResource( $color ) {
		
		$color = new Color($color);
		$colorString = (string) $color->__toString();
		
		if( !array_key_exists( $colorString, $this->colorResources ) ) 
			@ $this->colorResources[ $colorString ] = imagecolorallocatealpha( $this->imagen, $color->getRed(), $color->getGreen(), $color->getBlue(), floor(($color->getAlpha() * 255) / 100 ));
			
			
		return $this->colorResources[ $colorString ];
	}
	
	
	private function _out( $file = null ) {
				
		if($this->type == self::TYPE_JPEG) imagejpeg( $this->imagen, $file, $this->quality);
		
		else if( $this->type == self::TYPE_GIF ) imagegif( $this->imagen, $file );
		
		else if( $this->type == self::TYPE_PNG ) imagepng( $this->imagen, $file );
		
		else if( $this->type == self::TYPE_BMP ) imagewbmp( $this->imagen, $file );
	}
	
		
	//---------------------------------------------------------------------------
	
	
	public function out( $cache = true ) { $this->show($cache); }
	
	
	public function show( $cache = true ) {
		
		header("Content-Type: image/{$this->type}");
		
		if(!$cache) {
			
			header('Cache-Control: no-cache; must-revalidate');
			
		}
		
		
		$this->_out();
	}
	
	
	public function save( $file ) { return (boolean) file_put_contents( $file, $this->getString() ); }
	
	
	public function destroy() { @ imagedestroy($this->imagen); }
	
	
	
	public function duplicate() {
		
		$imagen = new Image( $this->getString() );
		$imagen->setType( $this->getType() );
		$imagen->setQuality( $this->getQuality() );
		
		return $imagen;
		
	}
	
	//-------------------------------------------------------------------------

	
	
	public function getFileSize() { return strlen( $this->getString() ); }
	
		
	public function getString() {
				
		@ $file = file_create_temp();
		
		$this->_out( $file );
		@ $string = file_get_contents( $file );
		@ unlink($file);
				
		return $string;		
	}
		
	
	public function __toString() { return $this->getString(); }
	
	//---------------------------------------------------------------------------
	
	
	public function getHeight() { return imagesy( $this->imagen ); }
		
	
	public function getWidth() { return imagesx( $this->imagen ); }
		
	public function setSize( $width = 0, $height = 0 ) {
		
		// obtenemos el ancho y alto de la imagen
		
		
		$img_width = imagesx( $this->imagen );
		$img_height = imagesy( $this->imagen );
		
		if( $width > 0 && $height <= 0 ) $height = $width / ( $img_width / $img_height );
		else if( $height > 0 && $width <= 0 ) $width = $height * ( $img_width / $img_height );
					
		
		$imageResource = $this->imagen;
		$this->_create( $width, $height, $this->getType() );
						
		imagecopyresampled( $this->imagen,$imageResource,0,0,0,0,$width, $height, $img_width, $img_height );
		imagedestroy($imageResource);
	}
	
	
	public function setWidth( $width, $preserveAspect = true ) { 
		
		$this->setSize( $width, $preserveAspect ? 0 : $this->getHeight() ); 
	}
	
	public function setHeight( $height, $preserveAspect = true  ) { 
		
		$this->setSize( $preserveAspect ? 0 : $this->getWidth(), $height ); 
	}
		
	
	public function trim( $x, $y, $width = 0, $height = 0 ) {
		
		$x = abs($x);
		$y = abs($y);
		
		$img_width = imagesx( $this->imagen );
		$img_height = imagesy( $this->imagen );
				
		if( $width <= 0 ) $width = abs( $img_width - $x );
		if( $height <= 0 ) $height = abs( $img_height - $y );
		
		$imageResource = $this->imagen;
		$this->_create( $width, $height, $this->getType() );
				
		imagecopyresampled( $this->imagen,$imageResource,0,0,$x,$y,$width, $height, $width, $height );
		imagedestroy($imageResource);
	}
		
	
	function paste(Image $imagen, $x = 0, $y = 0, $transparent = true ) {
		
		$width = $imagen->getWidth();
		$height = $imagen->getHeight();
				
		$function = $transparent ? 'imagecopyresized' : 'imagecopyresampled';
		$function( $this->imagen, $imagen->imagen, $x, $y, 0, 0, $width, $height, $width, $height );
	}
	
	
	function insertImage( Image $image, $x = 0, $y = 0, $transparent = true ) { $this->paste( $image, $x, $y, $transparent ); }
	
	
	
	// ------------------------------------------------------------------------------------------
	
	
	public function fill( $color ) { 
		
		imagefilledrectangle($this->imagen,0,0,$this->getWidth() - 1,$this->getHeight() - 1, $this->_getColorResource( $color )  );  
	}
	
	
		
	public function drawRectangle( $x = 0, $y = 0, $width = 0, $height = 0, $color = null, $background = null,  $lineWidth = 1 ) {
		
		If( $width <= 0 ) $width = imagesx( $this->imagen ) - 1;
		If( $height <= 0 ) $height = imagesy( $this->imagen ) - 1;
		
		
		imagesetthickness( $this->imagen, $lineWidth );
						
		If ( $background != null ) 
			
			imagefilledrectangle($this->imagen,$x,$y,$x+$width,$y+$height, $this->_getColorResource( $background)  );
		
			
		If ( $color != null && $lineWidth > 0 ) 
		
			imagerectangle( $this->imagen, $x, $y, $x + $width, $y + $height, $this->_getColorResource( $color  ));
	}
	
	
	public function drawBorder( $color = null, $lineWidth = 1 ) {
		
		if($color == null) $color = self::$defaultLineColor;
		$this->drawRectangle(0,0,$this->getWidth()-1, $this->getHeight()-1, $color, null, $lineWidth);
	}
	
	
	public function drawLine( $x1, $y1, $x2, $y2, $color = null, $lineWidth = 1 ) {
		
		imagesetthickness( $this->imagen, $lineWidth );
		imageline( $this->imagen, $x1, $y1, $x2, $y2, $this->_getColorResource( $color != null ? $color : self::$defaultLineColor ) );
				
		
	}
	
	
	public function drawLinePolar( $x, $y, $angle, $width, $color = null, $lineWidth = 1 ) {
		
		$angle = deg2rad( $angle );
			
		$posX = $width * cos( $angle );
		$posY = sqrt( pow( $width, 2 ) - pow( $posX, 2 ) );
			
		$this->drawLine( $x, $y, $posX + $x, $posY + $y, $color, $lineWidth );
		
	}
		
	
	public function drawEllipse( $x, $y, $width = null, $height = null, $color = null, $background = null,  $lineWidth = 1 ) {
		
		if( !$width && !$height ) {
			
			$width = imagesx( $this->imagen ) - 1;
			$height = imagesy( $this->imagen ) - 1;
		
		} else if( !$width ) $width = $height;
		
		else if( !$height ) $height = $width;
		
		
		imagesetthickness( $this->imagen, $lineWidth );
						
		If ( $background != null )  imagefilledellipse($this->imagen,$x,$y,$width,$height,$this->_getColorResource( $background  ) );
					
		If ( $color != null && $lineWidth > 0 ) imageellipse( $this->imagen, $x, $y, $width, $height, $this->_getColorResource( $color ));
	}
	
	
	
	public function drawPoint( $x, $y, $diam = 1, $color = null ) {
		
		
		$this->drawEllipse( $x, $y, $diam * 2, $diam * 2, null, $color != null ? $color : self::$defaultLineColor  );
	}
	
	
	public function drawArc( $x, $y, $width = 0, $height = 0, $start = 0, $end = 0, $color = null, $background = null,  $lineWidth = 1 ) {
		
		If( $width <= 0 ) $width = imagesx( $this->imagen ) - 1;
		If( $height <= 0 ) $height = imagesy( $this->imagen ) - 1;
		
		
		imagesetthickness( $this->imagen, $lineWidth );
						
		If ( $background != null ) 
			
			imagefilledarc($this->imagen,$x,$y,$width,$height,$start, $end, $this->_getColorResource( $background  ) );
		
			
		If ( $color != null && $lineWidth > 0 ) 
		
			imagearc($this->imagen,$x,$y,$width,$height,$start, $end, $this->_getColorResource( $color ));
	}
	
	
	
	public function drawPolygon( $points, $color = null, $background = null, $lineWidth = 1 ) {
		
		imagesetthickness( $this->imagen, $lineWidth );
						
		
		If ( $background != null ) 
		
			imagefilledpolygon($this->imagen,$points, floor(count($points) / 2), $this->_getColorResource( $background  )  );
		
			
		If ( $color != null && $lineWidth > 0 ) 
		
			imagepolygon( $this->imagen, $points, floor(count($points) / 2), $this->_getColorResource( $color  ) );
		
	}
	
	
	//---------------------------------------------------------------------------
	
		
	public function drawText( $text, $x = 0, $y = 0, FontStyle $style = null ) {
		
		if($style == null) $style = new FontStyle();
				
		$fontFile = self::_getFontFile( $style );
		
		$textX = $x;
		$textY = $y;
		list($textWidth, $textHeight) = self::getTextSize( $text, $style );

		$rectangleX = $x;
		$rectangleY = $y;
		$rectangleWidth = $style->getWidth() ? $style->getWidth() : $textWidth + $style->getPaddingLeft() + $style->getPaddingRight();
		$rectangleHeight = $style->getHeight() ? $style->getHeight() : $textHeight  + $style->getPaddingTop() + $style->getPaddingBottom();
		
		if( $style->getBackgroundColor() != null || ( $style->getLineWidth() && $style->getLineColor() != null ) ) 
		
			$this->drawRectangle( $rectangleX, $rectangleY, $rectangleWidth, $rectangleHeight, $style->getLineColor(), $style->getBackgroundColor(), $style->getLineWidth() );
						
			
		$textX += $style->getPaddingLeft();	
		$textY += $style->getPaddingTop();
		
		$availableWidth = $rectangleWidth - ( $style->getPaddingLeft() + $style->getPaddingRight() );
		$availableHeight = $rectangleHeight - ( $style->getPaddingBottom() + $style->getPaddingTop() );
				
		if( $style->getWidth() && $style->getAlign() != FONTSTYLE_ALIGN_LEFT ) {
		
			if( $style->getAlign() == FONTSTYLE_ALIGN_CENTER ) $textX += ( $availableWidth / 2 ) - ( $textWidth / 2 );
			if( $style->getAlign() == FONTSTYLE_ALIGN_RIGHT ) $textX += $availableWidth - $textWidth;
		}
		
		if( $style->getHeight() && $style->getVerticalAlign() != FONTSTYLE_VALIGN_TOP ) {
		
			if( $style->getVerticalAlign() == FONTSTYLE_VALIGN_CENTER ) $textY += ( $availableHeight/ 2 ) - ( $textHeight / 2 );
			if( $style->getVerticalAlign() == FONTSTYLE_VALIGN_BOTTOM ) $textY += $availableHeight - $textHeight;
		}

		
		imagettftext( $this->imagen,$style->getSize(), 0 ,$textX, $textY + $textHeight,$this->_getColorResource( $style->getColor() ), $fontFile, $text );
	}
	
}


//------------------------------------------------------ ?>