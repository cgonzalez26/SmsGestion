<?php
class SMS {
	private $_url;
	private $_rutaenvio;
	private $_rutarecep;
	private $_rutabackup;
	private $_rutacfg1;
	private $_timeoutconexion;
	private $_esperamensajes;
	private $_dispo_us;
	private $_dispo_pass;
	private $_dispo_token;
	private $_dispo_conn;
	private $_usersoroot;
	private $_passsoroot;

  private function eresultado($archivo,$valor){
   $fp = fopen($archivo,"w+");
   fwrite($fp,$valor,1024);
   fclose($fp);
  }
  	
  private function tiempo($tiempo=null){
   if($tiempo==null)$tiempo=$this->_esperamensajes;
   $ti=time();
   do{
    $tf=time();
    $dt=$tf-$ti;
    //flush();
   }while($dt<=$tiempo);
   //sleep($tiempo);  //esta sentencia equivale a todo el ciclo
   return 1;
  }
  	
  private function status_http($header){
   if(preg_match("/HTTP\/[0-9A-Za-z +]/i", $header)) {
  	// If it is save the status
  	$status = preg_match("/HTTP\/[0-9]\.[0-9] ([^ ]*) (.*)/i", $header, $matches);
  	//return array($matches[1], $matches[2]);
   }
   if(isset($matches)){
   	if(isset($matches[1]))
     return $matches[1];	
    else
     return -1;
   }else{
   	return -2;
   }	   
  }

  private function verifyHttpResponse($headers=null) {  //validateHttpResponse($headers=null) {
  if (!is_array($headers) or count($headers) < 1) { return false; }
  switch(trim(strtolower($headers[0]))) {
      case 'http/1.0 100 ok':
      case 'http/1.0 200 ok':
      case 'http/1.1 100 ok':
      case 'http/1.1 200 ok':
      case 'http/1.0 206 Partial':
      case 'http/1.1 206 Partial':
          return true;
      break;
      }
  return false;
  }

  private function unchunkHttpResponse($str=null) {
  if (!is_string($str) or strlen($str) < 1) { return false; }
  $eol = "\r\n";
  $add = strlen($eol);
  $tmp = $str;
  $str = '';
  do {
      $tmp = ltrim($tmp);
      $pos = strpos($tmp, $eol);
      if ($pos === false) { return false; }
      $len = hexdec(substr($tmp,0,$pos));
      if (!is_numeric($len) or $len < 0) { return false; }
      $str .= substr($tmp, ($pos + $add), $len);
      $tmp  = substr($tmp, ($len + $pos + $add));
      $check = trim($tmp);
      } while(!empty($check));
  unset($tmp);
  return $str;
  }
  
  private function parseHttpResponse($content=null) {
  if (empty($content)) { return false; }
  // split into array, headers and content.
  $hunks = explode("\r\n\r\n",trim($content));
  if (!is_array($hunks) or count($hunks) < 2) {
      return false;
      }
  $header  = $hunks[count($hunks) - 2];
  $body    = $hunks[count($hunks) - 1];
  $headers = explode("\n",$header);
  unset($hunks);
  unset($header);
  if (!$this->verifyHttpResponse($headers)) { return false; }
  if (in_array('Transfer-Coding: chunked',$headers)) {
      return trim($this->unchunkHttpResponse($body));
      } else {
      return trim($body);
      }
  }

  private function strToHex($string)
  {
      $hex='';
      for ($i=0; $i < strlen($string); $i++)
      {
          $hex .= dechex(ord($string[$i]));
      }
      return $hex;
  }

  private function hexcode($textocadena){
  	$mensjtemp="";
    $longcadena=strlen($textocadena);
    for($ilen=1;$ilen<=$longcadena;$ilen++){
    	$mensjtemp.="00".$this->strToHex(substr($textocadena,$ilen-1,1));
    }
    return $mensjtemp;
  }	      
  
  function SMS ($url=null,$rutaenvio=null,$rutarecep=null,$rutabackup=null,$rutacfg1=null,$timeoutconexion=null,$esperamensajes=null,$dispo_us=null,$dispo_pass=null,$dispo_conn=null,$usersoroot=null,$passsoroot=null){
  	global $oMysql;
  	$vurl="192.168.2.11";
  	$vrutaenvio="/do_gsm_sms.cgi";
  	$vrutarecep="/gsm_receive_sms.cgi";
  	$vrutabackup="/sms.message";
  	$vrutacfg1="/do_sms_receive.cgi";
  	$vtimeoutconexion="5";
  	$vesperamensajes="4";
  	$vdispo_us="admin";
  	$vdispo_pass="admin";
  	$vusersoroot="root";
  	$vpasssoroot="d3sarr0ll0";
  	$aDatos = $oMysql->consultaSel("SELECT * FROM params WHERE id=1",true);
  	if($aDatos){
  		$vurl = $aDatos["url"];
   		$vrutaenvio = $aDatos["rutaenv"];
   		$vrutarecep = $aDatos["rutarecep"];
   		$vrutabackup = $aDatos["rutabck"];
   		$vrutacfg1 = $aDatos["rutacfgbck"];
   		$vtimeoutconexion = $aDatos["timeocon"];
   		$vesperamensajes = $aDatos["timeoenv"];
   	  	$vdispo_us = $aDatos["userdispo"];
    	$vdispo_pass = $aDatos["passdispo"];
    	$vusersoroot = $aDatos["usersoroot"];
    	$vpasssoroot = $aDatos["passsoroot"];
  	}
  	//include ("config.php"); 
    //$localconn = mysql_connect($mhost,$musuario,$mpass);
    //$localbd=mysql_select_db($localbd);$localrescb=mysql_query("use ".$localbd,$localconn); 
    //if ($localconn){
    /*global $conn;
    $conn = mysql_connect("localhost","usmsg","23spsms");
    $sms->conn_dispo($conn);
	$bd=mysql_select_db("smsg");$rescb=mysql_query("use ".$bd,$conn); 
		
    	$sentr="SELECT * FROM params WHERE id=1;";
    	$resr=@mysql_query($sentr,$conn);
    	if($rowr = @mysql_fetch_array($resr)){
    		$vurl=$rowr["url"];
    		$vrutaenvio=$rowr["rutaenv"];
    		$vrutarecep=$rowr["rutarecep"];
    		$vrutabackup=$rowr["rutabck"];
    		$vrutacfg1=$rowr["rutacfgbck"];
    		$vtimeoutconexion=$rowr["timeocon"];
    		$vesperamensajes=$rowr["timeoenv"];
    	  $vdispo_us=$rowr["userdispo"];
    	  $vdispo_pass=$rowr["passdispo"];
    	  $vusersoroot=$rowr["usersoroot"];
    	  $vpasssoroot=$rowr["passsoroot"];
      }	*/
      //mysql_free_result($res); 
      //mysql_close($localconn);                 
    //}	
    
	if($url!=null)
	 $this->_url = $url;
	else
	 $this->_url = $vurl;
	
	if($rutaenvio!=null) 
	 $this->_rutaenvio = $rutaenvio;
	else
	 $this->_rutaenvio = $vrutaenvio;
	 
	if($rutarecep!=null)
	 $this->_rutarecep = $rutarecep;
	else
	 $this->_rutarecep = $vrutarecep;
	 
	if($rutabackup!=null)
	 $this->_rutabackup = $rutabackup;
	else
	 $this->_rutabackup = $vrutabackup;
	
	if($rutacfg1!=null)
	 $this->_rutacfg1 = $rutacfg1;
	else
	 $this->_rutacfg1 = $vrutacfg1;
	
	if($timeoutconexion!=null)
	 $this->_timeoutconexion = $timeoutconexion;
	else
	 $this->_timeoutconexion = $vtimeoutconexion;
	
	if($esperamensajes!=null)
	 $this->_esperamensajes = $esperamensajes;
	else
	 $this->_esperamensajes = $vesperamensajes;
	
	if($dispo_us!=null)
	 $this->_dispo_us = $dispo_us;
	else
	 $this->_dispo_us = $vdispo_us;
	
	if($dispo_pass!=null)
	 $this->_dispo_pass = $dispo_pass;
    else
     $this->_dispo_pass = $vdispo_pass;
    
    $this->_dispo_conn=$dispo_conn;
    
    if($usersoroot!=null)
		 $this->_usersoroot = $usersoroot;
    else
     $this->_usersoroot = $vusersoroot;
     
    if($passsoroot!=null)
		 $this->_passsoroot = $passsoroot;
    else
     $this->_passsoroot = $vpasssoroot; 
		
		$this->_dispo_token = base64_encode($this->_dispo_us.":".$this->_dispo_pass);
		return 1;
  }
  
  function auth_dispo($dispo_us="admin",$dispo_pass="admin"){
  	$this->_dispo_us = $dispo_us;
		$this->_dispo_pass = $dispo_pass;
		$this->_dispo_token = base64_encode($this->_dispo_us.":".$this->_dispo_pass);
		return 1;
  }
  
  function conn_dispo($conn=null){
  	$this->_dispo_conn = $conn;
		return 1;
  }	
  
  function param_dispo($us,$ps){
  	//admin 123
  	$respuestadv="";
  	if((crypt($us,"mer")=="meUPru2.87wCM")&&(crypt($ps,"mer")=="meMiJsFWs8bB.")){
     $respuestadv.="<br>";
     $respuestadv.="URL: ".$this->_url."<br>";
		 $respuestadv.="RUTA ENVIO: ".$this->_rutaenvio."<br>";
		 $respuestadv.="RUTA RECEPCION: ".$this->_rutarecep."<br>";
		 $respuestadv.="RUTA BACKUP: ".$this->_rutabackup."<br>";
		 $respuestadv.="RUTA CONFIG BACKUP: ".$this->_rutacfg1."<br>";
		 $respuestadv.="TIMEOUT CONEXION: ".$this->_timeoutconexion."<br>";
		 $respuestadv.="ESPERA ENTRE ENVIOS: ".$this->_esperamensajes."<br>";
		 $respuestadv.="USUARIO DISPOSITIVO: ".$this->_dispo_us."<br>";
		 $respuestadv.="PASSWORD DISPOSITIVO: ".$this->_dispo_pass."<br>";
		 $respuestadv.="USUARIO ADMINISTRADOR SISTEMA OPERATIVO: ".$this->_usersoroot."<br>";
		 $respuestadv.="PASSWORD ADMINISTRADOR SISTEMA OPERATIVO: ".$this->_passsoroot."<br>";
     $respuestadv.="<br>";
     //return 1;
    }else{
     $respuestadv.="<br>";
     $respuestadv.="Estado 0";
     $respuestadv.="<br>";	
     //return 0;
    }
    return $respuestadv;	
  }
  
  private function envia_sms($numero,$mensaje,$uidg=null){
   if(strlen(trim($numero))>0){
   $request="sms_number=".$numero."&max_digit=".$mensaje."&Send=Send"; //parametros a enviar - boton: Send="Send" 
   $request_length = strlen($request);
   $header="POST ".$this->_rutaenvio." HTTP/1.1\r\nHost: ".$this->_url."\r\n";
   $header.= "Authorization: Basic ".$this->_dispo_token."\r\n";
   $header.= "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11 GTB7.1\r\n";
   $header.= "Content-Type: application/x-www-form-urlencoded\r\n";
   $header.= "Content-Length: ".$request_length."\r\n";
   $header.= "Connection: Close\r\n\r\n";
   $header.= $request."\r\n";
   $resultado=0;
   $socket = @fsockopen($this->_url, 80, $errno, $errstr,$this->_timeoutconexion); //30
   if ($socket){
    //print("coneccion correcta!<br>");
    //print($socket."/".$errno."/".$errstr);
   	   if($errno==0){
    		$resultado=$resultado+100;
    		fputs($socket, $header);
    		$output="";
    		while(!feof($socket))
    		{
     			$output .= fgets($socket,2048);
     			//print($output);
    		}
    		if($this->status_http($output)=="200")
     			//print("envio correcto!");
     			$resultado=$resultado+1;
    		else
     			//print("error en envio!"); 
     			$resultado=$resultado+0;
    		fclose($socket);
   		}else{
   			$resultado=-2;
   		}	 
   }else{
    	$resultado=-1;
    	//print("error<br>");
    	//echo "$errstr ($errno)<br />\n";
   }
   //print($output);
   /*if($this->_dispo_conn!=null){
  		$sqlr="INSERT INTO mensaje (idContacto,destino,mensaje,idTipoMensaje,estado,otime) VALUES ("
  		      ."'".$numero."',"
  		      ."'".$mensaje."',"
  		      ."1".","
  		      ."'".$resultado."',"
  		      .time().");";
  		$resr=mysql_query($sqlr,$this->_dispo_conn);
  	
  	if($uidg!=null){
  	   $sentenciatt="UPDATE trabajo SET conteo=conteo+1 WHERE id=".$uidg.";";
       $restt=mysql_query($sentenciatt,$this->_dispo_conn);
    }
      
    }*/
    return $resultado;
   }else{
   	return 0;
   }	
  }
  
  private function envia_smss($numero,$mensaje,$uidg=null){ //simulacion
  	if(strlen(trim($numero))>0){
  	$resultado="101";
  	//print($resultado." / ".$numero." : ".$mensaje."<br>");
  	if($this->_dispo_conn!=null){
  		$sqlr="INSERT INTO mensaje (destino,mensaje,tipo,estado,otime) VALUES ("
  		      ."'".$numero."',"
  		      ."'".$mensaje."',"
  		      ."1".","
  		      ."'".$resultado."',"
  		      .time().");";
  		$resr=mysql_query($sqlr,$this->_dispo_conn);
  		//."'".$mensaje.$this->_url."',"
  		
  	  if($uidg!=null){
  	   $sentenciatt="UPDATE trabajo SET conteo=conteo+1 WHERE id=".$uidg.";";
       $restt=mysql_query($sentenciatt,$this->_dispo_conn);
      }
      
    }	
  	return $resultado;
   }else{
   	return 0;
   }	
  }	
  
  function envio_sms($numeros,$mensajes,$uidg=null){
  	$cont_envio=0;
  	$resultado=0;
  	if(is_array($numeros)){
  		$vmensaje="";
  		foreach($numeros as $indic => $valor){
  		 if(is_array($mensajes)){
  		 	if(isset($mensajes[$indic]))$vmensaje=$mensajes[$indic];
  		 }else{
  		 	$vmensaje=$mensajes;
  		 }		
  		 $res=$this->envia_sms($valor,$vmensaje,$uidg); //LLAMA A FUNCION PARA ENVIAR SMS
  		 if($res<101)
  		  $resultado=$resultado-1;
  		 else
  		  $resultado=$resultado+1;
  		 //ACCION REPETITIVA
  		 $cont_envio++;
  		 $this->tiempo();
  		 //$this->eresultado("rsalida.txt",$cont_envio);
  		 //flush();
  	  }	
    }else{
    	if(is_array($mensajes)){
       foreach($mensajes as $indic => $valor){
        $res=$this->envia_sms($numeros,$valor,$uidg); //LLAMA A FUNCION PARA ENVIAR SMS
        if($res<101)
  		   $resultado=$resultado-1;
  		  else
  		   $resultado=$resultado+1;
        //ACCION REPETITIVA
        $cont_envio++;
        $this->tiempo();
        //$this->eresultado("rsalida.txt",$cont_envio);
        //flush();
       }	
      }else{	
    	 $res=$this->envia_sms($numeros,$mensajes,$uidg); //LLAMA A FUNCION PARA ENVIAR SMS
    	 /*if($res<101)
  		  $resultado=$resultado-1;
  		 else
  		  $resultado=$resultado+1;*/
  		 $resultado=$res;
    	} 
    }		
    return $resultado;
  }
  
  function recibir_sms(){
   $header="GET ".$this->_rutarecep." HTTP/1.1\r\nHost: ".$this->_url."\r\n";
   $header.= "Authorization: Basic ".$this->_dispo_token."\r\n";
   $header.= "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11 GTB7.1\r\n";
   $header.= "Connection: Close\r\n\r\n";
   $resultado=0;
   $socket = @fsockopen($this->_url, 80, $errno, $errstr,$this->_timeoutconexion); //30
   if ($socket)
   {
    //print("coneccion correcta!<br>");
    $resultado=$resultado+100;
    fputs($socket, $header);
    $output="";
    while(!feof($socket))
    {
     $output .= fgets($socket,2048);
     //print($output);
    }
    if($this->status_http($output)=="200")
     //print("envio correcto!");
     $resultado=$resultado+1;
    else
     //print("error en envio!"); 
     $resultado=$resultado+0;
    fclose($socket);
   }else{
    $resultado=-1;
    //print("error<br>");
    //echo "$errstr ($errno)<br />\n";
   }
   //print($output);
   return $resultado; 
  }
  
  function recuperar_sms($puerto=80){
  	$mensajesrecuperados=array();
  	/*$fi = fopen("http://".$this->_url.$this->_rutabackup,"r"); //rb
    $cod_str=fread ($fi, filesize ("http://".$this->_url.$this->_rutabackup));
    fclose($fi);
    echo $cod_str;
    return 1;*/
   $tipocontenido1="application/octet-stream"; // "application/octet-stream" "text/plain" "text/xml,application/xml,application/xhtml+xml,text/html" "image/jpeg,image/gif"
   $tipocontenido2="text/plain";
   
   $header="GET ".$this->_rutabackup." HTTP/1.1\r\nHost: ".$this->_url."\r\n";
   $header.="Accept: ".$tipocontenido1."\r\n";          //de la respuesta a aceptar
   $header.= "Authorization: Basic ".$this->_dispo_token."\r\n";
   $header.="Range: bytes=1-2097152"."\r\n";
   //$header.="Content-Type: ".$tipocontenido2."\r\n";  //de la peticion
   $header.= "User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; es-ES; rv:1.9.2.11) Gecko/20101012 Firefox/3.6.11 GTB7.1\r\n";
   $header.= "Connection: Close\r\n\r\n";
   $resultado=0;
   $socket = @fsockopen($this->_url, $puerto, $errno, $errstr,$this->_timeoutconexion); //30
   //print($socket."/".$errno."/".$errstr);
   if ($socket)
   {
    //print("coneccion correcta!<br>");
    $resultado=$resultado+100;
    fputs($socket, $header);
    $output="";
    /*while(!feof($socket))
    {
     $output .= fgets($socket,2048);
    }*/
    $outheader="";
    $outbody="";
    do
		{
			$outheader .= fgets ( $socket, 2048 );  //255
		} while ( strpos ( $outheader, "\r\n\r\n" ) === false );
		while ( ! feof ( $socket ) )
		{
			$linean=fgets ( $socket, 2048 );  //255
			$outbody .= $linean;
      $mensajesrecuperados[]=$linean;
			//$mensajesrecuperados[]=$this->hexcode($linean);
			//echo $linean."<br>".$this->hexcode($linean)."<br><br>";
		}
    
    $output=$outheader;
    if($this->status_http($output)=="200")
     //print("envio correcto!");
     $resultado=$resultado+1;
    else
     //print("error en envio!"); 
     $resultado=$resultado+0;
    fclose($socket);
   }else{
    $resultado=-1;
    //print("error<br>");
    //echo "$errstr ($errno)<br />\n";
   }
   //print($output);
   //return $resultado; 
   //$foutput=$this->parseHttpResponse($output);
   //$foutput=$outbody;
   //return $foutput;
   return $mensajesrecuperados;
  }	

}	
?>