/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;
/**
 *
 * @author danchoatanasov
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
public class UploadServlet extends HttpServlet {
    
    private boolean isMultipart;
    private String filePath;
    private int maxFileSize = 50 * 1024;
    private int maxMemSize = 4 * 1024;
    private File file ;
    
    public void init( ){
      // Get the file location where it would be stored.
      //filePath = getServletContext().getInitParameter("file-upload");
      //filePath = getServletContext().getInitParameter("folderpath");
      //out.println(filePath);
   }

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
        try (PrintWriter out = response.getWriter()) {
            
            DiskFileItemFactory factory = new DiskFileItemFactory();
   
            // maximum size that will be stored in memory
            factory.setSizeThreshold(maxMemSize);

            // Location to save data that is larger than maxMemSize.
            factory.setRepository(new File(getServletContext().getRealPath("/").substring(0,2)));

            // Create a new file upload handler
            ServletFileUpload upload = new ServletFileUpload(factory);

            // maximum file size to be uploaded.
            upload.setSizeMax( maxFileSize );
            
            //filePath = request.getParameter("folderpath");
            
            try { 
            // Parse the request to get file items.
            List fileItems = upload.parseRequest(request);

            // Process the uploaded file items
            Iterator i = fileItems.iterator();
            
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet upload</title>");  
            out.println("</head>");
            out.println("<body>");

            while ( i.hasNext () ) {
               FileItem fi = (FileItem)i.next();
               if ( !fi.isFormField () ) {
                  // Get the uploaded file parameters
                  String fieldName = fi.getFieldName();
                  String fileName = fi.getName();
                  String contentType = fi.getContentType();
                  boolean isInMemory = fi.isInMemory();
                  long sizeInBytes = fi.getSize();
                 
                  // Write the file
//                  if( getServletContext().getRealPath("/").lastIndexOf("\\build\\web") > 0) {
//                     file = new File(getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").lastIndexOf("\\build\\web")) + "/exams/" + request.getHeader("referer").split("=")[1] + "/" + request.getHeader("referer").split("=")[1].split("_")[0] + "-Draft.txt");
//                     file = new File(getServletContext().getRealPath("/"));
//                  } else {
//                     file = new File(getServletContext().getRealPath("/").substring(0, getServletContext().getRealPath("/").lastIndexOf("\\build\\web")) + "/exams/" + request.getHeader("referer").split("=")[1] + "/" + request.getHeader("referer").split("=")[1].split("_")[0] + "-Draft.txt");
//                  }
                  //String destination = getServletContext().getRealPath("/") + "/exams/" + request.getHeader("referer").split("=")[1] + "/" + request.getHeader("referer").split("=")[1].split("_")[0] + "-Draft.txt";
                  file = new File(filePath);
                  fi.write( file );
                  response.sendRedirect(request.getHeader("referer"));
                  //out.println("Uploaded Filename: " + fileName + "<br>");
                  //out.println("Dest: " + destination + "<br>");
                  //out.println("filePath: " + filePath + "<br>");
               }
               else //Case where we are getting a form field that is not a file
               {
                   filePath = fi.getString();
               }
            }
            out.println("</body>");
            out.println("</html>");
            } catch(Exception ex) {
               out.println("<p>not working bro</p>");
               out.println(ex.toString());
            }
        }
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
