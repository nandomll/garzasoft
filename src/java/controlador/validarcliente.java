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
import javax.servlet.http.HttpSession;
import logic.logiccliente;

/**
 *
 * @author hp
 */
public class validarcliente extends HttpServlet {
    beancliente bcli =new beancliente();
    logiccliente lcli=new logiccliente();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      
           String accion=request.getParameter("accion");
            HttpSession obSesion = request.getSession();
         
              switch(accion){
              
                case "ingresar":
                    /*ingresa a panel de cliente*/
                        String usuario=request.getParameter("usuario");
                        String clave=request.getParameter("password");
                        bcli=lcli.validar(usuario, clave);
                        if(bcli.getDnicli()!=null){
                            obSesion.setAttribute("cliente", bcli);
                            request.setAttribute("rpta1","Bienvenido");
                            request.getRequestDispatcher("controladorcliente?accion=vista&dnicliente="+usuario).forward(request, response);
                        }else{
                            request.setAttribute("rpta2", "Credenciales Incorrectos");
                           request.getRequestDispatcher("logeo.jsp").forward(request, response);   
                        }
                      
                 break;
                case "cerrar":
                        obSesion.setAttribute("cliente", null);
                        obSesion.invalidate();
                        request.getRequestDispatcher("logeo.jsp").forward(request, response);  

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
