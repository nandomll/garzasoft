/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import config.conexion;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author hp
 */
public class controladorreportes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion =request.getParameter("accion");
        String condicion;
        String dni;
        /*Reporte de clientes*/
        if(accion.equalsIgnoreCase("reporte1")){
               try{
                     condicion=request.getParameter("condicion");
                     
                     if(condicion==""){
                     
                      request.getRequestDispatcher("controladoradministrador?accion=listarclientes").forward(request, response);
                     
                     }else{
                     conexion cn=new conexion();
                     File reportfile = new File (request.getServletContext().getRealPath("reporte/rp-clientes.jasper"));
                     Map parametro=new HashMap();
                     parametro.put("condicion",condicion);
                     byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(),parametro, cn.getConnection());
                     response.setContentType("application/pdf");
                     response.setContentLength(bytes.length);
                     response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");
                     ServletOutputStream outputstream = response.getOutputStream();
                     outputstream.write(bytes,0,bytes.length);
                     outputstream.flush();
                     outputstream.close();
                     }
                     
                     
                 }catch(Exception e){

                 }  
        }
        
         /*Reporte de clientes*/
        
           if(accion.equalsIgnoreCase("reporte2")){
               try{
                     condicion=request.getParameter("condicion");
                     
                     if(condicion==""){
                     
                      request.getRequestDispatcher("controladoradministrador?accion=listartrabajadores").forward(request, response);
                     
                     }else{
                     conexion cn=new conexion();
                     File reportfile = new File (request.getServletContext().getRealPath("reporte/rp-trabajadores.jasper"));
                     Map parametro=new HashMap();
                     parametro.put("condicion",condicion);
                     byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(),parametro, cn.getConnection());
                     response.setContentType("application/pdf");
                     response.setContentLength(bytes.length);
                     response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");
                     ServletOutputStream outputstream = response.getOutputStream();
                     outputstream.write(bytes,0,bytes.length);
                     outputstream.flush();
                     outputstream.close();
                     }
                     
                     
                 }catch(Exception e){

                 }  
        }
        
         /*Reporte de clientes*/
        
        /*Reporte de proyectos de soporte*/
           if(accion.equalsIgnoreCase("reporte3")){
               try{
                     dni=request.getParameter("dni");
                     
                     if(dni==""){
                     
                      request.getRequestDispatcher("controladoradministrador?accion=listarsoportes").forward(request, response);
                     
                     }else{
                     conexion cn=new conexion();
                     File reportfile = new File (request.getServletContext().getRealPath("reporte/rp-soporte.jasper"));
                     Map parametro=new HashMap();
                     parametro.put("dni",dni);
                     byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(),parametro, cn.getConnection());
                     response.setContentType("application/pdf");
                     response.setContentLength(bytes.length);
                     response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");
                     ServletOutputStream outputstream = response.getOutputStream();
                     outputstream.write(bytes,0,bytes.length);
                     outputstream.flush();
                     outputstream.close();
                     }
                     
                     
                 }catch(Exception e){

                 }  
        }
         /*Reporte de proyectos de soporte*/
         
         /*Reporte de proyectos de desarrollo*/
           if(accion.equalsIgnoreCase("reporte4")){
               try{
                     dni=request.getParameter("dni");
                     
                     if(dni==""){
                     
                      request.getRequestDispatcher("controladoradministrador?accion=listardesarrollo").forward(request, response);
                     
                     }else{
                     conexion cn=new conexion();
                     File reportfile = new File (request.getServletContext().getRealPath("reporte/rp-desarrollo.jasper"));
                     Map parametro=new HashMap();
                     parametro.put("dni",dni);
                     byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(),parametro, cn.getConnection());
                     response.setContentType("application/pdf");
                     response.setContentLength(bytes.length);
                     response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");
                     ServletOutputStream outputstream = response.getOutputStream();
                     outputstream.write(bytes,0,bytes.length);
                     outputstream.flush();
                     outputstream.close();
                     }
                     
                     
                 }catch(Exception e){

                 }  
        }
         /*Reporte de proyectos de desarrollo*/
          /*Reporte de proyectos de desarrollo*/
           if(accion.equalsIgnoreCase("reporte5")){
               try{
                     dni=request.getParameter("dni");
                     
                     if(dni==""){
                     
                      request.getRequestDispatcher("controladoradministrador?accion=listarmantenimientos").forward(request, response);
                     
                     }else{
                     conexion cn=new conexion();
                     File reportfile = new File (request.getServletContext().getRealPath("reporte/rp-mantenimiento.jasper"));
                     Map parametro=new HashMap();
                     parametro.put("dni",dni);
                     byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(),parametro, cn.getConnection());
                     response.setContentType("application/pdf");
                     response.setContentLength(bytes.length);
                     response.setHeader("Content-Disposition", "inline; filename=reporte.pdf");
                     ServletOutputStream outputstream = response.getOutputStream();
                     outputstream.write(bytes,0,bytes.length);
                     outputstream.flush();
                     outputstream.close();
                     }
                     
                     
                 }catch(Exception e){

                 }  
        }
         /*Reporte de proyectos de desarrollo*/
        
      
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
