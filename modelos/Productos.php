<?php
//Incluimos conexion a la base de trader_cdlrisefall3methods
require "../config/Conexion.php";

Class Productos
{
  //Implementando nuestro constructor
  public function __construct()
  {


  }
  //Implementamos metodo para insertar registro
    public function insertar($nombre,$codigo,$stock,$puntos)
    {
      $sql="INSERT INTO productos (nombre,codigo,stock,puntos,condicion)
      VALUES ('$nombre','$codigo','$stock','$puntos','1')";
      return ejecutarConsulta($sql);
   }
    //Implementamos un metodo para editar registro
    public function editar($id_producto, $nombre, $codigo, $stock, $puntos)
    {
      $sql = "UPDATE productos SET nombre='$nombre', codigo='$codigo', stock='$stock', puntos='$puntos' WHERE id_producto='$id_producto'";
      return ejecutarConsulta($sql);
    }


    //Implementamos un metodo para eliminar registro
    public function desactivar($id_producto)
    {
      $sql="UPDATE productos SET condicion='0'
      where id_producto='$id_producto'";
      return ejecutarConsulta($sql);
    }
    //Implementamos un metodo para eliminar registro
    public function activar($id_producto)
    {
      $sql="UPDATE productos SET condicion='1'
      where id_producto='$id_producto'";
      return ejecutarConsulta($sql);
    }

    //Implementamos un metodo para mostrar los datos de un registro a modificar
    public function mostrar($id_producto)
    {
      $sql="SELECT * FROM productos where id_producto='$id_producto'";
      return ejecutarConsultaSimpleFila($sql);

    }

    //Implementar metodo para listar los registros
    public function listar()
    {
      $sql="SELECT *FROM productos ORDER BY id_producto DESC";
      return ejecutarConsulta($sql);

    }
    public function select()
    {
      $sql="SELECT * FROM productos where condicion=1";
      return ejecutarConsulta($sql);

    }
    

    public function eliminar($id_producto)
    {
    $sql="DELETE FROM productos where id_producto='$id_producto'";
    return ejecutarConsulta($sql);
    }


    //Implementar metodo para listar los registros y mostrar en el select
   
  public function listarProductos()
	{
		$sql="SELECT id_producto, nombre,
     codigo, stock,puntos as puntos_prod,condicion
    FROM productos Where condicion='1'";
		return ejecutarConsulta($sql);
	
  }
 
}

 ?>
