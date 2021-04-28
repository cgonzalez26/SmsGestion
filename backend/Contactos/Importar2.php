<?php
	define( 'BASE' , dirname( __FILE__ ) . '/../..');
	include_once(  BASE . '/_global.php' );
	
//$data[$c]=str_replace(";","', ", $data[$c])
$row = 1;
$handle = fopen("datos.csv", "r");
while (($data = fgetcsv($handle, 1000, ",")) !== FALSE) {
	$num = count($data);
	$row++;
	$cadena = "insert into xls(Campo1,Campo2,Campo3,Campo4) values(";
	for ($c=0; $c < $num; $c++) {
		if ($c==($num-1))
			$cadena = $cadena."'".$data[$c] . "'";
		else
			$cadena = $cadena."'".$data[$c] . "',";
	}

	$cadena = $cadena.");";
	echo $cadena."<br>";

	$enlace=Conectarse();
	$result=mysql_query($cadena, $enlace);
	mysql_close($enlace);
}

fclose($handle);

?>
<h2>Se insertaron <?php echo $row ?> Registros en la tabla </h2>