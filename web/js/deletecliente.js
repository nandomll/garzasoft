 $(document).ready(function(){
             $("tr #btndelete").click(function(e){
                 e.preventDefault();
                var idcliente=$(this).parent().find("#idcliente").val();
               Swal.fire({
                    title: 'Deseas eliminar el Cliente?',
                    text: "Esta accion no podra ser revertida!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Acepto',
                    cancelButtonText:'Cancelar',
                    width:'30%'
                }).then((result) => {
                    if (result.isConfirmed) {
                         eliminar(idcliente);
                        Swal.fire({
                          title: 'Eliminado!',
                          text: "Cliente Eliminado.",
                          icon: 'success' ,
                          confirmButtonText: 'Aceptar',
                          confirmButtonColor:'#2874A6 ',
                          width:'30%'
                        } ).then((result) => {
                                    if(result.isConfirmed){
                                        parent.location.href="controladoradministrador?accion=listarclientes";
                                    }
                                });
                    }
                });
              
                 
             });
            function eliminar(idcliente){
                var url="controladoradministrador?accion=eliminarcliente&idcliente="+idcliente;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });

