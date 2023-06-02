<?php
if (strlen(session_id()) < 1)
  session_start();

require_once "../modelos/Ticket.php";

$venta=new Ticket();
$idventa=isset($_POST["idventa"])? limpiarCadena($_POST["idventa"]):"";
$idcliente=isset($_POST["idcliente"])? limpiarCadena($_POST["idcliente"]):"";
$idusuario=$_SESSION["idusuario"];
$codigotipo_comprobante=isset($_POST["codigotipo_comprobante"])? limpiarCadena($_POST["codigotipo_comprobante"]):"";
// $serie=isset($_POST["serie"])? limpiarCadena($_POST["serie"]):"";
// $correlativo=isset($_POST["correlativo"])? limpiarCadena($_POST["correlativo"]):"";
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
			require_once "../reportes/numeroALetras.php";
			$letras = NumeroALetras::convertir($total_importe);
			list($num,$cen)=explode('.',$total_importe);
			$leyenda = $letras.'Y '.$cen.'/100 SOLES';

			$rspta=$venta->insertar($idcliente,$idusuario,$codigotipo_comprobante,$fecha_hora,$impuesto,$total_venta_gravado,$total_venta_inafectas,$total_venta_exonerado,$total_venta_gratuitas,$isc,$total_descuentos,$total_igv,$total_importe,$leyenda,$moneda,$_POST["idarticulo"],$_POST["cantidad"],$_POST["precio_venta"],$_POST["descuento"],$_POST["serieArticulo"],$_POST["incentivo"],$_POST["incentivo_total"]);
			echo $rspta ? "Venta registrada" : "No se pudieron registrar todos los datos de la venta";
		}
		else {
		}
	break;

	case 'anular':
		$rspta=$venta->anular($idventa);
 		echo $rspta ? "Venta anulada" : "Venta no se puede anular";
	break;

	case 'mostrar':
		$rspta=$venta->mostrar($idventa);
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

		$rspta = $venta->listarDetalle($id);
		$total=0.00;
		$impuesto=18;
		$sumigv=0;
		$sumdes=0;
		$grava=0;
		echo '<thead style="background-color:#A9D0F5">
							  <th>Opciones</th>
                              <th>Descripcion</th>
                              <th>Laboratorio</th>
							  <th>Lote Nº</th>
                              <th>Ubicacion</th>
                              <th>U.Medida</th>
							  <th>Fecha Vencimiento</th>
                              <th>Cantidad</th>
                              <th>p. venta</th>
                              <th>Sub total</th>
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

					echo '<tr class="filas">
					<td></td>
					<td>'.$reg->nombre.'</td>
					<td>'.$reg->laboratorio.'</td>
					<td>'.$reg->lote.'</td>
					<td>'.$reg->ubicacion.'</td>
					<td>'.$reg->unidad_medida.'</td>
					<td>'.$reg->fecha_vencimiento.'</td>
					<td>'.$reg->cantidad.'</td>
					<td>'.$reg->precio_venta.'</td>
					<td>'.$reg->subtotal.'</td></tr>';
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
                                    <th><h4 id="totalg">'.number_format($op_gravadas,2,".",",").'</h4><input type="hidden" name="total_venta_gravado" id="total_venta_gravado"></th>
                                  </tr>
								  
                                   <tr>
                                    <th style="height:2px;"  colspan="7"></th>
                                    <th colspan="2">IGV</th>
                                    <th><h4 id="totaligv">'.number_format($sumigv,2,".",",").'</h4><input type="hidden" name="total_igv" id="total_igv"></th>
                                   </tr>
                                   <tr>
                                    <th style="height:2px;" colspan="7"></th>
                                    <th style="height:2px;" colspan="2">TOTAL IMPORTE</th>
                                    <th style="height:2px;"><h4 id="totalimp">'.number_format($total,2,".",",").'</h4><input type="hidden" name="total_importe" id="total_importe"></th>
                                   </tr>
                                </tfoot>';


	break;

	case 'listar':
		$rspta=$venta->listar();
 		//Vamos a declarar un array
 		$data= Array();

 		while ($reg=$rspta->fetch_object()){
 			/*if($reg->codigotipo_comprobante=='1' || $reg->codigotipo_comprobante=='3'){
 			//$url='../reportes/Reporte_PDF_Comprobante-tiket.php?id=';
 			$url='../reportes/Reporte_PDF_Comprobante-A4.php?id=';
 			}else{
 				$url='../reportes/preFactura.php?id=';

 			}*/

 			$url_ticket = '../reportes/Reporte_PDF_Comprobante-tiket.php?id=';
			$url_pdf = '../reportes/Reporte_PDF_Comprobante-A4.php?id=';

			$data[]=array(
				//"0"=>(($reg->estado=='Aceptado')?'<button class="btn btn-warning" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>'.'':
									 //' <button class="btn btn-danger" onclick="anular('.$reg->idventa.')"><i class="fa fa-close"></i></button>':
						   //'<button class="btn btn-warning" onclick="mostrar('.$reg->idventa.')"><i class="fa fa-eye"></i></button>').
			   "0"=>'<a target="_blank" href="'.$url_ticket.$reg->idventa.'"> <button class="btn btn-success"><i class="fa fa-print"></i></button></a>'.
				'<a target="_blank" href="'.$url_pdf.$reg->idventa.'"> <button class="btn btn-success"><i class="fa fa-file-pdf-o"></i></button></a>',
				"1"=>$reg->fecha,
 				"2"=>$reg->cliente,
 				"3"=>$reg->usuario,
 				"4"=>$reg->descripcion_tipo_comprobante,
 				"5"=>$reg->serie.'-'.$reg->correlativo,
 				"6"=>$reg->total_venta,
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

	case 'selectTipoComprobante':
		$rspta = $venta->selectTipoComprobante();
		while ($reg = $rspta->fetch_object()) {
			echo '<option value='.$reg->codigotipo_comprobante.'>'.$reg->descripcion_tipo_comprobante.'</option>';
		}
		break;

	case 'selectMoneda':
			$rspta = $venta->selectMoneda();
			while ($reg=$rspta->fetch_object()) {
				echo '<option value='.$reg->idmoneda.'>'.$reg->descripcion.'</option>';
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
			 // -- '.$reg->idarticulo.',\''.$reg->nombre.'\',\''.$unidadm.'\','.$reg->precio_venta.',\''.$reg->afectacion.'\', \''.$reg->precio_compra.'\'
 			$data[]=array(
				"0"=>'<button class="btn btn-warning" onclick="agregarDetalle('.$reg->idarticulo.',\''.$reg->nombre.'\',\''.$reg->laboratorio.'\',\''.$reg->lote.'\',\''.$reg->fecha_vencimento.'\',\''.$unidadm.'\','.$reg->precio_venta.',\''.$reg->afectacion.'\','.$reg->incentivo.',\''.$reg->categoria.'\')"><span class="fa fa-plus"></span></button>',
				"1"=>$reg->nombre,
				"2"=>$reg->laboratorio,
				"3"=>$reg->lote,
 				"4"=>$reg->categoria,	
 				"5"=>$unidadm,
 				"6"=>$reg->stock,
 				"7"=>$reg->precio_venta,
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
