/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.37
 * Generated at: 2019-01-28 16:02:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.Writer;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.io.File;

public final class exam_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(1);
    _jspx_dependants.put("/parts/head.jsp", Long.valueOf(1548685351315L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.io.BufferedWriter");
    _jspx_imports_classes.add("java.io.Writer");
    _jspx_imports_classes.add("java.io.FileWriter");
    _jspx_imports_classes.add("java.io.IOException");
    _jspx_imports_classes.add("java.io.FileReader");
    _jspx_imports_classes.add("java.io.BufferedReader");
    _jspx_imports_classes.add("java.io.InputStreamReader");
    _jspx_imports_classes.add("java.io.File");
    _jspx_imports_classes.add("java.io.InputStream");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        ");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("<title>Exam Review System</title>\n");
      out.write("<link rel=\"shortcut icon\" href=\"/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("<link rel=\"icon\" href=\"favicon.ico\" type=\"image/x-icon\">\n");
      out.write("<link href=\"uploadcss.css\" rel=\"stylesheet\" type=\"text/css\">\n");
      out.write("<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            table.comments {\n");
      out.write("              font-family: arial, sans-serif;\n");
      out.write("              border-collapse: collapse;\n");
      out.write("              width: 100%;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .comments td, th {\n");
      out.write("              border: 1px solid #dddddd;\n");
      out.write("              text-align: left;\n");
      out.write("              padding: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .comments tr:nth-child(even) {\n");
      out.write("              background-color: #dddddd;\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("        <nav class=\"navbar navbar-default\">\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("                <div class=\"navbar-header\">\n");
      out.write("                <a href=\"dashboard.jsp\">\n");
      out.write("                    <img alt=\"Uni of Dundee crest\" src=\"Dundeebadge.png\" height=\"50\" width=\"50\"> \n");
      out.write("                </a>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                ");

                    String name=session.getAttribute("username").toString();
                    out.println("Hello "+ name + "!");
                
      out.write("\n");
      out.write("\n");
      out.write("                <a href=\"logout.jsp\"> <button type=\"button\" class=\"btn btn-default navbar-btn\"style=\"float:right\">Logout</button>  </a>\n");
      out.write("            </div>\n");
      out.write("\t</nav>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("    </head>\n");
      out.write("    <body> \n");
      out.write("        <table class=\"other\">\n");
      out.write("            ");

                String folder = request.getParameter("folder").toString();
                String[] titles = {"Module Code", "Module Title", "Author", "Academic Year", "Semester",  "Online or Paper", "Main or Resit", "Undergraduate or Postgraduate", "Progress"};
                String path = "/exams/" + folder + "/" + folder.split("_")[0] + "-Info.txt";
                
                try {
                    BufferedReader br1 = new BufferedReader(new FileReader(path));
                    String data;
                    int counter = 0;
                        while((data= br1.readLine())!= null)
                        {
                            out.println("<tr>");
                            out.println("<td>" + titles[counter] + "</td>");
                            counter++;
                            out.println("<td>" + data + "</td>");
                            out.println("</tr>");
                        }
                    
                    br1.close();
                }catch(Exception e){
                e.printStackTrace();
                } 
            
      out.write("\n");
      out.write("        </table>\n");
      out.write("        <div class = uploadtable>\n");
      out.write("        <h4>File Upload:</h4>\n");
      out.write("        Select a file to upload: <br />\n");
      out.write("        <form action = \"UploadServlet\" method = \"post\" enctype = \"multipart/form-data\">\n");
      out.write("           <input type = \"file\" name = \"file\" size = \"50\" />\n");
      out.write("           <input type=\"hidden\" name=\"folderpath\" value=\"");
      out.print( "/exams/" + folder + "/" + folder.split("_")[0] + "-Draft.txt");
      out.write("\">\n");
      out.write("           <br />\n");
      out.write("           <input type = \"submit\" value = \"Upload File\" />\n");
      out.write("        </form>\n");
      out.write("\t\t\n");
      out.write("\t\t</div>\n");
      out.write("        \n");
      out.write("\t\t<div class = commenttable>\n");
      out.write("        <table class=\"comments\">\n");
      out.write("            <tr>\n");
      out.write("                <th>Username</th>\n");
      out.write("                <th>Comment</th>\n");
      out.write("            </tr>\n");
      out.write("        \n");
      out.write("        ");

            try {
                BufferedReader br = new BufferedReader(new FileReader("/exams/" + folder + "/" + folder.split("_")[0] + "-Comments.txt"));
                String data;
                    while((data= br.readLine())!= null)
                    {
                        out.println("<tr>");
                        String[] parts = data.split(":", 2);
                        for(int i = 0; i < parts.length; i++)
                        {
                            out.println("<td>" + parts[i] + "</td>");
                        }
                        out.println("</tr>");
                    }
                
                br.close();
            }catch(Exception e){
            e.printStackTrace();
            } 
        
      out.write("\n");
      out.write("        \n");
      out.write("        </table>\n");
      out.write("        <form action=\"PostComment\" method=\"POST\">\n");
      out.write("            <textarea name=\"comment\" style=\"width:300px; height:100px;\" placeholder=\"Leave comment here...\"></textarea>\n");
      out.write("            <input type=\"hidden\" name=\"username\" value=\"");
      out.print( session.getAttribute("username"));
      out.write("\">\n");
      out.write("            <input type=\"hidden\" name=\"modulecode\" value=\"");
      out.print( folder);
      out.write("\">\n");
      out.write("            <input type=\"hidden\" name=\"folderpath\" value=\"");
      out.print( "/exams/" + folder + "/" + folder.split("_")[0] + "-Comments.txt");
      out.write("\">\n");
      out.write("            <br>\n");
      out.write("            <input type=\"submit\">\n");
      out.write("        </form>\n");
      out.write("        <button type=\"button\" onclick=\"window.location = window.location.href\">Reload</button>\n");
      out.write("\t\t</div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
