<?php
if (strlen(session_id()) < 1)
  session_start();

require_once "../modelos/Proforma.php";

$proforma=new Proforma();

$idproforma=isset($_POST["idproforma"])? limpiarCadena($_POST["idproforma"]):"";
$idusuario=$_SESSION["idusuario"];
$idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$correlativo=isset($_POST["correlativo"])? limpiarCadena($_POST["correlativo"]):"";
$tipo_proforma=isset($_POST["tipo_proforma"])? limpiarCadena($_POST["tipo_proforma"]):"";
$igv_total=isset($_POST["igv_total"])? limpiarCadena($_POST["igv_total"]):"";
$total_venta=isset($_POST["total_venta"])? limpiarCadena($_POST["total_venta"]):"";
$fecha_hora=isset($_POST["fecha_hora"])? limpiarCadena($_POST["fecha_hora"]):"";


switch ($_GET["op"]){
	case 'guardaryeditar':
		if (empty($idproforma)){
			$rspta=$proforma->insertar($idusuario,$idcliente,$correlativo,$tipo_proforma,$igv_total,$total_venta,$fecha_hora,$_POST["descripcion"],$_POST["cantidad"],$_POST["precio"]);
			echo $rspta ? "proforma registrada" : "No se pudieron registrar todos los datos de la proforma";
		}
		else {
		}
	break;

	case 'anular':
		$rspta=$proforma->anular($idproforma);
 		echo $rspta ? "proforma anulada" : "proforma no se puede anular";
	break;

	case 'mostrar':
		$rspta=$proforma->mostrar($idproforma);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);
	break;

	case 'mostrarDatoCliente':
		require_once "../modelos/Persona.php";
		$cliente = new Persona();
		$rspta=$cliente->mostrar($idcliente);
 		echo json_encode($rspta);

	break;


	case 'listarDetalle':
		//Recibimos el idingreso
		$id=$_GET['id'];

		$rspta = $proforma->listarDetalle($id);
		$subt=0.00;
		$sumigv=0.00;
		$total=0.00;

		 /*<th>Opciones</th>
                                    <th>Artículo</th>
                                    <th>Cantidad</th>
                                    <th>Precio Venta</th>
                                    <th>Descuento</th>
                                    <th>Subtotal</th>*/
		echo '<thead style="background-color:#A9D0F5">
                                   
                                    <th>Opciones</th>
                                    <th >Descripcion</th>
                                    <th>Cantidad</th>
                                    <th>Precio Unitario</th>
                                    <th>Precio Parcial</th>
                                </thead>';

		while ($reg = $rspta->fetch_object())
				{


					echo '<tr class="filas"><td></td><td>'.$reg->descripcion.'</td><td>'.$reg->cantidad.'</td><td>'.$reg->precio.'</td><td>'.$reg->subtotal.'</td></tr>';
				

					$subt += $reg->subtotal;
					$sumigv= $subt*0.18;
					$total = $subt+$sumigv;

					
				}
		
    	echo '<tfoot>

                                   <tr>
                                    <th colspan="3"></th>
                                    <th colspan="">SUBTOTAL</th>
                                    <th><h4 id="subtotal">'.$subt.'</h4><input type="hidden" name="ssubtotal" id="ssubtotal"></th>
                                   <tr>
                                    <th style="height:2px;"  colspan="3"></th>
                                    <th colspan="">IGV</th>
                                    <th><h4 id="totaligv">'.$sumigv.'</h4><input type="hidden" name="igv_total" id="igv_total"></th>
                                   </tr>
                                   <tr>
                                    <th style="height:2px;" colspan="3"></th>
                                    <th style="height:2px;" colspan="">TOTAL IMPORTE</th>
                                    <th style="height:2px;"><h4 id="totalimp">'.$total.'</h4><input type="hidden" name="total_venta" id="total_venta"></th>
                                   
                                   </tr>
                                </tfoot>';


	break;

	case 'listar':
		$rspta=$proforma->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
 			// if($reg->codigotipo_comprobante=='1' || $reg->codigotipo_comprobante=='3'){
 			// 	$url='../reportes/Facturacion.php?id=';
 			// }else{
 				$url='../reportes/proforma.php?id=';

 			// }

 			$data[]=array(
 				"0"=>(($reg->estado=='AceptadoP')?'<button class="btn btn-warning" onclick="mostrar('.$reg->idproforma.')"><i class="fa fa-eye"></i></button>'.
 				 					' <button class="btn btn-danger" onclick="anular('.$reg->idproforma.')"><i class="fa fa-close"></i></button>':
 				 					'<button class="btn btn-warning" onclick="mostrar('.$reg->idproforma.')"><i class="fa fa-eye"></i></button>').
 				'<a target="_blank" href="'.$url.$reg->idproforma.'" > <button class="btn btn-info"><i class="fa fa-file"></i></button></a>',
 				"1"=>$reg->fecha,
 				"2"=>$reg->tipo_proforma,
 				"3"=>$reg->cliente,
 				"4"=>$reg->usuario,
 				"5"=>$reg->total_venta,
 				"6"=>($reg->estado=='AceptadoP')?'<span class="label bg-green">Aceptado</span>':
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

	// case 'selectUsuario':
	// 	require_once "../modelos/Usuario.php";
	// 	$usuario = new Usuario();
	// 	$rspta=$usuario->listar();
	// 	while ($reg=$rspta->fetch_object()) {
	// 		echo '<option value='.$reg->idusuario.'>'.$reg->nombre.'</option>';
	// 	}
	// break;

		
	// case 'listarArticulosVenta':
	// 	require_once "../modelos/Articulo.php";
	// 	$articulo=new Articulo();

	// 	$rspta=$articulo->listarActivosVenta();
 // 		//Vamos a declarar un array
 // 		$data= Array();
 // 		$i=0;
 // 		while ($reg=$rspta->fetch_object()){

 // 			if($reg->unidad_medida=='otros'){
 // 				$unidadm = $reg->descripcion_otros;
 // 			}else{
 // 				$unidadm = $reg->unidad_medida;
 // 			}
 // 			$i+=1;
 // 			$data[]=array(
 // 				"0"=>'<button class="btn btn-warning" onclick="agregarDetalle('.$reg->idarticulo.',\''.$reg->nombre.'\',\''.$unidadm.'\','.$reg->precio_venta.',\''.$reg->afectacion.'\')"><span class="fa fa-plus"></span></button>',
 // 				"1"=>$reg->nombre,
 // 				"2"=>$unidadm,
 // 				"3"=>$reg->categoria,
 // 				"4"=>$reg->codigo,
 // 				"5"=>$reg->stock,
 // 				"6"=>$reg->precio_venta,
 // 				"7"=>"<img src='../files/articulos/".$reg->imagen."' height='50px' width='50px' >",
 // 				// "8"=>'Gravado<input type="radio" name="afectacion'.$reg->idarticulo.'" checked value="10">  Exonerado<input type="radio" name="afectacion'.$reg->idarticulo.'" value="20"> Inafecta<input type="radio" name="afectacion'.$reg->idarticulo.'" value="30">'
 // 				"8"=>$reg->afectacion,
 // 				);
 // 		}
 // 		$results = array(
 // 			"sEcho"=>1, //Información para el datatables
 // 			"iTotalRecords"=>count($data), //enviamos el total registros al datatable
 // 			"iTotalDisplayRecords"=>count($data), //enviamos el total registros a visualizar
 // 			"aaData"=>$data);
 // 		echo json_encode($results);
	// break;
}
?>
