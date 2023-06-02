<?php
if(strlen(session_id()) < 1)
  session_start();
  date_default_timezone_set('America/Lima'); 
// En windows
setlocale(LC_TIME, 'spanish');
 ?>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Formulario Contacto</title>
	<!-- <link rel="stylesheet" type="text/css" href="normalize.css"> -->
	<style type="text/css">
		  table {color:black; 
		 	border: none;
            width: 100%;            
          }		

		 .header{
		 	display: inline-block;
		 	padding-left: 30px; 
		 	padding-right: 20px; 
		 	
		 }
		 .info{
		 	width: 30%; 
		 	color: #34495e;
		 	font-size:12px;
		 	text-align:justify-all;
		 }
		 .factura{
		 	color: red;
		 	width: 28%;
		 	height:10px;
		 	border: 1px solid red;
		 	text-align: center;
		 }
		 .linea{
		 	padding-left: 20px; 
		 	padding-right: 20px; 	
		 	height: 0.01px;		 	
		 }
		 .cliente{
		 	padding-left: 40px; 
		 	padding-right: 20px;
		 	font-size:14px;
		 }
		 .articulos{
		 	padding-left: 40px; 
		 	padding-right: 40px;
		 	font-size:11px;

		 }
		 .razon-social{
		 	font-size:18px;	
		 }
		 .cabecera{
		 	background: #000;
			color:white;
			font-size:11px;	
		}

		 .total{
		 	padding-left: 20px; 
		 	padding-right: 20px;
		 	font-size:14px;

		 }
		 .foot{
		 	padding-left: 20px; 
		 	padding-right: 20px;
		 	font-size: 8pt;
		 }
		 .silver{
			background:white;
			padding: 3px 4px 3px;
		}
		.clouds{
			background:#ecf0f1;
			padding: 3px 4px 3px;
		}
		.tbl-main2{
			background: silver;
			position: static;
			height: 214px;
			min-height: 214px;
		}

	</style>
</head>
<body>
<?php 
require_once "../modelos/Perfil.php";
        $perfil=new Perfil();
        $rspta=$perfil->cabecera_perfil();
        // $rspta= Perfil::cabecera_perfil();
        $reg=$rspta->fetch_assoc();
        $rucp=$reg['ruc'];
        $razon_social=$reg['razon_social'];
        $direccion=$reg['direccion'];
        $distrito=$reg['distrito'];
        $provincia=$reg['provincia'];
        $departamento=$reg['departamento'];
        $telefono=$reg['telefono'];
        $email=$reg['email'];

        require_once "../modelos/Venta2.php";
        $venta=new Venta2();
        $rsptac= $venta->ventacabecera($_GET["id"]);
        $regc=$rsptac->fetch_object();
        $cliente=$regc->cliente;
        $tipo_doc_c=$regc->tipo_documento;
        if($tipo_doc_c == 'RUC'){
            $tipo_documento_cliente = '6';
        }else{
            $tipo_documento_cliente = '1';
        }
        $ruc=$regc->num_documento;
        if($regc->codigotipo_comprobante =='1'){
            $codigotipo_comprobante='FACTURA  ELECTRÓNICA';
        }else  if($regc->codigotipo_comprobante =='3'){
            $codigotipo_comprobante='BOLETA DE VENTA ELECTRÓNICA';
        }

        $direccioncliente=$regc->direccion;
        $serie=$regc->serie;
        $correlativo=$regc->correlativo;
        $moneda=$regc->descmoneda;
        $fecha=$regc->fecha;
        $fechaCompleta=$regc->fechaCompleta;
        list($anno,$mes,$dia)=explode('-',$fecha);

        $horas = substr($fechaCompleta, -9);
        $op_gravadas=$regc->op_gravadas;
        $total_igv=$regc->total_igv;
        $op_inafectas=$regc->op_inafectas;
        $op_exoneradas=$regc->op_exoneradas;
        $op_gratuitas=$regc->op_gratuitas;
        $isc=$regc->isc;
        $total_venta=$regc->total_venta;

        $rsptad= $venta->ventadetalle($_GET["id"]);
    $item=0;
 ?>
<form action>
	<input type="hidden" name="rucempresa">
	<input type="hidden" name="seriecompro">
	<input type="hidden" name="correlativocompro">
</form>
<br>
<page_footer>
	<table id="">
		<tr class="">
		    <td style="">
			     <div style="text-align: center;" class="foot">
					Representación impresa de la FACTURA ELECTRONICA emitida del sistema del contribuyente Autirazado con fecha 10/8/2018<br>
	                Sistema desarrollado por www.solucionesintegralesjb.com
	            </div>
				<div class="linea" style=""><hr></div>
		    </td>
		</tr>
	</table><br>
</page_footer>
<form action>
	<input type="hidden" name="rucempresa">
	<input type="hidden" name="seriecompro">
	<input type="hidden" name="correlativocompro">
</form>
<!-- Header -->
<div class="header">
	<table style="width: 100%;">
		<tr>					
			<td style="width: 55%;">
				<!-- Loogo - Razon Social -->
				<table>
					<tr><th style="width: 100%; text-align: center;"><img style="height: 50px" src="../files/perfil/cabecera.png"></th></tr>			
					<tr><td class="razon-social" style="width: 100%;"><b><?php echo $razon_social; ?></b></td></tr>
					<tr>
						<td style="width: 100%;">
							<?php echo strtoupper( $direccion); ?>
							<?php echo strtoupper($distrito.' - '.$provincia.' - '.$departamento) ?>	
						</td>
					</tr>
					<tr><td style="width: 100%;">Telef.: <?php echo $telefono; ?></td></tr>
					<tr><td style="width: 100%;">Email.: <?php echo $email; ?></td></tr>
		       	</table>
			</td>				 	
			<td style="width: 40%;">
				<!-- Numeracion -->
				<table >
					<tr>
						<th class="factura" style="width:80%"><br>
							RUC: <?php echo $rucp; ?><br><br>
							<?php echo $codigotipo_comprobante; ?><br><br>
							<?php echo $serie.' - '.$correlativo ?><br><br>
						</th>
					</tr>
		       	</table>				 		
			</td>
			<td style="width: 5%;"></td>
		</tr>
	</table>	
</div>
<div class="linea" style=""><br><hr></div>
<!--  Datos del Cliente -->
<div class="cliente">
	<table style="width: 100%;">
		<tr><td style="width: 14%;">Cliente</td><td style="width: 80%">: <?php echo $cliente; ?></td></tr>
		<tr><td style="width: 14%;">RUC</td><td style="width: 80%">: <?php echo $ruc; ?></td></tr>
		<tr><td style="width: 14%;">Dirección:</td><td style="width: 80%">: <?php echo $direccioncliente; ?></td></tr>
	</table>
	<table style="width: 100%;">
		<tr>
			<td style="width: 14%;">Fecha Emisión </td>
			<td style="width: 40%;">: <?php echo strftime("%d de %B del %Y", strtotime($fecha)); ?></td>
			<td style="width: 8%;">Moneda</td>
			<td style="width: 30%;">: <?php echo $moneda; ?></td>						
		</tr>
	</table>
</div>
<!--  Descripcion del Comprovante -->
<div class="articulos">
	<table style="width: 100%" cellspacing="0" cellpadding="0" border="0.2"  >
		<tr class="cabecera">
		    <th style="width: 60%; text-align: center; height: 12px; padding-top: 5px ">DESCRIPCIÓN</th>
		    <th style="width: 7%; text-align: center; padding-top: 5px ">CAT.</th>
		    <th style="width: 13%; text-align: center; padding-top: 5px ">P. UNIT.</th>
		    <th style="width: 13%; text-align: center; padding-top: 5px ">MPORTE</th>
		</tr>
        <?php 
                    $cantidad=0;
                        while($regd=$rsptad->fetch_object()){
                        $item+=1;
                        if($item%2==0){
                        $estilo='silver';
                        }else{
                            $estilo='clouds';
                        }
                        $newValoU=$regd->precio_venta/1.18;
                        $newValorU=round($newValoU,2);
                        $preciov = $regd->precio_venta;
                        $totalpv= $regd->precio_venta*$regd->cantidad;
                     ?>

         <tr  style="text-align:left">
                        
                        <td style="width:60%; height: 10px; padding-top: 5px " rowspan="&">&nbsp;&nbsp;<?php echo $regd->articulo." ".$regd->serie; ?></td>
                        <td style="width:7%; padding-top: 5px; text-align: center;"><?php echo $regd->cantidad;  ?></td>
                        <td style="width:13%; padding-top: 5px; text-align: right;"><?php echo number_format($preciov,2,'.',','); ?>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td style="width:13%; padding-top: 5px; text-align: right;"><?php echo number_format($totalpv,2,'.',','); ?>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         
        </tr>

        		 <?php }?>
				
				<br>
	</table>
               	

			<?php 
			require_once "numeroALetras.php";
			$letras = NumeroALetras::convertir($total_venta);
			list($num,$cen)=explode('.',$total_venta);
			 ?>
			
			
			<br><br>
			<table cellspacing="0" cellpadding="0" border="0.2"  >
				<tr class="articulos" style="width: 100%; text-align: center">
		            <td style="text-align: center; width:12%">OP. <br>GRABADA</td>
		            <td style="text-align: center; width:12%">OP. <br>GRATUITA</td>
		            <td style="text-align: center; width:12%">OP.<br> EXONERADA</td>
		            <td style="text-align: center; width:12%">OP. <br>INAFECTA</td>
		            <td style="text-align: center; width:12%">DESCTO <br>TOTAL </td>
		            <td style="text-align: center; width:12%">IGV <br>(18%)</td>
		            <td style="text-align: center; width:12%">PRECIO <br>TOTAL</td>            
        		</tr>
        		<tr style="width: 100%; text-align: center;">
					<td style="width:12%">S/&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $op_gravadas; ?></td>
					<td style="width:12%">S/ &nbsp;&nbsp;&nbsp;&nbsp; 00.00</td>
					<td style="width:12%">S/ &nbsp;&nbsp;&nbsp;&nbsp; 00.00</td>
					<td style="width:12%">S/ &nbsp;&nbsp;&nbsp;&nbsp; 00.00</td>
					<td style="width:12%">S/ &nbsp;&nbsp;&nbsp;&nbsp; 00.00</td>
					<td style="width:12%">S/ &nbsp;&nbsp;&nbsp;&nbsp;<?php echo number_format($total_igv,2,'.',','); ?></td>
					<td style="width:12%">S/&nbsp;&nbsp;&nbsp;&nbsp; <?php echo $total_venta; ?></td>

				</tr>
			</table>
			<br>
			
	
			
		<table  style="border: solid 0.2px black; ">
			<tr style="width: 80%;">
				<td style=" width:92%; height: 14px;">SON: <?php echo $letras.' Y '.$cen; ?>/100 SOLES</td>	
			</tr>	
		</table>
			</div>	
			 <table align="center" border="none"  width="100%">
                <tr>
                  <td>&nbsp;</td>
                </tr>  

                 <tr>
                  <td align="center">
                        <?php 
                            require "phpqrcode/qrlib.php";    
                            $dir = 'temp_qrcode/';
                            
                            if (!file_exists($dir)){
                                mkdir($dir);
                            }
                            
                            $filename = $dir.$rucp.'-0'.$regc->codigotipo_comprobante.'-'.$serie.'-'.$correlativo;
                         
                            $tamaño = 2; //Tamaño de Pixel
                            $level = 'Q'; //Precisión Baja
                            // L = Baja
                            // M = Mediana
                            // Q = Alta
                            // H= Máxima
                            $framSize = 1; //Tamaño en blanco
                            $contenido = $rucp.'|0'.$regc->codigotipo_comprobante.'|'.$serie.'|'.$correlativo.'|'.$total_igv.'|'.$total_venta.'|'.$fecha.'|'.$tipo_documento_cliente.'|'.$ruc.'|'; //Texto
                            
                                //Enviamos los parametros a la Función para generar código QR 
                            QRcode::png($contenido, $filename, $level, $tamaño, $framSize); 
                            
                                //Mostramos la imagen generada
                            echo '<img src="'.$dir.basename($filename).'" />';  
                         ?>
                      


                      
                  </td>
                </tr>  

                <tr>
                  <td align="center">¡GRACIAS POR SU COMPRA VUELVA PRONTO! </td>
                </tr>
               
               
            </table>

		
		

   
 
   

</body>
</html>