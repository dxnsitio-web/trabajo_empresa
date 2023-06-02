<?php

session_start();

require_once dirname(__FILE__).'/vendor/autoload.php';

use Spipu\Html2Pdf\Html2Pdf;
use Spipu\Html2Pdf\Exception\Html2PdfException;
use Spipu\Html2Pdf\Exception\ExceptionFormatter;

if (!isset($_SESSION["nombre"])) {
  echo 'Debe ingresar al sistema correctamente para visualizar el reporte';
} else {
  if ($_SESSION['administracion'] == 1) { 
    try {
      require_once "../modelos/Perfil.php";
      $perfil = new Perfil();
      $rspta = $perfil->cabecera_perfil();
      $reg = $rspta->fetch_object();
      $ruc = $reg->ruc;
      
      require_once "../modelos/Puntos.php";
      $puntos = new Puntos();
      $rsptac = $puntos->Puntoscabecera($_GET["id"]);
      $regc = $rsptac->fetch_object();
      $serie = $regc->serie;
      $correlativo = $regc->correlativo; 

      // Get the HTML content from a separate file
      ob_start();
      include dirname(__FILE__).'/comprobante_A4_Puntos.php';
      $content = ob_get_clean();

      // Create the PDF
      $html2pdf = new Html2Pdf('P', 'A4', 'es', true, 'UTF-8', 0);
      $html2pdf->pdf->SetDisplayMode('fullpage');
      $html2pdf->writeHTML($content);
      $html2pdf->output($ruc.'-'.'0'.$serie.'-'.$correlativo.'.pdf');
      
    } catch (Html2PdfException $e) {
      $html2pdf->clean();
      $formatter = new ExceptionFormatter($e);
      echo $formatter->getHtmlMessage();
    }
  } else {
    echo 'No tiene permiso para visualizar el reporte';
  }
}

ob_end_flush();