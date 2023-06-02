<?php
ob_start();
session_start();
	require_once("../config/conexion.php");
	require 'header.php';
    if ($_SESSION['configuracion'] == 1) {
		
	$sqll="SELECT * FROM perfil where idperfil='1' ";
	$quer=mysqli_query($conexion,$sqll);
	$row=mysqli_fetch_array($quer);
	
?>
      <div class="content-wrapper">        
        <section class="content">
            <div class="row">
              <div class="col-md-12">
                  <div class="box">
                    <div class="box-header with-border">
                          <h1 class="box-title">Configuración </h1>
                     <!--      <button class="btn btn-success" id="btnAgregar" onclick="mostrarForm(true)"><i class="fa fa-plus-circle"></i> Agregar</button></h1>
                        <div class="box-tools pull-right">
                        </div> -->
                    </div>
                    <!-- /.box-header -->
                    <!-- centro -->
                    
                    <div class="panel-body"  id="formularioRegistros">

                      <form action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>" method="post" id="perfil" ">
				        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 toppad" >


				          <div class="panel ">
				           <!--  <div class="panel-heading">
				              <h3 class="panel-title"><i class='glyphicon glyphicon-cog'></i> Configuración</h3>
				            </div> -->
				            <div class="panel-body">
				              <div class="row">

				                <div class="col-md-3 col-lg-3 " align="center">
								<div id="load_img">
									<img name="logo" class="img-responsive" src="../files/perfil/<?php echo $row['logo']; ?>" alt="Logo" width="300px">

								</div>
								<br>
									<div class="row">
				  						<div class="col-md-12">
											<div class="form-group">
												<input class='filestyle' data-buttonText="Logo" type="file" name="imagefile" id="imagefile" onchange="upload_image();">
											</div>
										</div>

									</div>
								</div>
				                <div class=" col-md-9 col-lg-9 ">
				                  <table class="table table-condensed">
				                    <tbody>
				                      <tr>
				                        <td class='col-md-3'>Razon Social:</td>
				                        <td><input type="text" class="form-control input-sm" name="razon_social" value="<?php echo $row['razon_social']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td class='col-md-3'>Nombre Comercial:</td>
				                        <td><input type="text" class="form-control input-sm" name="nombre_comercial" value="<?php echo $row['nombre_comercial']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td class='col-md-3'>RUC:</td>
				                        <td><input type="text" class="form-control input-sm" name="ruc" value="<?php echo $row['ruc']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td class='col-md-3'>Dirección:</td>
				                        <td><input type="text" class="form-control input-sm" name="direccion" value="<?php echo $row['direccion']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td>Distrito:</td>
				                        <td><input type="text" class="form-control input-sm" name="distrito" value="<?php echo $row['distrito']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td>Provincia:</td>
				                        <td><input type="text" class="form-control input-sm" name="provincia" value="<?php echo $row['provincia']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td>Departamento:</td>
				                        <td><input type="text" class="form-control input-sm" name="departamento" value="<?php echo $row['departamento']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td>Código postal:</td>
				                        <td><input type="text" class="form-control input-sm" name="codigo_postal" value="<?php echo $row["codigo_postal"];?>"></td>
				                      </tr>
				                      <tr>
				                        <td>Teléfono:</td>
				                        <td><input type="text" class="form-control input-sm" name="telefono" value="<?php echo $row['telefono']?>" required></td>
				                      </tr>
				                      <tr>
				                        <td>Correo electrónico:</td>
				                        <td><input type="email" class="form-control input-sm" name="email" value="<?php echo $row['email']?>" ></td>
				                      </tr>
				                      <tr>
				                        <td>Pais:</td>
				                        <td><input type="text" class="form-control input-sm" name="pais" value="<?php echo $row['pais']?>" ></td>
				                      </tr>
									  
									
									  



				                    </tbody>
				                  </table>
					                	</div>
									<div class='col-md-12' id="resultados_ajax"></div><!-- Carga los datos ajax -->
					              </div>
					            </div>
					                 <div class="panel-footer text-center">
					                <button type="submit" class="btn btn-sm btn-success"><i class="glyphicon glyphicon-refresh"></i> Actualizar datos</button>
				                    </div>
					          	</div>
					        </div>
						</form>

                </div>
                       


                    </div>
                  </div>
              </div>
          </div>
      </section><!-- /.content -->

    </div><!-- /.content-wrapper -->

	<?php
    } else {
        require 'noacceso.php';
    }

    require 'footer.php';
    ?>
<script>
$( "#perfil" ).submit(function( event ) {
  $('.guardar_datos').attr("disabled", true);

 var parametros = $(this).serialize();
	 $.ajax({
			type: "POST",
			url: "editar_config.php",
			data: parametros,
			 beforeSend: function(objeto){
				$("#resultados_ajax").html("Mensaje: Cargando...");
			  },
			success: function(datos){
			$("#resultados_ajax").html(datos);
			$('.guardar_datos').attr("disabled", false);

		  }
	});
  event.preventDefault();
})


 </script>
 <script>
		function upload_image(){

				var inputFileImage = document.getElementById("imagefile");
				var file = inputFileImage.files[0];
				if( (typeof file === "object") && (file !== null) )
				{
					$("#load_img").text('Cargando...');
					var data = new FormData();
					data.append('imagefile',file);


					$.ajax({
						url: "imagen_config.php",        // Url to which the request is send
						type: "POST",             // Type of request to be send, called as method
						data: data, 			  // Data sent to server, a set of key/value pairs (i.e. form fields and values)
						contentType: false,       // The content type used when sending data to the server.
						cache: false,             // To unable request pages to be cached
						processData:false,        // To send DOMDocument or non processed data file it is set to false
						success: function(data)   // A function to be called if request succeeds
						{
							$("#load_img").html(data);

						}
					});
				}


			}
  </script>
