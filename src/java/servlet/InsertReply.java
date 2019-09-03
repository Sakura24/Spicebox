/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbInsert;
import ejbs.DbUpdate;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bishnu
 */
public class InsertReply extends HttpServlet {

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
//            out.println("<title>Servlet InsertReply</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet InsertReply at " + request.getContextPath() + "</h1>");
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
    DbUpdate dbUpdate = new DbUpdate(); 
    Integer status = 0;
    HttpSession session = request.getSession();
        try {
            String ticketId = request.getParameter("ticketId");
            session.setAttribute("ticketId", ticketId);
            DbInsert addFeedback = new DbInsert();
            int rs = 0;
            out.print("ticket_id" + request.getParameter("ticketId"));
            out.print("description" + request.getParameter("description"));
            rs = addFeedback.ReplyFeedback(request.getParameter("ticketId"), request.getParameter("description"));
            out.print(rs);
            if (rs == 1) {
                status = dbUpdate.UpdateReplyStatus(ticketId);
                response.sendRedirect("/spicebox/admindisplayreply.jsp");
            } else {
                out.print("Error");
            }
        } catch (Exception e) {
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
