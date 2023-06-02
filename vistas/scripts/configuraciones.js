function init(){
	// agregaryeditar();

	// mostrar();
	$("#formulario").on("submit",function(e){
		agregaryeditar(e);
	})


	$("#imagen").change(function(){
		var imagen = this.files[0];
		if(imagen["type"]=="image/jpeg" || imagen['type'] == "image/png"){
			if(Number(imagen["size"]) > 2000000){
				$("#imagen").val("");
				swal({
					 title: "¡Error al subir la imagen!",
					 text: "¡La imagen no debe pesar más de 2 MB!",
					 type:"error",
					 confirmButtonText: "Cerrar",
					 closeOnConfirm: false
					
				})
			}else{
				var datosImagen = new FileReader();
				datosImagen.readAsDataURL(imagen);
				$(datosImagen).on("load",function(e){
					$("#previsualizar").attr("src",e.target.result);
				})
			}
		}else{
			$("#imagen").val("");

			swal({
				title:"¡Error al subir la imagen!",
				text:"¡La imagen debe estar en formato JPG o PNG!",
			 	confirmButtonText: "Cerrar",
				type:"error",
				// closeOnConfirm:false,
				// showCancelButton: true,
				// confirmButtonColor: '#3085d6',
			 //  	cancelButtonColor: '#d33',
			 //  	confirmButtonText: 'Yes, delete it!'

			})
			
		}
	})
}

function agregaryeditar(e){
		e.preventDefault();
		
		var formData = new FormData($("#formulario")[0]);
		$.ajax({
			url:'../ajax/configuraciones.php?op=editar',
			type:"POST",
			data:formData,
			contentType: false,
            processData: false,
			success:function(data){
				bootbox.alert(data);
			}
			
		});
}

init();