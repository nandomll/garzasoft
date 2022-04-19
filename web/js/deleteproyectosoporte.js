 $(document).ready(function(){
             $("tr #btndelete").click(function(e){
                 e.preventDefault();
                var idproyecto=$(this).parent().find("#idproyecto").val();
               Swal.fire({
                    title: 'Deseas eliminar el Proyecto?',
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
                         eliminar(idproyecto);
                        Swal.fire({
                          title: 'Eliminado!',
                          text: "Proyecto Eliminado.",
                          icon: 'success' ,
                          confirmButtonText: 'Aceptar',
                          confirmButtonColor:'#2874A6 ',
                          width:'30%'
                        } ).then((result) => {
                                    if(result.isConfirmed){
                                        parent.location.href="controladoradministrador?accion=listarsoportes";
                                    }
                                });
                    }
                });
              
                 
             });
            function eliminar(idproyecto){
                var url="controladoradministrador?accion=eliminarproyecto&idproyecto="+idproyecto;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });

