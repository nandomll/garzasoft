<%-- 
    Document   : admi-pdedesarrollo-agregar
    Created on : 22/03/2022, 09:58:53 AM
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
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
         <link href="css/admi-requerimiento.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="libr/css/bootstrap-datepicker.standalone.css" rel="stylesheet" type="text/css"/>
        
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
        <div class=" contenido pl-4 pr-4 pt-4 pb-2 "> 
          <div class="h4 ma-1 d-inline  pl-2 "><i class="las la-folder-open"></i> Requerimientos </div>
            
             
           <hr class="mt-4" style="background: #1F618D">
           
            <div class="card">
              <div class="card-body pl-4 pr-4 pt-5 pb-4">
               
              <div class="d-flex">
                <div class="formulario-agregar">
                    
                   <form action="controladoradministrador" method="post" class="needs-validation mb-4 mt-1" novalidate>
                       <h5 class="card-title mt-1 mb-4"><i class="fa-solid fa-file-lines"></i> Datos del Proyecto</h5>
                        <div class=" mb-3">
                          <label for="validationCustom01" class="mb-3">Nombre del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-folder-open"></i></span>
                            </div>
                              <input type="hidden" name="idproyecto" value="${undesarrollo.getIdproyecto()}">
                              <input type="text" class="form-control" id="validationCustomUsername" value="${undesarrollo.getNombre()}"  placeholder="Ingrese Proyecto" aria-describedby="inputGroupPrepend" readonly>
                            
                          </div>  
                          
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustom02" class="mb-3">Fecha de Inicio del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span>
                            </div>
                              <input type="text" class="form-control "  value="${undesarrollo.getInicio()}" placeholder="aaaa / mm/ dd"  readonly>
                            
                          </div>   
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustomUsername" class="mb-3">Fecha de Terminado del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span> 
                            </div>
                              <input type="text" class="form-control "   value="${undesarrollo.getFin()}" placeholder="aaaa / mm/ dd"  readonly>
                            
                          </div>
                        </div>
                      
                        
                        
                        <div class=" mb-3">
                          <label for="validationCustom02" class="mb-3">Cliente</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                             <span class="input-group-text"  style="font-size: 25px"><i class="las la-user"></i></span>
                            </div>
                              
                              <input type="text" class="form-control" id="clientee" value="${undesarrollo.getIdcliente().getNombrecli()} ${undesarrollo.getIdcliente().getApellidocli()}"  placeholder="Ingrese Cliente"   readonly>
                            
                          </div>   
                        </div>
                        <div class=" mb-3">
                          <label for="validationCustomUsername" class="mb-3">Trabajador</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-user"></i></span>
                            </div>
                              
                              <input type="text" class="form-control" id="trabajadorr" value="${undesarrollo.getIdtrabajador().getNombre()} ${undesarrollo.getIdtrabajador().getApellido()}" name="" placeholder="Ingrese Trabajador"  readonly>
                            
                          </div>
                        </div>
                         <button class="btn btn-success text-white w-100 mt-3 " name="accion" value="listardesarrollo"  type="submit">Salir</button>
                   </form>     
            </div> 
            <div class="table-requerimientos ml-3">
                <h4 class="ma-1 d-inline "><i class="fa-solid fa-list"></i> Lista de Requerimientos </h4>
                

           
                <hr class="mb-4" style="background: #1F618D">
                  <table class="table mt-5" id="datatable">
                      <thead class="thead-light">
                        <tr>
                          
                          <th scope="col" >Requerimientos</th>
                          <th scope="col"> Estado</th>
                          <th scope="col">Acciones </th>
                          
                        </tr>
                      </thead>
                      
                      <tbody>
                        <c:forEach var="lr" items="${lis}"> 
                        <tr>
                          
                          <td>${lr.getRequerimientos()}</td>
                          
                            <c:choose>
                            <c:when test="${lr.getEstado() == 'Pendiente'}">
                               <td class=" p-1">
                                  <div class="card  text-white bg-danger p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </div>
                              </td>
                            </c:when>
                            <c:when test="${lr.getEstado() == 'Terminado'}">
                              <td class=" p-1">
                                  <div class="card  text-white bg-success p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </div>
                              </td>
                            </c:when>
                            <c:otherwise>
                              <td class=" p-1">
                                  <div class="card  text-white bg-warning p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${lr.getEstado()}
                                  </div>
                              </td>
                            </c:otherwise>
                          </c:choose>
                          
                          
                         <td class="m-0 p-1">
                            
                            <a href="" class="btn btn-warning text-white " style="font-size: 15px" id="actualizar" data-toggle="modal" data-target="#nuevo5${lr.getIdrequeriminetos()}"><i class="fas fa-edit"></i></a>
                            
                            <%--modal de editar requerimiento--%> 
                            
                              <div class="modal fade" id="nuevo5${lr.getIdrequeriminetos()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                      <div class="modal-content col-sm-11 p-0">
                                        <div class="modal-header mod-h p-3 ">
                                          <h4 class="modal-title  mt-3 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-list"></i> Modificar Requerimiento</h4>
                                          <div style="border: none" class="close   mr-2" data-dismiss="modal" aria-label="Close">
                                            &times;
                                          </div>

                                        </div>
                                     <div class="modal-body pl-3 pr-3 pt-1">
                                      <form  action="controladoradministrador" method="post" novalidate>
                                          <input type="hidden" name="idpro" value="${undesarrollo.getIdproyecto()}">
                                          <input type="hidden" name="idrequerimiento" value="${lr.getIdrequeriminetos()}">
                                        <div class="modal-body mr-1  mb-1 ml-1">
                                          
                                            
                                            <div class="form-group mb-4 ">
                                              <label for="inputtext">Requerimiento</label>
                                              <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span style="font-size: 20px"class="input-group-text"  ><i class="las la-list"></i></i></span>
                                                </div>
                                                  <input type="text" class="form-control" name="requerimiento" value="${lr.getRequerimientos()}" placeholder="Nombre">
                                              </div>
                                            </div>

                                      
                                         
                                   
                                           <button type="submit" name="accion" value="modificarrequerimientos" class="btn  btn-block mt-4 mb-2 btn-1 text-white" >Actualizar</button>


                                         </div>

                                        </form>
                                      </div>
                                      </div>
                                    </div>
                                </div>
                            
                            
                            
                            <input  type="hidden" id="idproyecto" value="${undesarrollo.getIdproyecto()}">
                            <input type="hidden" id="idrequerimiento" value="${lr.getIdrequeriminetos()}">
                            <a  id="btndelete" href="#" class="btn btn-danger text-white  " style="font-size: 15px"><i class="fas fa-trash-alt"></i></a>  
                          </td>
                          
                        </tr>
                        
                         </c:forEach>  
                      </tbody>
                </table>
                  </div>   
                 </div>
              

                  <!--modal del trabajador-->
                  

                 <!--modal del Cliente--> 
                
                  
                  
              </div>
            </div>
            <input type="hidden" id="msj" value="${msj}">
        </div>
       
    </body>
    <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
     <script src="libr/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
     <script src="libr/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="js/Efectodespejable.js" type="text/javascript"></script>
     <script src="js/Datatable.js" type="text/javascript"></script>
     <script src="js/mensajescrud.js" type="text/javascript"></script>
     <script src="js/deleterequerimiento.js" type="text/javascript"></script>
</html>
