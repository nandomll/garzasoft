 $(document).ready(function(){
             $("tr #btndelete").click(function(e){
                 e.preventDefault();
                var idproyecto=$(this).parent().find("#idproyecto").val();
                var idrequerimiento=$(this).parent().find("#idrequerimiento").val();
               Swal.fire({
                    title: 'Deseas eliminar el Requerimiento?',
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
                         eliminar(idrequerimiento);
                        Swal.fire({
                          title: 'Eliminado!',
                          text: "Requerimiento Eliminado.",
                          icon: 'success' ,
                          confirmButtonText: 'Aceptar',
                          confirmButtonColor:'#2874A6 ',
                          width:'30%'
                        } ).then((result) => {
                                    if(result.isConfirmed){
                                        parent.location.href="controladoradministrador?accion=listarrequerimientos&idproyecto="+idproyecto;
                                    }
                                });
                    }
                });
              
                 
             });
            function eliminar(idrequerimiento){
                var url="controladoradministrador?accion=eliminarrequerimiento&idrequerimiento="+idrequerimiento;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });


