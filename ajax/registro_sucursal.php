<?php
require_once "../modelos/registro_sucursal.php";

$sucursales=new Sucursales();

$id_sucursal=isset($_POST["id_sucursal"])? limpiarCadena($_POST["id_sucursal"]):"";
$nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
$direccion=isset($_POST["direccion"])? limpiarCadena($_POST["direccion"]):"";
$telefono=isset($_POST["telefono"])? limpiarCadena($_POST["telefono"]):"";
$horarios=isset($_POST["horarios"])? limpiarCadena($_POST["horarios"]):"";

switch ($_GET["op"])
{
  case 'guardaryeditar':
    if(empty($id_sucursal))
    {
      $rspta=$sucursales->insertar($nombre,$direccion,$telefono,$horarios);
      echo $rspta ? "sucursal registrado" : "sucursal no se pudo registrar";
    }else 
    {
      $rspta=$sucursales->editar($id_sucursal,$nombre,$direccion,$telefono,$horarios);
      echo $rspta ? "sucursal actualizado" : "sucursal no se pudo actualizar";
    }
  break;

    case 'desactivar':
      $rspta=$sucursales->desactivar($id_sucursal);
      echo $rspta ? "sucursal desactivada" : "sucursal no se pudo desactivar";
    break;

    case 'activar':
        $rspta=$sucursales->activar($id_sucursal);
      echo $rspta ? "sucursal activada" : "sucursal no se pudo activar";
    break;

    case 'mostrar':
        $rspta=$sucursales->mostrar($id_sucursal);
      //codificar el resultado usando json
      echo json_encode($rspta);
    break;
    case 'eliminar':
      $rspta=$sucursales->eliminar($id_sucursal);
      echo $rspta ? "Sucursal eliminado" : "sucursal no se pudo eliminar";
      break;
    break;
    case 'listar':
      $rspta=$sucursales->listar();
      //Vamos a declarar un array
      $data=Array();
      while($reg=$rspta->fetch_object())
      {
        
        $data[]=array(
          "0"=>($reg->condicion)?'<button class="btn btn-warning" onclick="mostrar('.$reg->id_sucursal.')"><i class="fa fa-pencil"></i></button> '.
					 '<button class="btn btn-danger" onclick="desactivar('.$reg->id_sucursal.')"><i class="fa fa-close"></i></button> '.
					'<button class="btn btn-primary" onclick="eliminar('.$reg->id_sucursal.')"><i class="fa fa-trash"></i></button>':
                   '<button class="btn btn-warning" onclick="mostrar('.$reg->id_sucursal.')"><i class="fa fa-pencil"></i></button>'.
 					' <button class="btn btn-info" onclick="activar('.$reg->id_sucursal.')"><i class="fa fa-check"></i></button>',
          "1"=>$reg->nombre,
          "2"=>$reg->direccion,
          "3"=>$reg->telefono,
          "4"=>$reg->horarios,
          "5"=>($reg->condicion)?'<span class="label bg-green">Activada<span>':'<span class="label bg-red">Desactivada<span>'
          
        );
      }
      
      $results= array(
        "sEcho"=>1, //Informacion para el datatable
        "iTotalRecords"=>count($data),//Enviamos el total de registtros en el datatable
        "iTotalDisplayRecords"=>count($data),//enviamos el total de registros a visualizar
        "aaData"=>$data);
      echo json_encode($results);


    break;

    
  

}

 ?>
