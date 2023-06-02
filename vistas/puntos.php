<?php
//Activamos el almacenamiento en el buffer
ob_start();
session_start();

if (!isset($_SESSION["nombre"]))
{
  header("Location: index.php");
}
else
{
require 'header.php';

if ($_SESSION['administracion']==1)
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
                          <h1 class="box-title">
                           Puntos &nbsp;&nbsp;<button class="btn btn-success" id="btnagregar" onclick="mostrarform(true)">
                              <i class="fa fa-plus-circle"></i>&nbsp;&nbsp;Agregar</button></h1>
                              <a target="_blank" href="cliente.php"> <button class="btn btn-success">Clientes</button></a>
                             <!-- <a target="_blank" href="cotizacion.php"> <button class="btn btn-info">Proforma</button></a>-->
                        <div class="box-tools pull-right">
                        </div>
                    </div>

                    <!-- /.box-header -->
                    <!-- centro -->
                    <div class="panel-body table-responsive" id="listadoregistros">
                        <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover">
                          <thead>
                            <th>Opciones</th>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Usuario</th>
                            <th>Numero</th>
                            <th>Puntos Descontados</th>
                            <th>Total Puntos</th>
                            <th>Estado</th>
                          </thead>
                          <tbody>
                          </tbody>
                          <tfoot>
                            <th>Opciones</th>
                            <th>Fecha</th>
                            <th>Cliente</th>
                            <th>Usuario</th>
                            <th>Numero</th>
                            <th>Puntos Descontados</th>
                            <th>Total Puntos</th>
                            <th>Estado</th>
                          </tfoot>
                        </table>
                    </div>
                    <div class="panel-body" style="" id="formularioregistros">
                        <form name="formulario" id="formulario" method="POST">
                          <div class="form-group col-lg-7 col-md-7 col-sm-7 col-xs-12">
                            <label>Cliente(*):</label>
                            <input type="hidden" name="idventa" id="idventa">
                            <select id="idcliente" name="idcliente" class="form-control selectpicker" data-live-search="true" required  data-style="btn-default" title="Seleccione cliente">

                            </select>
                          </div>
                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Puntos Descontados:</label>
                            <input type="text" class="form-control" name="total_puntos" id="total_puntos" required="" readonly>
                          </div>
                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Total Puntos:</label>
                            <input type="text" class="form-control" name="puntos" id="puntos" required="" readonly>
                          </div>
                         
                          
                          
                          <div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label>Numero de documento:</label>
                            <input type="text" class="form-control" name="numdireccion" id="numdireccion" placeholder="Numero de documento">
                          </div>
                           <div class="form-group col-lg-4 col-md-4 col-sm-4 col-xs-12">
                            <label>Dirección:</label>
                            <input type="text" class="form-control" name="direccioncliente" id="direccioncliente" placeholder="Dirección">
                          </div>

                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Fecha(*):</label>
                            <input type="date" class="form-control" name="fecha" id="fecha" required="" readonly>
                          </div>
                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Puntos Restantes:</label>
                            <input type="text" class="form-control" name="total_puntos_restantes" id="total_puntos_restantes" required="" readonly>
                          </div>
                         
                          <div class="form-group col-lg-7 col-md-7 col-sm-7 col-xs-12">
                            <a data-toggle="modal" href="#myModal">
                              <button id="btnAgregarArt" type="button" class="btn btn-primary"> <span class="fa fa-plus"></span>&nbsp;&nbsp;Agregar Producto</button>
                            </a>
                          </div>
                      <!--     <div class="form-group col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label>Serie:</label>
                            <input type="text" class="form-control" name="serie" id="serie" maxlength="4" placeholder="Serie">
                          </div>
                          <div class="form-group col-lg-2 col-md-2 col-sm-2 col-xs-12">
                            <label>Correlativo:</label>
                            <input type="text" class="form-control" name="correlativo" id="correlativo" maxlength="8" placeholder="Número" >
                          </div> -->
                          <div class="table-responsive col-lg-12 col-sm-12 col-md-12 col-xs-12">
                            <table id="detalles" class="table table-striped table-bordered table-condensed table-hover">
                              <thead style="background-color:#1a87b6">
                                <th>Opciones</th>
                                <th>Nombre</th>
                                <th>Codigo</th>
                                <th>Cantidad</th>
                                <th>Puntos Utilizar</th>
                                <th>Total Puntos</th>  
                                
                                </thead>
                                <!-- <tfoot>
                                    <th>TOTAL</th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th></th>
                                    <th><h4 id="total">S/. 0.00</h4><input type="hidden" name="total_venta" id="total_venta"></th>
                                </tfoot> -->
                                <tfoot>
                                   <!-- <tr>
                                  <th colspan="3"></th>
                                    <th colspan="2">TOTAL PUNTOS RESTANTES</th>
                                    <th><h4 id="totalg">0.00</h4><input type="hidden" name="total_puntos_restantes" id="total_puntos_restantes"></th>
                                    </tr>-->
                                   
                                   <tr>
                                    <th style="height:2px;" colspan="3"></th>
                                    <th style="height:2px;" colspan="2">TOTAL PUNTOS UTILIZADOS</th>
                                    <th style="height:2px;"><h4 id="totalimp">0.00</h4><input type="hidden" name="total_puntos_descontados" id="total_puntos_descontados"></th>
                                   </tr>
                                </tfoot>
                                    
                                <tbody>

                                </tbody>
                            </table>
                          </div>

                          <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <button class="btn btn-primary" type="submit" id="btnGuardar"><i class="fa fa-save"></i>&nbsp;&nbsp; Guardar</button>

                            <button id="btnCancelar" class="btn btn-danger" onclick="cancelarform()" type="button"><i class="fa fa-arrow-circle-left"></i> &nbsp;&nbsp;Cancelar</button>
                          </div>
                          
                        </form>
                    </div>
                    <!--Fin centro -->
                  </div><!-- /.box -->
              </div><!-- /.col -->
          </div><!-- /.row -->
      </section><!-- /.content -->

    </div>
    <!-- /.content-wrapper -->
  <!--Fin-Contenido-->

  <!-- Modal -->
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-dialog"   >
      <div class="modal-content"style="width: 95%; height: 100%;">
        <div class="modal-header backColor">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Seleccione un Producto</h4>
        </div>
        <div class="modal-body table-responsive">
          <table id="tblproductos" class="table  table-striped table-bordered table-condensed table-hover">
            <thead>
                <th>Opciones</th>
                <th>Producto</th>
                <th>Codigo</th>
                <th>Stock</th>
                <th>Puntos</th>
                <th>Condicion</th>
                
            </thead>
            <tbody>

            </tbody>
            <tfoot>
              <th>Opciones</th>
                <th>Producto</th>
                <th>Codigo</th>
                <th>Stock</th>
                <th>Puntos</th> 
                <th>Condicion</th>
            </tfoot>
          </table>
              
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Fin modal -->
<?php
}
else
{
  require 'noacceso.php';
}

require 'footer.php';
?>
<script type="text/javascript" src="scripts/puntos.js"></script>
<?php
}
ob_end_flush();
?>
  
