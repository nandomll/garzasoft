<%-- 
    Document   : admi-requerimientosnuevos
    Created on : 30/03/2022, 07:42:37 AM
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
           <div class="h4 ma-1  pl-2 "><i class="las la-folder-open"></i>
               Proyectos de Desarrollo  
           </div>
           <hr class="mt-4" style="background: #1F618D">
             <div class="card">
              <div class="card-body pl-5 pr-5 pt-5 pb-4">
                  <h5 class="mb-5">Modificar datos del proyecto si es necesario, con respecto a lo acordado con el trabajador. </h5>
                  <h5 class="card-title mt-1 mb-4"><i class="fa-solid fa-file-lines"></i> Informacion del Proyecto</h5> 
                  <form class="needs-validation mb-5" action="controladoradministrador" novalidate>
                      <input type="hidden" value="${undesarrollo.getIdproyecto()}" name="idproyecto">
                      <div class="form-row">
                        <div class="col-md-4 mb-3">
                          <label for="validationCustom01">Nombre del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-folder-open"></i></span>
                            </div>
                              <input type="text" class="form-control" id="validationCustomUsername" value="${undesarrollo.getNombre()}"readonly>
                            
                          </div>  
                          
                        </div>
                        <div class="col-md-4 mb-3">
                          <label for="validationCustom02">Fecha de Inicio del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span>
                            </div>
                              <input type="text" class="form-control" value="${undesarrollo.getInicio()}"  readonly>
                            
                          </div>   
                        </div>
                        <div class="col-md-4 mb-3">
                          <label for="validationCustomUsername">Fecha de Terminado del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span> 
                            </div>
                              <input type="text" class="form-control "  name="fechafin"  value="${undesarrollo.getFin()}"  readonly>
                            
                          </div>
                        </div>
                      </div>
                        <div class="form-row mt-2">
                        
                        <div class="col-md-6 mb-3">
                          <label for="validationCustom02">Cliente</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                             <span class="input-group-text"  style="font-size: 25px"><i class="las la-user"></i></span>
                            </div>
                              <input type="text" class="form-control" id="validationCustomUsername" value="${undesarrollo.getIdcliente().getNombrecli()} ${undesarrollo.getIdcliente().getApellidocli()}" readonly>
                            
                          </div>   
                        </div>
                        <div class="col-md-6 mb-3">
                          <label for="validationCustomUsername">Trabajador</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-user"></i></span>
                            </div>
                              <input type="text" class="form-control" id="validationCustomUsername" value="${undesarrollo.getIdtrabajador().getNombre()} ${undesarrollo.getIdtrabajador().getApellido()}" readonly>
                            
                          </div>
                        </div>
                      </div>
                     
                     <h5 class="card-title mt-3 mb-4"><i class="fas fa-edit"></i> Modificar datos del proyecto</h5>
                      <div class="form-row mt-2">
                        
                        <div class="col-md-4 mb-3">
                          <label for="validationCustom02">Nueva fecha para terminar el proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                             <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span>
                            </div>
                              <input type="text" class="form-control calen" id="validationCustomUsername" name="fechafinmo" placeholder="aaaa / mm/ dd"  required>
                            
                          </div>   
                        </div>
                     

                      </div>
                     
                    <div class="mt-3 d-flex">
                        <button class="btn btn-1 mr-1 text-white " value="modificarfecha" name="accion" type="submit" style="width: 38vw">Modificar </button>
                      <button class="btn btn-danger text-white"  name="accion" value="listardesarrollo" type="submit" style="width: 37vw">Cancelar</button>
                     </div>
                </form>
                    
               
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
     <script src="js/mensajescrud.js" type="text/javascript"></script>
      <script  type="text/javascript">
         $(function(){
            $('.calen').datepicker({
                format: "yyyy/mm/dd",
                language: "es",
                orientation: "top left"
               });
         });
     </script>
</html>