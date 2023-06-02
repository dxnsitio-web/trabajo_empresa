<?php
//Incluimos conexion a la base de trader_cdlrisefall3methods
require "../config/Conexion.php";

Class Articulo
{
  //Implementando nuestro constructor
  public function __construct()
  {


  }
  //Implementamos metodo para insertar registro
    public function insertar($idcategoria,$codigo,$nombre,$stock,$descripcion,$imagen,$unidad_medida,$descripcion_otros,$afectacion,$tipo_venta_articulo)
    {
      $sql="INSERT INTO articulo (idcategoria,codigo,nombre,stock,descripcion,imagen,unidad_medida,descripcion_otros,condicion,afectacion,stock_ingreso,stock_salida,id_tipo_venta_articulo)
      VALUES ('$idcategoria','$codigo','$nombre','$stock','$descripcion','$imagen','$unidad_medida','$descripcion_otros','1','$afectacion','$stock','0','$tipo_venta_articulo')";
      return ejecutarConsulta($sql);
   }
    //Implementamos un metodo para editar registro
    public function editar($idarticulo,$idcategoria,$codigo,$nombre,$stock,$descripcion,$imagen,$unidad_medida,$descripcion_otros,$afectacion,$fecha_vencimiento,$tipo_venta_articulo)
    {
      $sql="UPDATE articulo SET idcategoria='$idcategoria',codigo='$codigo',nombre='$nombre',stock='$stock', descripcion='$descripcion', imagen='$imagen',unidad_medida='$unidad_medida',descripcion_otros='$descripcion_otros',afectacion='$afectacion',stock_ingreso='$stock',stock_salida='0',fecha_vencimiento='$fecha_vencimiento',id_tipo_venta_articulo='$tipo_venta_articulo'
      where idarticulo='$idarticulo'";
      return ejecutarConsulta($sql);
    }
   

    //Implementamos un metodo para eliminar registro
    public function desactivar($idarticulo)
    {
      $sql="UPDATE articulo SET condicion='0'
      where idarticulo='$idarticulo'";
      return ejecutarConsulta($sql);
    }

    //Implementamos un metodo para eliminar registro
    public function activar($idarticulo)
    {
      $sql="UPDATE articulo SET condicion='1'
      where idarticulo='$idarticulo'";
      return ejecutarConsulta($sql);
    }

    //Implementamos un metodo para mostrar los datos de un registro a modificar
    public function mostrar($idarticulo)
    {

      $sql="SELECT a.*, di.fecha_vencimiento
      FROM articulo AS a
      LEFT JOIN detalle_ingreso AS di ON a.idarticulo = di.idarticulo
      WHERE a.idarticulo='$idarticulo'";
      return ejecutarConsultaSimpleFila($sql);
    }

    //Implementar metodo para listar los registros
    public function listar()
    {
      $sql="SELECT a.idarticulo,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,a.descripcion,a.imagen,a.unidad_medida,a.descripcion_otros,a.condicion,DATE_FORMAT(di.fecha_vencimiento, '%d/%m/%Y') as fecha_vencimiento   
      FROM articulo a 
      LEFT JOIN (
        SELECT idarticulo, MAX(iddetalle_ingreso) AS ultimodetalle
        FROM detalle_ingreso
        GROUP BY idarticulo
      ) ultimos ON a.idarticulo = ultimos.idarticulo
      LEFT JOIN detalle_ingreso di ON ultimos.ultimodetalle = di.iddetalle_ingreso
      INNER JOIN categoria c ON a.idcategoria=c.idcategoria
      GROUP BY a.idarticulo
      ORDER BY a.idarticulo DESC";
      return ejecutarConsulta($sql);
    }
    
 
   public function listar_precios(){
    $sql="SELECT a.idarticulo, di.idarticulo, a.codigo, a.nombre, a.unidad_medida, a.descripcion_otros, a.condicion, c.nombre as categoria, a.stock_ingreso, a.stock_salida, a.stock, di.laboratorio, di.lote, DATE_FORMAT(di.fecha_vencimiento, '%d/%m/%Y') as fecha_vencimiento, di.precio_compra, di.precio_venta 
    FROM articulo a 
    INNER JOIN categoria c ON a.idcategoria = c.idcategoria 
    INNER JOIN detalle_ingreso di ON a.idarticulo = di.idarticulo 
    INNER JOIN (
        SELECT idarticulo, MAX(iddetalle_ingreso) AS ultimodetalle
        FROM detalle_ingreso
        GROUP BY idarticulo
    ) ultimos ON di.idarticulo = ultimos.idarticulo AND di.iddetalle_ingreso = ultimos.ultimodetalle
    GROUP BY a.idarticulo
    ORDER BY a.idarticulo desc";
    return ejecutarConsulta($sql);
}



    //Implementar metodo para listar los registros activos
    public function listarActivos()
    {
      $sql="SELECT a.idarticulo,a.idcategoria,c.nombre as categoria,a.codigo,a.nombre,a.stock,a.descripcion,a.imagen,a.condicion,a.afectacion,a.fecha_vencimiento  FROM articulo a inner join categoria c on a.idcategoria=c.idcategoria where a.condicion='1' order by a.idarticulo desc";
      return ejecutarConsulta($sql);

    }
    public function listarActivosVenta()
{
  $sql="SELECT 
              a.idarticulo, 
              a.idcategoria,
              c.nombre as categoria,
              a.codigo,
              a.nombre,
              a.unidad_medida,
              a.descripcion_otros,
              a.stock,
              (SELECT precio_venta FROM detalle_ingreso where idarticulo=a.idarticulo order by iddetalle_ingreso desc limit 0,1) as precio_venta,
              (SELECT precio_compra FROM detalle_ingreso where idarticulo=a.idarticulo order by iddetalle_ingreso desc limit 0,1) as precio_compra,
              a.descripcion,
              a.imagen,
              a.condicion,
              a.afectacion,
              DATE_FORMAT(a.fecha_vencimiento, '%d/%m/%Y') as fecha_vencimiento,
              t.descripcion AS controlador,
              di.idarticulo,
              di.laboratorio,
              di.lote,
              DATE_FORMAT(di.fecha_vencimiento, '%d/%m/%Y') as fecha_vencimento,
              di.incentivo
  FROM articulo a 
  INNER JOIN categoria c ON a.idcategoria = c.idcategoria
  LEFT JOIN tipo_venta_articulo t ON a.id_tipo_venta_articulo = t.id
  LEFT JOIN detalle_ingreso di ON a.idarticulo = di.idarticulo
  INNER JOIN (
    SELECT idarticulo, MAX(iddetalle_ingreso) AS ultimodetalle
    FROM detalle_ingreso
    GROUP BY idarticulo
  ) ultimos ON di.idarticulo = ultimos.idarticulo AND di.iddetalle_ingreso = ultimos.ultimodetalle
  WHERE a.condicion = '1'
  GROUP BY a.idarticulo
  ORDER BY a.idarticulo DESC"; 
  return ejecutarConsulta($sql);
}


  

    public function imprimirCodigoBarra($idarticulo){
      $sql=" SELECT idarticulo,codigo FROM articulo WHERE idarticulo='$idarticulo'";
      return ejecutarConsultaSimpleFila($sql);
    }

    public function agregarstock($idarticulo,$stockanti,$stocknew){
      $sql="UPDATE articulo SET stock=$stockanti+$stocknew, stock_ingreso=stock_ingreso+$stocknew where idarticulo='$idarticulo'";
      return ejecutarConsulta($sql);
    }
    public function mostrarStock($idarticulo){
       $sql="SELECT idarticulo,nombre,stock FROM articulo where idarticulo='$idarticulo'";
      return ejecutarConsultaSimpleFila($sql);
    }
    public function listarControlados(){
      $sql="SELECT * from tipo_venta_articulo";
      return ejecutarConsulta($sql);
    }

    public function listarMedicamentosVencer(){
      $date1 = new DateTime();
      $date1->modify('+30 day');
      $date = $date1->format('Y-m-d');
      
      $sql="SELECT a.codigo,a.nombre,a.unidad_medida,a.condicion,c.nombre
      as categoria,a.stock,di.precio_venta,di.fecha_vencimiento,di.lote,di.laboratorio
      FROM articulo a 
      INNER JOIN categoria c ON a.idcategoria=c.idcategoria 
      INNER JOIN (SELECT ddi.idarticulo,count(ddi.idarticulo) 
      as cantidadIngresos,ddi.precio_venta,ddi.laboratorio,ddi.fecha_vencimiento,ddi.lote
      FROM detalle_ingreso ddi WHERE ddi.fecha_vencimiento < '$date' AND ddi.fecha_vencimiento > CURRENT_DATE
      group by ddi.idarticulo desc) di ON di.idarticulo = a.idarticulo 
      order by di.idarticulo desc";
      return ejecutarConsulta($sql);
    }

  }
 ?>
