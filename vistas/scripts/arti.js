var tabla;

//Función que se ejecuta al inicio
function init(){
	mostrarform(false);
	listar();
	otros();
	$(".afectacionArticulo").hide();

	$("#formulario").on("submit",function(e)
	{
		guardaryeditar(e);
	})

	//Cargamos los items al select categoria
	$.post("../ajax/articulo.php?op=selectCategoria", function(r){
	            $("#idcategoria").html(r);
	            $('#idcategoria').selectpicker('refresh');

	});
	$.post("../ajax/articulo.php?op=selectCategoria", function(r){//😀
		$("#idcategoria").html(r);
		$('#idcategoria').selectpicker('refresh');

});
	$("#imagenmuestra").hide();
	// $("#detalleunidad").prop('disabled',true);
	// document.getElementById("detalleunidad").val("12323");
	// if($('#unidadmedida').checked()){
	// 	$('#detalleunidad').hide();
	// };
	
	// if(document.getElementById("unidadmedida").checked){
 //       document.getElementById("detalleunidad").disabled=true;}

 // otros();

 	$('#btnAgregarStock').click(function(){
        var idarti=$('#idarti').val();
        var stockanti=$('#stockanti').val();
        stockanti=parseInt(stockanti);
        var stocknew=$('#astock').val();
        stocknew=parseInt(stocknew);

        agregarStock(idarti,stockanti,stocknew);
      });

 	// $('#stock').prop("disabled",false);
 	// disabledStock();
}


function otros(){
	
	// if(document.getElementById("unidadmedida").checked){
 //       document.getElementById("detalleunidad").val("12323");
 //   };

		 if ($('#unidadmedida').val()=='otros'){
		    $("#detalleunidad").prop('disabled',false);
		}else {
			$("#detalleunidad").prop('disabled',true);
			$("#detalleunidad").val("");
		}
}

//Función limpiar
function limpiar()
{
	$("#codigo").val("");
	$("#nombre").val("");
	$("#descripcion").val("");
	$("#stock").val("");
	$("#imagenmuestra").attr("src","");
	$("#imagenactual").val("");
	$("#print").hide();
	$("#tipo_venta_articulo").val("");
	$("#idarticulo").val("");
	$("#fecha_vencimiento").val("");
	$("#gravado").prop("checked",true);

  	
}

// function otros(){
	
// 	if(document.getElementById("unidadmedida").checked){
//        document.getElementById("detalleunidad").val("12323");
//    };
// }

//Función mostrar formulario
function mostrarform(flag)
{
	limpiar();
	if (flag)
	{
		$("#listadoregistros").hide();
		$("#formularioregistros").show();
		$("#btnGuardar").prop("disabled",false);
		$("#btnagregar").hide();
		$("#detunidad").hide();

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
					url: '../ajax/articulo.php?op=listar',
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
//Función para guardar o editar

function guardaryeditar(e)
{
	e.preventDefault(); //No se activará la acción predeterminada del evento
	$("#btnGuardar").prop("disabled",true);
	var formData = new FormData($("#formulario")[0]);

	$.ajax({
		url: "../ajax/articulo.php?op=guardaryeditar",
	    type: "POST",
	    data: formData,
	    contentType: false,
	    processData: false,

	    success: function(datos)
	    {
	          bootbox.alert(datos);
	          mostrarform(false);
	          tabla.ajax.reload();
	    }

	});
	limpiar();
}

// function disabledStock(){
//  	var st= $('#stock').val();

// 	if(st!=''){
//  			$('#stock').prop("disabled",true);
//  		}else{
//  			$('#stock').prop("disabled",false);

//  		}
// }
function mostrar(idarticulo)
{
	$.post("../ajax/articulo.php?op=mostrar",{idarticulo : idarticulo}, function(data, status)
	{
		data = JSON.parse(data);
		mostrarform(true);

		$("#idcategoria").val(data.idcategoria);
		$('#idcategoria').selectpicker('refresh');
		$("#codigo").val(data.codigo);
		$("#nombre").val(data.nombre);
		$("#stock").val(data.stock);
		$("#descripcion").val(data.descripcion);
		$("#imagenmuestra").show();
		$("#fecha_vencimiento").val(data.fecha_vencimiento);
		$("#tipo_venta_articulo").val(data.tipo_venta_articulo);
		$("#imagenmuestra").attr("src","../files/articulos/"+data.imagen);
		$("#imagenactual").val(data.imagen);
 		$("#idarticulo").val(data.idarticulo);
		$("#unidadmedida").val(data.unidad_medida);
		$("#detalleunidad").val(data.descripcion_otros);
		if(data.afectacion=='Gravado'){
			$('#gravado').prop("checked",true);
			$('#exonerado').prop("checked",false);
		}else{
			$('#gravado').prop("checked",false);
			$('#exonerado').prop("checked",true);
		}
		
 		generarbarcode();

 	})
}

function mostrarCodigoBarra(idarticulo){
	$.post("../ajax/articulo.php?op=mostrarCodigoBarra",{idarticulo:idarticulo},function(data,status){
		data = JSON.parse(data);
		$('#codigob').val(data.codigo);
		codigo=$("#codigob").val();
		JsBarcode("#barcodeb", codigo,{
			 width: 4,
  			 height: 100,
  			 // lineColor: "blue"
  			 // displayValue: false
		});
	})
}

function mostrarStock(idarticulo){
	$.post("../ajax/articulo.php?op=mostrarStock",{idarticulo:idarticulo},function(data,status){
		data = JSON.parse(data);
		$('#art').val(data.nombre);
		$("#idarti").val(data.idarticulo);
		$('#stockanti').val(data.stock);
		
	})
}



function agregarStock(idarti,stockanti,stocknew){
	// $.post("../ajax/articulo.php?op=agregarStock",{idarticulo:idarticulo,stock:stock},function(e){
	// 	// data = JSON.parse(data);
		
	// })
    var MsjEnviando='<img src="../files/loading.gif">';

	cadena='idarti='+idarti+'&stockanti='+stockanti+'&stocknew='+stocknew;

	$.ajax({
		type:'POST',
		url:'../ajax/articulo.php?op=agregarStockk',
		data:cadena,
		
        beforeSend: function(){
                $('.msjRespuesta').html(MsjEnviando);
            },
        // error: function() {
        //         $('.msjRespuesta').html(MsjError);
        //     },
        
		success:function(r){
			if(r){
				$('.msjRespuesta').html("");
				listar();
				$("#astock").val("");

			}else{
				alert('No se pudo actualizar :(');
				// alertify.error('No se pudo actualizar :)');

			 }
		}
		
	});
}


//Función para desactivar registros
function desactivar(idarticulo)
{
	bootbox.confirm("¿Está Seguro de desactivar el artículo?", function(result){
		if(result)
        {
        	$.post("../ajax/articulo.php?op=desactivar", {idarticulo : idarticulo}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});
        }
	})
}

//Función para activar registros
function activar(idarticulo)
{
	bootbox.confirm("¿Está Seguro de activar el Artículo?", function(result){
		if(result)
        {
        	$.post("../ajax/articulo.php?op=activar", {idarticulo : idarticulo}, function(e){
        		bootbox.alert(e);
	            tabla.ajax.reload();
        	});
        }
	})
}

//función para generar el código de barras
function generarbarcode()
{
	codigo=$("#codigo").val();
	JsBarcode("#barcode", codigo);
	$("#print").show();
}

//Función para imprimir el Código de barras
function imprimir()
{
	$("#print").printArea();
}
function imprimirb()
{
	$("#printb").printArea();
}
function listarControlados(){
	$.post("../ajax/articulo.php?op=listarControlados", function(r){
		$("#tipo_venta_articulo").html(r);
		// $('#idcategoria').selectpicker('refresh');
		console.log(r)

});

 }
init();

listarControlados()