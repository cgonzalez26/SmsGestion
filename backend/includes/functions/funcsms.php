<?php
function pars_num($cadena){
 $parser='|From:(.*?) Date:|is';  //MessFrom:
 $embed="";
 if(preg_match($parser, $cadena, $embed1)) 
 { 
  $embed=$embed.$embed1[1];                  
 } 
 return $embed;
}	
 
function pars_fecha($cadena){
 $parser='|Date:(.*?) Message:|is';  
 $embed="";
 if(preg_match($parser, $cadena, $embed1)) 
 { 
  $embed=$embed.$embed1[1];                  
 } 
 return $embed;
}

function pars_mensaje($cadena){
 $parser='| Message:(.*?)-*-|is';  
 $embed="";
 if(preg_match($parser, $cadena, $embed1)) 
 { 
  $embed=$embed.$embed1[1];                  
 } 
 return $embed;
}     
 
function pfechaaunix($fecha){
 //10/10/25 19:39:01-12
 $fechaunix=0;
 if(strlen($fecha)>=20){
 $dia=trim(substr($fecha,6,2));
 $mes=trim(substr($fecha,3,2));
 $anyo="20".trim(substr($fecha,0,2));
 $hor=trim(substr($fecha,9,2));
 $min=trim(substr($fecha,12,2));
 $seg=trim(substr($fecha,15,2));
 $fechaunix=gmmktime($hor,$min,$seg,$mes,$dia,$anyo);	
 }
 return $fechaunix;
}

function fechapers($timestampunix){
 $fechapers="";
 if($timestampunix>0){
  $fechapers=gmdate("d/m/Y - H:i:s",$timestampunix);
 }
 return $fechapers;
}

function parsea_mensaje($mensajetxt){
	$mensajetxt.="-*-";
	$mensajetxts=array();
	$numerox=pars_num($mensajetxt);
	$fechaox=pars_fecha($mensajetxt);
	$fechaux=pfechaaunix($fechaox);
	$fechapx=fechapers($fechaux);
	$mensajex=pars_mensaje($mensajetxt);
	$idgenx="";
	if(strlen($mensajex)>=5)
	 $idgenx=md5(trim($numerox).$fechaux.substr($mensajex,0,5));
	else 
	 $idgenx=md5(trim($numerox).$fechaux."00000");
	$mensajetxts["numero"]=$numerox;
	$mensajetxts["fechao"]=$fechaox;
	$mensajetxts["fechau"]=$fechaux;
	$mensajetxts["fechap"]=$fechapx;
	$mensajetxts["mensaje"]=hexcode($mensajex);
	$mensajetxts["idgen"]=$idgenx;
	return $mensajetxts;
}

function strToHex($string)
{
    $hex='';
    for ($i=0; $i < strlen($string); $i++)
    {
        $hex .= dechex(ord($string[$i]));
    }
    if(strlen($hex)<2)$hex="0".$hex;
    return $hex;
}

function hexToStr($hex)
{
    $string='';
    for ($i=0; $i < strlen($hex)-1; $i+=2)
    {
        $string .= chr(hexdec($hex[$i].$hex[$i+1]));
    }
    return $string;
}
function hexcode($textocadena){
  	if(!((substr($textocadena,0,2)=="00")&&(substr($textocadena,4,2)=="00"))){
  	$mensjtemp="";
    $longcadena=strlen($textocadena);
    for($ilen=1;$ilen<=$longcadena;$ilen++){
    	$mensjtemp.="00".strToHex(substr($textocadena,$ilen-1,1));
    }
    return $mensjtemp;
    }else{
     return $textocadena;
    }	
}

function strhexcode($cadenatexto){
   $mensjtemp="";
   //if((substr($cadenatexto,0,2)=="00")&&(substr($cadenatexto,4,2)=="00")){
  	 $longcadena=round(strlen($cadenatexto)/4);
     for($ilen=1;$ilen<=$longcadena;$ilen++){
  	  $mensjtemp .= hexToStr(substr($cadenatexto,($ilen-1)*4+2,2));
     }
     return $mensjtemp;
   //}
}
?>