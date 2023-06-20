/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import bean.beancliente;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import logic.logiccliente;
import logic.logicproyecto;
import logic.logicrequerimientos;

/**
 *
 * @author hp
 */
public class controladorcliente extends HttpServlet {
   logiccliente lcli = new logiccliente();
    beancliente bcli =new beancliente();
   logicproyecto lpro=new logicproyecto();
   logicrequerimientos lre=new logicrequerimientos();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         String accion =request.getParameter("accion");
         switch(accion){
             case "vista":
                   String dnicliente=request.getParameter("dnicliente");
                   request.setAttribute("clientelis", lcli.listarpordni(dnicliente));
                   request.setAttribute("npro", lcli.numerodeproyectosporcliente(dnicliente));
                   request.setAttribute("nso", lcli.numerodesoporteporcliente(dnicliente));
                   request.setAttribute("nde", lcli.numerodedesarrolloporcliente(dnicliente));
                   request.setAttribute("npendiente", lcli.numdeproyectospendientes(dnicliente));
                   request.setAttribute("nenproceso", lcli.numdeproyectosenproceso(dnicliente));
                   request.setAttribute("nterminado", lcli.numdeproyectosterminados(dnicliente));
                   request.getRequestDispatcher("cli-principal.jsp").forward(request, response);
             break;
             case "perfil":
                    int idcliente=Integer.parseInt(request.getParameter("idcliente"));
                    request.setAttribute("uncliente", lcli.cliente(idcliente));
                    request.getRequestDispatcher("cli-perfil.jsp").forward(request, response);
             break;
             case "actualizar":
                    String claveantigua=request.getParameter("claveantigua");
                    String clavenueva=request.getParameter("clavenueva");
                    String rclavenueva=request.getParameter("rclavenueva");
                    String clave= request.getParameter("clave");
                    int id=Integer.parseInt(request.getParameter("idcliente"));
                        if(claveantigua.equalsIgnoreCase("")&&clavenueva.equalsIgnoreCase("")&&rclavenueva.equalsIgnoreCase(""))
                        {
                             bcli.setTelefonocli(request.getParameter("telefono"));
                             bcli.setCorreocli(request.getParameter("correo"));
                             bcli.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
                             lcli.actualizar(bcli); 
                             request.setAttribute("rpta", "correcto");
                        }else{
                             if( clave.equals(claveantigua) && clavenueva.equalsIgnoreCase(rclavenueva)&& 
                                 clavenueva!="" && rclavenueva!="")
                             {
                               bcli.setTelefonocli(request.getParameter("telefono"));
                               bcli.setCorreocli(request.getParameter("correo"));
                               bcli.setIdcliente(Integer.parseInt(request.getParameter("idcliente")));
                               lcli.actualizar(bcli);
                               bcli.setClavecli(claveantigua);
                               lcli.actualizarclave(bcli, clavenueva);
                              request.setAttribute("rpta", "correcto");    
                             }else{
                               request.setAttribute("rpta","incorrecto");
                             }

                         }
                    request.getRequestDispatcher("controladorcliente?accion=perfil&idcliente="+id).forward(request, response);     
             break;
             case "listarsoportes":
                 int idclientes=Integer.parseInt(request.getParameter("idcliente"));
                 request.setAttribute("so", lcli.listarpoyectosporsoporte(idclientes));
                 request.getRequestDispatcher("cli-pdesoporte.jsp").forward(request, response);
             break;
             case "listardesarrollo": 
                 int idcliented=Integer.parseInt(request.getParameter("idcliente"));
                 request.setAttribute("de", lcli.listarpoyectospordesarrollo(idcliented));
                 request.getRequestDispatcher("cli-pdedesarrollo.jsp").forward(request, response);
                 
             break;
             case "listarrequerimientos":
                int idproyec=Integer.parseInt(request.getParameter("idproyecto"));
                request.setAttribute("pro",lpro.proyecto(idproyec));
                request.setAttribute("lis",lre.listar(idproyec));
                request.getRequestDispatcher("cli-requerimientos.jsp").forward(request, response);
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
