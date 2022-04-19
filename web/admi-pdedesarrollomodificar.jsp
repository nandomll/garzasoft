<%-- 
    Document   : admi-pdesarrollomodificar
    Created on : 23/03/2022, 09:14:46 PM
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
        <link href="css/admi-pdesoporte.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <link href="libr/css/bootstrap-datepicker.standalone.css" rel="stylesheet" type="text/css"/>
        <style>
           div.dataTables_wrapper {
                        width: 1017px;
                    
                    }
        </style>
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
          <div class=" d-inline h4 ma-1  pl-2 "><i class="las la-folder-open"></i> Proyectos de Desarrollo </div>
         <a href="controladoradministrador?accion=listarmantenimientos" type="button " class="btn btn-success text-white float-right  mr-2 ">
               <i class="fa-solid fa-gears"></i> Mantenimiento
             </a>
           <button type="button"  class="btn text-white float-right mr-1  btn-danger " data-toggle="modal" data-target="#nuevo5" >
                <i class="fa-solid fa-file-pdf" ></i> Exportar PDF
           </button>
           <hr class="mt-4" style="background: #1F618D">
           
            <div class="card">
              <div class="card-body pl-4 pr-4 pt-5 pb-4">
                  <form action="controladoradministrador" class="needs-validation mb-5" method="post" novalidate>
                      <input type="hidden" name="idproyecto" value="${undesarrollo.getIdproyecto()}">
                      <div class="form-row">
                        <div class="col-md-4 mb-3">
                          <label for="validationCustom01">Nombre del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-folder-open"></i></span>
                            </div>
                              <input type="text" class="form-control" name="proyecto" id="validationCustomUsername" value="${undesarrollo.getNombre()}" aria-describedby="inputGroupPrepend" required>
                            
                          </div>  
                          
                        </div>
                        <div class="col-md-4 mb-3">
                          <label for="validationCustom02">Fecha de Inicio del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span>
                            </div>
                              <input type="text" id="calen"  class="form-control calen" name="fechainicio" value="${undesarrollo. getInicio()}" required>
                            
                          </div>   
                        </div>
                        <div class="col-md-4 mb-3">
                          <label for="validationCustomUsername">Fecha Limite del Proyecto</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-calendar"></i></span> 
                            </div>
                              <input type="text" class="form-control calen"  name="fechafin" value="${undesarrollo.getFin()}" required>
                            
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
                              <input type="hidden" id="idcliente" name="idcliente" value="${undesarrollo.getIdcliente().getIdcliente()}">  
                              <input type="text" class="form-control" id="clientee" value="${undesarrollo.getIdcliente().getNombrecli()} ${undesarrollo.getIdcliente().getApellidocli()}"  data-toggle="modal" data-target="#nuevo4" required>
                            
                          </div>   
                        </div>
                        <div class="col-md-6 mb-3">
                          <label for="validationCustomUsername">Trabajador</label>
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <span class="input-group-text"  style="font-size: 25px"><i class="las la-user"></i></span>
                            </div>
                              <input type="hidden" id="idtrabajador" name="idtrabajador" value="${undesarrollo.getIdtrabajador().getIdtrabajador()}">
                             <input type="text" class="form-control" id="trabajadorr" value="${undesarrollo.getIdtrabajador().getNombre()} ${undesarrollo.getIdtrabajador().getApellido()}"  data-toggle="modal" data-target="#nuevo3" required>
                            
                          </div>
                        </div>
                      </div>
                    <div class="mt-3 d-flex">
                      <button name="accion" value="modificardesarrollo" class="btn btn-warning  mr-1 text-white " type="submit" style="width: 38vw">Modificar</button>
                      <button class="btn btn-danger text-white" name="accion" value="listardesarrollo" type="submit" style="width: 37vw">Cancelar</button>
                     </div>
                </form>
                    
                  <table class="table  nowrap " id="datatable" style="width:100%" >
                      <thead class="thead-light mb-0">
                        <tr>
                          <th scope="col">Acciones-Requerimientos</th>
                          <th scope="col">Estado</th>
                       
                          <th scope="col">Proyecto</th>
                          <th scope="col">Inicio</th>
                          <th scope="col">Fin</th>
                          <th scope="col">Cliente</th>
                          <th scope="col">Trabajador</th>
                          
                        </tr>
                      </thead>
                      <tbody>
                       <c:forEach var="d" items="${de}">  
                        <tr >
                            <td  >
                              <a href="controladoradministrador?accion=capturardesarrollo&idproyecto=${d.getIdproyecto()}" class="btn btn-warning text-white " style="font-size: 15px" id="actualizar" ><i class="fas fa-edit"></i></a> 
                              <input type="hidden" id="idproyecto1" value="${d.getIdproyecto()}"> 
                              <a href="#" id="btndelete1" class="btn btn-danger text-white  "style="font-size: 17px"><i class="fas fa-trash-alt"></i></a>
                              <a href="controladoradministrador?accion=listarrequerimientos&idproyecto=${d.getIdproyecto()}" class="btn  text-white  btn-1 "style="font-size: 15px"><i class="fa-solid fa-list"></i></a>
                                 <c:choose>
                                     <c:when test="${d.getCondicion()=='no'}">
                                     <a href="controladoradministrador?accion=requerimientos&condicion=${d.getCondicion()}&idproyecto=${d.getIdproyecto()}&estado=${d.getEstado()}" class="btn  text-white  btn-primary"style="font-size: 15px; width: 52px "><i class="fa-solid fa-x"></i></a>
                                     </c:when>
                                    
                                     <c:otherwise>
                                         <a href="controladoradministrador?accion=requerimientos&condicion=${d.getCondicion()}&idproyecto=${d.getIdproyecto()}&estado=${d.getEstado()}" class="btn  text-white  btn-success "style="font-size: 15px; width: 52px "><i class="fa-solid fa-check"></i></a>
                                     </c:otherwise>
                                </c:choose>
                            </td>
                          <c:choose>
                            <c:when test="${d.getEstado() == 'Pendiente'}">
                               <td class="m-0 p-1">
                                  <div class="card  text-white bg-danger p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${d.getEstado()}
                                  </div>
                              </td>
                            </c:when>
                            <c:when test="${d.getEstado() == 'Terminado'}">
                              <td class="m-0 p-1">
                                  <div class="card  text-white bg-success p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${d.getEstado()}
                                  </div>
                              </td>
                            </c:when>
                            <c:otherwise>
                              <td class="m-0 p-1">
                                  <div class="card  text-white bg-warning p-1 text-center" style="width: 7rem; font-weight:600; border: none">
                                    ${d.getEstado()}
                                  </div>
                              </td>
                            </c:otherwise>
                          </c:choose>
                          
                          <td>${d.getNombre()}</td>
                          <td>${d.getInicio()}</td>
                          <td>${d.getFin()}</td>
                          <td>${d.getIdcliente().getNombrecli()} ${d.getIdcliente().getApellidocli()}</td>
                          <td>${d.getIdtrabajador().getNombre()} ${d.getIdtrabajador().getApellido()}</td>
                          
                        </tr>
                        </c:forEach>
                     
                      </tbody>
                </table>
                  <!--modal del trabajador-->
                    <div class="modal fade" id="nuevo3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                       <div class="modal-content ml-5  pl-3 pr-3 pb-4" style="width: 450px">
                         <div class="modal-header mod-h ">
                           <h4 class="modal-title p-0  mt-2 mb-1 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-users"></i> Lista de Trabajadores</h4>
                           <div style="border: none" class="close " data-dismiss="modal" aria-label="Close">
                             &times;
                           </div>

                         </div>

                           <form class="d-flex mt-2 mb-3">
                             <div class="input-group ml-2 mr-2 ">
                             <div class="input-group-prepend">
                                 <div class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></div>
                             </div>  
                             <input class="form-control buscarjs  " type="search" placeholder="Buscar" aria-label="Search" >
                             </div>
                           </form>
                           <table class="table m-0" >
                               <thead class="thead-light p-0 m-0 sticky-top">
                                 <tr class="p-0 m-0">

                                   <th scope="col" class="w-25" >Dni</th>
                                   <th scope="col" class="w-50" >Nombre</th>
                                   <th scope="col" >Accion</th> 

                                 </tr>
                               </thead>
                           </table>
                            <div style="height: 350px; overflow-y: auto" >
                            <table class="table m-0" >
                                <tbody  class="tablejs" >
                               <c:forEach var="tra" items="${tr}">
                                 <tr>
                                    <td class="w-25" id="dnitr${tra.getIdtrabajador()}">${tra.getDni()}</td>
                                    <td class="w-50" id="nomtr${tra.getIdtrabajador()}">${tra.getNombre()} ${tra.getApellido()}</td>
                                    <td class=" pt-2 text-center">
                                     <a  href="#" onclick="agregartrabajador('${tra.getIdtrabajador()}')" style="font-size: 22px; color:green" data-dismiss="modal" aria-label="Close">
                                       <i class="fa-solid fa-circle-plus mr-4"></i> 
                                     </a>  

                                   </td>
                                 </tr>
                               </c:forEach>
                               </tbody>
                             </table>
                         </div>
                       </div>
                     </div>
                 </div>

                 <!--modal del Cliente--> 
                   <div class="modal fade" id="nuevo4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                       <div class="modal-content ml-5  pl-3 pr-3 pb-4" style="width: 450px">
                         <div class="modal-header mod-h ">
                           <h4 class="modal-title p-0  mt-2 mb-1 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-users"></i> Lista de Clientes</h4>
                           <div style="border: none" class="close " data-dismiss="modal" aria-label="Close">
                             &times;
                           </div>

                         </div>

                           <form class="d-flex mt-2 mb-3">
                             <div class="input-group ml-2 mr-2 ">
                             <div class="input-group-prepend">
                                 <div class="input-group-text"><i class="fa-solid fa-magnifying-glass"></i></div>
                             </div>  
                             <input class="form-control buscarjs " type="search" placeholder="Buscar" aria-label="Search" >
                             </div>
                           </form>
                           <table class="table m-0" >
                               <thead class="thead-light p-0 m-0 sticky-top">
                                 <tr class="">

                                     <th scope="col" class="w-25" >Dni</th>
                                     <th scope="col" class="w-50" >Nombre</th>
                                   <th scope="col" >Accion</th> 

                                 </tr>
                               </thead>
                           </table>
                            <div style="height: 350px; overflow-y: auto" >
                            <table class="table m-0" >
                                <tbody class="tablejs" >
                               <c:forEach var="cli" items="${cl}"> 
                                 <tr>
                                    <td class="w-25" id="dnicl${cli.getIdcliente()}">${cli.getDnicli()}</td>
                                    <td class="w-50" id="nomcl${cli.getIdcliente()}">${cli.getNombrecli()} ${cli.getApellidocli()}</td>
                                    <td class=" pt-2 text-center">
                                     <a  href="#" onclick="agregarcliente('${cli.getIdcliente()}')" style="font-size: 22px; color:green" data-dismiss="modal" aria-label="Close">
                                       <i class="fa-solid fa-circle-plus mr-4"></i> 
                                     </a>  

                                   </td>
                                 </tr>
                               </c:forEach>
                               </tbody>
                             </table>
                         </div>
                       </div>
                     </div>
                 </div>
                 
                            
                          <!--Modal condicion-->
          <div class="modal fade" id="nuevo5" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content col-sm-11 p-0">
                <div class="modal-header  p-3 ">
                  <h5 class="modal-title  mt-3 mb-2 ml-3  " id="exampleModalLabel"><i class="fa-solid fa-id-card"></i> Ingrese Dni del Trabajador</h5>
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
                            <span style="font-size: 20px"class="input-group-text"  ><i class="las la-address-card"></i></i></span>
                        </div>
                        <input type="text" class="form-control"  name="dni" placeholder="Dni" >
                      </div>
                    </div>




                   <button type="submit" name="accion" value="reporte4" class="btn  btn-block mt-4 mb-2 btn-1 text-white" >Generar Reporte</button>


                 </div>

                </form>
              </div>
              </div>
            </div>
        </div>
           
           <!--Modal condicion-->   
                  
                  
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
     <script >
         $(document).ready(function() {
            $('#datatable').DataTable( {
                "scrollX": true,
                "ordering": false,
                "language": {
                    "lengthMenu": "Mostrar _MENU_ Registros por paginas",
                    "zeroRecords": "Nada encontrado - disculpa",
                    "info": "Mostrando la pagina _PAGE_ de _PAGES_",
                    "infoEmpty": "No hay datos a mostrar",
                    "infoFiltered": "(Filtrado de _MAX_ Registros Totales)",
                    "search":"Buscar:",
                    "paginate":{
                        "next":"Siguiente",
                        "previous":"Anterior"
                    }
                    
                }
               
            } );
        } );
         
     </script>
     <script  type="text/javascript">
         $(function(){
            $('.calen').datepicker({
                format: "yyyy/mm/dd",
                language: "es",
                orientation: "bottom left"
               });
         });
     </script>
     <script src="js/Buscar.js" type="text/javascript"></script>
     <script  type="text/javascript">
          function agregarcliente(idcliente){
             nomcliente=document.getElementById("nomcl"+idcliente).innerHTML;
             $("#idcliente").val(idcliente);
             $("#clientee").val(nomcliente);
          }
          function agregartrabajador(idtrabajador){
              nomtrabajador=document.getElementById("nomtr"+idtrabajador).innerHTML;
              $("#idtrabajador").val(idtrabajador);
              $("#trabajadorr").val(nomtrabajador);
          }
          
     </script>
     <script src="js/deleteproyectodesarrollo.js" type="text/javascript"></script>
     <script src="js/mensajescrud.js" type="text/javascript"></script>
</html>

