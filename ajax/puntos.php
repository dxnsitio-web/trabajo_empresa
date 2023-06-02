<?php
if (strlen(session_id()) < 1)
  session_start();

require_once "../modelos/Puntos.php";

$puntos=new Puntos();

$id_puntos=isset($_POST["idpuntos"])? limpiarCadena($_POST["idpuntos"]):"";
$idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$idusuario=$_SESSION["idusuario"];
$fecha=isset($_POST["fecha"])? limpiarCadena($_POST["fecha"]):"";
$total_puntos_descontados=isset($_POST["total_puntos_descontados"])? limpiarCadena($_POST["total_puntos_descontados"]):"";




switch ($_GET["op"]){
	case 'guardaryeditar':
		if (empty($id_puntos)){
			$rspta=$puntos->insertar($idcliente,$idusuario,$fecha,$total_puntos_descontados,$_POST["id_producto"],$_POST["cantidad"],$_POST["puntos_prod"]);
			echo $rspta ? "punto registrado" : "No se pudieron registrar todos los puntos";
		}
		else {
		}
	break;


	case 'mostrarDatoCliente':
		require_once "../modelos/Persona.php";
		$cliente = new Persona();
		$rspta=$cliente->mostrar($idcliente);
		echo json_encode($rspta);
		break;
	
	case 'mostrarPuntosDescontados':
		$rspta = $puntos->TotalPuntosDescontados($idcliente);
		echo json_encode($rspta);
		break;

	
	case 'listar':
		$rspta=$puntos->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
			$url_ticket = '../reportes/Reporte_PDF_Puntos-Ticket.php?id=';
			$url_pdf = '../reportes/Reporte_PDF_Puntos-A4.php?id=';
			
			$data[]=array(
				"0"=>'<a target="_blank" href="'.$url_ticket.$reg->id_puntos.'"> <button class="btn btn-success"><i class="fa fa-print"></i></button></a>'.
 					 '<a target="_blank" href="'.$url_pdf.$reg->id_puntos.'"> <button class="btn btn-success"><i class="fa fa-file-pdf-o"></i></button></a>',
				"1"=>$reg->fecha,
				"2"=>$reg->cliente,
				"3"=>$reg->usuario,
				"4"=>$reg->serie.'-'.$reg->correlativo,
				"5"=>$reg->total_puntos_descontados,
				"6"=>$reg->total_puntos,
				"7"=>($reg->estado=='Aceptado')?'<span class="label bg-green">Aceptado</span>':
					'<span class="label bg-red">Anulado</span>'
			);
		}
		
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);
 		echo json_encode($results);

	break;

	case 'selectCliente':
		require_once "../modelos/Persona.php";
		$persona = new Persona();

		$rspta = $persona->listarC();

		while ($reg = $rspta->fetch_object())
				{
				echo '<option value=' . $reg->idpersona . '>' . $reg->nombre . '</option>';
				}
	break;

	case 'selectUsuario':
		require_once "../modelos/Usuario.php";
		$usuario = new Usuario();
		$rspta=$usuario->listar();
		$html = '';
		$html .= '<option value="all">Todos</option>';
		while ($reg=$rspta->fetch_object()) {
			$html .= '<option value='.$reg->idusuario.'>'.$reg->nombre.'</option>';
		}
		echo $html;
	break;

	
	case 'listarProductos':
		require_once "../modelos/Productos.php"; 
		$productos=new Productos();
		$rspta=$productos->listarProductos();

 		$data= Array();
		 while($reg=$rspta->fetch_object())
		 {
 			$data[]=array(
				"0"=>'<button class="btn btn-warning" onclick="agregarDetalle('.$reg->id_producto.',\''.$reg->nombre.'\',\''.$reg->codigo.'\','.$reg->puntos_prod.')"><span class="fa fa-plus"></span></button>',
				"1"=>$reg->nombre,
				"2"=>$reg->codigo,
				"3"=>$reg->stock,
 				"4"=>$reg->puntos_prod,	
				"5"=>($reg->condicion)?'<span class="label bg-green">Activada<span>':'<span class="label bg-red">Desactivada<span>'
 				);
			}
 		$results = array(
 			"sEcho"=>1, //Información para el datatables
 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 			"aaData"=>$data);
 		echo json_encode($results);
	break;
		}
?>
