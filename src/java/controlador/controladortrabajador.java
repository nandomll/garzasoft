/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import bean.beantrabajador;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.logicrequerimientos;
import logic.logictrabajador;

/**
 *
 * @author hp
 */
public class controladortrabajador extends HttpServlet {
    logictrabajador ltrab=new logictrabajador();
     beantrabajador btrab=new beantrabajador();
     logicrequerimientos lreq =new logicrequerimientos();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion =request.getParameter("accion");
       
         switch(accion){
             case "vista":
                 String dnitrabajador=request.getParameter("dnitrabajador");
                 request.setAttribute("ptrabajador", ltrab.listarpordni(dnitrabajador));
                 request.getRequestDispatcher("trab-principal.jsp").forward(request, response);
             break;
             case "perfil":
                    int idtrabajador=Integer.parseInt(request.getParameter("idtrabajador"));
                    request.setAttribute("untrabajador", ltrab.trabajador(idtrabajador));
                    request.getRequestDispatcher("trab-perfil.jsp").forward(request, response);
             break;
             case "actualizar":
                    String claveantigua=request.getParameter("claveantigua");
                    String clavenueva=request.getParameter("clavenueva");
                    String rclavenueva=request.getParameter("rclavenueva");
                    String clave= request.getParameter("clave");
                    int id=Integer.parseInt(request.getParameter("idtrabajador"));
                        if(claveantigua.equalsIgnoreCase("")&&clavenueva.equalsIgnoreCase("")&&rclavenueva.equalsIgnoreCase(""))
                        {
                             btrab.setTelefono(request.getParameter("telefono"));
                             btrab.setCorreo(request.getParameter("correo"));
                             btrab.setIdtrabajador(Integer.parseInt(request.getParameter("idtrabajador")));
                             ltrab.actualizar(btrab); 
                             request.setAttribute("rpta", "correcto");
                        }else{
                             if( clave.equals(claveantigua) && clavenueva.equalsIgnoreCase(rclavenueva)&& 
                                 clavenueva!="" && rclavenueva!="")
                             {
                             btrab.setTelefono(request.getParameter("telefono"));
                              btrab.setCorreo(request.getParameter("correo"));
                              btrab.setIdtrabajador(Integer.parseInt(request.getParameter("idtrabajador")));
                              ltrab.actualizar(btrab);
                              btrab.setClave(claveantigua);
                              ltrab.actualizarclave(btrab, clavenueva);
                              request.setAttribute("rpta", "correcto");    
                             }else{
                               request.setAttribute("rpta","incorrecto");
                             }

                         }
                    request.getRequestDispatcher("controladortrabajador?accion=perfil&idtrabajador="+id).forward(request, response);     

             break;
             case "proyecto":
                  int idtrabajadorp=Integer.parseInt(request.getParameter("idtrabajador"));
                  request.setAttribute("pro",ltrab.proyecto(idtrabajadorp));
                  int idproyecto=ltrab.proyecto(idtrabajadorp).getIdproyecto();
                  request.setAttribute("re",lreq.listar(idproyecto));
                  request.getRequestDispatcher("trab-proyecto.jsp").forward(request, response);
             break;
             case "cambiarestado":
                  int idtrabac=Integer.parseInt(request.getParameter("idtrabajador"));
                  int idproyectoc=Integer.parseInt(request.getParameter("idproyecto"));
                  String estado =request.getParameter("estado");
                  if(estado.equalsIgnoreCase("Pendiente")){
                    ltrab.actualizaraproceso(idproyectoc);
                  }
                  if(estado.equalsIgnoreCase("En Proceso")){
                      ltrab.actualizaraterminado(idproyectoc);
                      ltrab.actualizarocupado(idtrabac);
                  }
                  
                  
             break;
             case "cambiarestadorequerimiento":
               int idproyece=Integer.parseInt(request.getParameter("idproyecto"));
               int idtrabajadorcr=Integer.parseInt(request.getParameter("idtrabajador"));
               String estadocr=request.getParameter("estado");
               int idrequerimientocr=Integer.parseInt(request.getParameter("idrequerimiento"));
               
               if(estadocr.equalsIgnoreCase("Pendiente")){
                   lreq.actualizaraenproceso(idrequerimientocr);
               }
               if(estadocr.equalsIgnoreCase("En Proceso")){
                   lreq.actualizaraterminado(idrequerimientocr);
               }
               if(Integer.parseInt(lreq.numrequerimientosenproceso(idproyece))>0){
                   ltrab.actualizaraproceso(idproyece);
               }
               if(Integer.parseInt(lreq.numrequerimientos(idproyece))==Integer.parseInt(lreq.numrequerimientoterminados(idproyece))){
                  ltrab.actualizaraterminado(idproyece);
                   ltrab.actualizarocupado(idtrabajadorcr);
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
