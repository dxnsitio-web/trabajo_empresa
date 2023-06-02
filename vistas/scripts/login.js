$('#frmAcceso').on('submit', function(e) {
  e.preventDefault();
  logina = $("#logina").val();
  clavea = $("#clavea").val();

  $.post("../ajax/usuario.php?op=verificar", {"logina": logina, "clavea": clavea}, function(data) {
    if (data !== "null") {
      $(location).attr("href", "escritorio.php");
    } else {
       // bootbox.alert("usuario y/o password incorrectos");
      swal({
        title: "ERROR",
        text: "¡Usuario y/o contraseña incorrectos!",
        icon: "error",
        button: false,
        timer: 1000
      });
      // $("#mens").text("usuario y/o password incorrectos");
        // $("#mens").css({"color":"white","font-size":"17px"});
    }
  });
});
function togglePasswordVisibility() {
  var passwordInput = document.getElementById("clavea");
  var togglePassword = document.querySelector(".toggle-password");

  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    togglePassword.innerHTML = '<i class="zmdi zmdi-eye"></i>';
  } else {
    passwordInput.type = "password";
    togglePassword.innerHTML = '<i class="zmdi zmdi-eye-off"></i>';
  }
}

// Mostrar el ícono oculto con la flecha por defecto
var togglePassword = document.querySelector(".toggle-password");
togglePassword.innerHTML = '<i class="zmdi zmdi-eye-off"></i>';

// Controlador de eventos para el campo de contraseña
var passwordInput = document.getElementById("clavea");
passwordInput.addEventListener("input", function() {
  var togglePassword = document.querySelector(".toggle-password");

  if (passwordInput.value !== "") {
    togglePassword.style.display = "inline-block";
  } else {
    togglePassword.style.display = "none";
    passwordInput.type = "password"; // Asegurar que la contraseña esté oculta cuando se borra el texto
  }
});



