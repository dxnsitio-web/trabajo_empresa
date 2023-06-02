var tabla;

//Función que se ejecuta al inicio
function init(){
	listarProductosMasVendidos();
}

function listarProductosMasVendidos()
{
	var mes=$("#mes").val();
	var anno=$("#anno").val();


    tabla=$("#tbllistado").dataTable(
		{
			 "aProcessing": true, //Activamos el procesamiento de datatables
		      "aServerSide": true, //Paginacion y filtrado realizados por el servidor
		      dom: 'Bfrtip', //Definimos los elementos del control de tabla
		      buttons:[
		          'copyHtml5',
		          'excelHtml5',
		          'pdf'

		      ],
      		"ajax":{
      			url:"../ajax/reporte-mensual.php?op=listarProductos",
      			data:{mes:mes,anno,anno},
      			type:"get",
      			dataType:"json",
      			error:function(e)
			        {
			          console.log(e.responseText);
			        }
      		},
      		 "bDestroy":true,
		      "iDisplayLength" :5, //Paginacion
		      "order":[[0,"desc"]] //Ordenar (columna,orden)
				}
		).DataTable();


	
}

init();