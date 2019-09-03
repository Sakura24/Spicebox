/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbDelete;
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
public class DeleteOrderList extends HttpServlet {

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
//            out.println("<title>Servlet DeleteOrderList</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet DeleteOrderList at " + request.getContextPath() + "</h1>");
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
        PrintWriter out = response.getWriter();
        try {
            DbDelete deleteOrderList = new DbDelete();
            int rs = 0;
            String monthDate = request.getParameter("monthDate");
            String currentDate = request.getParameter("currentDate");
            StringBuffer sb=new StringBuffer("");
            String url=sb.toString();
            String urlEncoded="";
                    out.print("orderId" + request.getParameter("orderId"));
            out.print("monthDate" + monthDate);
            out.print("currentDate" +currentDate);
            rs = deleteOrderList.DeleteOrderList(request.getParameter("orderId"));
            out.print(rs);
            if (rs == 1) {
                sb.append("/spicebox/deletesuccess.jsp");
                sb.append("?monthDate="+monthDate);
                sb.append("&currentDate="+currentDate);
                url=sb.toString();
                urlEncoded=response.encodeRedirectURL(url);
               response.sendRedirect(url);
            } else {
                out.print("Error");
            }
        } catch (Exception e) {
            System.out.println("Error:" + e);

        }
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
