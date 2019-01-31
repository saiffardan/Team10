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
@WebServlet(name = "Dashboard", urlPatterns = {"/Dashboard"})
public class Dashboard extends HttpServlet {

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
            
            String redirectTo = "dashboard.jsp";
            String query = "SELECT * from exam";
            Connection conn = null;
            Statement st = null;
            ResultSet rs = null;
            ArrayList exams = new ArrayList();
            String examName = "";
            
            try {
                Class.forName("com.mysql.jdbc.Driver").newInstance();   
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                st = conn.createStatement();
                rs =  st.executeQuery(query);
                while(rs.next())
                {
                    //int i = 1;
                    //exam = new MyExam(rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++), rs.getString(i++));
                    //examName = rs.getString(2) + " - " + rs.getString(1);
                    String examFull = "";
                    for(int i = 1; i <= 14; i++)
                    {
                        examFull += rs.getString(i);
                        if(i != 14)
                        {
                            examFull +=  ",";
                        }
                    }
                    exams.add(examFull);
                }
                request.setAttribute("examsList", exams);
                //out.println(exams);
                
                
            } catch (Exception e) {
                out.println(e);
            }
            finally{
                try {
                    rs.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ExecuteQuery.class.getName()).log(Level.SEVERE, null, ex);
                }
                
                try {
                    conn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ExecuteQuery.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.getRequestDispatcher(redirectTo).forward(request, response);
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
