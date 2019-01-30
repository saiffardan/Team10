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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.logging.Level;
import java.util.logging.Logger;

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
            
            String query = "";
            String redirectTo = "";
            boolean dontForward = false;
            
//            Enumeration<String> parameterNames = request.getParameterNames();
// 
//        while (parameterNames.hasMoreElements()) {
// 
//            String paramName = parameterNames.nextElement();
//            out.println(paramName);
//            out.println(", ");
// 
//            String[] paramValues = request.getParameterValues(paramName);
//            for (int i = 0; i < paramValues.length; i++) {
//                String paramValue = paramValues[i];
//                out.println("t " + paramValue);
//                out.println(", ");
//            }
// 
//        }
            
            if(request.getParameter("login") != null)
            {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                request.setAttribute("passwordGuess", password);
                query = "SELECT email, password FROM users WHERE email='"+username+"'";
                redirectTo = "login.jsp";
                //dontForward = true;
                out.println("<p>how about here </p>");
            }
//            else
//            {
//                dontForward = true;
//                out.println("<p>I seee </p>");
//            }
            else if(request.getParameter("loadDashboard") != null){
                query = "SELECT * FROM exam";
                redirectTo = "dashboard.jsp";
                dontForward = true;
                out.println("<p>we here? </p>");
            }
//            else if(){
//                
//            }
            
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
                    if(' ' == wholeRow.charAt(wholeRow.length() - 1))
                    {
                        wholeRow = wholeRow.substring(0, wholeRow.length() - 1);
                    }
                    result.add(wholeRow);
                }
                
                request.setAttribute("queryResult", result);
                
                //request.getRequestDispatcher(redirectTo).forward(request, response);
                
            } catch (Exception e) {
                out.println(e);
            }
            finally{
//                try {
//                    rs.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(ExecuteQuery.class.getName()).log(Level.SEVERE, null, ex);
//                }
//                
//                try {
//                    conn.close();
//                } catch (SQLException ex) {
//                    Logger.getLogger(ExecuteQuery.class.getName()).log(Level.SEVERE, null, ex);
//                }
                
                if(!dontForward)
                {
                    request.getRequestDispatcher(redirectTo).forward(request, response);
                }
                
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
