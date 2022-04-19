 var msj=document.getElementById("msj").value;
          if(msj){
              Swal.fire({
                icon: 'success',
                title:msj,
               showConfirmButton: false,
               timer: 2000,
                width:'30%'
             });
          }

