/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

/**
 *
 * @author danchoatanasov
 */
@WebServlet(name = "ExecuteQuery", urlPatterns = {"/ExecuteQuery"})
public class ExecuteQuery extends HttpServlet {

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
            String query = request.getParameter("query");
            boolean noQuery = false;
            if(query == null)
            {
                noQuery = true;
                query = "select * from exams";
            }
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();   
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                st = conn.createStatement();
                rs =  st.executeQuery(query);
                ResultSetMetaData rsmd = rs.getMetaData();
                ArrayList result = new ArrayList();
                while(rs.next()){
                    String wholeRow = "";
                    for (int i = 1; i <= rsmd.getColumnCount(); i++) {
                        wholeRow += rs.getString(i) + " ";
                    }
                    result.add(wholeRow);
                }
                conn.close();
                request.setAttribute("queryResult", result);
                
                if(noQuery)
                {
                    request.getRequestDispatcher("/testDatabaseQuery.jsp").forward(request, response);
                }
                else
                {
                    String referer = request.getHeader("referer");
                    request.getRequestDispatcher(referer.substring(referer.lastIndexOf("/"), referer.length())).forward(request, response);
                }
                //request.getRequestDispatcher(referer.substring(referer.lastIndexOf("/"), referer.length())).forward(request, response);
            } catch (Exception e) {
                out.println(e);
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
