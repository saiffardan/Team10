/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author danchoatanasov
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

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
            
            String redirectTo = "login.jsp";
            String email = request.getParameter("email");
            //test username
            String passwordGuess = request.getParameter("password");
            //test password
            
            
            String password = "";
            String username = "";
            //request.setAttribute("passwordGuess", password);
            String query = "SELECT username, password FROM users WHERE email='"+email+"'";
            
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();   
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                st = conn.createStatement();
                rs =  st.executeQuery(query);
                while(rs.next())
                {
                    password = rs.getString(2);
                    username = rs.getString(1);
                }
                
                HttpSession session = request.getSession();
                
                if(password.equals(passwordGuess))
                {
                    session.setAttribute("username", username);
                    session.setAttribute("email", email);
                    redirectTo = "Dashboard";
                    //response.sendRedirect("Dashboard");
                }
                else
                {
                    session.setAttribute("loginError", "Invalid username or password, please try again.");
                    //response.sendRedirect("index.jsp");
                    redirectTo = "index.jsp";
                }
            } catch (Exception e) {
                out.println(e);
            }
            finally{
                try {
                    rs.close();
                    
                } catch (SQLException ex) {
                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect(redirectTo);
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

    protected boolean validateUsername (String username) {
        boolean valid = false;
        if (username.length() > 13 && username.length() < 100) {
            valid = true;
        } else {
            return false;
}
        if (username.contains("@")) {
            valid = true;
        } else {
            return false;
}
        if (username.contains("dundee.ac.uk")) {
            valid = true;
        } else {
            return false;
        }
        if (username.contains("#")) {
            return false;
        }
        if (username.isEmpty()) {
            return false;
        }
        if (username.indexOf("@") > 1) {
            return true;
        }
        return valid;
    }
}
