/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbUpdate;
import ejbs.DbUse;
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
public class InsertDeliveryDetail extends HttpServlet {

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
//            out.println("<title>Servlet InsertDeliveryDetail</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet InsertDeliveryDetail at " + request.getContextPath() + "</h1>");
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
        try {
            DbUpdate deliveryDetail = new DbUpdate();
            DbUse dbSelect = new DbUse();
            String orderNo = "";
            orderNo = request.getParameter("orderNo");
            out.print("orderNo= " + orderNo);
            String num = "";
            num = dbSelect.GetTotalFromOrderNo(String.valueOf(orderNo));
            int rs = 0;
            
            out.print(request.getParameter("delivery_address"));
            out.print(request.getParameter("description"));
            out.print(request.getParameter("orderNo"));
            out.print(num);
            rs = deliveryDetail.UpdateOrdersByOrderId(request.getParameter("delivery_address"), request.getParameter("description"),num, request.getParameter("orderNo"));
            out.print(rs);
            if (rs == 1) {
                response.sendRedirect("/spicebox/customerdisplayorders.jsp");
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
