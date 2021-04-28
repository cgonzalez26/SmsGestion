

<!--<div style="position:absolute;z-index:100; padding-top:130px">-->
<style>
/**************** menu coding *****************/
#menu {
width: 100%;
background: #eee;
float: left;
}

#menu ul {
list-style: none;
margin: 0;
padding: 0;
/*width: 12em;*/
width: 112px;
float: left;
}

#menu a, #menu h2 {
font: bold 11px/16px arial, helvetica, sans-serif;
display: block;
border-width: 1px;
border-style: solid;
border-color: #ccc #888 #555 #bbb;
margin: 0;
padding: 2px 3px;
}

#menu h2 {
color: #fff;
background: #000;
text-transform: uppercase;
}

#menu a {
color: #000;
background: #efefef;
text-decoration: none;
}

#menu a:hover {
color: #a00;
background: #fff;
}

#menu li {position: relative;}

#menu ul ul {
position: absolute;
z-index: 500;
width:150px;
text-align:left;
}

#menu ul ul ul {
position: absolute;
top: 0;
left: 100%;
}

div#menu ul ul,
div#menu ul li:hover ul ul,
div#menu ul ul li:hover ul ul
{display: none;}

div#menu ul li:hover ul,
div#menu ul ul li:hover ul,
div#menu ul ul ul li:hover ul
{display: block;} 
</style>
<div style="z-index:100;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">
<tr>
	<td valign="top"  height="164" >
	<table cellpadding="0" cellspacing="0" border="0" width="100%">
	<tr>
		<td valign="top" align="left">
		<img src="backend/includes/images/sitio/HeaderIzq.jpg" width="343" height="141" alt="" usemap="#Map" />
		<map name="Map" id="Map">
		<area shape="rect" coords="62,92,115,115" href="http://twitter.com/home?status=http://www.norteautomotor.com" target="_blank" alt="Compartir a Twitter" /><area name="fb_share" shape="rect" coords="15,92,58,115" target="_blank" alt="Compartir a Facebook" /></map>		
		</td>
		<td valign="top" style="padding-top:20px" id="tdTableLogin">{tablaLogin}</td>
	</tr>
	<tr>
		<td colspan="2">
		<table cellpadding="0" cellspacing="0" border="0" height="100%">		
		<tr>
			<td style="width:500px;" valign="bottom">
			
				<table cellpadding="0" cellspacing="0" border="0">		
				<tr>
					<td><img src="backend/includes/images/Botones/InicioNormal.png" style="width:112px;height:19px;cursor:pointer" onmouseover="ImageChange(this,'backend/includes/images/Botones/InicioSust.png')" onmouseout="ImageChange(this,'backend/includes/images/Botones/InicioNormal.png')" onclick="go('home')" /></td>
					<td style="padding-left:5px"><img src="backend/includes/images/Botones/ComprarNormal.png" style="width:112px;height:19px;cursor:pointer" onmouseover="ImageChange(this,'backend/includes/images/Botones/ComprarSust.png')" onmouseout="ImageChange(this,'backend/includes/images/Botones/ComprarNormal.png')" onclick="go('comprar')" /></td>
					<td style="padding-left:5px">
					<div id="menu">
					<ul>
  						<li><img src="backend/includes/images/Botones/VenderNormal.png" style="width:112px;height:19px;cursor:pointer" onmouseover="ImageChange(this,'backend/includes/images/Botones/VenderSust.png')" onmouseout="ImageChange(this,'backend/includes/images/Botones/VenderNormal.png')" />
						 <ul>
					         <li><a href="cargarvehiculo.php">Cargar Vehiculo</a></li>
					         <li><a href="solicitaragente.php">Solicitar Agente de Venta</a></li>
					         <li><a href="actualizardatos.php">Tramites Personales</a></li>
					      </ul>
					   	</li>
				    </ul>
				    </div>
					</td>
					<td style="padding-left:5px"><img src="backend/includes/images/Botones/PedidosNormal.png" style="width:112px;height:19px;cursor:pointer" onmouseover="ImageChange(this,'backend/includes/images/Botones/PedidosSust.png')" onmouseout="ImageChange(this,'backend/includes/images/Botones/PedidosNormal.png')" onclick="go('pedidos')" /></td>
					<td style="padding-left:5px"><img src="backend/includes/images/Botones/ContactoNormal.png" style="width:112px;height:19px;cursor:pointer" onmouseover="ImageChange(this,'backend/includes/images/Botones/ContactoSust.png')" onmouseout="ImageChange(this,'backend/includes/images/Botones/ContactoNormal.png')" onclick="go('contacto')" /></td>
				
				</tr>
				</table>
			</td>
			<td>&nbsp;</td>
		</tr>
		</table>
	</td>
	</tr>
	</table>
	</td>
	<td valign="top">
	<img src="backend/includes/images/sitio/HeaderDer.png" width="321" height="164" alt="" />
	</td>
</tr>
</table>	
</div>


