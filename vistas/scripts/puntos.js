var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();
	// $('#impuesto').prop('disabled',true);
    

	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);
	});
	//Cargamos los items al select proveedor
	$.post("../ajax/puntos.php?op=selectCliente", function(r){
	            $("#idcliente").html(r);
	            $('#idcliente').selectpicker('refresh');
	});

	      $("#idcliente").change(rellenarCliente);

}
function rellenarCliente() {
	var clientee= $("#idcliente").val();
	var idcliente=$("#idcliente").prop("selected",true);
  
	if (idcliente) {
	  // Obtener datos del cliente
	  $.post("../ajax/puntos.php?op=mostrarDatoCliente", { idcliente: clientee}, function(data) {
		data = JSON.parse(data);

		$("#numdireccion").val(data.num_documento);
		$("#direccioncliente").val(data.direccion);
		$("#puntos").val(data.puntos);
		$("#total_puntos_restantes").val(data.puntos);
		$.post("../ajax/puntos.php?op=mostrarPuntosDescontados", { idcliente: clientee }, function(data2) {
		  data2 = JSON.parse(data2);
		  $("#total_puntos").val(data2.total_puntos_descontados);
		  calcularTotal = parseInt(data2.total_puntos_descontados);

		});
	  });
	}
}

  

function LPad(ContentToSize,PadLength,PadChar)
  {
     var PaddedString=ContentToSize.toString();
     for(var i=ContentToSize.length+1;i<=PadLength;i++)
     {
         PaddedString=PadChar+PaddedString;
     }
     return PaddedString;
  }




function limpiar()
{
	$("#idcliente").val("");
	$("#cliente").val("");
	$("#correlativo").val("");
	$("#puntos").val("");
	$(".filas").remove();
	$("#total_puntos").val("");
	$("#totalimp").html("0");
	$("#total_puntos_descontados").val("");
	$("#total_puntos_restantes").val("");
	$("#numdireccion").val("");
			$("#direccioncliente").val("");
	//Obtenemos la fecha actual
	var now = new Date();
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);
	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $('#fecha').val(today);

    //Marcamos el primer tipo_documento
   
}

//Función mostrar formulario
function mostrarform(flag)
{
	limpiar();
	if (flag)
	{
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		//$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
		listarProductos();

		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").show();
		detalles=0;
	}
	else
	{
		$("#listadoregistros").show();
		$("#formularioregistros").hide();
		$("#btnagregar").show();
	}
}

//Función cancelarform
function cancelarform()
{
	limpiar();
	mostrarform(false);
}

//Función Listar
function listar()
{
	tabla=$('#tbllistado').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [
		            'copyHtml5',
		            'excelHtml5',
		            'csvHtml5',
		            'pdf'
		        ],
		"ajax":
				{
					url: '../ajax/puntos.php?op=listar',
					type : "get",
					dataType : "json",
					error: function(e){
						console.log(e.responseText);
					}
				},
		"bDestroy": true,
		"iDisplayLength": 10,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}


//Función ListarArticulos
function listarProductos()
{
	tabla=$('#tblproductos').dataTable(
	{
		"aProcessing": true,//Activamos el procesamiento del datatables
	    "aServerSide": true,//Paginación y filtrado realizados por el servidor
	    dom: 'Bfrtip',//Definimos los elementos del control de tabla
	    buttons: [

		        ],
		"ajax":
				{
					url: '../ajax/puntos.php?op=listarProductos',
					type : "get",
					dataType : "json",
					error: function(e){
						console.log(e.responseText);
					}
				},
		"bDestroy": true,
		"iDisplayLength": 5,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
	}).DataTable();
}
//Función para guardar o editar

function guardaryeditar(e)
{
	e.preventDefault(); //No se activará la acción predeterminada del evento
	//$("#btnGuardar").prop("disabled",true);
	var formData = new FormData($("#formulario")[0]);

	$.ajax({
		url: "../ajax/puntos.php?op=guardaryeditar",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {
	          // bootbox.alert(datos);
	        if(datos !="" || datos !=null){
		        swal({
				  title: "BIEN!",
				  text: "¡"+datos+"!",
				  type:"success",
				  confirmButtonText: "Cerrar",
				  closeOnConfirm: true
				},

				function(isConfirm){

					if(isConfirm){
						// history.back();
						mostrarform(false);
		          		listar();
					}
				});

	        }else{
	        	swal({
				  title: "Error!",
				  text: "¡Ocurrio un error, por favor registre nuevamente la venta!",
				  type:"warning",
				  confirmButtonText: "Cerrar",
				  closeOnConfirm: true
				},

				function(isConfirm){

					if(isConfirm){
						location.reload(true);
					}
				});
	        }

	       

	    }

	});
	limpiar();
}



//Función para anular registros
function anular(id_puntos)
{
	bootbox.confirm("¿Está Seguro de anular  ?", function(result){
		if(result)
        {
        	$.post("../ajax/puntos.php?op=anular", {id_puntos : id_puntos}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});
        }
	})
  limpiar();
}

//Declaración de variables necesarias para trabajar con las compras y
//sus detalles
var cont = 1; // Se recomienda declarar e inicializar todas las variables al inicio de la función.
var detalles = 0;
var total_puntos_descontados = 0;

function agregarDetalle(id_producto, nombre, codigo, puntos_prod) {
	var cantidad = 1;
  
	if (id_producto !== "") {
	  // Calcular el subtotal
	  var subtotal = cantidad * puntos_prod;
  
	  // Crear la fila del detalle
	 // Se recomienda utilizar comillas simples para el HTML dentro del JavaScript
	var fila = '<tr class="filas" id="fila' + cont + '">' +
	'<td><button type="button" class="btn btn-danger" onclick="eliminarDetalle(' + cont + ')">X</button></td>' +
	'<td><input type="hidden" name="id_producto[]" value="' + id_producto + '">' + nombre + '</td>' +
	'<td><input type="hidden" name="codigo[]" value="' + codigo + '">' + codigo + '</td>' +
	'<td><input type="number" name="cantidad[]" id="cantidad' + cont + '" min="1" value="' + cantidad + '" style="width:50px"></td>' +
	'<td><input type="hidden" name="puntos_prod[]" value="' + puntos_prod + '">' + puntos_prod + '</td>' +
	'<td><span name="subtotal" id="subtotal' + cont + '">' + subtotal + '</span></td>' +
	'</tr>';

  
	  // Incrementar el contador de detalles y agregar la fila al final de la tabla de detalles
	  detalles++;
	  $("#detalles").append(fila);
  
	  // Agregar eventos para modificar los subtotales cuando cambien la cantidad o los puntos_prod del detalle
	  $("#cantidad" + cont).keyup(modificarSubtotales);
	  $("#cantidad" + cont).change(modificarSubtotales);
  
	  $("#puntos_prod" + cont).keyup(modificarSubtotales);
	  $("#puntos_prod" + cont).change(modificarSubtotales);
  
	  cont++;
  
	  var puntos_restantes = parseInt($("#total_puntos_restantes").val());
	  if (puntos_restantes < puntos_prod) {
		alert("Puntos insuficientes");
		eliminarDetalle(cont - 1); // Eliminar la última fila agregada
	  } else {
		
		modificarSubtotales();
	  }
	} else {
	  alert("Error al ingresar el detalle, revisar los datos del producto");
	}
}



function modificarSubtotales() {
    var cant = document.getElementsByName("cantidad[]");
    var punt = document.getElementsByName("puntos_prod[]");
    var sub = document.getElementsByName("subtotal");

	calcular=calcularTotal;
     var total_puntos_descontados = 0;
    for (var i = 0; i < cant.length; i++) {
        var cantidad = parseInt(cant[i].value);
        var puntos_prod = parseInt(punt[i].value);
        var subtotal = cantidad * puntos_prod;
        sub[i].innerHTML = subtotal;
		total_puntos_descontados += subtotal;
		calcular+= subtotal;
    }

    $("#totalimp").html(addCommas(total_puntos_descontados));
    $('#total_puntos_descontados').val(total_puntos_descontados);
	
	$('#total_puntos').val(calcular);

    // Restar los puntos descontados del total de puntos del cliente
    var puntos_actuales = parseInt($("#puntos").val());
    var puntos_restantes = puntos_actuales - total_puntos_descontados;

    if (puntos_restantes <0) {
        alert("No tienes suficientes puntos para realizar esta compra");
        $("#btnGuardar").prop("disabled", true);
        $('#total_puntos_restantes').val('0');
    } else {
        $("#btnGuardar").prop("disabled", false); // Activar el botón
        $('#btnagregar').prop('disabled', false); // Activar el botón
        $("#totalg").html(addCommas(puntos_restantes)); // Mostrar los puntos restantes
        $('#total_puntos_restantes').val(puntos_restantes); // Actualizar el campo oculto con los puntos restantes
    }

    evaluar();
}



  function addCommas(nStr)
	{
		nStr += '';
		x = nStr.split('.');
		x1 = x[0];
		x2 = x.length > 1 ? '.' + x[1] : '';
		var rgx = /(\d+)(\d{3})/;
		while (rgx.test(x1)) {
			x1 = x1.replace(rgx, '$1' + ',' + '$2');
		}
		return x1 + x2;
	}

  function calcularTotales(){
  	/*var sub = document.getElementsByName("subtotal");
  	var impues =document.getElementsByName("valor_venta_u");
  	var impuestoTotal=0.0;
  	var total = 0.0;

  	for (var i = 0; i <sub.length; i++) {
		total += document.getElementsByName("subtotal")[i].value;
	}
	$('#totaligv').html(impuestoTotal);
	$("#totalimp").html("S/. " + total);
    $("#total_importe").val(impuestoTotal);*/
    evaluar();
  }

  function evaluar(){
  	if (detalles>0)
    {
      $("#btnGuardar").show();
    }
    else
    {
      $("#btnGuardar").hide();
      cont=0;
    }
  }
  

  function eliminarDetalle(indice){
  	$("#fila" + indice).remove();
  	modificarSubtotales();
  	detalles=detalles-1;
  	evaluar()
  }

init();
