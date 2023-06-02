var tabla;
function init(){

listar();

}


function listar(){
	tabla=$("#tbllistado").dataTable({
		 "scrollY":        "600px",
        "scrollCollapse": true,
        "paging":         false,
		"aProcessing": true, //Activamos el procesamiento de datatables
      "aServerSide": true, //Paginacion y filtrado realizados por el servidor
       dom: 'Bfrtip', //Definimos los elementos del control de tabla
      buttons:[
          'copyHtml5',
          'excelHtml5',
          // 'csvHtml5',
          // 'pdf'

      ],
		"ajax":{
			url: "../ajax/consultas.php?op=reportekardex",
			type:"get",
			dataType:"json"
		},
		"bDestroy":true,
      "iDisplayLength" :10, //Paginacion
      "order":[[0,"desc"]] //Ordenar (columna,orden)
	}).DataTable();
}

function reiniciar(){

	swal({
		  title: "BIEN!",
		  text: "¡Se ha actualizado el kardex!",
		  type:"success",
		  confirmButtonText: "Cerrar",
		  closeOnConfirm: false
		},

		function(isConfirm){

			if(isConfirm){
				// history.back();

				$.ajax({
					url:"../ajax/consultas.php?op=reiniciarkardex",
					type:"POST",
					success:function(){
						// $('#loading').html("");
						tabla.ajax.reload();
						$(location).attr("href","kardex.php");
					}
				});
			}
	});


	// var MsjEnviando='<img src="../files/loading.gif">';

	// 			$.ajax({
	// 				url:"../ajax/consultas.php?op=reiniciarkardex",
	// 				type:"POST",
	// 				beforeSend:function(){
	// 					$('#loading').html(MsjEnviando);
	// 				},
	// 				success:function(){
	// 					$('#loading').html("");
	// 					tabla.ajax.reload();
	// 				}
	// 			});
}

init();