<?php
define( 'BASE' , dirname( __FILE__ ) . '/../..');
include_once(  BASE . '/_global.php' );

if($_GET['id']) $id= $_GET['id'];

//echo $_SERVER['file_uploads'];
function subirImagenTabla($id){
		GLOBAL $oMysql;
		
	    echo "<script>function cerrarUpload(file){
        	  			
						parent.Windows.close(parent.Windows.focusedWindow.getId());
						parent.document.getElementById('imgFoto').src = '../includes/images/Noticias/' + file;
						parent.document.getElementById('sImagen').value = file;
					}</script>";
		$nombre_archivo = $_FILES['archivo']['name']; 
		$tipo_archivo = $_FILES['archivo']['type']; 
		$tamano_archivo = $_FILES['archivo']['size']; 
		//compruebo si las características del archivo son las que deseo 
		if (!((strpos($tipo_archivo, "gif") || strpos($tipo_archivo, "jpeg")|| strpos($tipo_archivo, "jpg")) && ($tamano_archivo < 1000000))) { 
		   	echo "La extensión o el tamaño de los archivos no es correcta."; 
		}else{ 
		    $destino =  "../includes/images/Contactos/".$nombre_archivo;
		    //$destino =  "./images/".$nombre_archivo;		    
		   	if (copy($_FILES['archivo']['tmp_name'], $destino)){ 
		      	$sCadena="
	        	         <center> 
	        	         
	        	         <span class='espacio'></span>
	        	         <br>
	        	         <div style='border:solid 1px #94217A;' >
	        	         <p style='font-family:Tahoma;font-style:italic;font-weight:bold;font-size:10pt; color:#94217A;'>
	        	             La imagen : \"{$nombre_archivo}\" se adjunto  correctamente 	            
	        	          </p>
	        	          </div>
	        	          <input type='button' id='cmd_cerrar' value='Cerrar' onclick='cerrarUpload(\"{$nombre_archivo}\")'/>
	        	          </center>
	        	          
	        	          ";
	            echo $sCadena;
		   	}else{ 
		   		 //echo $_FILES['archivo']['error']."<br>";
		      	 echo "Ocurrio algun error al subir el Archivo. No pudo guardarse."; 
		   	} 
		} 
	} 

if (isset($_POST['ok'])){
	$formu=$_POST;
	subirImagenTabla($id);	
	
}
else{	
?>

<!--<div id="a_tabbar" class="dhtmlxTabBar" imgpath="../includes/grillas/dhtmlxTabbar/sources/imgs/" style="width:330px; height:150px;"  skinColors="#FCFBFC,#F4F3EE" >
<div id="a1" style="250px" name="Subir" >-->

<body style="background-color:#FFFFFF;">
<div>

		<form action="upImagen.php"   enctype="multipart/form-data" name="f1" id="FormuSubir" method="POST">
		<fieldset>
		<legend>Buscar Imagen:</legend>
		<input type="hidden" name="idT" id="idT" value="<?php echo $id;?>" />
		<table class="formulario" style="font-family:Tahoma;font-size:10pt;">
				<tr><th>Archivo:<th><td><input type="file" name="archivo" ></td></tr>
				
		</table>	
	
		
		<input type="hidden" value="1" name="ok">
		<button type="button" onclick="enviar(this.form.id)" style="margin-top:5px;">Enviar</button>
		</fieldset>

		</form>
		<script language="javascript">
		function enviar(id)
		{
			var formu=document.forms[id];
			
			
			var mensaje='';
		
		    if(formu.archivo.value=='') mensaje +='Debe Indicar un Archivo Gracias.\n';
			if (mensaje=='') formu.submit();
		    else alert(mensaje);
		}
		
		</script>
</div>

<?php 

}//FIN DEL ELSE SI ES QUE NO MANDO NINGUN ARCHIVO

?>
</body>