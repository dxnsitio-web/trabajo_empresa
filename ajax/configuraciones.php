<?php 
	require_once "../modelos/Configuraciones.php";
	$configuracion = new Configuraciones();

	$idperfil=isset($_POST['idperfil'])? limpiarCadena($_POST['idperfil']): "";
	$razon_social=isset($_POST['razon_social'])? limpiarCadena($_POST['razon_social']): "";
	$nombre_comercial=isset($_POST['nombre_comercial'])? limpiarCadena($_POST['nombre_comercial']): "";
	$ruc=isset($_POST['ruc'])? limpiarCadena($_POST['ruc']): "";
	$direccion=isset($_POST['direccion'])? limpiarCadena($_POST['direccion']): "";
	$distrito=isset($_POST['distrito'])? limpiarCadena($_POST['distrito']): "";
	$provincia=isset($_POST['provincia'])? limpiarCadena($_POST['provincia']): "";
	$departamento=isset($_POST['departamento'])? limpiarCadena($_POST['departamento']): "";
	$codigo_postal=isset($_POST['codigo_postal'])? limpiarCadena($_POST['codigo_postal']): "";
	$telefono=isset($_POST['telefono'])? limpiarCadena($_POST['telefono']): "";
	$email=isset($_POST['email'])? limpiarCadena($_POST['email']): "";
	$pais=isset($_POST['pais'])? limpiarCadena($_POST['pais']): "";
	$sitio_web=isset($_POST['sitio_web'])? limpiarCadena($_POST['sitio_web']): "";
	$direccion2=isset($_POST['direccion2'])? limpiarCadena($_POST['direccion2']): "";
	$fecha_autorizacion=isset($_POST['fecha_autorizacion'])? limpiarCadena($_POST['fecha_autorizacion']): "";
	$publicidad=isset($_POST['publicidad'])? limpiarCadena($_POST['publicidad']): "";
	// $imagen=isset($_POST['imagen'])? limpiarCadena($_POST['imagen']): "";
	$imagenactual=isset($_POST['imagenactual'])? limpiarCadena($_POST['imagenactual']): "";


	switch($_GET['op']){

		case 'editar':

			if (!file_exists($_FILES['imagen']['tmp_name']) || !is_uploaded_file($_FILES['imagen']['tmp_name'])){
				$imagen=$imagenactual;
			}else{
				$ext = explode(".", $_FILES["imagen"]["name"]);
				if(!empty($imagenactual)){
					unlink("../files/perfil/".$imagenactual);
				}
				$imagen = round(microtime(true)).'.'.$ext[1];
				move_uploaded_file($_FILES["imagen"]["tmp_name"],"../files/perfil/".$imagen);
			}
			$rspta = $configuracion->editar($idperfil, $razon_social, $nombre_comercial, $ruc, $direccion, $distrito, $provincia, $departamento, $codigo_postal, $telefono, $email, $pais,$sitio_web,$direccion2,$fecha_autorizacion,$publicidad);
			echo $rspta ? "Actualizado con éxito!" : "No se pudo actualizar";
			
		
		break;
		
	}
	

 ?>