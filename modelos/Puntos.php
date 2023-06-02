<?php 

date_default_timezone_set('America/Lima'); 
require_once('../config/Conexion.php');

class Puntos {
	public function __construct(){}
  
	public function insertar($idcliente, $idusuario, $fecha, $total_puntos_descontados,$id_producto,$cantidad,$puntos_prod) {
	  // Obtener total de puntos restantes del cliente
	  $sql_persona="SELECT puntos FROM persona WHERE idpersona=$idcliente";
	  $data_persona= ejecutarConsultaSimpleFila($sql_persona);
	  $total_puntos_restantes = intval($data_persona["puntos"]);
  
	  //-- GENERAR PUNTOS POR USUARIOS--
	  $puntos = 0;
	  if($total_puntos_restantes > 0){
		$puntos = $total_puntos_restantes;
	  }
  
	  // Restar puntos descontados en la venta
	  $puntos_restantes = $puntos - $total_puntos_descontados;
	  if ($puntos_restantes < 0) {
		// Si el cliente no tiene suficientes puntos para la venta, lanzar una excepción
		throw new Exception("No hay suficientes puntos disponibles para realizar la venta.");
	  }
  
	  // Actualizar total de puntos restantes del cliente en la tabla persona
	  $sql_update_persona="UPDATE persona SET puntos=$puntos_restantes WHERE idpersona=$idcliente";
	  ejecutarConsulta($sql_update_persona);
  
	  // Generar correlativo
	  $saber = "SELECT serie,correlativo FROM puntos";
      $saberExiste = ejecutarConsultaSimpleFila($saber);
      if($saberExiste["serie"] == null and $saberExiste["correlativo"] == null){
        $serie='PT01';
        $correlativo='00000001';
      }else{
        $sqlmaxserie="SELECT max(serie) as maxSerie FROM puntos";
		$maxserie = ejecutarConsultaSimpleFila($sqlmaxserie);
		$serie= $maxserie["maxSerie"];
        $ultimoCorrelativo="SELECT max(correlativo) as ultimocorrelativo,serie,correlativo FROM puntos WHERE serie='$serie'";
        $ultimo = ejecutarConsultaSimpleFila($ultimoCorrelativo);
        if($ultimo["ultimocorrelativo"] =='99999999'){
          $ser = substr($serie,1)+1;
          $seri= str_pad((string)$ser,3,"0",STR_PAD_LEFT);
		  $serie = "PT".$seri;
          $correlativo = '00000001';
        }else{
          $corre = $ultimo["ultimocorrelativo"] + 1;
          $correlativo = str_pad($corre,8,"0",STR_PAD_LEFT);
        }
      }
  
	  // INSERTAR CABECERA DE PUNTOS
	  $fecha = date('Y-m-d');
		// INSERTAR CABECERA DE PUNTOS
		$sql = "INSERT INTO puntos (idcliente, idusuario, serie,correlativo, fecha, total_puntos_descontados,estado) VALUES ('$idcliente', '$idusuario','$serie','$correlativo', '$fecha', '$total_puntos_descontados','Aceptado')";
		$idpuntosnew = ejecutarConsulta_retornarID($sql);

		$num_elementos=count($id_producto);
		$sw=true;
		for ($i=0; $i < $num_elementos; $i++) { 
			$puntos= $puntos_prod[$i];
			$sql_detalle = "INSERT INTO detalle_puntos(id_puntos, id_producto, cantidad, puntos) VALUES ('$idpuntosnew', '".$id_producto[$i]."', '".$cantidad[$i]."', '$puntos')";
			ejecutarConsulta($sql_detalle) or $sw = false;
		}
		return $sw;
	}



	public function anular($id_producto)
	{
		$sql="UPDATE productos SET productos='0' WHERE id_producto='$id_producto'";
		return ejecutarConsulta($sql);
	}


	// INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`, `afectacion`) VALUES (NULL, '12', '1', '3', '3', '0', NULL)

	public function listar()
{
    $sql = "SELECT 
    p.id_puntos,
    DATE(p.fecha) AS fecha,
    per.nombre AS cliente, 
    u.nombre AS usuario, 
	p.serie,
    p.correlativo, 
    p.total_puntos_descontados,
    per.puntos AS total_puntos,
    p.estado
FROM 
    puntos p
    INNER JOIN persona per ON per.idpersona = p.idcliente 
    INNER JOIN usuario u ON u.idusuario = p.idusuario
ORDER BY 
    p.id_puntos DESC";
    return ejecutarConsulta($sql);
} 

public function TotalPuntosDescontados($idcliente)
{
    $sql = "SELECT IFNULL(sum(total_puntos_descontados), 0) as total_puntos_descontados FROM puntos WHERE idcliente = $idcliente";
    return ejecutarConsultaSimpleFila($sql);
}

public function Puntoscabecera($id_puntos){
	$sql="SELECT 
	pu.id_puntos,
	pu.idcliente,
	p.nombre as cliente,
	p.puntos,
	p.direccion,
	p.tipo_documento,
	p.num_documento,
	p.email,
	p.telefono,
	pu.idusuario,
	u.nombre as usuario,
	pu.serie,
	pu.correlativo,
	date(pu.fecha) as fecha,
	pu.fecha as fechaCompleta,
	pu.total_puntos_descontados FROM puntos pu INNER JOIN persona p ON pu.idcliente=p.idpersona INNER JOIN usuario u ON pu.idusuario=u.idusuario  WHERE pu.id_puntos='$id_puntos'";
	return ejecutarConsulta($sql);
}
public function Puntosdetalle($id_puntos){
	$sql="SELECT 
    p.nombre AS producto,
    p.codigo,
    p.stock,
    p.puntos,
    d.cantidad,
    pt.total_puntos_descontados 
FROM 
    detalle_puntos d 
    INNER JOIN productos p ON d.id_producto = p.id_producto 
    INNER JOIN puntos pt ON d.id_puntos = pt.id_puntos 
WHERE 
    d.id_puntos = '$id_puntos' 

";
	return ejecutarConsulta($sql);
}




}
 ?>
