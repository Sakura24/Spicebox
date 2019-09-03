/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import ejbs.DbInsert;
import ejbs.DbInt;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author Bishnu
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 50)
public class AddFoodItem extends HttpServlet {
    DbInt dbFunction = new DbInt();
    Connection con = dbFunction.makeConnection();
    PreparedStatement pstm;
    int var = 0;

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
//            out.println("<title>Servlet AddFoodItem</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddFoodItem at " + request.getContextPath() + "</h1>");
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
        String cat_id = "";
        String food_name = "";
        String description = "";
        String price_per_piece = "";
        String fileName = "";
        //String filePath = "";
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            List fileItems = upload.parseRequest(request);
            Iterator collect = fileItems.iterator();
            while (collect.hasNext()) {
                FileItem item = (FileItem) collect.next();
                if (item.isFormField()) {
                    if (item.getFieldName().equals("cat_id")) {
                        cat_id = item.getString();
                        response.getWriter().print(cat_id);
                        //out.print(cat_name);
                    }
                    
                    if (item.getFieldName().equals("food_name")) {
                        food_name = item.getString();
                        response.getWriter().print(food_name);
                        //out.print(cat_name);
                    }
                    
                    if (item.getFieldName().equals("description")) {
                        description = item.getString();
                        response.getWriter().print(description);
                        //out.print(cat_name);
                    }
                    
                    if (item.getFieldName().equals("price_per_piece")) {
                        price_per_piece = item.getString();
                        response.getWriter().print(price_per_piece);
                        //out.print(cat_name);
                    }
                } else {
                    fileName = item.getName();
                    response.getWriter().print(fileName);
                    //out.print(fileName);
                    //File file = new File("E:\\dissertationBackup\\uploadimage\\spicebox\\web\\WEB-INF\\upload\\" + fileName);
                    File file = new File("E:\\dissertationBackup\\uploadimage\\spicebox\\web\\upload\\" + fileName);
                    //filePath = file.toString();
                    //out.print("filePath= " + filePath);
                    item.write(file);
                }
            }
       
            pstm = con.prepareStatement("INSERT INTO fooditems (cat_id, food_name, description, price_per_piece, image) VALUES (?,?,?,?,?)");
            pstm.setString(1, cat_id);
            pstm.setString(2, food_name);
            pstm.setString(3, description);
            pstm.setString(4, price_per_piece);
            pstm.setString(5, fileName);
            var = pstm.executeUpdate();
            out.print(var);
            if (var == 1) {
                response.sendRedirect("/spicebox/admindisplayfoodmenu.jsp");
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
