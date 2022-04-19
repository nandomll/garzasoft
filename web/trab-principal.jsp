<%-- 
    Document   : trab-perfil
    Created on : 14/03/2022, 09:45:41 PM
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
        <link href="css/trab-principal.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
      
         <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.css">
         
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
                  <div class="lr-2 text-center text-white">${trabajador.getNombre()} </div>
              </div>
            
            </section>
            <section class="s-menu">
              <div>
                  <a href="controladortrabajador?accion=vista&dnitrabajador=${trabajador.getDni()}">
                        <i class="las la-home"></i> 
                        <span>Inicio</span> 
                  </a> 
             </div>
              <div>
                  <a href="controladortrabajador?accion=perfil&idtrabajador=${trabajador.getIdtrabajador()}">
                        <i class="las la-user"></i>
                        <span>Perfil</span> 
                  </a> 
             </div>
             <div>
                  <a href="controladortrabajador?accion=proyecto&idtrabajador=${trabajador.getIdtrabajador()}">
                        <i class="las la-file-alt"></i>
                        <span>Proyecto</span> 
                  </a> 
             </div>
              <div>
                  <a href="validartrabajador?accion=cerrar">
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
                       <img class=" mr-2 rounded-circle" style="background: #566573"  src="imagenes/icon2.png" width="43px" height="43px" />${trabajador.getNombre()} ${trabajador.getApellido()}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right text-center submenu " aria-labelledby="navbarDropdownMenuLink">
                        <a class="dropdown-item text-center" href="controladortrabajador?accion=perfil&idtrabajador=${trabajador.getIdtrabajador()}"><i class="las la-user" style="font-size:21px"></i> Perfil</a>
                       <div class="dropdown-divider"></div>
                       
                       <a class="dropdown-item" href="validartrabajador?accion=cerrar"> <i class="las la-power-off" style="font-size: 20px"></i> salir</a>
                    </div>
                  </li>
                </div>
              </div>
            </nav>


        </div>
        <div class=" contenido pl-3 pr-3 pt-3"> 
             <div class="cuerpo2 d-flex"> 
            <div class="cards1">
             <div class="cards2 d-flex">
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex pb-4">
                    <div class="pl-2 mt-2 ml-2 pr-1 tr-1">
                       <h5>Proyectos</h5>
                       <span>Modifica Estado</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-clipboard-list"></span>
                    </div>
                  </div>
              </div>
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-2 mt-2 ml-2 pr-1 tr-1">
                       <h5>Soportes</h5>
                       <span>Mejor Control</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-folder"></span>
                    </div>
                  </div>
              </div>
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-2 mt-2 ml-2 pr-1 tr-1">
                       <h5>Desarrollo</h5>
                       <span>Requerimientos</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-laptop"></span>
                    </div>
                  </div>
              </div>
            </div>
              <div class="card p-4" style="height: 670px">
                   <div class="card-body p-4 tabla-p" style="height: 420px">
                       <div id='calendar' ></div>
                     
                  </div>
              </div>
              
            </div>
              
             <div class="card" style="width:305px;height: 530px">
                  <div class="card-body p-0">
                     <h5 class="card-title pt-3 pb-1 mt-2 text-center">Proyecto </h5>
                       <div class="d-flex  p-2 mr-3 ml-3 trabajador">
                          <span class="las la-clipboard-list ml-2 mr-2" style="font-size: 50px"></span>
                            <div class="pt-1 pl-1 pr-1 pb-1" >
                                <div class="  ">${ptrabajador.getNombre()}</div>
                               
                            </div>

                       </div>
                       <div class="text-center  mt-2 ml-3 mr-4" >
                            <c:choose>
                            <c:when test="${ptrabajador.getEstado() == 'Pendiente'}">
                               
                                  <div class="card  text-white bg-danger w-100 p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${ptrabajador.getEstado()}
                                  </div>
                              
                            </c:when>
                            <c:when test="${ptrabajador.getEstado() == 'Terminado'}">
                              
                                  <div class="card  text-white bg-success w-100 p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${ptrabajador.getEstado()}
                                  </div>
                             
                            </c:when>
                            <c:otherwise>
                              
                                  <div class="card  text-white bg-warning  w-100 p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${ptrabajador.getEstado()}
                                  </div>
                             
                            </c:otherwise>
                          </c:choose>
                                 
                           
                        </div>
                      
                        <div class="pt-5 mr-3 ml-3 mt-4 pb-5 text-center  text-white" style="background:#566573; border-radius: 10px">
                          <div class="mb-2">Incio y fin del Proyecto</div>
                          <i class="las la-calendar mb-2 " style="font-size:100px"></i>
                          <div>${ptrabajador.getInicio()}- ${ptrabajador.getFin()}</div>
 
                       </div>
                  </div>
            </div> 
                
                
                
              
          </div>
         
        </div>
        
     <input type="hidden" id="msj" value="${rpta1}">   
    </body> 
      <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="js/msjBienvenida.js" type="text/javascript"></script>
   
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.2/locales/es.js"></script>
     <script >
        document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
           locale: 'es'
           

        });
        calendar.render();
      });

     </script>
</html>
