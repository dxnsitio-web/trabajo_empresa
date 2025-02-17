<?php
if (strlen(session_id()) < 1)
  session_start();

require_once "../modelos/Cotizacion.php";

$venta=new Cotizacion();

$idventa=isset($_POST["idventa"])? limpiarCadena($_POST["idventa"]):"";
$idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$idusuario=$_SESSION["idusuario"];
$codigotipo_comprobante=isset($_POST["codigotipo_comprobante"])? limpiarCadena($_POST["codigotipo_comprobante"]):"";
$serie=isset($_POST["serie"])? limpiarCadena($_POST["serie"]):"";
$correlativo=isset($_POST["correlativo"])? limpiarCadena($_POST["correlativo"]):"";
$fecha_hora=isset($_POST["fecha_hora"])? limpiarCadena($_POST["fecha_hora"]):"";
$impuesto=isset($_POST["impuesto"])? limpiarCadena($_POST["impuesto"]):"";
$moneda=isset($_POST["moneda"])? limpiarCadena($_POST["moneda"]):"";

$total_venta_gravado=isset($_POST["total_venta_gravado"])? limpiarCadena($_POST["total_venta_gravado"]):"";
$total_venta_exonerado=isset($_POST["total_venta_exonerado"])? limpiarCadena($_POST["total_venta_exonerado"]):"";
$total_venta_inafectas=isset($_POST["total_venta_inafectas"])? limpiarCadena($_POST["total_venta_inafectas"]):"";
$total_venta_gratuitas=isset($_POST["total_venta_gratuitas"])? limpiarCadena($_POST["total_venta_gratuitas"]):"";
$total_descuentos=isset($_POST["total_descuentos"])? limpiarCadena($_POST["total_descuentos"]):"";
$isc=isset($_POST["isc"])? limpiarCadena($_POST["isc"]):"";
$total_igv=isset($_POST["total_igv"])? limpiarCadena($_POST["total_igv"]):"";
$total_importe=isset($_POST["total_importe"])? limpiarCadena($_POST["total_importe"]):"";

switch ($_GET["op"]){
	case 'guardaryeditar':
		if (empty($idventa)){
			$rspta=$venta->insertar($idcliente,$idusuario,$codigotipo_comprobante,$serie,$correlativo,$fecha_hora,$impuesto,$total_venta_gravado,$total_venta_inafectas,$total_venta_exonerado,$total_venta_gratuitas,$isc,$total_importe,$moneda,$_POST["idarticulo"],$_POST["cantidad"],$_POST["precio_venta"],$_POST["descuento"],$_POST["serieCotizacion"]);
			echo $rspta ? "Proforma registrada" : "No se pudieron registrar todos los datos de la proforma";
		}
		else {
		}
	break;

	case 'anular':
		$rspta=$venta->anular($idventa);
 		echo $rspta ? "Proforma anulada" : "Proforma no se puede anular";
	break;

	case 'mostrar':
		$rspta=$venta->mostrar($idventa);
 		//Codificar el resultado utilizando json
 		echo json_encode($rspta);
	break;

	case 'listarDetalle':
		//Recibimos el idingreso
		$id=$_GET['id'];

		$rspta = $venta->listarDetalle($id);
		$total=0.00;
		$impuesto=18;
		$sumigv=0;
		$sumdes=0;
		$grava=0;

		 /*<th>Opciones</th>
                                    <th>Artículo</th>
                                    <th>Cantidad</th>
                                    <th>Precio Venta</th>
                                    <th>Descuento</th>
                                    <th>Subtotal</th>*/
		echo '<thead style="background-color:#A9D0F5">
                                   
                                    <th>Opciones</th>
                                    <th>Artículo</th>
                                    <th>Serie</th>
                                    <th>U. Medida</th>
                                 
                                    <th>Cantidad</th>
                                    <th>Val. Vta. U.</th>
                                 
                                    <th>Impuestos</th>
                                    <th>Precio Venta</th>
                                    <th>Val. Vta. Total</th>
                                    <th>Importe</th>
                                </thead>';

		while ($reg = $rspta->fetch_object())
				{

					if($reg->afectacion=='Exonerado'){
						$valorVentaU=$reg->precio_venta;
						$valorVentaU=round($valorVentaU,2);
				    	$valorVentaT=$reg->precio_venta*$reg->cantidad;
				    	$valorVentaT=round($valorVentaT,2);
				    	$newigv= 0.00;
					}else{
						$valorVentaU=$reg->precio_venta/(1+($impuesto/100));
						$valorVentaU=round($valorVentaU,2);
				    	$valorVentaT=$reg->precio_venta/(1+($impuesto/100))*$reg->cantidad - $reg->descuento;
				    	$valorVentaT=round($valorVentaT,2);
				    	$newigv=  ($reg->cantidad*$reg->precio_venta/(1+($impuesto/100))-$reg->descuento)*($impuesto/100);
    					$newigv=round($newigv,2);
					}
					
			    	// $sumgrava+=$valorVentaT;
			    	// $precioSinIgv= $reg->cantidad*$reg->precio_venta/(1+($impuesto/100));
				    // $igv = $precioSinIgv*($impuesto/100);
    				
    				$sumigv+=$newigv;
    				$sumdes+=$reg->descuento;

					echo '<tr class="filas"><td></td><td>'.$reg->nombre.'</td><td>'.$reg->serieCotizacion.'</td><td>'.$reg->unidad_medida.'</td><td>'.$reg->cantidad.'</td><td>'.$valorVentaU.'</td><td>'.$newigv.'</td><td>'.$reg->precio_venta.'</td><td>'.$valorVentaT.'</td><td>'.$reg->subtotal.'</td></tr>';
					$total=$total+($reg->precio_venta*$reg->cantidad-$reg->descuento);
					$op_gravadas=$reg->op_gravadas;
					$op_inafectas=$reg->op_inafectas;
					$op_exoneradas=$reg->op_exoneradas;
					$op_gratuitas=$reg->op_gratuitas;
					$isc=$reg->isc;
					
				}
		
    	echo '<tfoot>
                                  <tr>
                                    <th colspan="7"></th>
                                    <th colspan="2">TOTAL VENTA GRAVADO</th>
                                    <th><h4 id="totalg">'.number_format($op_gravadas,2,'.',',').'</h4><input type="hidden" name="total_venta_gravado" id="total_venta_gravado"></th>
                                  </tr>
                               
                                   <tr>
                                    <th style="height:2px;"  colspan="7"></th>
                                    <th colspan="2">IGV</th>
                                    <th><h4 id="totaligv">'.number_format($sumigv,2,'.',',').'</h4><input type="hidden" name="total_igv" id="total_igv"></th>
                                   </tr>
                                   <tr>
                                    <th style="height:2px;" colspan="7"></th>
                                    <th style="height:2px;" colspan="2">TOTAL IMPORTE</th>
                                    <th style="height:2px;"><h4 id="totalimp">'.number_format($total,2,'.',',').'</h4><input type="hidden" name="total_importe" id="total_importe"></th>
                                   </tr>
                                </tfoot>';


	break;

	case 'listar':
		$rspta=$venta->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
 			
 				$url='../reportes/Cotizacion.php?id=';
 			

 			$data[]=array(
 				"0"=>(($reg->estado=='Cotizado')?'<button class="btn btn-warning" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>'.
 				 					' <button class="btn btn-danger" onclick="anular('.$reg->idventa.')"><i class="fa fa-close"></i></button>':
 				 					'<button class="btn btn-warning" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>').
 				'<a target="_blank" href="'.$url.$reg->idventa.'"> <button class="btn btn-success"><i class="fa fa-file"></i></button></a>',
 				"1"=>$reg->fecha,
 				"2"=>$reg->cliente,
 				"3"=>$reg->usuario,
 				"4"=>'Proforma',
 				"5"=>$reg->serie.'-'.$reg->correlativo,
 				"6"=>$reg->total_venta,
 				"7"=>($reg->estado=='Cotizado')?'<span class="label bg-green">Cotizado</span>':
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
				echo '<option value=' . $reg->idpersona . ' selected="selected">' . $reg->nombre . '</option>';
				}
	break;

	case 'selectTipoComprobante':
		$rspta = $venta->selectTipoComprobante();
		while ($reg = $rspta->fetch_object()) {
			echo '<option value='.$reg->codigotipo_comprobante.'>'.$reg->descripcion_tipo_comprobante.'</option>';
		}
		break;

	case 'selectMoneda':
			$rspta = $venta->selectMoneda();
			while ($reg=$rspta->fetch_object()) {
				echo '<option value='.$reg->idmoneda.' selected>'.$reg->descripcion.'</option>';
			}
			break;	
	case 'listarArticulosVenta':
		require_once "../modelos/Articulo.php";
		$articulo=new Articulo();

		$rspta=$articulo->listarActivosVenta();
 		//Vamos a declarar un array
 		$data= Array();
 		$i=0;
 		while ($reg=$rspta->fetch_object()){

 			if($reg->unidad_medida=='otros'){
 				$unidadm = $reg->descripcion_otros;
 			}else{
 				$unidadm = $reg->unidad_medida;
 			}
 			$i+=1;
 			$data[]=array(
 				"0"=>'<button class="btn btn-warning" onclick="agregarDetalle('.$reg->idarticulo.',\''.$reg->nombre.'\',\''.$unidadm.'\','.$reg->precio_venta.',\''.$reg->afectacion.'\')"><span class="fa fa-plus"></span></button>',
 				"1"=>$reg->nombre,
 				"2"=>$unidadm,
 				"3"=>$reg->categoria,
 				"4"=>$reg->codigo,
 				"5"=>$reg->stock,
 				"6"=>$reg->precio_venta,
 				"7"=>"<img src='../files/articulos/".$reg->imagen."' height='50px' width='50px' >",
 				// "8"=>'Gravado<input type="radio" name="afectacion'.$reg->idarticulo.'" checked value="10">  Exonerado<input type="radio" name="afectacion'.$reg->idarticulo.'" value="20"> Inafecta<input type="radio" name="afectacion'.$reg->idarticulo.'" value="30">'
 				"8"=>$reg->afectacion,
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
