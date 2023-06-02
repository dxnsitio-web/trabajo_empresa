<?php
//Incluimos conexion a la base de trader_cdlrisefall3methods
require "../config/Conexion.php";

Class Sucursales
{
  //Implementando nuestro constructor
  public function __construct()
  {


  }
  //Implementamos metodo para insertar registro
    public function insertar($nombre,$direccion,$telefono,$horarios)
    {
      $sql="INSERT INTO sucursales (nombre,direccion,telefono,horarios,condicion)
      VALUES ('$nombre','$direccion','$telefono','$horarios','1')";
      return ejecutarConsulta($sql);
   }
    //Implementamos un metodo para editar registro
    public function editar($id_sucursal, $nombre, $direccion, $telefono, $horarios)
    {
      $sql = "UPDATE sucursales SET nombre='$nombre', direccion='$direccion', telefono='$telefono', horarios='$horarios' WHERE id_sucursal='$id_sucursal'";
      return ejecutarConsulta($sql);
    }


    //Implementamos un metodo para eliminar registro
    public function desactivar($id_sucursal)
    {
      $sql="UPDATE sucursales SET condicion='0'
      where id_sucursal='$id_sucursal'";
      return ejecutarConsulta($sql);
    }
    //Implementamos un metodo para eliminar registro
    public function activar($id_sucursal)
    {
      $sql="UPDATE sucursales SET condicion='1'
      where id_sucursal='$id_sucursal'";
      return ejecutarConsulta($sql);
    }

    //Implementamos un metodo para mostrar los datos de un registro a modificar
    public function mostrar($id_sucursal)
    {
      $sql="SELECT * FROM sucursales where id_sucursal='$id_sucursal'";
      return ejecutarConsultaSimpleFila($sql);

    }

    //Implementar metodo para listar los registros
    public function listar()
    {
      $sql="SELECT *FROM sucursales ORDER BY id_sucursal DESC";
      return ejecutarConsulta($sql);

    }
    public function select()
    {
      $sql="SELECT * FROM sucursales where condicion=1";
      return ejecutarConsulta($sql);

    }
    

    public function eliminar($id_sucursal)
    {
    $sql="DELETE FROM sucursales where id_sucursal='$id_sucursal'";
    return ejecutarConsulta($sql);
    }


    //Implementar metodo para listar los registros y mostrar en el select
   
  public function listarsucursales()
	{
		$sql="SELECT id_sucursal, nombre,
     direccion, telefono,horarios as horarios_prod,condicion
    FROM sucursales Where condicion='1'";
		return ejecutarConsulta($sql);
	
  }
 
}

 ?>
