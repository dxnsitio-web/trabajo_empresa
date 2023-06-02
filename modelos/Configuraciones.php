<?php 
require "../config/Conexion.php";
	Class Configuraciones {
		public function __construct(){

		}
		public function editar($idperfil, $razon_social, $nombre_comercial, $ruc, $direccion, $distrito, $provincia, $departamento, $codigo_postal, $telefono, $email, $pais,$sitio_web,$direccion2,$fecha_autorizacion,$publicidad) {
			$sql = "UPDATE perfil SET 
						razon_social = '$razon_social',
						nombre_comercial = '$nombre_comercial',
						ruc = '$ruc',
						direccion = '$direccion',
						distrito = '$distrito',
						provincia = '$provincia',
						departamento = '$departamento',
						codigo_postal = '$codigo_postal',
						telefono = '$telefono',
						email = '$email',
						pais = '$pais',
						sitio_web='$sitio_web',
						direccion2='$direccion2',
						fecha_autorizacion='$fecha_autorizacion',
						publicidad='$publicidad'
					WHERE idperfil = '$idperfil'";
			
			return ejecutarConsulta($sql);
		
		}

		public function mostrar(){
			$sql = "SELECT * FROM perfil WHERE idperfil='1'";
			return ejecutarConsulta($sql);
			// return $query->fetch_assoc();
		}
	}


 ?>