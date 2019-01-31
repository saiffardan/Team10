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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * We refactored our code by moving java code to servlets
 *
 * @author danchoatanasov
 */
//@WebServlet(name = "PostComment", urlPatterns = {"/PostComment"})

//@WebServlet(name = "PostComment", urlPatterns = {"X:/build/web/WEB-INF/classes/newpackage/PostComment"})
@WebServlet(name = "PostComment", urlPatterns = {"/PostComment"})
public class PostComment extends HttpServlet {

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
            if(request.getParameter("comment") != null){
                String username = request.getParameter("username");
                String strPath = request.getParameter("folderpath");
                String role = request.getParameter("role");
                if(role.equals("intMod"))
                {
                    role = "Internal Moderator";
                }
                else if(role.equals("exVet"))
                {
                    role = "Exam Vetter";
                }
                else if(role.equals("exMod"))
                {
                    role = "External Moderator";
                }
                else if(role.equals("exSet"))
                {
                    role = "Exam Setter";
                }
                //File creation
                File strFile = new File(strPath);
                boolean fileCreated = strFile.isFile();
                strFile.createNewFile();
                //File appending
                Writer objWriter = new BufferedWriter(new FileWriter(strFile, true));
                objWriter.write(username + "(" + role + ")" + ": ");
                objWriter.write(request.getParameter("comment").toString() + "\r\n");
                objWriter.flush();
                objWriter.close();
                //request.getRequestDispatcher("exam.jsp").forward(request, response);
                response.sendRedirect(request.getHeader("referer"));
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
