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
	$.post("../ajax/proforma.php?op=selectCliente", function(r){
	            $("#idcliente").html(r);
	            $('#idcliente').selectpicker('refresh');
	});

	      $("#idcliente").change(rellenarCliente);
}
function rellenarCliente(){
	var idcliente=$("#idcliente").val();

	var cliente=$("#idproforma").prop("selected",true);
	if(cliente){
		$.post("../ajax/proforma.php?op=mostrarDatoCliente",{idcliente : idcliente},function(data){
			data = JSON.parse(data);

			$("#numdireccion").val(data.num_documento);
			$("#direccioncliente").val(data.direccion);

		});
	}
}

// function LPad(ContentToSize,PadLength,PadChar)
//   {
//      var PaddedString=ContentToSize.toString();
//      for(var i=ContentToSize.length+1;i<=PadLength;i++)
//      {
//          PaddedString=PadChar+PaddedString;
//      }
//      return PaddedString;
//   }



function limpiar()
{
	$("#idcliente").val("");
	$("#idcliente").selectpicker('refresh');
	$("#correlativo").val("");



	$("#numdireccion").val("");
	$("#direccioncliente").val("");
	$("#tipo_proforma").val("");

	$("#subtotal").html("0.00");
	$("#ssubtotal").val("");

	$("#totaligv").html("0.00");
	$("#igv_total").val("");

	$("#totalimp").html("0.00");
	$("#total_venta").val("");


	// $("#total_venta_gravado").val("");
	// $("#totalg").html("0.00");
	// $("#total_venta_exonerado").val("");
	// $("#totale").html("0.00");
	// $("#total_venta_inafectas").val("");
	// $("#totali").html("0.00");
	// $("#total_venta_gratuitas").val("");
	// $("#totalgt").html("0.00");
	// $("#total_descuentos").val("");
	// $("#totald").html("0.00");
	// $("#totalisc").html("0.00");
	// $("#total_igv").val("");
	// $("#totaligv").html("0.00");

	// $("#total_importe").val("");
	$(".filas").remove();
	// $("#totalimp").html("0.00");
	

	//Obtenemos la fecha actual
	var now = new Date();
	var day = ("0" + now.getDate()).slice(-2);
	var month = ("0" + (now.getMonth() + 1)).slice(-2);
	var today = now.getFullYear()+"-"+(month)+"-"+(day) ;
    $('#fecha_hora').val(today);


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
		            // 'csvHtml5',
		            'pdf'
		        ],
		"ajax":
				{
					url: '../ajax/proforma.php?op=listar',
					type : "get",
					dataType : "json",
					error: function(e){
						console.log(e.responseText);
					}
				},
		"bDestroy": true,
		"iDisplayLength": 9,//Paginación
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
		url: "../ajax/proforma.php?op=guardaryeditar",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {
	          bootbox.alert(datos);
	          mostrarform(false);
	          listar();
	    }

	});
	limpiar();
}

function mostrar(idproforma)
{
	$.post("../ajax/proforma.php?op=mostrar",{idproforma : idproforma}, function(data, status)
	{
		data = JSON.parse(data);
		mostrarform(true);

		$("#idcliente").val(data.idcliente);
		$("#idcliente").selectpicker('refresh');
		$("#codigotipo_comprobante").val(data.codigotipo_comprobante);
		// $("#correlativo").val(data.correlativo);
		$("#fecha_hora").val(data.fecha);
		$("#idproforma").val(data.idproforma);
		$("#tipo_proforma").val(data.tipo_proforma);
		$("#tipo_proforma").selectpicker('refresh');



		// var subt=data.total_venta/1.18;
		// var igv=data.total_venta*0.18;

		$("#totalimp").html(data.total_venta);
		$("#total_venta").val(data.total_venta);
		rellenarCliente();

		$("#subtotal").html(data.total_venta-data.igv_total);
		$("#ssubtotal").val(data.total_venta-data.igv_total);

		$("#totaligv").html(data.igv_total);
		$("#igv_total").val(data.igv_total);




		//Ocultar y mostrar los botones
		$("#btnGuardar").hide();
		$("#btnCancelar").show();
		$("#btnAgregarArt").hide();
 	});

 	$.post("../ajax/proforma.php?op=listarDetalle&id="+idproforma,function(r){
	        $("#detalles").html(r);
	});
}

//Función para anular registros
function anular(idproforma)
{
	bootbox.confirm("¿Está Seguro de anular la venta?", function(result){
		if(result)
        {
        	$.post("../ajax/proforma.php?op=anular", {idproforma : idproforma}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});
        }
	})
  limpiar();
}

//Declaración de variables necesarias para trabajar con las compras y
//sus detalles
var impuesto=18;
var cont=0;
var detalles=0;
//$("#guardar").hide();
$("#btnGuardar").hide();




function agregarDetalle()
  {

  
	  	var cantidad=1;
	  	var precio_venta=1;
	    // var descuento=0;
   
    	var subtotal=cantidad*precio_venta;
    	
    	var fila='<tr class="filas" id="fila'+cont+'">'+
    	'<td><button type="button" class="btn btn-danger" onclick="eliminarDetalle('+cont+')">X</button></td>'+
    	'<td style="width:40%"><input type="text" name="descripcion[]" style="width:350px;"></td>'+
    	'<td style="width:15%"><input type="number" name="cantidad[]" id="cantidad'+cont+'" value="'+cantidad+'" ></td>'+

    	'<td style="width:15%"><input type="number" step="0.01" name="precio[]" id="precio'+cont+'" value="'+precio_venta+'" ></td>'+
    	// '<td><input type="number" name="impuest[]" value="'+igv+'"></td>'+
    	
    	'<td><span name="subtotal" id="subtotal'+cont+'">'+subtotal+'</span></td>'+
    	
    	'</tr>';
    

    	detalles=detalles+1;
    	$('#detalles').append(fila);
    	
  		$("#cantidad"+cont).change(function(){
    		modificarSubtotales();
  		});
  		$("#precio"+cont).change(function(){
    		modificarSubtotales();
  		});
    	cont++;
    	modificarSubtotales();
    	
    	
    	
  
  }

function modificarSubtotales()
  {
  	var cant = document.getElementsByName("cantidad[]");
    var prec = document.getElementsByName("precio[]");
    var sub = document.getElementsByName("subtotal");
  	var total = 0.0;
  	var totaligv = 0.0;
  	var newvparcial=0;
  	var igvt=0;

    for (var i = 0; i <cant.length; i++) {
    	var inpC=cant[i];
    	var inpP=prec[i];
    	var inpS=sub[i];

    		// var newValorU=inpP.value;
    		inpS.value=inpP.value*inpC.value;
    	
		// console.log(inpS);
    		// var newValoU=inpP.value/(1+(impuesto/100));
    		// var newValorU=newValoU.toFixed(2);
    		// var newValorT=(inpP.value/(1+(impuesto/100)))*inpC.value - inpD.value;
    		// newigv=  (inpC.value*inpP.value/(1+(impuesto/100))-inpD.value)*(impuesto/100);
    	
    	
		// console.log(inpA);
    	// inpS.value=(inpC.value * inpP.value)-inpD.value;
    	// document.getElementsByName("subtotal")[i].innerHTML = inpS.value;
    	// var newigv= (inpC.value*inpP.value)*(1+(impuesto/100))*(impuesto/100);
    	
    	// var rr = (inpC.value*inpP.value);
    	// document.getElementsByName("impuest")[i].innerHTML = newigv.toFixed(2);
    	// document.getElementsByName("valor_venta_t")[i].innerHTML = newValorT.toFixed(2);
    	// document.getElementsByName("valor_venta_u")[i].innerHTML = newValorU;
    	document.getElementsByName("subtotal")[i].innerHTML = parseFloat(inpS.value).toFixed(2);
    	// $("#subtotal"+i).html(inpS);
    	
    	// totalgravad += parseFloat(newValorT.toFixed(2));
    	newvparcial += parseFloat(inpS.value);
    	igvt=newvparcial*0.18;
    	total =newvparcial+igvt;

    	// totaldesc += parseFloat(inpD.value);
    	// totaligv+=parseFloat(newigv.toFixed(2));
    	// total+=inpS.value;
    }

    $('#subtotal').html("S/. " + newvparcial.toFixed(2));
    $('#ssubtotal').val(newvparcial.toFixed(2));

    $('#totaligv').html("S/. " + igvt.toFixed(2));
    $('#igv_total').val(igvt.toFixed(2));

    $("#totalimp").html("S/. " + total.toFixed(2));
    $("#total_venta").val(total.toFixed(2));
    evaluar();

    // calcularTotales();
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
