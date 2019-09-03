/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbInsert;
import ejbs.DbUse;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Bishnu
 */
public class AddToCart extends HttpServlet {

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
//            out.println("<title>Servlet AddToCart</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddToCart at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
//        String sessArray [][] = new String [1][];
//        HttpSession httpSession = request.getSession();
//        httpSession.setAttribute("myArray", sessArray);
        DbInsert insert = new DbInsert();
        DbUse select = new DbUse();
        int amount = 0;
        int check = 0;
        int orderId = 0;
        int var = 0;
        String foodId = request.getParameter("foodId");
        out.print(foodId);
        String food_name = request.getParameter("food_name");
        out.print(food_name);
        String rate = request.getParameter("rate");
        out.print(rate);
        int intRate = Integer.parseInt(rate);
        String quantity = request.getParameter("quantity");
        out.print(quantity);
        int intQty = Integer.parseInt(quantity);
        amount = intRate * intQty;
        out.print(amount);
        String stAmount = String.valueOf(amount);
        String uemail = (String) session.getAttribute("uemail");
        out.print(uemail);
        
//        orderNo =  session.getAttribute("orderId");
//        out.print("orderNo=" +orderNo);
//        if (orderNo == null){
//            try {
//                ResultSet userDetail = select.GetUserDetailsFromEmail(uemail);
//                userDetail.first();
//                check = insert.UserDetailForOrder(userDetail.getString(1));
//                out.print("check= " + check);
//                
//            } 
//            catch (Exception ex) {
//                
//            }
//            
//        }
        try {
            if (session.getAttribute("orderNo")==null) {
            ResultSet userDetail = select.GetUserDetailsFromEmail(uemail);
            userDetail.first();
            check = insert.UserDetailForOrder(userDetail.getString(1));
            
            if (check != 0) {
                orderId = select.LastInsertIdOrder();
                System.out.print("Order Id=" + orderId);
                session.setAttribute("orderNo",orderId);
            }}
            System.out.print("Order No =" + session.getAttribute("orderNo"));
                
                String order_no = session.getAttribute("orderNo").toString();
                
                System.out.print("Order No =" + order_no);
                
                var = insert.OrderDetail(request.getParameter("foodId"), request.getParameter("rate"), request.getParameter("quantity"),stAmount,order_no);
                //out.print("check =" + var);
                //if(var == 1){
                response.sendRedirect("/spicebox/customerdisplaycategory.jsp");
                //}
                //else {
                //out.print("Error");
            //}
        }
        
        catch(Exception ex){
        System.out.print("Hello"+ ex.getMessage());
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
