 $(document).ready(function(){
             $("tr #btndelete").click(function(e){
                 e.preventDefault();
                var idtrabajador=$(this).parent().find("#idtrabajador").val();
               Swal.fire({
                    title: 'Deseas eliminar el Trabajador?',
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
                         eliminar(idtrabajador);
                        Swal.fire({
                          title: 'Eliminado!',
                          text: "Trabajador Eliminado.",
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
            function eliminar(idtrabajador){
                var url="controladoradministrador?accion=eliminartrabajador&idtrabajador="+idtrabajador;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });


