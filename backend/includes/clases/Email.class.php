<?php //----------------------------------------------------------------------

@ include_once( dirname(__FILE__) . '/./../functions/files.php' );


final class Email {
		
	private static $defaultTextCharset = 'ISO-8859-1';
	private static $defaultTextEnableHTML = true;
	
	private static $defaultFromName = 'Julio Ojeda';
	private static $defaultFromEmail = 'julito0208@gmail.com';
	private static $defaultReplyEmail = 'julito0208@gmail.com';
	
	private static $defaultSMTPEnabled = true;
	private static $defaultSMTPServer = 'smtp.gmail.com';
	private static $defaultSMTPSSL = true;
	private static $defaultSMTPPort = 465;
	private static $defaultSMTPProtocol = 'tls';
	
	
	private static $defaultSMTPLoginEnabled = true;
	private static $defaultSMTPUser = 'julito0208@gmail.com';
	private static $defaultSMTPPass = 'DarkAngel';		
	
		
	private static function _validateEmail( $email ) {
		
		$filtro = '^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
		return ereg( $filtro, $email );
	}
		
	//-----------------------------------
	
	
	private $subject;
	
	private $textCharset;
	private $textEnableHTML;
	private $textBody;
	
	private $attachments = array();
	
	private $fromName;
	private $fromEmail;
	
	private $replyEmail;
	
	private $smtpEnabled;
	private $smtpServer;
	private $smtpProtocol;
	private $smtpPort;
	private $smtpSSL;
	
	private $smtpLoginEnabled;
	private $smtpUser;
	private $smtpPass;

	
	
	private $to = array();
	private $cc = array();

	
	
	public function __construct() {
		
		
		$this->setTextCharset( self::$defaultTextCharset );
		$this->setTextEnableHTML( self::$defaultTextEnableHTML );
		
		$this->setFrom( self::$defaultFromEmail, self::$defaultFromName );
		$this->setReplyEmail( self::$defaultReplyEmail );
		
		$this->setSMTPEnabled( self::$defaultSMTPEnabled );
		$this->setSMTPLoginEnabled( self::$defaultSMTPLoginEnabled );
		
		$this->setSMTP( self::$defaultSMTPServer, self::$defaultSMTPSSL, self::$defaultSMTPPort, self::$defaultSMTPProtocol );
		$this->setSMTPLogin(self::$defaultSMTPUser, self::$defaultSMTPPass);
		
		
		$this->setSubject('');
		$this->setText('');
	}
	
	
	//---------------------------------------------------------------
	
	public function setSubject( $subject ) { $this->subject = $subject; }
	
	public function getSubject() { return $this->subject; }
	
	//-------------------------------------------
	
	public function setTextCharset( $charset ) { $this->textCharset = $charset; }
	
	public function getTextCharset() { return $this->textCharset; }
	
	
	public function setTextEnableHTML( $bool ) { $this->textEnableHTML = (boolean) $bool; }
	
	public function getTextEnableHTML() { return $this->textEnableHTML; }
	
	
	
	public function setText( $text ) { $this->textBody = (string) $text; }
	
	public function addText( $text ) { $this->textBody.= (string) $text; }
	
	public function getText() { return $this->textBody; }
	
		
	//--------------------------------------------
	
	public function setFrom( $email, $name = '' ) { 
		
		$this->fromName = $name;
		$this->fromEmail = $email;
	}
	
	
	public function getFromName() { return $this->fromName; }
	
	public function getFromEmail() { return $this->fromEmail; }
	
	
	public function setReplyEmail( $email ) { $this->replyEmail = $email; }
	
	public function getReplyEmail() { return $this->replyEmail; }
	
	//--------------------------------------------
	
	
	public function setSMTPEnabled( $bool ) { $this->smtpEnabled = (boolean) $bool; }
	
	public function getSMTPEnabled() { return $this->smtpEnabled; }
	
	
	public function setSMTPLoginEnabled( $bool ) { $this->smtpLoginEnabled = (boolean) $bool; }
	
	public function getSMTPLoginEnabled() { return $this->smtpLoginEnabled; }
	
	
	public function setSMTP( $server, $ssl = false, $port = null, $protocol = null ) {
		
		if( !$port ) $port = ( (boolean) $ssl ) ? 465 : 25;
		
		$this->smtpServer = $server;
		$this->smtpSSL = (boolean) $ssl;
		$this->smtpPort = (integer) $port;
		$this->smtpProtocol = ($protocol == null) ? self::$defaultSMTPProtocol : $protocol;
	}
	
	
	public function setSMTPLogin( $user, $pass ) {
		
		$this->smtpUser = $user;
		$this->smtpPass = $pass;
	}
	
	
	public function getSMTPServer() { return $this->smtpServer; }
	
	public function getSMTPSSL() { return $this->smtpSSL; }
	
	public function getSMTPPort() { return $this->smtpPort; }
	
	public function getSMTPProtocol() { return $this->smtpProtocol; }
	
	public function getSMTPUser() { return $this->smtpUser; }
	
	public function getSMTPPass() { return $this->smtpPass; }
	
	//--------------------------------------------------------
	
	
	public function addAttachment( $file_content, $filename = null, $type = null ) {
		
		if($type === true) $type = 'application/octet-stream';
		
		
		if( is_file( $file_content ) ) {
			
			@ $string = file_get_contents( $file_content );
			
			if( $filename == null ) @ $filename = basename( $file_content );	
			if( $type == null ) @ $type = file_get_mimetype( $file_content );
			
			
		
		} else {
			
			$string = (string) $file_content;
			
			if( $type == null ) {
				
				$tempFile = file_create_temp( $string );
				@ $type = file_get_mimetype( $tempFile );
				@ unlink( $tempFile );
			}

			
			if($filename == null) $filename = 'Attachment ' . count( $this->attachments ); 
		}
		
		
		$content = "Content-Type: $type;\r\n";
		$content.= "Content-Transfer-Encoding: base64\r\n";
		$content.= "Content-Disposition: attachment;\r\n ";
		$content.= "filename=\"$filename\"\r\n";
		
		$content.= "\r\n\r\n" . chunk_split( base64_encode( $string ) );
		
		$this->attachments[ $filename ] = $content;
		
		
	}
	
	
	
	public function getAttachmentCount() { return count($this->attachments); }
	
	public function getAttachments() { return array_keys( $this->attachments ); }
	
	public function removeAttachment( $file ) { unset( $this->attachments[ $file ] ); }
	
	public function removeAttachments() { $this->attachments = array(); }
	
		
	//---------------------------------------------------------------------
	
	
	private function _addRecipient( $email, $name, $arrayName ) {
		
		if( is_array($email) ) {
		
			foreach($email as $key => $value)
			
				if( is_numeric( $key ) ) $this->_addRecipient( $value, null, $arrayName );
				
				else 
				
					if( self::_validateEmail($key) ) $this->{$arrayName}[ $key ] = $value;
					else if( self::_validateEmail($value) ) $this->{$arrayName}[ $value ] = $key;
				
					
			
			
		} else if(self::_validateEmail($email)) 
			
			$this->{$arrayName}[ $email ] =  ( $name == null ) ? ( array_shift( explode('@', $email) ) ) : $name ;
	}
	

	
	public function addTo( $email, $name = null ) { $this->_addRecipient( $email, $name, 'to' ); }
			
	public function addCc( $email, $name = null ) { $this->_addRecipient( $email, $name, 'cc' ); }
	
	
	
	public function getTo() { return array_keys($this->to); }
	
	public function getCc() { return array_keys($this->cc); }
	
	
	public function removeTo( $email ) { unset($this->to[$email]); }
	
	public function removeCc( $email ) { unset($this->cc[$email]); }
	

	
	public function removeToAll() { $this->to = array(); }
	
	public function removeCcAll() { $this->cc = array(); }
	
	
	
	
	
	//---------------------------------------------------------------------
	
	
	
	
	public function send() {
		
		
		if(!$this->to && !$this->cc) return false;
		
		//----------------------------------------------
		
		
		function getEmailList( $emails ) {
			
			$array = array();
			foreach($emails as $email => $name) $array[] = "\"$name\" <$email>";
			
			return implode( ',', $array );
		}
		
		
		$boundary = '-' . md5( uniqid() );
		
		
		$emailHeaders = '';
		
		if($this->to) $emailHeaders.= 'To: ' . getEmailList($this->to) . "\r\n";
		if($this->subject) $emailHeaders.= "Subject: {$this->subject}\r\n";
		$emailHeaders.= "From: \"{$this->fromName}\" <{$this->fromEmail}>\r\n";
		
		$emailHeaders.= "X-Mailer: PHP/" . phpversion() . " \r\n";
		$emailHeaders.= "X-Originating-Email: [{$this->fromEmail}]\r\n";
		$emailHeaders.= "X-Sender: {$this->fromEmail}\r\n";
		$emailHeaders.= "Reply-to: {$this->replyEmail}\r\n";
		
		$emailHeaders.= "MIME-version: 1.0\r\n";
		$emailHeaders.= "Content-type: \"multipart/mixed\"; ";
		$emailHeaders.= "boundary=\"{$boundary}\"\r\n;";
		
		$emailHeaders.= "\r\n\r\n";				
		
		//----------------------------------------------
		
		
		$emailBody = "--{$boundary}\r\nContent-Type: text/".($this->textEnableHTML ? 'html' : 'plain')."; charset=\"{$this->textCharset}\"\r\n\r\n{$this->textBody}\r\n\r\n\r\n";
		foreach($this->attachments as $body) $emailBody.= "--{$boundary}\r\n$body\r\n\r\n\r\n";
		
		$emailBody.= "\r\n.\r\n";
		
		//---------------------------------------------------------------------------------------------
		
		if( $this->smtpEnabled ) {
			
			
			function putSMTP( $string, $conexion_id ) {
		
				@ fputs( $conexion_id, $string );
				@ $ans = fgets( $conexion_id );
				
				return (integer) @ substr( $ans, 0, 3);	
			}
			
			$host = $this->smtpProtocol . '://' . $this->smtpServer;
			
			@ $conexion_id = fsockopen( $host, (integer) $this->smtpPort, $error, $error);
			@ fgets($conexion_id);
						
			If( !$conexion_id ) {
			
				throw new Exception("No se pudo conectar al host smtp: $error", 1);
				return false;
			}
			
			If( putSMTP( "HELO $host \r\n", $conexion_id ) != 250 ) {
			
				throw new Exception('Error al iniciar Comunicación con el Servidor', 1);
				return false;
			}
			
			
			if( $this->smtpLoginEnabled ) {
			
				putSMTP( "AUTH LOGIN\r\n", $conexion_id );
				putSMTP( base64_encode( $this->smtpUser ) . "\r\n", $conexion_id );
				$code = putSMTP( base64_encode( $this->smtpPass ) . "\r\n", $conexion_id );
				
				If( $code == 535 || $code != 235 ) {
				
					throw new Exception('Falló la autenticación con el servidor', 1);
					return false;
				}
			}
			
			If( putSMTP( "MAIL FROM: <{$this->fromEmail}>\r\n", $conexion_id ) == 535 ) {
			
				throw new Exception('El Servidor Requiere Autenticación', 1);
				return false;
			}

			
			$emails = array_keys($this->to) + array_keys($this->cc);
			
			foreach($emails as $email) putSMTP( "RCPT TO: <$email>\r\n", $conexion_id );
			
			
			If( putSMTP("DATA\r\n", $conexion_id) != 354 ) {
			
				throw new Exception('No se pudo comenzar el envío', 1);
				return false;
				
			}
	
			if( putSMTP( "{$emailHeaders}{$emailBody}", $conexion_id ) != 250 ) {
			
				throw new Exception('No se pudo enviar el E-Mail', 1);
				return false;
			}
			
			fputs( $conexion_id, "QUIT\r\n" );
			fclose( $conexion_id );
		
			return true;
			
		} else {
			
			$result =  mail( getEmailList( $this->to + $this->cc ), $this->subjet, $emailBody, $emailHeaders );

			if( !$result ) throw new Exception('Hubo un problema al enviar el E-Mail', 1);
			
			return $result;
			
		}
			
		
	}	
}

//---------------------------------------------------------------------- ?>