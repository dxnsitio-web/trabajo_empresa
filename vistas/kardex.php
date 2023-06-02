<?php
//Activar el almacenamiento en el buffer
ob_start();
session_start();

if(!isset($_SESSION["nombre"]))
{
  header("Location:index.php");
}
else {
require 'header.php';

if($_SESSION['almacen']==1)
{



 ?>
 <!--Contenido-->
       <!-- Content Wrapper. Contains page content -->
       <div class="content-wrapper">

         <!-- Main content -->
         <section class="content">
             <div class="row">
               <div class="col-md-12">
                   <div class="box">
                     <div class="box-header with-border">
                           <h1 class="box-title">REPORTE DE KARDEX</h1>
                         <div class="box-tools pull-right">
                         </div>
                     </div>
                     <!-- /.box-header -->
                     <!-- centro -->
                     <div class="panel-body table-responsive"  id="listadoregistros">

                     <div class="form-group col-lg-6 col-md-6 col-sm-6 col-xs-12" style="display: inline;">
                      <a target="_blank" href="../reportes/reporteKardex.php">
                          <button class="btn btn-success"><i class="fa fa-file"></i> &nbsp;REPORTE</button>
                      </a>
                      &nbsp;&nbsp;
                      <a href="#modalKardex" data-toggle="modal" class="btn btn-success" style="margin-left: -4px;">REINICIAR</a>
                      </div>  


                       <span id="loading"></span>
                     <!-- </div> -->



                        <table id="tbllistado" class="table  table-bordered table-condensed table-hover">
                          <thead>
                            <th>Descripcion</th>
                            <th>Laboratorio</th>
                            <th>Lote Nº</th>
                            <th>Ubicacion</th>
                            <th>U. Medida</th>
                            <th>Entrada</th>
                            <th>Salida</th>
                            <th>stock</th>

                          </thead>
                          <tbody>

                          </tbody>
                          <tfoot>
                            <th>Descripcion</th>
                            <th>Laboratorio</th>
                            <th>Lote Nº</th>
                            <th>Ubicacion</th>
                            <th>U. Medida</th>
                            <th>Entrada</th>
                            <th>Salida</th>
                            <th>Stock</th>

                          </tfoot>
                        </table>
                     </div>


           <!-- Modal -->
            <div class="modal fade modalKardex" tabindex="-1" id="modalKardex" role="dialog">
              <div class="modal-dialog modal-dialog-centered modal-sm" >
                <div class="modal-content">
                  <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    <h5 class="modal-title" id="exampleModalLabel">AVISO IMPORTANTE!</h5>
                  </div>
                  <div class="modal-body ">
                      
                      <div class="col-sm-12 col-xs-12">
                        <p>
                          ¿Está seguro de reiniciar el kardex?
                        </p>
                      </div>

                  </div>
                  <div class="modal-footer">
                 <!--  ¿Ya tienes una cuenta registrada? | <strong><a href="#modalIngreso" data-dismiss="modal" data-toggle="modal">Ingresar</a></strong> -->
                 <button type="submit" class="btn btn-success" onclick="reiniciar();" data-dismiss="modal">Aceptar</button>
                 <button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
                  </div>
                </div>
              </div>
            </div>
<!-- Fin modal -->
                     <!--Fin centro -->
                   </div><!-- /.box -->
               </div><!-- /.col -->
           </div><!-- /.row -->
       </section><!-- /.content -->

     </div><!-- /.content-wrapper -->
   <!--Fin-Contenido-->

   <?php
   }
   else {
     require 'noacceso.php';
  }



require 'footer.php';

    ?>

    <script type="text/javascript" src="scripts/kardex.js">
    </script>

<?php
}
ob_end_flush();

 ?>
