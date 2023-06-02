<?php
if(strlen(session_id()) < 1)
  session_start();
  date_default_timezone_set('America/Lima'); 

 ?>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>SISFARMA</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../public/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../public/css/font-awesome.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../public/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../public/css/_all-skins.min.css">
    <link rel="apple-touch-icon" href="../public/img/logo.ico">
    <link rel="shortcut icon" href="images/logo.png">

<!--   DATATABLES  -->
<link rel="stylesheet" type="text/css" href="../public/datatables/jquery.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="../public/datatables/buttons.dataTables.min.css">
<link rel="stylesheet" type="text/css" href="../public/datatables/responsive.dataTables.min.css">

<link rel="stylesheet" type="text/css" href="../public/css/bootstrap-select.min.css">
<link rel="stylesheet" type="text/css" href="../public/css/sweetalert.css">
<link rel="stylesheet" type="text/css" href="../public/css/principal.css">



  </head>
  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
<!-- -light -->
      <header class="main-header">

        <!-- Logo -->
        <a href="" class="logo">
          <!-- mini logo for sidebar mini 50x50 pixels -->
          <span class="logo-mini"> <img src="images/log2.png" /></span>
          <!-- logo for regular state and mobile devices -->
           <img src="images/logo_sis.jpg" alt="" />
        </a>

        <!-- Header Navbar: style can be found in header.less -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle titleheader" data-toggle="offcanvas" role="button">
            <span class="sr-only">Navegación </span> <b>&nbsp; &nbsp; SISTEMA VENTA - BOTICAS  </b>
          </a>
          <!-- Navbar Right Menu -->

          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <!-- Messages: style can be found in dropdown.less-->

              <!-- User Account: style can be found in dropdown.less -->
              <li class="dropdown user user-menu">
                <a href="#" data-toggle="dropdown">
                  <button id="btnAgregarArt" type="button" class="button button-user"> 
                    <img src="../files/usuarios/<?php echo $_SESSION['imagen']; ?>" class="user-image" alt="User Image">
                    <span class="hidden-xs"><?php echo $_SESSION['nombre']; ?></span>
                  </button>  
                </a>
                <ul class="dropdown-menu">
                  <!-- User image -->
                  <li class="user-header">
                    <img src="../files/usuarios/<?php echo $_SESSION['imagen']; ?>" class="img-circle" alt="User Image">
                    <p>
                      Usuario
                      <small></small>
                    </p>
                  </li>

                  <!-- Menu Footer-->
                  <li class="user-footer">

                    <div class="pull-right">
                      <a href="../ajax/usuario.php?op=salir" class="btn btn-default btn-flat">CERRAR SESSION</a>
                    </div>
                  </li>
                </ul>
              </li>

            </ul>
          </div>

          <div class="navbar-custom-menu" style="margin-top: 12px;">
                    <!-- <div class="form-group col-lg-7 col-md-7 col-sm-7 col-xs-12"> -->
            <a data-toggle="modal" href="#myModalMedicamentosVencer">
              <button id="btnAgregarArt" type="button" class="button button-orange"> <i class="fa fa-bell alerta" aria-hidden="true"></i>              
                <!-- <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-bell-fill" viewBox="0 0 16 16">
                  <path d="M8 16a2 2 0 0 0 2-2H6a2 2 0 0 0 2 2zm.995-14.901a1 1 0 1 0-1.99 0A5.002 5.002 0 0 0 3 6c0 1.098-.5 6-2 7h14c-1.5-1-2-5.902-2-7 0-2.42-1.72-4.44-4.005-4.901z"/>
                </svg>        &nbsp;Vencimiento -->
                <span class="hidden-xs">Vencimiento</span>
                
              </button>              
            </a>
          </div>

        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">
        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">
          <!-- sidebar menu: : style can be found in sidebar.less -->
          <ul class="sidebar-menu">
            <li class="header"></li>

  
            <?php
            if($_SESSION['escritorio']==1)
            {
              echo '<li>
                  <a href="escritorio.php">
                    <i class="fa fa-tasks"></i> <span>Escritorio</span>
                  </a>
                </li>';


            }
            ?>

            <?php
            if($_SESSION['almacen']==1)
            {
              echo '<li class="treeview">
                <a href="#">
                  <i class="fa fa-laptop"></i>
                  <span>Almacén</span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="articulo.php"><i class="fa fa-chevron-circle-right"></i>Registro Medicamentos</a></li>
                  <li><a href="productos.php"><i class="fa fa-chevron-circle-right"></i>Registro productos</a></li>
                  <li><a href="categoria.php"><i class="fa fa-chevron-circle-right"></i>Ubicacion</a></li>
                  <li><a href="precio-articulos.php"><i class="fa fa-chevron-circle-right"></i>Lista de Precios</a></li>
                  <li><a href="kardex.php"><i class="fa fa-chevron-circle-right"></i>Reporte de Kardex</a></li>
                </ul>
              </li>';


            }
            ?>


            <?php
            if($_SESSION['compras']==1)
            {
              echo '<li class="treeview">
                <a href="#">
                  <i class="fa fa-th"></i>
                  <span>Compras</span>
                   <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="ingreso.php"><i class="fa fa-chevron-circle-right"></i> Ingreso Medicamentos</a></li>
                  <li><a href="proveedor.php"><i class="fa fa-chevron-circle-right"></i>Registro de Proveedores</a></li>
                </ul>
              </li>';


            }
            ?>

            <?php
            if($_SESSION['ventas']==1)
            {
              echo '<li class="treeview">
                  <a href="#">
                    <i class="fa fa-shopping-cart"></i>
                    <span>Ventas</span>
                     <i class="fa fa-angle-left pull-right"></i>
                  </a>
                  <ul class="treeview-menu">
                    <li><a href="venta.php"><i class="fa fa-chevron-circle-right"></i> Factura y Boleta</a></li>
                    <li><a href="ticket.php"><i class="fa fa-chevron-circle-right"></i> Nota de venta</a></li>
                    <li><a href="notacredito.php"><i class="fa fa-chevron-circle-right"></i> Nota Credito</a></li>
                    <li><a href="cotizacion.php"><i class="fa fa-chevron-circle-right"></i> Proforma</a></li>
                    <!--<li><a href="proforma.php"><i class="fa fa-chevron-circle-right"></i> Cotizacion</a></li>-->
                    <li><a href="cliente.php"><i class="fa fa-chevron-circle-right"></i> Registro Clientes</a></li>
                  </ul>
                </li>';


            }
            ?>
           
            
            
            <?php
            if($_SESSION['consultac']==1)
            {
              echo '<li class="treeview">
                <a href="#">
                  <i class="fa fa-bar-chart"></i> <span>Consulta Compras</span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="comprasfecha.php"><i class="fa fa-chevron-circle-right"></i> Consulta Compras</a></li>
                </ul>
              </li>';


            }
            ?>
            <?php
            if($_SESSION['consultav']==1)
            {
              echo '<li class="treeview">
                    <a href="#">
                      <i class="fa fa-bar-chart"></i> <span>Consulta Ventas</span>
                      <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                      <li><a href="ventasfechacliente.php"><i class="fa fa-chevron-circle-right"></i>Ventas por Cliente</a></li>
                      <li><a href="ventasfechausuario.php"><i class="fa fa-chevron-circle-right"></i>Ventas por Usuario</a></li>
                      <li><a href="reporte-general.php"><i class="fa fa-chevron-circle-right"></i> Reporte General</a></li>
                      <li><a href="venta_mensual.php"><i class="fa fa-chevron-circle-right"></i>Reporte Venta Mensual</a></li>
                      <li><a href="reporte-mensual.php"><i class="fa fa-chevron-circle-right"></i> Producto mas Vendido </a></li>
                      <li><a href="consultaCotizacion.php"><i class="fa fa-chevron-circle-right"></i>Proforma</a></li>
                      

                    </ul>
                  </li>';


            }
            ?>
            <?php
            if($_SESSION['acceso']==1)
            {
              echo '<li class="treeview">
                <a href="#">
                  <i class="fa fa-key"></i> <span>Acceso</span>
                  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="usuario.php"><i class="fa fa-chevron-circle-right"></i> Usuarios</a></li>
                  <li><a href="permiso.php"><i class="fa fa-chevron-circle-right"></i> Permisos</a></li>

                </ul>
              </li>';


            }
            ?>
            <?php
              if($_SESSION['administracion']==1)
              {
                echo '<li class="treeview">
                    <a href="#">
                      <i class="fa fa-user"></i>
                      <span>Administracion</span>
                      <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                      <li><a href="puntos.php"><i class="fa fa-chevron-circle-right"></i> Puntos</a></li>
                      <li><a href="mant-producto.php"><i class="fa fa-chevron-circle-right"></i>Mant.Productos</a></li>
                      
                    </ul>
                  </li>';


              }
              ?>
            <?php
            if($_SESSION['contabilidad']==1)
            {
              echo  '<li class="treeview">
                    <a href="#">
                    <i class="fa fa-calculator"></i><span> Contabilidad</span>
                      <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">  
                    <li><a href="reporte-contable.php"><i class="fa fa-chevron-circle-right"></i> Reporte Contable</a></li>
                    <li><a href="reporte_notacredito.php"><i class="fa fa-chevron-circle-right"></i> Reporte Nota de Credito</a></li>
                   
                    </ul>
                  </li>';
            }
            ?> 

            <!--<?php
            if($_SESSION['consultav']==1)
            {
              echo '<li class="treeview">
                    <a href="#">                     
                      <i class="fa fa-file-pdf-o"></i><span>Consulta en Linea</span>
                      <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                      <li><a href="http://solucionesintegralesjb.com/gamervision/" target="_blank"><i class="fa fa-chevron-circle-right"></i> Consultar comprobante</a></li> 
                    </ul>
                  </li>';


            }
            ?>  -->          
               
              
              
              <?php
                if ($_SESSION['configuraciones'] == 1) {
                  echo '<li class="treeview">
                          <a href="#">
                            <i class="fa fa-cog"></i> <span>Configuraciones</span>
                            <i class="fa fa-angle-left pull-right"></i>
                          </a>
                          <ul class="treeview-menu">
                          <li><a href="configuraciones.php"><i class="fa fa-chevron-circle-right"></i>Perfil de Empresa</a></li>
                      
                      
                    </ul>
                        </li>';
                }
                ?>

        


           <!--  <li>
              <a href="#">
                <i class="fa fa-plus-square"></i> <span>Ayuda</span>
                <small class="label pull-right bg-red">PDF</small>
              </a>
            </li> -->
            

          </ul>
        </section>
        <!-- /.sidebar -->
      </aside>

      <div class="modal fade" id="myModalMedicamentosVencer" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 65% !important;">
      <div class="modal-content">
        <div class="modal-header backColor">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title">Medicamentos a Vencer</h4>
        </div>
        <div class="modal-body table-responsive">
          <table id="tblarticulosvencer" class="table  table-striped table-bordered table-condensed table-hover">
            <thead>
                <th>Descripcion</th>
                <th>Laboratorio</th>
                <th>Ubicacion</th>
                <th>Unidad Medida</th>
                <th>Cantidad</th>
                <th>Fecha Vencimiento</th>
                <th>Lote</th>
                <th>Precio Venta</th>                            
                <th>Estado</th>
            </thead>
            <tbody>

            </tbody>
            <tfoot>
            <th>Opciones</th>
                <th>Nombre</th>
                <th>U. Medida</th>
                <th>Laboratorio</th>
                <th>Compuesto</th>
                <th>Stock</th>
                <th>Precio Venta</th>
                <th>Controlados</th>
                <th>Afectacion</th>
            </tfoot>
          </table>
              
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
        </div>
      </div>
    </div>
  </div>

  <script>
    // Función para mostrar la ventana modal
    function mostrarModal() {
      $('#myModalMedicamentosVencer').modal('show');
    }

    
    //Llamar a la función para mostrar la ventana modal automáticamente al cargar la página

    const fecha_vencer = sessionStorage.getItem('fecha_vencer');
    if (fecha_vencer==1){
      window.onload = function() {
        mostrarModal();
        sessionStorage.setItem('fecha_vencer', 2);
      };      
    }

  </script>