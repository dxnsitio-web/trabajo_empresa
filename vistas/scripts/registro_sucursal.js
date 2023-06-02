var tabla;

//funcion que se ejecuta al inicio
function init() {
  mostrarform(false);
  listar();

  $("#formulario").on("submit",function(e)
  {
    guardaryeditar(e);
  });

  	//Cargamos los items al select categoria
	


}

//Funcion limpiar
function limpiar() {
  $("#nombre").val("");
  $("#direccion").val("");
  $("#telefono").val("");
  $("#horarios").val("");

}

//Funcion mostrar formulario
function mostrarform(flag)
{
  limpiar();
  if(flag)
  {
    $('#listadoregistros').hide();
    $('#formularioregistros').show();
    $('#btnGuardar').prop("disabled",false);

  }
  else {
    $('#listadoregistros').show();
    $('#formularioregistros').hide();
  }

}

//funcion cancelarform
function cancelarform()
{
  limpiar();
  mostrarform(false);


}

//function listar
function listar()
{
  tabla=$('#tbllistado').dataTable(
    {
      "aProcessing": true, //Activamos el procesamiento de datatables
      "aServerSide": true, //Paginacion y filtrado realizados por el servidor
      dom: 'Bfrtip', //Definimos los elementos del control de tabla
      buttons:[
          'copyHtml5',
          'excelHtml5',
          'csvHtml5',
          'pdf'

      ],
      "ajax":
      {
        url:'../ajax/registro_sucursal.php?op=listar',
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

function guardaryeditar(e)
{
  e.preventDefault();// No se activara la accion predeterminada del evento
  $("#btnGuardar").prop("disabled",true);
  var formData=new FormData($("#formulario")[0]);

  $.ajax(
    {
      url:"../ajax/registro_sucursal.php?op=guardaryeditar",
      type:"POST",
      data:formData,
      contentType:false,
      processData:false,

      success:function(datos)
      {
          alert(datos);
          mostrarform(false);
          tabla.ajax.reload();

      }

    }
  );
  limpiar();
}

function mostrar(id_sucursal)
{
 $.post("../ajax/registro_sucursal.php?op=mostrar",{id_sucursal:id_sucursal}, function(data,status)
{
    data=JSON.parse(data);
    mostrarform(true);

    $("#nombre").val(data.nombre);
    $("#direccion").val(data.direccion);
    $("#telefono").val(data.telefono);
    $("#horarios").val(data.horarios);
    $("#id_sucursal").val(data.id_sucursal);
})
}
//funcion desactivar
function desactivar(id_sucursal)
{
  bootbox.confirm("¿Esta seguro de desactivar el producto?",function(result)
{
  if(result)
  {
    $.post("../ajax/registro_sucursal.php?op=desactivar",{id_sucursal:id_sucursal},function(e){
      bootbox.alert(e);
        tabla.ajax.reload();
    });
  }
})
}

function activar(id_sucursal)
{
  bootbox.confirm("¿Esta seguro de activar el producto?",function(result)
{
  if(result)
  {
    $.post("../ajax/registro_sucursal.php?op=activar",{id_sucursal:id_sucursal},function(e){
        bootbox.alert(e);
        tabla.ajax.reload();

    });

  }

}
)

}
function eliminar(id_sucursal)
{
 bootbox.confirm("¿Está Seguro que desea eliminar este Producto?", function(result){
 if(result)
   {
     $.post("../ajax/registro_sucursal.php?op=eliminar", {id_sucursal : id_sucursal}, function(e){
       bootbox.alert(e);
       
       tabla.ajax.reload();
     });
   }
 })
}




init();
