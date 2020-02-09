<!DOCTYPE html>
<?php
    ini_set('display_errors', true);
    require_once 'data.php';
?>
<html>
	<head>
		<meta charset="utf-8">
		<title>Sitio de Ventas</title>
		<link rel="stylesheet" type="text/css" href="css/ventas.css">
	</head>
	<body>
		<div id="encabezado">
			<img src="img/logo.png">
                        <h1>
                            <?php
                                $title = "Tu tienda de peliculas (PHP)";
                                echo($title);  
                            ?>
                        </h1>
			<h2>El mejor sitio de compras en la web</h2>
		</div>
		<div id="menu">
			<ul>
				<li><a href="#">Pagina Principal</a></li>
				<li><a href="#">Inicio de Sesion</a></li>
				<li><a href="#">Contacto</a></li>
			<ul>
		</div>
		<div id="buscador">
			<label>Ingresa tu busqueda</label>
			<input type="text"/>
			<input type="button" value="Buscar" />
		</div>
		<div id="categorias">
			<h2>Categorias</h2>
			<ul>
                            <?php
                                foreach(getCategories() as $categorie){
                                    echo('<li><a href="#">'.$categorie.'</a></li>');
                                }
                            ?>
				<li><a href="#">Procesadores</a></li>
				<li><a href="#">Memorias</a></li>
				<li><a href="#">Discos</a></li>
				<li><a href="#">Gabinetes</a></li>
				<li><a href="#">Monitores</a></li>
				<li><a href="#">Perifericos</a></li>
			<ul>
		</div>
		<div id="productos">
			<div class="producto">
				<img src="img/logo.png" />
				<span class="nombre-producto">Pentium III</span>
				<p>Procesador muy lento y viejo</p>
				<span class="precio-producto">U$S 10</span>
			</div>
			<div class="producto">
				<img src="img/logo.png" />
				<span class="nombre-producto">Pentium IV</span>
				<p>Procesador lento y viejo</p>
				<span class="precio-producto">U$S 15</span>
			</div>
			<div class="producto">
				<img src="img/logo.png" />
				<span class="nombre-producto">i3</span>
				<p>Procesador lento y moderno</p>
				<span class="precio-producto">U$S 20</span>
			</div>
			<div class="producto">
				<img src="img/logo.png" />
				<span class="nombre-producto">i5</span>
				<p>Procesador moderno y rapido</p>
				<span class="precio-producto">U$S 20</span>
			</div>
			<div class="producto">
				<img src="img/logo.png" />
				<span class="nombre-producto">i7</span>
				<p>Procesador moderno y muy bueno</p>
				<span class="precio-producto">U$S 20</span>
			</div>
		</div>
	</body>
</html>