<?php
//Incluimos conexion a la base de trader_cdlrisefall3methods
require "../config/Conexion.php";

Class Ingreso
{
  //Implementando nuestro constructor
  public function __construct()
  {


  }
  //Implementamos metodo para insertar registro
    public function insertar($idproveedor,$idusuario,$tipo_comprobante,$serie_comprobante,$num_comprobante,$fecha_hora,$impuesto,$total_compra,$idarticulo,$laboratorio,$idcategoria,$lote,$cantidad,$precio_compra,$precio_venta,$fecha_vencimiento)
    {
      $sql="INSERT INTO ingreso (idproveedor,idusuario,tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total_compra,estado)
      VALUES ('$idproveedor','$idusuario','$tipo_comprobante','$serie_comprobante','$num_comprobante','$fecha_hora','$impuesto','$total_compra','Aceptado')";
      //return ejecutarConsulta($sql);
      $idingresonew=ejecutarConsulta_retornarID($sql);
      $num_elementos=0;
      $sw=true;

      while($num_elementos < count($idarticulo) )
      {
        $sql_detalle="INSERT INTO detalle_ingreso(idingreso,idarticulo,laboratorio,codigo,lote,cantidad,precio_compra,precio_venta,fecha_vencimiento) 
        VALUES('$idingresonew','$idarticulo[$num_elementos]','$laboratorio[$num_elementos]','$idcategoria','$lote[$num_elementos]','$cantidad[$num_elementos]','$precio_compra[$num_elementos]','$precio_venta[$num_elementos]','$fecha_vencimiento[$num_elementos]')";
        
        
        ejecutarConsulta($sql_detalle) or $sw=false;
        
        $sql_articulo="UPDATE articulo SET idcategoria=$idcategoria WHERE idarticulo='$idarticulo[$num_elementos]'";
        ejecutarUpdateArticulo($sql_articulo) or $sw=false;
        
        
        $num_elementos=$num_elementos+1;
        
      }
      return $sw;
   }


    //Implementamos un metodo para eliminar registro
    public function anular($idingreso)
    {
      $sql="UPDATE ingreso SET estado='Anulado'
      where idingreso='$idingreso'";
      return ejecutarConsulta($sql);
    }


    //Implementamos un metodo para mostrar los datos de un registro a modificar
    public function mostrar($idingreso)
    {
      $sql="SELECT i.idingreso,DATE(i.fecha_hora) as fecha, i.idproveedor,p.nombre as proveedor, u.idusuario, u.nombre as usuario, i.tipo_comprobante,i.serie_comprobante,i.num_comprobante,i.total_compra,i.impuesto,i.estado FROM ingreso i inner join persona p on i.idproveedor=p.idpersona inner join usuario u on i.idusuario=u.idusuario where i.idingreso='$idingreso'";
      return ejecutarConsultaSimpleFila($sql);

    }

    public function listarDetalle($idingreso)
    {
      $sql="SELECT di.idingreso, di.idarticulo,a.nombre,di.cantidad,di.precio_compra,di.precio_venta,di.incentivo FROM detalle_ingreso di inner join articulo a on di.idarticulo=a.idarticulo where di.idingreso='$idingreso'";
      return ejecutarConsulta($sql);

    }


    //Implementar metodo para listar los registros
    public function listar()
    {
      $sql="SELECT i.idingreso,DATE(i.fecha_hora) as fecha, i.idproveedor,p.nombre as proveedor, u.idusuario, u.nombre as usuario, i.tipo_comprobante,i.serie_comprobante,i.num_comprobante,i.total_compra,i.impuesto,i.estado 
      FROM ingreso i 
      left join persona p on i.idproveedor=p.idpersona 
      left join usuario u on i.idusuario=u.idusuario order by i.idingreso desc";
      return ejecutarConsulta($sql);

    }


  }


 ?>
