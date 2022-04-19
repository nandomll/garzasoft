<%-- 
    Document   : cli-principal
    Created on : 14/03/2022, 08:58:25 PM
    Author     : hp
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
        <link href="css/cli-principal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    </head>
    <body>
        <div class=" sidelbar">
               <section  class="logo text-center  mt-2">
             <h2 class="text-white"><i class="fab fa-glide-g m-0"></i>Garzasoft
             </h2>
           </section>
            <section class="img  text-center">
              <img  class=" bg-white rounded-circle" src="imagenes/icon2.png" width="60px" height="60px"/>
              <div class="lr" >
                  <div class="lr-1 text-center text-white">Bienvenido:</div>
                  <div class="lr-2 text-center text-white">${cliente.getNombrecli()}</div>
              </div>
            
            </section>
            <section class="s-menu">
              <div>
                  <a href="controladorcliente?accion=vista&dnicliente=${cliente.getDnicli()}">
                        <i class="las la-home"></i> 
                        <span>Inicio</span> 
                  </a> 
             </div>
              <div>
                  <a href="controladorcliente?accion=perfil&idcliente=${cliente.getIdcliente()}">
                        <i class="las la-user"></i>
                        <span>Perfil</span> 
                  </a> 
             </div>
             <div>
                 <a href="#" class="dentro1" id="dentro1">
                        <i class="las la-file-alt"></i>
                        <span>Proyecto</span> 
                        <i class="las la-angle-right flecha" style="font-size:15px"></i>
                  </a>
                  <section class="dentro1-1 mt-2">
                   
                     <div>
                      <a href="controladorcliente?accion=listarsoportes&idcliente=${cliente.getIdcliente()}" >Soporte</a>   
                       
                     </div>
                 
                      <div>
                      <a  href="controladorcliente?accion=listardesarrollo&idcliente=${cliente.getIdcliente()}">Desarrollo </a>   
                       
                     </div>
                 </section> 
             </div>
              <div>
                  <a href="validarcliente?accion=cerrar">
                         <i class="las la-door-open"></i>
                        <span>Salir</span> 
                  </a> 
                  
              </div>
            
            </section>
        </div>
        <div class=" sticky-top header">
           <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="collapse navbar-collapse" id="navbarNavDropdown">
                <div class="navbar-nav  ml-auto mr-3   "> 
                  <li class="nav-item dropdown  " style="background:">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="background:">
                       <img class=" mr-2 rounded-circle" style="background: #566573"  src="imagenes/icon2.png" width="43px" height="43px" />${cliente.getNombrecli()} ${cliente.getApellidocli()}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right text-center submenu" aria-labelledby="navbarDropdownMenuLink ">
                        <a class="dropdown-item text-center" href="cli-perfil.jsp"><i class="las la-user" style="font-size:21px"></i> Perfil</a>
                       <div class="dropdown-divider"></div>
                       
                      <a class="dropdown-item" href="validarcliente?accion=cerrar"> <i class="las la-power-off "style="font-size:20px"></i> salir</a>
                      
                    </div>
                  </li>
                </div>
              </div>
           </nav>
        </div>
        <div class=" contenido pl-3 pr-3 pt-2 "> 
                <div class="cuerpo2 d-flex"> 
            <div class="cards1">
             <div class="cards2 d-flex">
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-3 pr-3 tr-1">
                       <h1>${npro}</h1>
                       <span>Proyectos</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-clipboard-list"></span>
                    </div>
                  </div>
              </div>
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-3 pr-3 tr-1">
                       <h1>${nso}</h1>
                       <span>Soportes</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-folder"></span>
                    </div>
                  </div>
              </div>
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-3 pr-3 tr-1">
                       <h1>${nde}</h1>
                       <span>Desarrollo</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-laptop"></span>
                    </div>
                  </div>
              </div>
            </div>
              <div class="card" style="height: 411px">
                   <div class="card-body p- tabla-p">
                      <h5 class="card-title">Grafico de Proyectos</h5>
                      <canvas id="myChart" height="338" width="735"></canvas>  
                  </div>
              </div>
              
            </div>
              
             <div class="card" style="width:305px; height: 543px; overflow-y: auto">
                  <div class="card-body p-0">
                     <h5 class="card-title pt-3 pb-1 mt-2 text-center">Proyectos </h5>
                      <c:forEach var="pro" items="${clientelis}"> 
                       <div class="d-flex  p-2 mr-3 ml-3 trabajador">
                            <span class="las la-clipboard-list ml-2 mt-1 mr-2 itr" style="font-size: 54px"></span>
                            <div class="pt-1 pl-1 pr-1 pb-1" >
                                <div class="  ">${pro.getNombre()}</div>
                               
                            </div>

                       </div>
                        </c:forEach>
                  </div>
            </div>       
         </div>              
        </div>
        
        <input type="hidden" id="msj" value="${rpta1}">
        <input type="hidden" id="pendiente" value="${npendiente}"> 
        <input type="hidden" id="enproceso" value="${nenproceso}"> 
         <input type="hidden" id="terminados" value="${nterminado}">
    </body>
    
    
     <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="js/msjBienvenida.js" type="text/javascript"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.js" integrity="sha512-Lii3WMtgA0C0qmmkdCpsG0Gjr6M0ajRyQRQSbTF6BsrVh/nhZdHpVZ76iMIPvQwz1eoXC3DmAg9K51qT5/dEVg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
     <script>
         
        var npendiente= document.getElementById("pendiente").value;
        var nenproceso= document.getElementById("enproceso").value;
          var nterminados= document.getElementById("terminados").value;
        var ctx=document.getElementById("myChart").getContext("2d");
        var myChart=new Chart(ctx,{
            type:"line",
            data:{
                labels:['Pendiente','En proceso','Terminado'],
                datasets:[{
                label:"Grafico",
                data:[ npendiente,nenproceso,nterminados],
                borderColor:'rgb(21, 67, 96)',
                backgroundColor:'rgb(21, 67, 96)',
                pointRadius: 6,
                  
                
            }]
            },
              options: {
                   scales: {
                      y: {
                        beginAtZero: true
                      }  
                   }
              }
            
        });
    
    
    </script>
    <script src="js/Efectodespejable.js" type="text/javascript"></script>
</html>
