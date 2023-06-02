<?php 

require_once('../config/Conexion.php');

Class Proforma
{

  public function __construct(){

  }


  public function insertar($idusuario,$idcliente,$correlativo,$tipo_proforma,$igv_total,$total_venta,$fecha_hora,$descripcion,$cantidad,$precio){

    $sql="INSERT INTO proforma (idusuario,idcliente,correlativo,tipo_proforma,igv_total,total_venta,fecha_hora,estado) VALUES ('$idusuario','$idcliente','$correlativo','$tipo_proforma','$igv_total','$total_venta','$fecha_hora','AceptadoP')";
    // return ejecutarConsulta($sql);
    $idproformanew=ejecutarConsulta_retornarID($sql);

    $num_elementos=0;
    $sw=true;

    while ($num_elementos<count($cantidad)) {
      $sql_detalle = "INSERT INTO detalle_proforma(idproforma, descripcion,cantidad,precio) VALUES ('$idproformanew', '$descripcion[$num_elementos]','$cantidad[$num_elementos]','$precio[$num_elementos]')";
      ejecutarConsulta($sql_detalle) or $sw = false;
      $num_elementos=$num_elementos + 1;
    }
     return $sw;

  }


  public function anular($idproforma)
  {
    $sql="UPDATE proforma SET estado='AnuladoP' WHERE idproforma='$idproforma'";
    return ejecutarConsulta($sql);
  }

  public function mostrar($idproforma)
  {
    $sql="SELECT v.idproforma,DATE(v.fecha_hora) as fecha,v.idcliente,p.nombre as cliente,u.idusuario,u.nombre as usuario,v.tipo_proforma,v.igv_total,v.correlativo,v.total_venta,v.estado FROM proforma v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario WHERE v.idproforma='$idproforma'";
    return ejecutarConsultaSimpleFila($sql);
  }

  public function listarDetalle($idproforma)
  {
    $sql="SELECT dp.idproforma,dp.descripcion,dp.cantidad,dp.precio,(dp.cantidad*dp.precio) as subtotal,p.total_venta FROM detalle_proforma dp inner join proforma p on p.idproforma=dp.idproforma where dp.idproforma='$idproforma'";
    return ejecutarConsulta($sql);
  }


  public function listar()
  {
    $sql="SELECT p.idproforma,DATE(p.fecha_hora) as fecha,p.idcliente,pe.nombre as cliente,p.idusuario,u.nombre as usuario,p.correlativo,p.tipo_proforma,p.total_venta,p.estado FROM proforma p INNER JOIN persona pe ON p.idcliente=pe.idpersona INNER JOIN usuario u ON p.idusuario=u.idusuario where p.estado!='AnuladoP' ORDER by p.idproforma desc";
    return ejecutarConsulta($sql);
  }

  public function ventacabecera($idproforma){
    $sql="SELECT v.idproforma,v.idcliente,p.nombre as cliente,p.direccion,p.tipo_documento,p.num_documento,v.idusuario,u.nombre as usuario,v.correlativo,date(v.fecha_hora) as fecha,v.tipo_proforma,v.igv_total,v.total_venta FROM proforma v INNER JOIN persona p ON v.idcliente=p.idpersona INNER JOIN usuario u ON v.idusuario=u.idusuario WHERE v.idproforma='$idproforma'";
    return ejecutarConsulta($sql);
  }

  public function ventadetalle($idproforma){
    $sql="SELECT d.iddetalle_proforma,d.descripcion,d.cantidad,d.precio,(d.cantidad*d.precio) as subtotal FROM detalle_proforma d WHERE d.idproforma='$idproforma'";
    return ejecutarConsulta($sql);
  }


 

  
  
}
 ?>
