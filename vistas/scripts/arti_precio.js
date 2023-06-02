var tabla;

function init(){
	 listar_precios();
}

function listar_precios(){
	tabla = $("#tbllistado").dataTable(
	{
		"aProcessing":true,
		"aServerSide":true,
	 //    dom: 'Bfrtip',//Definimos los elementos del control de tabla
		// buttons: [
		//             'copyHtml5',
		//             'excelHtml5',
		//             'pdf'
		//         ],
		"ajax": {
			url: "../ajax/articulo.php?op=listar_precios",
			type: "get",
			dataType: "json",
			error:function(e){
				console.log(e.responseText);
			}
		},
		"bDestroy": true,
		"iDisplayLength": 15,//Paginación
	    "order": [[ 0, "desc" ]]//Ordenar (columna,orden)
		
	}).DataTable();
}
function mostrarPrecioVenta(descripcion, iddetalle_ingreso, fecha_vencimiento) {
	mostrarform(true)
	$("#iddetalle_ingreso").val(iddetalle_ingreso)
	$("#descripcion").val(descripcion);
	$("#precio_venta").val(fecha_vencimiento);
}
init();