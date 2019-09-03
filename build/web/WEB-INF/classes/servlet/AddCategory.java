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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
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
public class AddCategory extends HttpServlet {

    public static final String UPLOAD_DIRECTORY = "upload";
    public static final String DEFAULT_FILENAME = "default.file";
    public static final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    public static final int MAX_FILE_SIZE = 1024 * 1024 * 40;
    public static final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;
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
//            out.println("<title>Servlet AddCategory</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet AddCategory at " + request.getContextPath() + "</h1>");
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
        //processRequest(request, response);
        String cat_name = request.getParameter("cat_name");
        String filName = "";
        String catName = null;
        String uploadPath = "E:\\spicebox\\build\\web\\" + File.separator + UPLOAD_DIRECTORY;
        
        System.out.print("upload path "+uploadPath);
        Part part = request.getPart("file");
        
        filName=extractFileName(part);
                            String filePath = uploadPath + File.separator + filName;
                           // File storeFile = new File(filePath);
        System.out.print("filepath"+ filePath);
        //part.write(filePath);
        part.write(File.separator+filName);
//        System.out.print("test");
//        //HttpServletRequest request = req;
//        // System.out.print(request.getParameter("cat_name"));
//        System.out.print(ServletFileUpload.isMultipartContent(request));
//        if (ServletFileUpload.isMultipartContent(request)) {
//
//            DiskFileItemFactory factory = new DiskFileItemFactory();
//            factory.setSizeThreshold(MEMORY_THRESHOLD);
//            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));
//
//            ServletFileUpload upload = new ServletFileUpload(factory);
//            upload.setFileSizeMax(MAX_FILE_SIZE);
//            upload.setSizeMax(MAX_REQUEST_SIZE);
//            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
//            System.out.print(uploadPath);
//            File uploadDir = new File(uploadPath);
//            if (!uploadDir.exists()) {
//                System.out.println("not exist");
//                uploadDir.mkdir();
//            }
//
//            try {
//                catName = request.getParameter("cat_name");
//                List<FileItem> formItems = upload.parseRequest(request);
//
//                System.out.print("formItems" + formItems.size());
//                if (formItems != null && formItems.size() > 0) {
//                    for (FileItem item : formItems) {
//                        if (!item.isFormField()) {
//                            String fileName = new File(item.getName()).getName();
//                            filName = new File(item.getName()).getName();
//                            String filePath = uploadPath + File.separator + fileName;
//                            File storeFile = new File(filePath);
//                            item.write(storeFile);
//                            request.setAttribute("message", "File " + fileName + " has uploaded successfully!");
//                        }
//                    }
//                }
//            } catch (Exception ex) {
//                request.setAttribute("message", "There was an error: " + ex.getMessage());
//            }
            try {
            pstm = con.prepareStatement("INSERT INTO categories (cat_name, image) VALUES (?,?)");
            pstm.setString(1, cat_name);
            pstm.setString(2, filName);
            var = pstm.executeUpdate();

        } catch (Exception ex) {
            ex.getMessage();
        }
//            DbInsert foodMenu = new DbInsert();
//            int rs = 0;
//            out.print(request.getParameter("cat_name"));
            System.out.print("filNME" + filName);
            //          rs = foodMenu.Category(request.getParameter("cat_name"),filName);
            out.print(var);
            if (var == 1) {
                response.sendRedirect("/spicebox/admindisplaycategory.jsp");
            } else {
                out.print("Error");
            }
            System.out.print("abc" + catName);
            //getServletContext().getRequestDispatcher("/Image/result.jsp").forward(request, response);
        }
//    PrintWriter out = response.getWriter();
//        try {
//            DbInsert foodMenu = new DbInsert();
//            int rs = 0;
//            out.print(request.getParameter("cat_name"));
//            rs = foodMenu.Category(request.getParameter("cat_name"));
//            out.print(rs);
//            if (rs == 1) {
//                response.sendRedirect("/spicebox/admindisplaycategory.jsp");
//            } else {
//                out.print("Error");
//            }
//        } catch (Exception e) {
//            System.out.println("Error:" + e);
//
//        }
//    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private String extractFileName(Part part) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items){
        if (s.trim().startsWith("filename")){
            return s.substring(s.indexOf("=") + 2, s.length()-1);
        }
        }
        return "";
    }
}
