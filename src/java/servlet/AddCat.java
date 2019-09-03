/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

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
public class AddCat extends HttpServlet {
    
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
//            out.println("<title>Servlet AddCat</title>");
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddCat at " + request.getContextPath() + "</h1>");
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
        String cat_name = ""; // creaing an empty string vlaue
        String fileName = "";
        //String filePath = "";
        try {
            DiskFileItemFactory factory = new DiskFileItemFactory(); // imporitng the files and creaing a lcass
            ServletFileUpload upload = new ServletFileUpload(factory);
            List fileItems = upload.parseRequest(request);
            Iterator collect = fileItems.iterator();
            while (collect.hasNext()) {
                FileItem item = (FileItem) collect.next();
                if (item.isFormField()) {
                    if (item.getFieldName().equals("cat_name")) {
                        cat_name = item.getString();
                        response.getWriter().print(cat_name);
                        //out.print(cat_name);
                    }
                } else {
                    fileName = item.getName();
                    response.getWriter().print(fileName);
                    //out.print(fileName);
                    //File file = new File("E:\\dissertationBackup\\uploadimage\\spicebox\\web\\WEB-INF\\upload\\" + fileName);
                    File file = new File("E:\\assignmentbackups\\spicebox\\web\\upload\\" + fileName);
                    //filePath = file.toString();
                    //out.print("filePath= " + filePath);
                    item.write(file);
                }
            }
            pstm = con.prepareStatement("INSERT INTO categories (cat_name, image) VALUES (?,?)"); // carryout the insertion coe
            pstm.setString(1, cat_name);
            pstm.setString(2, fileName);
            var = pstm.executeUpdate();
            out.print(var);
            if (var == 1) {
                response.sendRedirect("/spicebox/admindisplaycategory.jsp");// providing the path after the execution 
            } else {
                out.print("Error");
            }
           
        } catch (Exception ex) {
            out.print("Error");
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
