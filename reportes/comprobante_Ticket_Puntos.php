
<?php
if(strlen(session_id()) < 1)
  session_start();
  date_default_timezone_set('America/Lima'); 
// En windows
setlocale(LC_TIME, 'spanish');
 ?>
<style type="text/css">
<!--
    div.zone { border: none; border-radius: 6mm; background: #FFFFFF; border-collapse: collapse; padding:3mm; font-size: 2.7mm;}
    h1 { padding: 0; margin: 0; color: #DD0000; font-size: 7mm; }
    h2 { padding: 0; margin: 0; color: #222222; font-size: 5mm; position: relative; }
-->

.body {
    margin: 10px; padding: 0;
    /*background-image: url(../img/fondo.png);*/
    /*background-repeat: repeat;*/
    /*padding-bottom: 1px;*/
    font-size: 11px;
    
}

.silver{
            background:white;
            padding: 2px 1px 2px;
}
.clouds{
    background:#ecf0f1;
    padding: 2px 1px 2px;
}
table tbody.cuerpoM{
    font-size: 9px;

}


.body, td, th {
    /*font-family: Arial, Helvetica, sans-serif;*/
    /*font-size:12px;*/
    font-family: Helvetica;

}
.producto{
font-size: 10px;


}
.tab-c{
    font-size: 12px;

}

</style>
<page format="200x80" orientation="P" style="font: arial;" class="body">
  
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
      

        require_once "../modelos/Puntos.php";
        $puntos=new Puntos();
        $rsptac= $puntos->puntoscabecera($_GET["id"]);
        $rsptad = $puntos->puntosdetalle($_GET["id"]);
        $regc=$rsptac->fetch_object();
        $cliente=$regc->cliente;
       
        $tipo_doc_c=$regc->tipo_documento;
        $ruc=$regc->num_documento;
        $direccioncliente=$regc->direccion;
        $serie=$regc->serie;
        $correlativo=$regc->correlativo;
        $fecha=$regc->fecha;
        $puntos=$regc->puntos;
        $fechaCompleta=$regc->fechaCompleta;
        list($anno,$mes,$dia)=explode('-',$fecha);

        $horas = substr($fechaCompleta, -9);
       
        $total_puntos_descontados=$regc->total_puntos_descontados;

 ?>
    
        <!-- <page_header> -->


        <br><br>
            <table id="encabezado" align="center" width="100%">

                <tr>
                   
                    <!--<td style="text-align: center; font-size: 18px;font-weight:bold;"> <img style="width: 100%;" src="../files/perfil/logo01.png"></td>-->
                <td style="font-size: 20px;font-weight:bold; width: 100%;"><?php echo $razon_social ?></td>
                </tr>
                </table>
                <table id="encabezado" align="center" width="100%">
                <tr>
                    <td style="font-size: 10px;font-weight:bold; width: 100%;"> </td>
                </tr>
                  
                </table>
                <table id="encabezado" align="center" width="100%">

                 <tr>
                    <td></td>
                    <td style="text-align: center; width: 23%; ">&nbsp;</td>
                    <td style="text-align: center;">R.U.C.: <?php echo $rucp ?></td>
                </tr>
                 <tr>
                    <td></td>
                    <td style="text-align: center; width: 23%; ">&nbsp;</td>
                    <td style="text-align: center;"><?php echo $direccion ?></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center; width: 23%; ">&nbsp;</td>
                    <td style="text-align: center;"><?php echo $distrito.' - '.$provincia.' - '.$departamento ?></td>
                </tr>
                <!--<tr>
                    <td></td>
                    <td style="text-align: center; width: 23%; ">&nbsp;</td>
                    <td style="text-align: center;">Telf.: <?php echo $telefono ?></td>
                </tr>-->
            </table>
        <!-- </page_header> -->
        <!-- <page_footer>
        </page_footer> -->
        <table align="center" border="none"  width="100%">
                <!-- <tr>
                  <td>&nbsp;</td>
                </tr>   -->
                <tr>
                  <td style="padding-bottom: 7px">_______________________________________________</td>
                </tr>   
                <tr>
                  <td align="center" style="font-weight:bold;"><?php echo 'PUNTOS TICKET'; ?></td>
                </tr>  
                <tr>
                  <td align="center"><b><?php echo $serie.' - '.$correlativo ?></b></td>
                </tr>   
        </table>
        <table align="left" border="none"  width="100%" class="tab-c" style="margin-left: 8px;">
                 
              <tr  style="font-size: 11px;" align="left">
                  <td  align="left">FECHA:</td>
                <td> <?php echo strftime("%d de %B del %Y", strtotime($fecha)); ?></td>
                  <td align="right"></td>
                  <td>&nbsp;</td>
                </tr>  
                <tr  style="font-size: 11px;" align="left">
                    <td style="width: 50%;">CLIENTE:</td>
                    <td ><?php echo $cliente; ?></td>
                    <td></td>
                    <td></td>
                </tr> 
                <tr style="font-size: 11px;" align="left">
                    <td style="width: 50%;">D.N.I.:</td>
                    <td ><?php echo $ruc; ?></td>
                    <td></td>
                    <td></td>
                </tr> 
                
        </table>
        <table align="center" border="none"  width="100%">
                 
                <tr>
                  <td>---------------------------------------------------------------------------------</td>
                </tr>
        </table> 
        <div class="producto">
            <table border="" style="width: 100%;">
                <tr >
                    <th style="width: 1%; text-align:center"></th>
                    <th style="width: 45%; text-align:center">Descripción</th>
                    <th style="width: 11%; text-align:center">Cant.</th>
                    <th style="width: 20%; text-align:center">P. Prod.</th>
                    <th style="width: 20%; text-align: center;">subtotal</th>
                     <th style="width: 1%; text-align:center"></th>
                 </tr>
               </table>
            <table border="" style="width: 100%;">
                <tr>
                 <th style="width: 100%; text-align:center ">--------------------------------------------------------------------------------------------------</th>
             </tr>
            </table>
        </div>
       
        <div class="producto">         
            <table border="" style="width: 95%;">
                <tbody class="cuerpoM">
                <?php 
                    $cantidad=0;
                        while($regd=$rsptad->fetch_object()){
                        
                        $PuntosProd = $regd->puntos;
                        $subtotalPT= $regd->puntos*$regd->cantidad;
                        $TotalpuntosUtilizados= $regd->total_puntos_descontados;

                     ?>
                    <tr  style="text-align:left">
                        <td style="text-align: left; width: 2%"> </td>
                        <td style="width:45%;" ><?php echo $regd->producto; ?></td>
                        <td style="width:16%; text-align: center;">  &nbsp;&nbsp;&nbsp;<?php echo $regd->cantidad;  ?></td>
                        <td style="width:16%; text-align: right;"><?php echo number_format($PuntosProd); ?></td>
                        <td style="width:20%;  text-align: right;"><?php echo number_format($subtotalPT); ?>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                         <th style="width: 1%; text-align:center;"></th>
                    </tr>
                </tbody>
            </table>
            <table border="" style="width: 95%;">
               <tbody class="cuerpoM">


                    <?php 
                    $cantidad+=$regd->cantidad;

                } ?>
                    <tr  style="font-size: 9px; text-align:left">
                        <td style="width: 60%;"></td>
                        <td style="font-size: 9px;">Puntos Utilizadas:</td>
                        <td ><?php echo number_format($TotalpuntosUtilizados); ?></td>
                    </tr>
                </tbody>

            </table>

               <table border="" style="width: 90%;">

              <tr>
                    <th style="width: 5%; text-align:center"></th> 
                    <td style="font-size: 11px; width: 50%;">Puntos Restantes:</td> 
                    <td><?php echo round($puntos); ?></td>
                 </tr>
               </table>
               <table border="" style="width: 90%;">
             
               </table>
               
               <table border="" style="width: 100%;">
              <tr>
            
                    <td style="font-size: 13px; width: 100%;text-align:center">!!!!Siga Canjeando mas puntos !!!</td> 
                   
                 </tr>
               </table>
            <table border="" style="width: 100%;">
                <tr>
                 <!-- <th style="width: 100%; text-align:center ">--------------------------------------------------------------------------------------------</th> -->
             </tr>
            </table>
        </div>
            <table border="" style="width: 100%;">
                <tr>
                 <!-- <th style="width: 100%; text-align:center ">--------------------------------------------------------------------------------------------</th> -->
             </tr>
            </table>
            <table align="center" border="none"  width="100%">
                <tr>
                  <td>&nbsp;</td>
                </tr>  
                <tr>
                  <td>*******************************************************************</td>
                </tr> 
                 <tr>
                  <td align="center">
                        <?php 
                            require "phpqrcode/qrlib.php";    
                            $dir = 'temp_qrcode/';
                            
                            if (!file_exists($dir)){
                                mkdir($dir);
                            }
                            
                            $filename = $dir.$rucp.'-0'.$serie.'-'.$correlativo;
                         
                            $tamaño = 2; //Tamaño de Pixel
                            $level = 'Q'; //Precisión Baja
                            // L = Baja
                            // M = Mediana
                            // Q = Alta
                            // H= Máxima
                            $framSize = 1; //Tamaño en blanco
                            $contenido = $rucp.'|0'.$serie.'|'.$correlativo.'|'.$total_puntos_descontados.'|'.$fecha.'|'.$ruc.'|'; //Texto
                            
                                //Enviamos los parametros a la Función para generar código QR 
                            QRcode::png($contenido, $filename, $level, $tamaño, $framSize); 
                            
                                //Mostramos la imagen generada
                            echo '<img src="'.$dir.basename($filename).'" />';  
                         ?>
                      


                      
                  </td>
                </tr>  

                <tr>
                  <td align="center">¡¡ GRACIAS POR SU COMPRA VUELVA PRONTO !!</td>
                </tr>
               
             
            </table>  
            
            <div style="font-size: 7px;text-align: center;" class="foot">
			<p><b>** Representación Impresa de la Facturación Electrónica<br>Puede consultar en www.solucionesintegralesjb.com/boticab-m **</b></p>

		</div>

            <!-- <table >
                <tr>
                    <td style="text-align: left; width: 8%; height: 15">&nbsp;</td>
                    <td style="text-align: left; width: 65%"> <?php  ?></td>
                    <td style="width: 22%"> <?php echo $rucp; ?></td>
                    <td style="width: 5%"></td>
                </tr>
            </table> -->
            

        <!-- </div> -->

</page>