<%-- 
    Document   : admi-clientes
    Created on : 14/03/2022, 08:30:27 PM
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
        <link href="css/admi-cli-trab.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.2/css/jquery.dataTables.css">
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
        <div class=" contenido pl-4 pr-4 pt-4 pb-2"> 
          <div class=" d-inline h4 ma-1 pl-2 "><i class="fas fa-user"></i> Lista de Clientes 
             </div> 
          
            <button type="button" class="btn text-white float-right btn-1 " data-toggle="modal" data-target="#nuevo">
                <i class="fas fa-plus"></i> Nuevo Cliente
             </button>
            <button type="button"  class="btn text-white float-right mr-1  btn-danger " data-toggle="modal" data-target="#nuevo5" >
                <i class="fa-solid fa-file-pdf" ></i> Exportar PDF
             </button>
             <hr class="mt-4" style="background: #1F618D">
             
             <div class="card " style=" " >
              <div class="card-body p-3">
                <table id="datatable" class="table ">
                      <thead class="thead-light">
                        <tr>
                          <th scope="col">DNI</th>
                          <th scope="col">NOMBRES</th>
                          <th scope="col">APELLIDOS</th>
                          <th scope="col">TELEFONO</th>
                          <th scope="col">CORREO</th>
                           <th scope="col">CONDICION</th>
                          <th scope="col">ACCIONES</th>
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="cli" items="${c}"> 
                        <tr class="pb-5">
                          <td >${cli.getDnicli()}</td>
                          <td >${cli. getNombrecli()}</td>
                          <td >${cli.getApellidocli()}</td>
                          <td >${cli.getTelefonocli()}</td>
                          <td >${cli.getCorreocli()}</td>
                           <td >${cli.getCondicioncli()}</td>
                          <td  >
                          <!--boton actualizar-->
                           <a class="btn btn-warning text-white " style="font-size: 15px" id="actualizar" data-toggle="modal" data-target="#nuevo2${cli.getIdcliente()}"><i class="fas fa-edit"></i></a>  
                         <!--boton actualizar--> 
                        
                        <!--modal actualizar-->  
                             <div class="modal fade" id="nuevo2${cli.getIdcliente()}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <div class="modal-content col-sm-11 p-0">
                                    <div class="modal-header mod-h p-3 ">
                                      <h4 class="modal-title  text-white mt-4 mb-2 ml-3  " id="exampleModalLabel"><i class="fas fa-user"></i> Actualizar Cliente</h4>
                                      <div style="border: none" class="close  text-white mr-2" data-dismiss="modal" aria-label="Close">
                                        &times;
                                      </div>

                                    </div>
                                 <div class="modal-body">
                                  <form  action="controladoradministrador" method="post" novalidate>
                                      <input type="hidden" name="idcliente" value="${cli.getIdcliente()}">
                                    <div class="modal-body mr-2  mb-2 ml-2">
                                      <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputtext">Dni</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-address-card"></i></span>
                                            </div>
                                              <input type="text" class="form-control"  name="dni1"  value="${cli.getDnicli()}">
                                          </div>
                                        </div>
                                         <div class="form-group col-md-6">
                                          <label for="inputtext">Nombre</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span style="font-size: 20px"class="input-group-text"  ><i class="las la-user "></i></span>
                                            </div>
                                              <input type="text" class="form-control"  name="nombre1"  value="${cli. getNombrecli()}">
                                          </div>
                                        </div>

                                      </div>
                                       <div class="form-row">
                                        <div class="form-group col-md-6">
                                          <label for="inputtext">Apellido</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                                <span style="font-size: 20px"class="input-group-text" ><i class="las la-user "></i></span>
                                            </div>
                                              <input type="text" class="form-control"  name="apellido1" value="${cli.getApellidocli()}">
                                          </div>
                                        </div>  
                                          <div class="form-group col-md-6">
                                          <label for="inputtext">Telefono o Celular</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-phone-alt"></i></span>
                                            </div>
                                              <input type="text" class="form-control"  name="telefono1" value="${cli.getTelefonocli()}">
                                          </div>
                                        </div> 
                                      </div>
                                       <div class="form-row">  
                                        <div class="form-group col-md-6">
                                          <label for="inputtext">Genero</label>
                                           <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-transgender"></i></span>
                                            </div>
                                             <select class="form-control" name="genero1" >
                                                <option value="" <c:if test="${cli.getSexocli()==''}">selected</c:if> >Seleccione...</option>
                                                <option value="hombre" <c:if test="${cli.getSexocli()=='hombre'}">selected</c:if>>Hombre</option>
                                                <option value="mujer"<c:if test="${cli.getSexocli()=='mujer'}">selected</c:if>  >Mujer</option>

                                              </select>
                                          </div>
                                        </div>                
                                        <div class="form-group col-md-6">
                                          <label for="inputtext">Fecha de Ingreso</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-calendar"></i></span>
                                            </div>
                                              <input type="text" class="form-control calen " name="fecha1" value="${cli.getIngresocli()}" >
                                          </div>
                                        </div>

                                      </div>
                                       <div class="form-row">
                                       <div class="form-group col-md-6">
                                          <label for="inputtext">Contraseña</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-key"></i></span>
                                            </div>
                                              <input type="password" class="form-control"  name="clave3" value="${cli.getClavecli()}" >
                                          </div>
                                        </div> 

                                        <div class="form-group col-md-6">
                                          <label for="inputtext">Contraseña</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-key"></i></span>
                                            </div>
                                              <input type="password" class="form-control"  name="clave4" value="${cli.getClavecli()}">
                                          </div>
                                        </div> 
                                      </div>    
                                          <label for="inputtext">Correo</label>
                                          <div class="input-group">
                                            <div class="input-group-prepend">
                                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-at"></i></span>
                                            </div>
                                              <input type="email" class="form-control"  name="correo1"  value="${cli.getCorreocli()}">
                                          </div>


                                      <button type="submit" name="accion" value="modificarcliente" class="btn  btn-block mt-4 mb-4 btn-1 text-white" >Actualizar</button>


                                    </div>

                                    </form>
                                 </div>
                                  </div>
                                </div>
                            </div>
                            
                            
                        <!--modal  actualizar-->  
                            
                        <input type="hidden" id="idcliente" value="${cli.getIdcliente()}"> 
                        <a href="#" id="btndelete" class="btn btn-danger text-white ml-1 "style="font-size: 15px"><i class="fas fa-trash-alt"></i></a>
                            
                        </td>
                        </tr> 
                        </c:forEach>
                      </tbody>
                    </table>
              </div>
            </div>
           <!--Modal Registrar-->
              <div class="modal fade" id="nuevo" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content col-sm-11 p-0">
                    <div class="modal-header mod-h p-3 ">
                      <h4 class="modal-title  text-white mt-4 mb-2 ml-3  " id="exampleModalLabel"><i class="fas fa-user"></i> Nuevo Cliente</h4>
                      <div style="border: none" class="close  text-white mr-2" data-dismiss="modal" aria-label="Close">
                        &times;
                      </div>
                    
                    </div>
                 <div class="modal-body">
                  <form  action="controladoradministrador" method="post" novalidate>
                    <div class="modal-body mr-2  mb-2 ml-2">
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="inputtext">Dni</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-address-card"></i></span>
                            </div>
                              <input type="text" class="form-control"  name="dni" placeholder="Dni" required>
                          </div>
                        </div>
                         <div class="form-group col-md-6">
                          <label for="inputtext">Nombre</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                                <span style="font-size: 20px"class="input-group-text"  ><i class="las la-user "></i></span>
                            </div>
                              <input type="text" class="form-control"  name="nombre" placeholder="Nombre" required>
                          </div>
                        </div>

                      </div>
                       <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="inputtext">Apellido</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                                <span style="font-size: 20px"class="input-group-text" ><i class="las la-user "></i></span>
                            </div>
                              <input type="text" class="form-control"  name="apellido" placeholder="Apellido">
                          </div>
                        </div>  
                          <div class="form-group col-md-6">
                          <label for="inputtext">Telefono o Celular</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-phone-alt"></i></span>
                            </div>
                              <input type="text" class="form-control"  name="telefono" placeholder="Telefono">
                          </div>
                        </div> 
                      </div>
                       <div class="form-row">  
                        <div class="form-group col-md-6">
                          <label for="inputtext">Genero</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-transgender"></i></span>
                            </div>
                              <select class="form-control" name="genero" >
                                <option value="" >Seleccione...</option>
                                <option value="hombre">Hombre</option>
                                <option value="mujer" >Mujer</option>

                              </select>
                          </div>
                        </div>                
                        <div class="form-group col-md-6">
                          <label for="inputtext">Fecha de Ingreso</label>
                          <div class="input-group "  >
                            <div class="input-group-prepend ">
                               <span style="font-size: 20px"class="input-group-text" ><i class="las la-calendar"></i></span>
                            </div>
                              <input type="text" class="form-control calen " name="fecha" placeholder="aaaa /mm /dd" >
                          </div>
                        </div>

                      </div>
                       <div class="form-row">
                       <div class="form-group col-md-6">
                          <label for="inputtext">Contraseña</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-key"></i></span>
                            </div>
                              <input type="password" class="form-control"  name="clave1" placeholder="Contraseña">
                          </div>
                        </div> 
                         
                        <div class="form-group col-md-6">
                          <label for="inputtext">Contraseña</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-key"></i></span>
                            </div>
                              <input type="password" class="form-control"  name="clave2" placeholder="Contraseña">
                          </div>
                        </div> 
                      </div>    
                          <label for="inputtext">Correo</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                               <span style="font-size: 20px"class="input-group-text"  ><i class="las la-at"></i></span>
                            </div>
                              <input type="email" class="form-control"  name="correo" placeholder="Correo">
                          </div>
                        

                      <button type="submit" name="accion" value="agregarcliente" class="btn  btn-block mt-4 mb-4 btn-1 text-white" >Registrar</button>
                                          
                        
                    </div>
                    
                    </form>
                  </div>
                  </div>
                </div>
            </div>
             
           <!--Modal Registrar-->
            <!--Modal condicion-->
          <div class="modal fade" id="nuevo5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content col-sm-11 p-0">
                <div class="modal-header  p-3 ">
                  <h5 class="modal-title  mt-3 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-list"></i> Seleccione Condicion</h5>
                  <div style="border: none" class="close   mr-2" data-dismiss="modal" aria-label="Close">
                    &times;
                  </div>

                </div>
             <div class="modal-body pl-3 pr-3 pt-1">
              <form  action="controladorreportes" method="post" novalidate>
                <div class="modal-body mr-1  mb-1 ml-1">


                    <div class="form-group mb-4 ">
                      
                      <div class="input-group">
                        <div class="input-group-prepend">
                            <span style="font-size: 20px"class="input-group-text"  ><i class="las la-list"></i></i></span>
                        </div>
                        <select class="form-control" name="condicion" >
                                <option value="" >Seleccione...</option>
                                <option value="Nuevo">Nuevo</option>
                                <option value="Antiguo" >Antiguo</option>

                         </select>
                      </div>
                    </div>




                   <button type="submit" name="accion" value="reporte1" class="btn  btn-block mt-4 mb-2 btn-1 text-white" >Generar Reporte</button>


                 </div>

                </form>
              </div>
              </div>
            </div>
        </div>
           
           <!--Modal condicion--> 
           
           <input type="hidden" id="msj" value="${msj}">
        </div>
       
    </body>
    <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.11.2/js/jquery.dataTables.js"></script>
     <script src="libr/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
     <script src="libr/locales/bootstrap-datepicker.es.min.js" type="text/javascript"></script>
     <script src="js/Datatable.js" type="text/javascript"></script>
     <script src="js/Efectodespejable.js" type="text/javascript"></script>
     <script  type="text/javascript">
         $(function(){
            $('.calen').datepicker({
                format: "yyyy/mm/dd",
                language: "es"
               
               });
         });
     </script>
     <script src="js/mensajescrud.js" type="text/javascript"></script>
     <script src="js/deletecliente.js" type="text/javascript"></script>
</html>
