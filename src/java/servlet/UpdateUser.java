/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbUpdate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bishnu
 */
public class UpdateUser extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet UpdateUser</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet UpdateUser at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
    PrintWriter out = response.getWriter();
        try{
           DbUpdate update=new DbUpdate();
          int execute=0;
          out.print("id="+request.getParameter("UserId"));
           out.print(request.getParameter("first_name"));
           out.print(request.getParameter("last_name"));
           out.print(request.getParameter("address"));
           out.print(request.getParameter("contact_no"));
           out.print(request.getParameter("email"));
           out.print(request.getParameter("password"));
           execute=update.updateUser(request.getParameter("first_name"),request.getParameter("last_name"),request.getParameter("address"),request.getParameter("contact_no"),request.getParameter("email"), request.getParameter("password"),Integer.valueOf(request.getParameter("UserId")));
           out.print(execute);
          if(execute==1){
               response.sendRedirect("/spicebox/admindisplayusers.jsp");
           }else{
               out.print("Wrong");
           }
        }catch (Exception e) {
            System.out.println("Error:" + e);

        }
    
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
