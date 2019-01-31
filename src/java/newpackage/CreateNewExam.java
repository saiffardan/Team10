/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author danchoatanasov
 */
@WebServlet(name = "CreateNewExam", urlPatterns = {"/CreateNewExam"})
public class CreateNewExam extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if(request.getParameter("modulecode") != null){
                //String drive = getServletContext().getRealPath("/").substring(0,2);
                String moduleCode = request.getParameter("modulecode");
                String moduleTitle = request.getParameter("moduletitle");
                String author = request.getParameter("author");
                String year = request.getParameter("year");
                String semester = request.getParameter("semester");
                String online = request.getParameter("online");
                String main = request.getParameter("main");
                String undergrad = request.getParameter("undergrad");
                //File creation
                //String strPath = "C:/apache-tomcat-8.0.18/tomcat1/webapps/2018-agileteam10/exams/newcomment.txt";
                //String strPath = "/exams/newcomment.txt";
                String path = getServletContext().getRealPath("/") + "/exams/" + moduleCode + "_" + year;
                
                new File(path).mkdirs();
                String strPath = path + "/" + moduleCode + "-Info.txt";
                String commentPath = path + "/" + moduleCode + "-Comments.txt";
                File strFile = new File(strPath);
                File commentFile = new File(commentPath);
                boolean fileCreated = strFile.isFile();
                strFile.createNewFile();
                commentFile.createNewFile();
                //File appending
                Writer objWriter = new BufferedWriter(new FileWriter(strFile, true));
                objWriter.write(moduleCode + "\r\n");
                objWriter.write(moduleTitle + "\r\n");
                objWriter.write(author + "\r\n");
                objWriter.write(year + "\r\n");
                objWriter.write(semester + "\r\n");
                objWriter.write(online + "\r\n");
                objWriter.write(main + "\r\n");
                objWriter.write(undergrad + "\r\n");
                objWriter.write("New" + "\r\n");
                objWriter.flush();
                objWriter.close();
                //request.getRequestDispatcher("exam.jsp").forward(request, response);
                response.sendRedirect(request.getContextPath() + "/dashboard.jsp");
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateNewExam.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CreateNewExam.class.getName()).log(Level.SEVERE, null, ex);
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
