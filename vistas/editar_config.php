<?php


require_once("../config/conexion.php");
	// require 'header.php';


	$sqll="SELECT * FROM perfil where idperfil='1' ";
	$quer=mysqli_query($conexion,$sqll);
	$row=mysqli_fetch_array($quer);




	// if($_SERVER['REQUEST_METHOD']=='POST'){
		$razon_social=mysqli_real_escape_string($conexion,trim($_POST['razon_social']));
		$nombre_comercial=mysqli_real_escape_string($conexion,trim($_POST['nombre_comercial']));
		$ruc=mysqli_real_escape_string($conexion,trim($_POST['ruc']));
		$direccion=mysqli_real_escape_string($conexion,trim($_POST['direccion']));
		$distrito=mysqli_real_escape_string($conexion,trim($_POST['distrito']));
		$provincia =mysqli_real_escape_string($conexion,trim($_POST['provincia']));
		$departamento =mysqli_real_escape_string($conexion,trim($_POST['departamento']));
		$codigo_postal =mysqli_real_escape_string($conexion,trim($_POST['codigo_postal']));
		$telefono =mysqli_real_escape_string($conexion,trim($_POST['telefono']));
		$email =mysqli_real_escape_string($conexion,trim($_POST['email']));
		$pais =mysqli_real_escape_string($conexion,trim($_POST['pais']));


		$consulta="UPDATE perfil SET razon_social='$razon_social', nombre_comercial='$nombre_comercial', ruc='$ruc', direccion='$direccion', distrito='$distrito', provincia='$provincia', departamento='$departamento', codigo_postal='$codigo_postal', telefono='$telefono',email='$email',pais='$pais' where idperfil='1'";
		$q=mysqli_query($conexion,$consulta);
		if($q){
			$mens[] = "Datos actualizados satisfactoriamente";
		}else{
			$error[]= "Lo siento algo ha salido mal intenta nuevamente.".mysqli_error($conexion);
		}

		if(isset($mens)){
		?>
		<div class="alert alert-success">
			<button class="close" data-dismiss="alert">&times;</button>
			<strong>¡Bien hecho!</strong>
		
			<?php
				foreach ($mens as $men) {
					echo $men;
				}
			?>
		</div>
		<?php

		}
?>