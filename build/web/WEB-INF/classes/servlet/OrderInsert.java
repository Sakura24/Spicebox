/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbInsert;
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
public class OrderInsert extends HttpServlet {

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
//            out.println("<title>Servlet OrderInsert</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet OrderInsert at " + request.getContextPath() + "</h1>");
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
        DbUse dbSelect = new DbUse();
        DbUpdate dbEdit = new DbUpdate();
        String OrderNo = "";
        OrderNo = request.getParameter("orderNo");
        String num = "";
        try {
            DbInsert insertOrderDetail = new DbInsert();
            int execute = 0;
            out.print("food_name" + request.getParameter("food_name"));
            out.print("rate" + request.getParameter("rate"));
            out.print("quantity" + request.getParameter("quantity"));
            out.print("amount" + request.getParameter("amount"));
            execute = insertOrderDetail.OrderDetail(request.getParameter("food_name"), request.getParameter("rate"), request.getParameter("quantity"), request.getParameter("amount"), request.getParameter("orderNo"));
            if (execute == 1) {
                out.print("orderno:"+OrderNo);
                num = dbSelect.GetTotalFromOrderNo(String.valueOf(OrderNo));
                out.print(num);
                execute = dbEdit.UpdateTotalByOrderId(num, OrderNo);
                if (execute == 1) {
                response.sendRedirect("/spicebox/customerorderprocess.jsp");
                }
                else {
                out.print("Not Updated");
            }
            } else {
                out.print("Not Inserted");
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
