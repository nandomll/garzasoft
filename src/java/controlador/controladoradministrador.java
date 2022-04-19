/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import bean.beanadministrador;
import bean.beancliente;

import bean.beanproyecto;
import bean.beanrequerimientos;
import bean.beantrabajador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.logicadministrador;
import logic.logiccliente;

import logic.logicproyecto;
import logic.logicrequerimientos;
import logic.logictrabajador;

/**
 *
 * @author hp
 */
public class controladoradministrador extends HttpServlet {
    logiccliente lcli =new logiccliente();
    beancliente bcli=new beancliente();
    logictrabajador ltra=new logictrabajador();
    beantrabajador btra=new beantrabajador();
    logicproyecto lpro=new logicproyecto();
    beanproyecto bpro=new beanproyecto();
    logicadministrador ladm= new logicadministrador();
    beanadministrador badm=new beanadministrador();
    logicrequerimientos lreq=new logicrequerimientos();
    beanrequerimientos breq=new beanrequerimientos();
    List<beanrequerimientos> lista= new ArrayList<>();
    int item;
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
         String accion =request.getParameter("accion");
        
           switch(accion){
            case "vista":
                    request.setAttribute("numcliente", lcli.numerodecliente());  
                    request.setAttribute("numtrabajador", ltra.numerodetrabajadores());    
                    request.setAttribute("numproyecto", lpro.numerodeproyectos());
                    request.setAttribute("tr", ltra.listar());
                    request.setAttribute("pen", lpro.numerodeproyectospendientes());
                    request.setAttribute("enpro", lpro.numerodeproyectosenproceso());
                    request.setAttribute("ter", lpro.numerodeproyectosterminado());
                    request.getRequestDispatcher("admi-principal.jsp").forward(request, response);  
             break;
             case "perfil":
                    int idadministrador=Integer.parseInt(request.getParameter("idadministrador"));
                    request.setAttribute("unadministrador", ladm.administrador(idadministrador));
                    request.getRequestDispatcher("admi-perfil.jsp").forward(request, response);
             break;
             case "actualizar":
                    String claveantigua=request.getParameter("claveantigua");
                    String clavenueva=request.getParameter("clavenueva");
                    String rclavenueva=request.getParameter("rclavenueva");
                    String clave= request.getParameter("clave");
                    int id=Integer.parseInt(request.getParameter("idadministrador"));
                        if(claveantigua.equalsIgnoreCase("")&&clavenueva.equalsIgnoreCase("")&&rclavenueva.equalsIgnoreCase(""))
                        {
                             badm.setTelefonoadmi(request.getParameter("telefono"));
                             badm.setCorreoadmi(request.getParameter("correo"));
                             badm.setIdadministrador(Integer.parseInt(request.getParameter("idadministrador")));
                             ladm.actualizar(badm);
                             request.setAttribute("rpta", "correcto");
                        }else{
                             if( clave.equalsIgnoreCase(claveantigua) && clavenueva.equalsIgnoreCase(rclavenueva)&& 
                                 clavenueva!="" && rclavenueva!="")
                             {
                              badm.setTelefonoadmi(request.getParameter("telefono"));
                              badm.setCorreoadmi(request.getParameter("correo"));
                              badm.setIdadministrador(Integer.parseInt(request.getParameter("idadministrador")));
                              ladm.actualizar(badm);
                              badm.setClaveadmi(claveantigua);
                              ladm.actualizarclave(badm, clavenueva);
                              request.setAttribute("rpta", "correcto");    
                             }else{
                               request.setAttribute("rpta","incorrecto");
                             }

                         }
                    request.getRequestDispatcher("controladoradministrador?accion=perfil&idadministrador="+id).forward(request, response);     

             break;
             
             case "listarclientes":
                   request.setAttribute("c", lcli.listar());
                   request.getRequestDispatcher("admi-clientes.jsp").forward(request, response);
             break;
             
             case "agregarcliente":
                   String clave1=request.getParameter("clave1");
                   String clave2=request.getParameter("clave2");
                   if(clave1.equalsIgnoreCase(clave2) && clave1!="" && clave2!=""){
                   String dni=request.getParameter("dni");
                   String fechadeingreso=request.getParameter("fecha");
                   bcli.setDnicli(dni);
                   bcli.setNombrecli(request.getParameter("nombre"));
                   bcli.setApellidocli(request.getParameter("apellido"));
                   bcli.setTelefonocli(request.getParameter("telefono"));
                   bcli.setSexocli(request.getParameter("genero"));
                   bcli.setClavecli(clave1);
                   bcli.setCorreocli(request.getParameter("correo"));
                   bcli.setIngresocli(fechadeingreso);
                   request.setAttribute("msj", lcli.agregar(bcli, dni, fechadeingreso));
                   }else{
                    request.setAttribute("msj","errorclave" );   
                   }
                   request.getRequestDispatcher("controladoradministrador?accion=listarclientes").forward(request, response);
                   
             break;
             case "modificarcliente":
                   String clave3=request.getParameter("clave3");
                   String clave4=request.getParameter("clave4");
                  if(clave3.equalsIgnoreCase(clave4) && clave3!="" && clave4!=""){
                   String dni1=request.getParameter("dni1");
                   String fechadeingreso1=request.getParameter("fecha1");
                   bcli.setDnicli(dni1);
                   bcli.setNombrecli(request.getParameter("nombre1"));
                   bcli.setApellidocli(request.getParameter("apellido1"));
                   bcli.setTelefonocli(request.getParameter("telefono1"));
                   bcli.setSexocli(request.getParameter("genero1"));
                   bcli.setClavecli(clave3);
                   bcli.setCorreocli(request.getParameter("correo1"));
                   bcli.setIngresocli(fechadeingreso1);
                   bcli.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
                   request.setAttribute("msj", lcli.actualizarcliente(bcli, dni1, fechadeingreso1));
                   }else{
                    request.setAttribute("msj","errorclave" );   
                   }
                   request.getRequestDispatcher("controladoradministrador?accion=listarclientes").forward(request, response);   
             break;
             case "eliminarcliente":
                   int idcliente=Integer.parseInt(request.getParameter("idcliente"));
                   lcli.eliminar(idcliente);
             break;
             case "listartrabajadores":
                   request.setAttribute("t", ltra.listar());
                   request.getRequestDispatcher("admi-trabajador.jsp").forward(request, response);
             break;
             case "cambiarestado":
                  int idtrab=Integer.parseInt(request.getParameter("idtrab"));
                  String estado=request.getParameter("estado");
                  if(estado.equalsIgnoreCase("libre")){
                     ltra.actualizarlibre(idtrab); 
                  }
                  if(estado.equalsIgnoreCase("ocupado")){
                      ltra.actualizarocupado(idtrab);
                  }
             break;
             
             case "agregartrabajador":
                   String clav1=request.getParameter("clave1");
                   String clav2=request.getParameter("clave2");
                   if(clav1.equalsIgnoreCase(clav2) && clav1!="" && clav2!=""){
                   String dni=request.getParameter("dni");
                   String fechadeingreso=request.getParameter("fecha");
                   btra.setDni(dni);
                   btra.setNombre(request.getParameter("nombre"));
                   btra.setApellido(request.getParameter("apellido"));
                   btra.setTelefono(request.getParameter("telefono"));
                   btra.setSexo(request.getParameter("genero"));
                   btra.setClave(clav1);
                   btra.setCorreo(request.getParameter("correo"));
                   btra.setIngreso(fechadeingreso);
                   request.setAttribute("msj", ltra.agregar(btra, dni, fechadeingreso));
                   }else{
                    request.setAttribute("msj","errorclave" );   
                   }
                   request.getRequestDispatcher("controladoradministrador?accion=listartrabajadores").forward(request, response);
             break;
             case "modificartrabajador":
                   String clav3=request.getParameter("clave3");
                   String clav4=request.getParameter("clave4");
                   if(clav3.equalsIgnoreCase(clav4) && clav3!="" && clav4!=""){
                   String dni1=request.getParameter("dni1");
                   String fechadeingreso=request.getParameter("fecha1");
                   btra.setDni(dni1);
                   btra.setNombre(request.getParameter("nombre1"));
                   btra.setApellido(request.getParameter("apellido1"));
                   btra.setTelefono(request.getParameter("telefono1"));
                   btra.setSexo(request.getParameter("genero1"));
                   btra.setClave(clav3);
                   btra.setCorreo(request.getParameter("correo1"));
                   btra.setIngreso(fechadeingreso);
                   btra.setIdtrabajador(Integer.parseInt(request.getParameter("idtrabajador")));
                   request.setAttribute("msj", ltra.actualizartrabajador(btra, dni1, fechadeingreso));
                   }else{
                    request.setAttribute("msj","errorclave" );   
                   }
                   request.getRequestDispatcher("controladoradministrador?accion=listartrabajadores").forward(request, response);
             break;
             case "eliminartrabajador":
                   int idtrabajador=Integer.parseInt(request.getParameter("idtrabajador"));
                   ltra.eliminar(idtrabajador);
             break;
             case "listarsoportes":
                  request.setAttribute("tr", ltra.listarporestado());
                  request.setAttribute("cl", lcli.listar());
                  request.setAttribute("so", lpro.listarproyectosporsoporte());
                  request.getRequestDispatcher("admi-pdesoporte.jsp").forward(request, response);
             break;
            case "agregarsoporte":
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idcli=Integer.parseInt(request.getParameter("idcliente"));
                 int idtra=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idcli);
                 btra.setIdtrabajador(idtra);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setTipo("Soporte");  
                 bpro.setCondicion("si");
                 ltra.actualizarlibre(idtra);
                 bpro.setMantenimiento("no");
                 request.setAttribute("msj", lpro.agregar(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listarsoportes").forward(request, response);
             break;
             case "eliminarproyecto":
                   int idproyecto=Integer.parseInt(request.getParameter("idproyecto"));
                   lpro.elimina(idproyecto);
             break;
             case "capturarsoporte":
                  request.setAttribute("unsoporte", lpro.proyecto(Integer.parseInt(request.getParameter("idproyecto"))));
                  request.setAttribute("tr", ltra.listarporestado());
                  request.setAttribute("cl", lcli.listar());
                  request.setAttribute("so", lpro.listarproyectosporsoporte());
                  request.getRequestDispatcher("admi-pdesoportemodificar.jsp").forward(request, response);
             break;
             case "modificarsoporte":
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idclien=Integer.parseInt(request.getParameter("idcliente"));
                 int idtraba=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idclien);
                 btra.setIdtrabajador(idtraba);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setIdproyecto(Integer.parseInt(request.getParameter("idproyecto")));
                 ltra.actualizarlibre(idtraba);
                 request.setAttribute("msj", lpro.actualizarproyecto(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listarsoportes").forward(request, response);
             break;
             
             case "listardesarrollo":
                  request.setAttribute("tr", ltra.listarporestado());
                  request.setAttribute("cl", lcli.listar());
                  request.setAttribute("de", lpro.listarproyectospordesarrollo());
                  request.getRequestDispatcher("admi-pdedesarrollo.jsp").forward(request, response);
             break;
             case "agregardesarrollo":
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idclie=Integer.parseInt(request.getParameter("idcliente"));
                 int idtr=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idclie);
                 btra.setIdtrabajador(idtr);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setTipo("Desarrollo"); 
                 bpro.setCondicion("no");
                 bpro.setMantenimiento("no");
                 ltra.actualizarlibre(idtr);
                 request.setAttribute("msj", lpro.agregar(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response);  
             break;
             case "capturardesarrollo":
                    request.setAttribute("undesarrollo", lpro.proyecto(Integer.parseInt(request.getParameter("idproyecto"))));
                    request.setAttribute("tr", ltra.listarporestado());
                    request.setAttribute("cl", lcli.listar());
                    request.setAttribute("de", lpro.listarproyectospordesarrollo());
                    request.getRequestDispatcher("admi-pdedesarrollomodificar.jsp").forward(request, response);
             break;
             case "modificardesarrollo":
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idc=Integer.parseInt(request.getParameter("idcliente"));
                 int idt=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idc);
                 btra.setIdtrabajador(idt);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setIdproyecto(Integer.parseInt(request.getParameter("idproyecto")));
                 ltra.actualizarlibre(idt);
                 request.setAttribute("msj", lpro.actualizarproyecto(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response);
                 
             break;
             case "requerimientos":
                  String condicion=request.getParameter("condicion");
                  int idp=Integer.parseInt(request.getParameter("idproyecto"));
                  String estado1=request.getParameter("estado");
                  lista.clear();
                  item=0;
                  if(condicion.equalsIgnoreCase("no")){
                    request.setAttribute("undesarrollo", lpro.proyecto(idp));
                    request.getRequestDispatcher("admi-requerimientos.jsp").forward(request, response);  
                  }
                  if(condicion.equalsIgnoreCase("si")){
                     if(estado1.equalsIgnoreCase("Terminado")){
                       request.setAttribute("msj1", idp);
                       request.setAttribute("msj", "norequerimientos"); 
                       request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response);  
                     }else{
                       request.setAttribute("msj1", idp);
                       request.setAttribute("msj", "nrequerimientos"); 
                       request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response); 
                     }
                     
                  }   
             break;
             
             case "masrequerimientos":
                     int idpro=Integer.parseInt(request.getParameter("idproyecto"));
                     request.setAttribute("undesarrollo", lpro.proyecto(idpro));
                    request.getRequestDispatcher("admi-requerimientosnuevos.jsp").forward(request, response); 
             break;
             case "mantenimiento":
                 int idproy=Integer.parseInt(request.getParameter("idproyecto"));
                     request.setAttribute("undesarrollo", lpro.proyecto(idproy));
                    request.getRequestDispatcher("admi-requerimientomantenimiento.jsp").forward(request, response); 
              
             break;    
             case "modificarfecha":
                    int idproyem=Integer.parseInt(request.getParameter("idproyecto"));
                    String fin=request.getParameter("fechafin");
                    String fin2=request.getParameter("fechafinmo");
                    if(fin2==""){
                        bpro.setFin(fin);
                        bpro.setIdproyecto(idproyem);
                        lpro.modificarfecha(bpro);
                    }else{
                        bpro.setFin(fin2);
                        bpro.setIdproyecto(idproyem);
                       request.setAttribute("msj",lpro.modificarfecha(bpro));
                    }
           
                  request.getRequestDispatcher("controladoradministrador?accion=requerimientos&condicion=no&idproyecto="+idproyem).forward(request, response);
             break;
             case "agregarrequerimiento":
                 int idproyector=Integer.parseInt(request.getParameter("idproyecto"));
                 breq=new beanrequerimientos();
                 item=item+1;
                 breq.setIdrequeriminetos(item);
                 breq.setRequerimientos(request.getParameter("requerimiento"));
                 request.setAttribute("undesarrollo", lpro.proyecto(idproyector));
                 lista.add(breq);
                 request.setAttribute("li", lista);
                 request.getRequestDispatcher("admi-requerimientos.jsp").forward(request, response);
             break;
             case "eliminarlista":
                  int idproyectol=Integer.parseInt(request.getParameter("idproyecto"));
                  request.setAttribute("undesarrollo", lpro.proyecto(idproyectol));
                  int idrequerimiento=Integer.parseInt(request.getParameter("idreque"));
                  for(int i=0; i<lista.size();i++){
                      if(lista.get(i).getIdrequeriminetos()==idrequerimiento){
                          lista.remove(i);
                      }
                  }
                  
                  request.setAttribute("li", lista);
                  request.getRequestDispatcher("admi-requerimientos.jsp").forward(request, response);
             break;
             case "generarrequerimientos":
              int idproyectog=Integer.parseInt(request.getParameter("idproyecto"));
              bpro.setIdproyecto(idproyectog);
              for(int i=0; i<lista.size();i++){
                    breq=new beanrequerimientos();
                    breq.setRequerimientos(lista.get(i).getRequerimientos());
                    breq.setIdproyecto(bpro);
                    lreq.agregar(breq);
                  }
                lpro.actualizarproyectocondicion(bpro);
               request.setAttribute("msj", "resgistradorequerimientos");
               request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response);
             break;      
             case "listarrequerimientos":
                int idproyectolist=Integer.parseInt(request.getParameter("idproyecto"));
                request.setAttribute("undesarrollo", lpro.proyecto(idproyectolist));
                request.setAttribute("lis",lreq.listar(idproyectolist));
                request.getRequestDispatcher("admi-requerimiento-lista.jsp").forward(request, response);
             break;
             case "modificarrequerimientos":
                  int idproyecto3=Integer.parseInt(request.getParameter("idpro"));
                  breq.setIdrequeriminetos(Integer.parseInt(request.getParameter("idrequerimiento")));
                  breq.setRequerimientos(request.getParameter("requerimiento"));
                  request.setAttribute("msj",lreq.actualizar(breq));
                  request.getRequestDispatcher("controladoradministrador?accion=listarrequerimientos&idproyecto="+idproyecto3).forward(request, response);
             break;
             case "eliminarrequerimiento":
                  int idrequeri=Integer.parseInt(request.getParameter("idrequerimiento"));
                  lreq.eliminar(idrequeri);
             break; 
             case "listarmantenimientos":
                 request.setAttribute("tr", ltra.listarporestado());
                 request.setAttribute("des", lpro.listarproyectosporsoportemantenimientoterminado());
                 request.setAttribute("de", lpro.listarproyectosporsoportemantenimiento());
                 request.getRequestDispatcher("admi-pdedesarrollomantenimiento.jsp").forward(request, response);
             break;
             case "agregarmantenimiento":
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idclientem=Integer.parseInt(request.getParameter("idcliente"));
                 int idtram=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idclientem);
                 btra.setIdtrabajador(idtram);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setTipo("Desarrollo"); 
                 bpro.setCondicion("no");
                 bpro.setMantenimiento("si");
                 ltra.actualizarlibre(idtram);
                 request.setAttribute("msj", lpro.agregar(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listarmantenimientos").forward(request, response);  
             break;
             case "capturarmantenimiento":
                  request.setAttribute("undesarrollo", lpro.proyecto(Integer.parseInt(request.getParameter("idproyecto"))));
                  request.setAttribute("tr", ltra.listarporestado());
                  request.setAttribute("des", lpro.listarproyectosporsoportemantenimientoterminado());
                  request.setAttribute("de", lpro.listarproyectosporsoportemantenimiento());
                  request.getRequestDispatcher("admi-pdedesarrollomantenimientomodificar.jsp").forward(request, response);
             break;
             case "modificarcarmantenimiento":
             
                 bpro.setInicio(request.getParameter("fechainicio"));
                 bpro.setFin(request.getParameter("fechafin"));
                 int idcm=Integer.parseInt(request.getParameter("idcliente"));
                 int idtm=Integer.parseInt(request.getParameter("idtrabajador"));
                 bcli.setIdcliente(idcm);
                 btra.setIdtrabajador(idtm);
                 bpro.setIdcliente(bcli);
                 bpro.setIdtrabajador(btra);
                 bpro.setNombre(request.getParameter("proyecto"));
                 bpro.setIdproyecto(Integer.parseInt(request.getParameter("idproyecto")));
                 ltra.actualizarlibre(idtm);
                 request.setAttribute("msj", lpro.actualizarproyecto(bpro));
                 request.getRequestDispatcher("controladoradministrador?accion=listarmantenimientos").forward(request, response);
             
             
             break;
                 case "requerimientos2":
                  String condicion1=request.getParameter("condicion");
                  int idp1=Integer.parseInt(request.getParameter("idproyecto"));
                  String estado2=request.getParameter("estado");
                  lista.clear();
                  item=0;
                  if(condicion1.equalsIgnoreCase("no")){
                    request.setAttribute("undesarrollo", lpro.proyecto(idp1));
                    request.getRequestDispatcher("admi-requerimientos.jsp").forward(request, response);  
                  }
                  if(condicion1.equalsIgnoreCase("si")){
                     if(estado2.equalsIgnoreCase("Terminado")){
                       request.setAttribute("msj1", idp1);
                       request.setAttribute("msj", "norequerimientos"); 
                       request.getRequestDispatcher("controladoradministrador?accion=listarmantenimientos").forward(request, response);  
                     }else{
                       request.setAttribute("msj1", idp1);
                       request.setAttribute("msj", "nrequerimientos"); 
                       request.getRequestDispatcher("controladoradministrador?accion=listarmantenimientos").forward(request, response); 
                     }
                     
                  }   
             break;
             
              default:
                 throw new AssertionError();
       
          }
        
        
        
        
        
        
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
