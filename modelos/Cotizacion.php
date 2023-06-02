<?php 
date_default_timezone_set('America/Lima');   
require_once('../config/Conexion.php');

Class Cotizacion
{

	public function __construct(){

	}

	public function insertar($idcliente,$idusuario,$codigotipo_comprobante,$serie,$correlativo,$fecha_hora,$impuesto,$op_gravadas,$op_inafectas,$op_exoneradas,$op_gratuitas,$isc,$total_venta,$idmoneda,$idarticulo,$cantidad,$precio_venta,$descuento,$serieCotizacion){

		$saber = "SELECT serie,correlativo FROM venta WHERE codigotipo_comprobante='10'";
	      $saberExiste = ejecutarConsultaSimpleFila($saber);
	      if($saberExiste["serie"] == null and $saberExiste["correlativo"] == null){
	        
	          $serie='P001';
	        $correlativo='00000001';
	      }else{
	        $sqlmaxserie="SELECT max(serie) as maxSerie FROM venta WHERE codigotipo_comprobante='10' ";
	        $maxserie = ejecutarConsultaSimpleFila($sqlmaxserie);
	        $serie= $maxserie["maxSerie"];
	        $ultimoCorrelativo="SELECT max(correlativo) as ultimocorrelativo,serie,correlativo FROM venta WHERE codigotipo_comprobante='10'  and serie='$serie'";
	        $ultimo = ejecutarConsultaSimpleFila($ultimoCorrelativo);
	        if($ultimo["ultimocorrelativo"] =='99999999'){
	          $ser = substr($serie,1)+1;
	          $seri= str_pad((string)$ser,3,"0",STR_PAD_LEFT);
	            $serie = "P".$seri;
	          $correlativo = '00000001';
	        }else{
	          $corre = $ultimo["ultimocorrelativo"] + 1;
	          $correlativo = str_pad($corre,8,"0",STR_PAD_LEFT);
	        }
	      }

		$sql="INSERT INTO venta (idcliente,idusuario,codigotipo_comprobante,serie,correlativo,fecha_hora,impuesto,op_gravadas,op_inafectas,op_exoneradas,op_gratuitas,isc,total_venta,estado,idmoneda,idmotivo_doc) VALUES ('$idcliente','$idusuario','$codigotipo_comprobante','$serie','$correlativo','$fecha_hora','$impuesto','$op_gravadas','$op_inafectas','$op_exoneradas','$op_gratuitas','$isc','$total_venta','Cotizado','$idmoneda',null)";
		// return ejecutarConsulta($sql);
		$idventanew=ejecutarConsulta_retornarID($sql);

		$num_elementos=0;
		$sw=true;

		while ($num_elementos<count($idarticulo)) {
			$sql_detalle = "INSERT INTO cotizacion(idventa, idarticulo,cantidad,precio_venta,descuento,serie) VALUES ('$idventanew', '$idarticulo[$num_elementos]','$cantidad[$num_elementos]','$precio_venta[$num_elementos]','$descuento[$num_elementos]','$serieCotizacion[$num_elementos]')";
			ejecutarConsulta($sql_detalle) or $sw = false;
			$num_elementos=$num_elementos + 1;
		}
		 return $sw;

	}



	public function selectTipoComprobante(){
		$sql="SELECT * from tipo_comprobante where codigotipo_comprobante in (1,3)";
		return ejecutarConsulta($sql);
	}

	public function selectMoneda(){
		$sql="SELECT * FROM moneda";
		return ejecutarConsulta($sql);
	}

	public function anular($idventa)
	{
		$sql="UPDATE venta SET estado='AnuladoC' WHERE idventa='$idventa'";
		return ejecutarConsulta($sql);
	}

	public function mostrar($idventa)
	{
		$sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idusuario,u.nombre as usuario,v.codigotipo_comprobante,tc.descripcion_tipo_comprobante,v.serie,v.correlativo,v.impuesto,v.op_gravadas,v.op_inafectas,v.op_exoneradas,v.op_gratuitas,v.isc,v.total_venta,v.idmoneda,m.descripcion FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario INNER JOIN tipo_comprobante tc ON v.codigotipo_comprobante=tc.codigotipo_comprobante INNER JOIN moneda m ON v.idmoneda=m.idmoneda WHERE v.idventa='$idventa'";
		return ejecutarConsultaSimpleFila($sql);
	}

	public function listarDetalle($idventa)
	{
		$sql="SELECT dv.idventa,dv.idarticulo,a.nombre,a.unidad_medida,a.afectacion,dv.cantidad,dv.precio_venta,dv.descuento,dv.serie as serieCotizacion,(dv.cantidad*dv.precio_venta-dv.descuento) as subtotal,v.op_gravadas,v.op_inafectas,v.op_exoneradas,v.op_gratuitas,v.isc,v.total_venta FROM cotizacion dv inner join articulo a on dv.idarticulo=a.idarticulo inner join venta v on v.idventa=dv.idventa where dv.idventa='$idventa'";
		return ejecutarConsulta($sql);
	}

	// INSERT INTO `detalle_venta` (`iddetalle_venta`, `idventa`, `idarticulo`, `cantidad`, `precio_venta`, `descuento`, `afectacion`) VALUES (NULL, '12', '1', '3', '3', '0', NULL)

	public function listar()
	{
		$sql="SELECT v.idventa,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idusuario,u.nombre as usuario,v.codigotipo_comprobante,tc.descripcion_tipo_comprobante,v.serie,v.correlativo,v.total_venta,v.impuesto,v.estado FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario INNER JOIN tipo_comprobante tc ON v.codigotipo_comprobante=tc.codigotipo_comprobante where v.estado='Cotizado' or v.estado='AnuladoC' ORDER by v.idventa desc";
		return ejecutarConsulta($sql);
	}

	public function ventacabecera($idventa){
		$sql="SELECT v.idventa,v.idcliente,p.nombre as cliente,p.direccion,p.tipo_documento,p.num_documento,p.email,p.telefono,v.idusuario,u.nombre as usuario,v.codigotipo_comprobante,v.serie,v.correlativo,date(v.fecha_hora) as fecha,v.impuesto,v.op_gravadas,v.op_inafectas,v.op_exoneradas,v.op_gratuitas,v.isc,v.total_venta,v.idmoneda,m.descripcion as descmoneda FROM venta v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario INNER JOIN moneda m ON m.idmoneda=v.idmoneda WHERE v.idventa='$idventa'";
		return ejecutarConsulta($sql);
	}

	public function ventadetalle($idventa){
		$sql="SELECT a.nombre as articulo,a.unidad_medida,a.descripcion_otros,a.afectacion,c.cantidad,c.precio_venta,c.descuento,c.serie as serieCotizacion,(c.cantidad*c.precio_venta-c.descuento) as subtotal FROM cotizacion c INNER JOIN articulo a ON c.idarticulo=a.idarticulo WHERE c.idventa='$idventa'";
		return ejecutarConsulta($sql);
	}

	
}
 ?>
