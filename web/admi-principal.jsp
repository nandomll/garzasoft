<%-- 
    Document   : DashboardAdministrador
    Created on : 14/03/2022, 07:02:02 PM
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
        <link href="css/admi-principal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    </head>
    <body>
        <div class="sidelbar">
            <section  class="logo text-center  mt-2">
             <h2 class="text-white"><i class="fab fa-glide-g m-0"></i>Garzasoft
             </h2>
           </section>
           <section class="d-flex img ">
              <img  class=" bg-white rounded-circle" src="imagenes/img.1.png" width="60px" height="60px"/>
              <div class="lr" >
                  <div class="lr-1 text-center text-white">Bienvenido:</div>
                  <div class="lr-2 text-white">${administrador.getNombreadmi()}</div>
              </div>
            
            </section>
             <section class="s-menu">
              <div>
                  <a href="controladoradministrador?accion=vista">
                        <i class="las la-home"></i> 
                        <span>Inicio</span> 
                  </a> 
             </div>
              <div>
                  <a href="controladoradministrador?accion=perfil&idadministrador=${administrador.getIdadministrador()}">
                        <i class="las la-user"></i>
                        <span>Perfil</span> 
                  </a> 
             </div>
             <div>
                 <a href="#" class="dentro1" id="dentro1">
                        <i class="las la-file-alt"></i>
                        <span>Proyectos</span> 
                        <i class="las la-angle-right flecha" style="font-size:15px"></i>
                  </a> 
                  <section class="dentro1-1 mt-2">
                   
                     <div>
                      <a href="controladoradministrador?accion=listarsoportes" >Soporte</a>   
                       
                     </div>
                 
                      <div>
                      <a  href="controladoradministrador?accion=listardesarrollo">Desarrollo </a>   
                       
                     </div>
                 </section>    
              </div>
             <div>
                  <a href="controladoradministrador?accion=listarclientes">
                        <i class="las la-users"></i>
                        <span>Clientes</span> 
                  </a> 
             </div>
              <div>
                  <a href="controladoradministrador?accion=listartrabajadores">
                        <i class="las la-users"></i>
                        <span>Trabajadores</span> 
                  </a> 
              </div>
              
              <div>
                  <a href="validaradministrador?accion=cerrar">
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
                       <img class=" mr-2 rounded-circle" style="background: #566573"  src="imagenes/img.1.png" width="43px" height="43px" />${administrador.getNombreadmi()} ${administrador.getApellidosadmi()}
                    </a>
                    <div class="dropdown-menu dropdown-menu-right text-center submenu" aria-labelledby="navbarDropdownMenuLink ">
                      
                        <a class="dropdown-item text-center" href="controladoradministrador?accion=perfil&idadministrador=${administrador.getIdadministrador()}"><i class="las la-user" style="font-size:21px"></i> Perfil</a>
                       <div class="dropdown-divider"></div>
                       
                      <a class="dropdown-item" href="validaradministrador?accion=cerrar"> <i class="las la-power-off" style="font-size:20px" ></i> salir</a>
                    </div>
                  </li>
                </div>
              </div>
            </nav>

        </div>
        <div class=" contenido"> 
            <div class="cuerpo2 d-flex"> 
            <div class="cards1">
             <div class="cards2 d-flex">
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-3 pr-3 tr-1">
                       <h1>${numproyecto}</h1>
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
                       <h1>${numtrabajador}</h1>
                       <span>Trabajadores</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-users"></span>
                    </div>
                  </div>
              </div>
              <div class="card" style="width: 16rem;">
                  <div class="card-body d-flex">
                    <div class="pl-3 pr-3 tr-1">
                       <h1>${numcliente}</h1>
                       <span>Clientes</span>
                    </div>
                    <div class="tr-2">
                        <span class="las la-users"></span>
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
              
              
             <div class="card " style="width: 305px;height: 543px; overflow-y: auto">
              <div class="card-body p-0">
                <h5 class="card-title pt-3 pb-1 mt-2 text-center">Trabajadores</h5>
                 <c:forEach var="trab" items="${tr}"> 
                     <c:choose>
                        <c:when test="${trab.getSexo()=='hombre'}">
                           <div class="d-flex  p-2 mr-3 ml-3 trabajador">
                                <img  class=" rounded-circle  ml-2 mr-2" src="imagenes/icon2.png" width="50px" height="50px" style="background: #566573" />
                                <div class="pt-1 pl-1 pr-1 pb-1" >
                                    <div class=" text-center ">${trab.getNombre()}</div>
                                    <div class=" ">${trab.getCondicion()}</div>
                                </div>

                           </div>
                            
                        </c:when>
                         <c:when test="${trab.getSexo()=='mujer'}">
                            <div class="d-flex  p-2 mr-3 ml-3 trabajador">
                                <img  class=" rounded-circle  ml-2 mr-2" src="imagenes/icon1.png" width="50px" height="50px" style="background: #566573" />
                                <div class="pt-1 pl-1 pr-1 pb-1" >
                                    <div class=" text-center ">${trab.getNombre()}</div>
                                    <div class=" ">${trab.getCondicion()}</div>
                                </div>

                            </div>
                            
                        </c:when>
                        
                        <c:otherwise>
                               No hay clientes Registrados  
                        </c:otherwise>
                    </c:choose>      
                 </c:forEach>
              </div>
            </div>
         </div>
            <input type="hidden" id="msj" value="${rpta1}">
            <input type="hidden" id="pen" value="${pen}"> 
            <input type="hidden" id="enpro" value="${enpro}"> 
            <input type="hidden" id="ter" value="${ter}"> 
        </div>
       
    </body>
    <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="js/Efectodespejable.js" type="text/javascript"></script>
     <script src="js/msjBienvenida.js" type="text/javascript"></script>
     <script src="js/Buscar.js" type="text/javascript"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.7.1/chart.js" integrity="sha512-Lii3WMtgA0C0qmmkdCpsG0Gjr6M0ajRyQRQSbTF6BsrVh/nhZdHpVZ76iMIPvQwz1eoXC3DmAg9K51qT5/dEVg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
      <script>
         
        var pen=document.getElementById("pen").value;
        var enpro=document.getElementById("enpro").value;
        var ter=document.getElementById("ter").value;
        var ctx=document.getElementById("myChart").getContext("2d");
        var myChart=new Chart(ctx,{
            type:"bar",
            data:{
                labels:['Pendiente','En proceso','Terminado'],
                datasets:[{
                label:"Grafico",
                data:[ pen,enpro,ter],
                backgroundColor:[
                  'rgb(203, 67, 53)',   
                  'rgb(244, 208, 63 )',
                  'rgb(30, 132, 73  )'
                ]
                  
                
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
</html>
