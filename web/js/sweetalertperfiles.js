var mensaje =document.getElementById("msj2").value;
         if(mensaje=="correcto"){
            
            Swal.fire({
            icon: 'success',
            title: 'Actualizado Correctamente',
            
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }
          if(mensaje=="incorrecto"){
            
            Swal.fire({
            icon: 'error',
            title: 'error',
            text: 'Ingrese sus datos nuevamente',
            confirmButtonColor:'#2874A6 ',
            confirmButtonText: 'Aceptar',
            width:'30%'
          });
         }


