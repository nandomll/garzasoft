 $(document).ready(function(){
             $("tr #btnmodificar").click(function(e){
                 e.preventDefault();
                var idtrab=$(this).parent().find("#idtrab").val();
                var estado=$(this).parent().find("#estado").val();
               Swal.fire({
                    title: 'Deseas Modificar el Estado?',
                    text: "Esta accion si podra ser revertida!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Acepto',
                    cancelButtonText:'Cancelar',
                    width:'30%'
                }).then((result) => {
                    if (result.isConfirmed) {
                         eliminar(idtrab,estado);
                        Swal.fire({
                          title: 'Modificado!',
                          text: "Estado Modificado.",
                          icon: 'success' ,
                          confirmButtonText: 'Aceptar',
                          confirmButtonColor:'#2874A6 ',
                          width:'30%'
                        } ).then((result) => {
                                    if(result.isConfirmed){
                                        parent.location.href="controladoradministrador?accion=listartrabajadores";
                                    }
                                });
                    }
                });
              
                 
             });
            function eliminar(idtrab,estado){
                var url="controladoradministrador?accion=cambiarestado&idtrab="+idtrab+"&estado="+estado;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });


