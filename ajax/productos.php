<?php
require_once "../modelos/Productos.php";

$productos=new Productos();

$id_producto=isset($_POST["id_producto"])? limpiarCadena($_POST["id_producto"]):"";
$nombre=isset($_POST["nombre"])? limpiarCadena($_POST["nombre"]):"";
$codigo=isset($_POST["codigo"])? limpiarCadena($_POST["codigo"]):"";
$stock=isset($_POST["stock"])? limpiarCadena($_POST["stock"]):"";
$puntos=isset($_POST["puntos"])? limpiarCadena($_POST["puntos"]):"";

switch ($_GET["op"])
{
  case 'guardaryeditar':
    if(empty($id_producto))
    {
      $rspta=$productos->insertar($nombre,$codigo,$stock,$puntos);
      echo $rspta ? "Producto registrado" : "Producto no se pudo registrar";
    }else 
    {
      $rspta=$productos->editar($id_producto,$nombre,$codigo,$stock,$puntos);
      echo $rspta ? "Producto actualizado" : "Producto no se pudo actualizar";
    }
  break;

    case 'desactivar':
      $rspta=$productos->desactivar($id_producto);
      echo $rspta ? "Producto desactivada" : "Producto no se pudo desactivar";
    break;

    case 'activar':
        $rspta=$productos->activar($id_producto);
      echo $rspta ? "Producto activada" : "Producto no se pudo activar";
    break;

    case 'mostrar':
        $rspta=$productos->mostrar($id_producto);
      //codificar el resultado usando json
      echo json_encode($rspta);
    break;
    case 'eliminar':
      $rspta=$productos->eliminar($id_producto);
      echo $rspta ? "Prodcuto eliminado" : "Producto no se pudo eliminar";
      break;
    break;
    case 'listar':
      $rspta=$productos->listar();
      //Vamos a declarar un array
      $data=Array();
      while($reg=$rspta->fetch_object())
      {
        
        $data[]=array(
          "0"=>($reg->condicion)?'<button class="btn btn-warning" onclick="mostrar('.$reg->id_producto.')"><i class="fa fa-pencil"></i></button> '.
					 '<button class="btn btn-danger" onclick="desactivar('.$reg->id_producto.')"><i class="fa fa-close"></i></button> '.
					 '<button class="btn btn-primary" onclick="eliminar('.$reg->id_producto.')"><i class="fa fa-trash"></i></button>':
 					'<button class="btn btn-warning" onclick="mostrar('.$reg->id_producto.')"><i class="fa fa-pencil"></i></button>'.
 					' <button class="btn btn-info" onclick="activar('.$reg->id_producto.')"><i class="fa fa-check"></i></button>',
          "1"=>$reg->nombre,
          "2"=>$reg->codigo,
          "3"=>$reg->stock,
          "4"=>$reg->puntos,
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
