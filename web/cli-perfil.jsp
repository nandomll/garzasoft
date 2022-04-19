<%-- 
    Document   : cli-perfil
    Created on : 14/03/2022, 09:33:05 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <title>JSP Page</title>
        <link href="css/cli-perfli.css" rel="stylesheet" type="text/css"/>
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
                      <a href="controladorcliente?accion=listardesarrollo&idcliente=${cliente.getIdcliente()}">Desarrollo </a>   
                       
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
        <div class=" contenido pl-4 pr-4 pt-4 pb-2"> 
           <div class="ma-1 h4 pt-1 pb-3 ml-2 mr-2"><i class="fas fa-user"></i> Perfil  del Usuario</div>
             <section class="d-flex cards">
                <div class="card p-3" style="width: 46rem;">
                  <div class="card-body">
                    <h5 class="card-title mt-3 mb-4"><i class="fa-solid fa-user-pen"></i> Datos Personales</h5>
                    <form action="controladorcliente" id="formulario" method="post">
                    <input type="hidden" name="idcliente" value="${cliente.getIdcliente()}">
                    <input type="hidden" name="clave" id="idclave"  value="${cliente.getClavecli()}"> 
                          <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="idnombre" class=" pb-1 ">Nombres : </label>
                              <input type="text" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1 read" id="idnombre" value="${uncliente.getNombrecli()}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                              <label for="idapellido" class=" pb-1 ">Apellidos : </label>
                              <input type="text" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1 read" id="idapellido" value="${uncliente.getApellidocli()}" readonly>
                            </div>
                          </div>
                         <div class="form-row">
                            <div class="form-group col-md-6">
                              <label for="iddni" class=" pb-1 " >Dni : </label>
                              <input type="text" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1 read" id="iddni" value="${uncliente.getDnicli()}" readonly>
                            </div>
                            <div class="form-group col-md-6">
                              <label for="idtelefono" class=" pb-1 " >Telefono : </label>
                              <input type="text" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1" id="idtelefoni" name="telefono"  value="${uncliente.getTelefonocli()}">
                            </div>
                          </div>
                          <div class="form-group ">
                              <label for="idcorreo" class=" pb-1 ">Correo : </label>
                              <input type="email" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1" id="idcorreo" name="correo" value="${uncliente.getCorreocli()}">
                          </div>
                         <h5 class="card-title mb-4" style="margin-top: 33px"><i class="fa-solid fa-lock"></i> Cambiar Contraseña</h5>
                         <div class="form-row">
                          <p class="card-text pt-2 pb-3 pl-3 pr-3">Para actualizar la contraseña de esta cuenta debera ingresar la contraseña actual, una nueva y volverla a escribir. En caso que no desee actualizarla debe dejar los 3 campos vacios</p>
                            <div class="form-group col-md-4">
                              <label for="idcontraseña" class=" pb-1 " >Contraseña Actual : </label>
                              <input type="password" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1" id="idclaveantigua" name="claveantigua" placeholder="Ingrese Contraseña Actual">
                              <div class=" invalid-feedback  text-danger pl-2 mt-2" id="no_valido"><i class="fa-solid fa-circle-exclamation"></i>  Ingrese contraseña correcta </div>
                            </div>
                             <div class="form-group col-md-4">
                              <label for="idcontraseña" class=" pb-1 ">Contraseña Nueva : </label>
                              <input type="password" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1" id="idclavenueva" name="clavenueva" placeholder="Ingrese Contraseña Nueva">
                              <div class="invalid-feedback  ml-2 text-danger pl-2 mt-2" id="no_valido1"><i class="fa-solid fa-circle-exclamation"></i> Ambas contraseñas deben ser igual </div>
                            </div>
                             <div class="form-group col-md-4">
                              <label for="idcontraseña" class=" pb-1 ">Repita Contraseña Nueva : </label>
                              <input type="password" class="pb-1 pt-1 pl-2 pr-2 w-100 m-1" id="idclavenuevar" name="rclavenueva" placeholder="Repita Contraseña Nueva">
                               <div class="invalid-feedback  ml-2 text-danger pl-2 mt-2" id="no_valido2"><i class="fa-solid fa-circle-exclamation"></i> Ambas contraseñas deben ser igual </div>
                            </div>
                            
                          </div>
                          
                      
                       
                         <button type="submit " name="accion" value="actualizar" class="btn btn-primary float-right mt-5  mb-2 pl-5 pr-5 pb-2 pt-2 "><i class="fa-regular fa-floppy-disk mr-1 ml-1" style="font-size: 22px"></i>  ACTUALIZAR</button>
                        </form>
                  </div>
                </div>
                 <div class="card" style="width: 20rem; height:350px">
                  <div class="card-body perfil text-center" style="height: 200px ">
                    <img  class=" bg-white rounded-circle mt-4" src="imagenes/icon2.png" width="90px" height="90px"/>
                    <h5 class="pt-4 text-white">Cliente</h5>
                    <p class="text-white mb-3">${uncliente.getCorreocli()}</p>
                   
                  </div>
                  <div class="card-body" >
                   
                  </div>
                </div> 
             
             </section>              
           
        </div>
        
        <input type="hidden" id="msj2" value="${rpta}">
    </body>
    
    
     <script src="https://kit.fontawesome.com/ef7654b222.js" crossorigin="anonymous"></script> 
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
     <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
     <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
     <script src="js/validaciondeperfil.js" type="text/javascript"></script>
     <script src="js/sweetalertperfiles.js" type="text/javascript"></script>
     <script src="js/Efectodespejable.js" type="text/javascript"></script>
</html>
