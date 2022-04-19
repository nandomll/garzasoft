 $(document).ready(function(){
             $("#btnestado").click(function(e){
                 e.preventDefault();
                var idproyecto=$(this).parent().find("#idproyecto").val();
                var idtrabajador=$(this).parent().find("#idtrabajador").val();
                var estado=$(this).parent().find("#estado").val();
               Swal.fire({
                    title: 'Deseas Cambiar el estado Proyecto?',
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
                         eliminar(idproyecto,estado,idtrabajador);
                        Swal.fire({
                          title: 'Modificado!',
                          text: "Estado Modificado",
                          icon: 'success' ,
                          confirmButtonText: 'Aceptar',
                          confirmButtonColor:'#2874A6 ',
                          width:'30%'
                        } ).then((result) => {
                                    if(result.isConfirmed){
                                        parent.location.href="controladortrabajador?accion=proyecto&idtrabajador="+idtrabajador;
                                    }
                                });
                    }
                });
              
                 
             });
            function eliminar(idproyecto,estado,idtrabajador){
                var url="controladortrabajador?accion=cambiarestado&idtrabajador="+idtrabajador+
                        "&idproyecto="+idproyecto+"&estado="+estado;
                $.ajax({
                    type:'POST',
                    url: url,
                    async: true,
                    success:function(r){
                   
                    }
                });
                 
             }   
      });



