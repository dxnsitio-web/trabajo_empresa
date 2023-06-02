<?php 
    ob_start();

  session_start();
  
    if(isset($_SESSION['nombre'])){
      header("Location:escritorio.php");
    }else{
 ?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>SISFARMA</title>
    <link rel="shortcut icon" href="images/logo.png">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <script src="js/sweet-alert.min.js"></script>
    <link rel="stylesheet" href="css/sweet-alert.css">
    <link rel="stylesheet" href="css/material-design-iconic-font.min.css">
    <link rel="stylesheet" href="css/normalize.css">
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/jquery.mCustomScrollbar.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/login.css">
    <!-- <link rel="stylesheet" type="text/css" href="../public/css/sweetalert.css"> -->


    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/jquery-1.11.2.min.js"><\/script>')</script>
    <script src="js/modernizr.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/main.js"></script>
</head>
<body class="full-cover-background" style="background-image:url(assets/img/fondo_login.jpg);width: 100%; height: 100%;">
  <div class="box">
    <div class="form-container"><h2 align="center" style="font-weight: 900; color: #1D3A67;";>SISTEMA FARMACEÚTICA<br> FACTURACIÓN ELECTRÓNICA <br>
    
   </h2>
        <p class="text-center" style="margin-top: 17px;">
           <i class=""><img src="images/login.png"></i>
       </p>
       <h4 class="text-center all-tittles" style="margin-bottom: 30px; color: black">inicia sesión con tu cuenta</h4>
       <form method="post" id="frmAcceso">
            <div class="group-material-login">
              <input type="text" id="logina" name="logina" class="material-login-control" required="" maxlength="70">
              <span class="highlight-login"></span>
              <span class="bar-login"></span>
              <label><i class="zmdi zmdi-account"></i> &nbsp; Usuario</label>
            </div><br>
            <div class="group-material-login">
          <input type="password" id="clavea" name="clavea" class="material-login-control" required="" maxlength="70">
          <span class="highlight-login"></span>
          <span class="bar-login"></span>
          <label><i class="zmdi zmdi-lock"></i> &nbsp; Contraseña</label>
          <span class="toggle-password" onclick="togglePasswordVisibility()"><i class="zmdi zmdi-eye"></i></span>
        </div>
            <div id="mens" class="label label-default "></div>
            <button class="btn-login" type="submit">Ingresar &nbsp; <i class="zmdi zmdi-arrow-right"></i></button>
        </form>
    </div>
    </div>
    <script type="text/javascript" src="scripts/login.js"></script>
    <!-- <script src="../public/js/sweetalert.min.js"></script> -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script>sessionStorage.setItem('fecha_vencer', 1);</script> 
</body>
</html>

<?php
  }
?>