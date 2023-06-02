<?php
//Activar el almacenamiento en el buffer
ob_start();
session_start();

if (!isset($_SESSION["nombre"])) {
    header("Location:index.php");
} else {
    require 'header.php';

    if ($_SESSION['sucursales'] == 1) {

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
                                <h1 class="box-title">Consulta de Cambios de Sucursales</h1>
                                <div class="box-tools pull-right">
                                    <button class="btn btn-success" onclick="mostrarTabla()"><i class="fa fa-table"></i> Mostrar</button>
                                </div>
                            </div>
                            <!-- /.box-header -->
                            <!-- centro -->
                            <div class="panel-body table-responsive" id="listadoregistros" style="display: none;">
                                <table id="tbllistado" class="table table-striped table-bordered table-condensed table-hover">
                                    <thead>
                                        <th>ID</th>
                                        <th>Fecha</th>
                                        <th>Sucursal Anterior</th>
                                        <th>Sucursal Nueva</th>
                                        <th>Usuario</th>
                                    </thead>
                                    <tbody>
                                        <?php
                                        // Conexión a la base de datos (reemplaza los valores con los de tu configuración)
                                        $servername = "localhost";
                                        $username = "nombre_usuario";
                                        $password = "contraseña";
                                        $dbname = "nombre_base_de_datos";

                                        $conn = new mysqli($servername, $username, $password, $dbname);

                                        // Verificar la conexión
                                        if ($conn->connect_error) {
                                            die("Error de conexión: " . $conn->connect_error);
                                        }

                                        // Consulta de cambios de sucursales
                                        $sql = "SELECT * FROM cambios_sucursales";
                                        $result = $conn->query($sql);

                                        if ($result->num_rows > 0) {
                                            while ($row = $result->fetch_assoc()) {
                                                echo "<tr>";
                                                echo "<td>" . $row["id"] . "</td>";
                                                echo "<td>" . $row["fecha"] . "</td>";
                                                echo "<td>" . $row["sucursal_anterior"] . "</td>";
                                                echo "<td>" . $row["sucursal_nueva"] . "</td>";
                                                echo "<td>" . $row["usuario"] . "</td>";
                                                echo "</tr>";
                                            }
                                        } else {
                                            echo "<tr><td colspan='5'>No se encontraron resultados.</td></tr>";
                                        }

                                        // Cerrar la conexión
                                        $conn->close();
                                        ?>
                                    </tbody>
                                </table>
                            </div>
                            <!--Fin centro -->
                        </div><!-- /.box -->
                    </div><!-- /.col -->
                </div><!-- /.row -->
            </section><!-- /.content -->

        </div><!-- /.content-wrapper -->
        <!--Fin-Contenido-->

        <?php
    } else {
        require 'noacceso.php';
    }

    require 'footer.php';
    ?>

    <script>
        function mostrarTabla() {
            var tabla = document.getElementById("listadoregistros");
            tabla.style.display = "block";
        }
    </script>

    <?php
    ob_end_flush();
}
?>
