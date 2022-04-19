  var msj=document.getElementById("msj").value; 
         if(msj=="errorclave"){
           Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         
          if(msj=="errordni"){
           Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'El dni se encuentra registrado',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
          if(msj=="errordni2"){
           Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'El dni no se encuentra registrado',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         if(msj=="registrado"){
          Swal.fire({
            icon: 'success',
            title: 'Registro Correcto' , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
          if(msj=="modificado"){
          Swal.fire({
            icon: 'success',
            title: 'Modificado Correctamente' , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
         
         if(msj=="norequerimientos"){
             var idproyecto1= document.getElementById("idproyecto").value;
              Swal.fire({
                    title: 'Proyecto Terminado' , 
                    text: "Si quiere adiccionar requerimientos debera realizar un mantenimiento si es asi pulsar Mantenimiento!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Mantenimiento',
                    cancelButtonText:'Cancelar',
                    width:'30%'
                }).then((result) => {
                    if (result.isConfirmed) {
                        parent.location.href="controladoradministrador?accion=listarmantenimientos";
                        
                    }
                });
         }
           if(msj=="nrequerimientos"){
              var idproyecto1= document.getElementById("idproyecto").value;
              Swal.fire({
                   
                    text: "Para realizar esta accion tuvo que tener una reunion previa con el trabajador si es asi dar Confirmar!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText:'Cancelar',
                    width:'30%'
                }).then((result) => {
                    if (result.isConfirmed) {
                        parent.location.href="controladoradministrador?accion=masrequerimientos&idproyecto="+idproyecto1;
                        
                    }
                });
         }
         
         
         
         if(msj=="resgistradorequerimientos"){
          Swal.fire({
            icon: 'success',
            title: 'Requerimientos Registrados' , 
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
