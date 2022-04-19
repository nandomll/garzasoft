<%-- 
    Document   : trab-proyecto
    Created on : 28/03/2022, 07:08:30 PM
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
        <link href="css/trab-proyecto.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
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
        <div class=" contenido pl-4 pr-4 pt-3 pb-2 ">    
         <c:choose>
            <c:when test="${pro.getTipo()=='Desarrollo'}">
        
            <%--proyecto de desarrollo--%>
         <c:choose>
                <c:when test="${pro.getMantenimiento() == 'no'}">
                  <div class="h4 ma-1  ml-2 "><i class="las la-folder-open"></i> Proyecto de Desarrollo </div>
                </c:when>
                <c:when test="${pro.getMantenimiento() == 'si'}">
                    <div class="h4 ma-1  ml-2 "><i class="las la-folder-open"></i> Proyecto de Desarrollo en Mantenimiento</div>
                </c:when>
                         
         </c:choose>   
            
            
         
           <hr class="mt-4" style="background: #1F618D">
           
            <div class="card">
              <div class="card-body  pl-4 pr-4 pt-5 pb-4">
               
              <div class="d-flex">
                <div class="formulario-agregar ml-1 p-4">
                   <form action="controladoradministrador" method="post" class="needs-validation  mb-4 mt-1" novalidate>
                       
                        <div class=" mb-3">
                          <label for="validationCustom01" class="mb-3">Nombre del Proyecto</label>
                          <div class=" text-center">
                            
                              <h4 class="text-center">${pro.getNombre()}</h4>
                            
                          </div>  
                          
                        </div>
                          <div class="mt-5 mb-4">
                          <label for="validationCustom01" class="">Estado:</label>
                          <div class=" text-center">
                            <c:choose>
                            <c:when test="${pro.getEstado() == 'Pendiente'}">
                               <div class=" p-1 text-center" style="margin-left: 90px">
                                  <div class="card  text-white bg-danger p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </div>
                               </div>
                            </c:when>
                            <c:when test="${pro.getEstado() == 'Terminado'}">
                              <div class=" p-1 text-center" style="margin-left: 90px">
                                  <div class="card  text-white bg-success p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </div>
                              </div>
                            </c:when>
                            <c:otherwise>
                              <div class=" p-1 text-center" style="margin-left: 90px">
                                  <div class="card  text-white bg-warning p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </div>
                              </div>
                            </c:otherwise>
                          </c:choose>
                              
                            
                          </div>  
                          
                        </div>
                      
                        <div class=" mb-3">
                          <label for="validationCustom02" class="mb-3"> Inicio del Proyecto:</label>
                          <div class="input-group">
                            
                              <div  style="margin-left: 90px">${pro.getInicio()}</div>
                            
                          </div>   
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustomUsername" class="mb-3">Fin de proyecto:</label>
                          <div class="input-group">
                            
                             <div  style="margin-left: 90px">${pro.getFin()}</div>
                            
                          </div>
                        </div>
                        <div class=" mb-5">
                          <label for="validationCustomUsername" class="mb-3">Tipo:</label>
                          <div class="input-group">
                            
                             <div style="margin-left: 90px">Proyecto de Desarrollo</div>
                            
                          </div>
                        </div>
                   
                 </form>   
                 </div> 
            <div class="table-requerimientos ml-4">
                <h4 class="ma-1 d-inline "><i class="fa-solid fa-list"></i> Lista de Requerimientos </h4>
                <hr class="mb-4" style="background: #1F618D">
                  <table class="table mt-5" id="datatable">
                      <thead class="thead-light">
                        <tr>
                          
                          <th scope="col" >Requerimientos</th>
                          <th scope="col"> Estado</th>
                          
                          
                        </tr>
                      </thead>
                      
                      <tbody>
                        <c:forEach var="lr" items="${re}"> 
                        <tr>
                          
                          <td>${lr.getRequerimientos()}</td>
                           <c:choose>
                            <c:when test="${lr.getEstado() == 'Pendiente'}">
                               <td class=" p-1">
                                  <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${lr.getEstado()}">
                                   <input type="hidden" id="idreque" value="${lr.getIdrequeriminetos()}">
                                  <a id="btnestado1" class="card btn btnestado1 text-white bg-danger p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </a>
                              </td>
                            </c:when>
                            <c:when test="${lr.getEstado() == 'Terminado'}">
                              <td class=" p-1">
                                  <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${lr.getEstado()}">
                                   <input  type="hidden" id="idreque" value="${lr.getIdrequeriminetos()}">
                                  <a id="btnestado1" class="card btn text-white btnestado1 bg-success p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </a>
                              </td>
                            </c:when>
                            <c:otherwise>
                              <td class=" p-1">
                                  <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${lr.getEstado()}">
                                   <input type="hidden" id="idreque" value="${lr.getIdrequeriminetos()}">
                                   <a id="btnestado1" class="card btn text-white bg-warning btnestado1 p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </a>
                              </td>
                            </c:otherwise>
                          </c:choose>
                        </tr>
                        
                         </c:forEach>  
                      </tbody>
                </table>
                  </div>   
                 </div>    
              </div>
            </div>    
              <%--proyecto de desarrollo--%> 
           </c:when>   
              
              
              
         <c:when test="${pro.getTipo()=='Soporte'}">     
            <%--proyecto de Soporte--%>  
          <div class="h4 ma-1  pl-2 "><i class="las la-folder-open"></i> Proyecto de Soporte </div>
           <hr class="mt-4" style="background: #1F618D">      
              <div class="card ml-2">
              <div class="card-body pl-4 pr-4 pt-5 pb-4">
               
              <div class="d-flex">
                <div class="formulario-agregar p-4">
              
                       
                        <div class=" mb-3">
                          <label for="validationCustom01" class="mb-3">Nombre del Proyecto</label>
                          <div class=" text-center">
                            
                              <h4 class="text-center">${pro.getNombre()}</h4>
                            
                          </div>  
                          
                        </div>
                         <div class="mt-5 mb-4">
                          <label for="validationCustom01" class="">Estado:</label>
                          <div class=" text-center">
                            <c:choose>
                            <c:when test="${pro.getEstado() == 'Pendiente'}">
                               <div class=" p-1 text-center" style="margin-left: 90px">
                                   <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${pro.getEstado()}">
                                   <a id="btnestado" class="card btn  text-white bg-danger p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </a>
                               </div>
                            </c:when>
                            <c:when test="${pro.getEstado() == 'Terminado'}">
                              <div class=" p-1 text-center" style="margin-left: 90px">
                                  <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${pro.getEstado()}">
                                  <a id="btnestado"  class="card btn text-white bg-success p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </a>
                              </div>
                            </c:when>
                            <c:otherwise>
                              <div class=" p-1 text-center" style="margin-left: 90px">
                                  <input type="hidden" id="idtrabajador" value="${trabajador.getIdtrabajador()}">
                                   <input type="hidden" id="idproyecto" value="${pro.getIdproyecto()}">
                                   <input type="hidden" id="estado" value="${pro.getEstado()}">
                                  <a id="btnestado" class="card btn text-white bg-warning p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${pro.getEstado()}
                                  </a>
                              </div>
                            </c:otherwise>
                          </c:choose>
                              
                            
                          </div>  
                          
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustom02" class="mb-3"> Inicio del Proyecto:</label>
                          <div class="input-group">
                            
                              <div  style="margin-left: 90px">${pro.getInicio()}</div>
                            
                          </div>   
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustomUsername" class="mb-3">Fin de proyecto:</label>
                          <div class="input-group">
                            
                             <div  style="margin-left: 90px">${pro.getFin()}</div>
                            
                          </div>
                        </div>
                        <div class=" mb-5">
                          <label for="validationCustomUsername" class="mb-3">Tipo:</label>
                          <div class="input-group">
                            
                             <div style="margin-left: 90px">Proyecto de Desarrollo</div>
                            
                          </div>
                        </div>
                      
                        
                       
                        
                        
                      
            </div> 
                  <div class="table-requerimientos ml-3"  style="background:#336C8F">
               
                     
                    <img src="imagenes/programar.svg" style="width: 500px; height: 500px">
              
                  </div>   
                 </div>    
              </div>
            </div> 
            </c:when>
           </c:choose>
           
           
        </div>
        
     <input type="hidden" id="msj" value="${rpta1}">   
    </body> 
      <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
      <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
     <script src="js/msjBienvenida.js" type="text/javascript"></script>
     <script src="js/Datatable.js" type="text/javascript"></script>
     <script src="js/cambiarestado.js" type="text/javascript"></script>
     <script src="js/cambiarestadoarequerimientos.js" type="text/javascript"></script>
</html>

