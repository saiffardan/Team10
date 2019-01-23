<%-- 
    Document   : newjsp
    Created on : 21-Jan-2019, 14:48:03
    Author     : danchoatanasov
--%>

<%@page import="myfilespackage.*"%>
<%@page import="java.nio.file.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Read file</title>
    </head>
    <body>
        Absolute Path is:<%= getServletContext().getRealPath("/") %> 
        
        <%--<%!
            public String saySomething(){
            return "<br>something</br>";
            }

            public void readDataFromFile(String fileName){
            InputStream ins = application.getResourceAsStream(fileName);
            try
            {
                if(ins == null)
                {
                    response.setStatus(response.SC_NOT_FOUND);
                }
                else
                {
                    BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                    String data;
                    while((data= br.readLine())!= null)
                    {
                        out.println(data+"<br>");
                    }
                } 
            }
            catch(IOException e)
            {
            out.println(e.getMessage());
            }
            }
            %> --%>
      <%
          //out.println(saySomething());
          
          %>
        
        <%--<jsp:useBean id="testFile" class="myfilespackage.MyFiles"/>
        <%
            out.println(testFile.saySomethingCool());
            %> --%>
        
        <%
            String fileName = "/fileToBeRead.txt";
        InputStream ins = application.getResourceAsStream(fileName);
        try
        {
            if(ins == null)
            {
                response.setStatus(response.SC_NOT_FOUND);
            }
            else
            {
                BufferedReader br = new BufferedReader((new InputStreamReader(ins)));
                String data;
                while((data= br.readLine())!= null)
                {
                    out.println(data+"<br>");
                }
            } 
        }
        catch(IOException e)
        {
        out.println(e.getMessage());
        }
        %>
        
        <%
            File[] files = new File("C:/apache-tomcat-8.0.18/tomcat1/webapps/2018-agileteam10/exams").listFiles();
            for(File file: files){
                if(file.isFile()){
                    out.println(file.getName());
                }
            }
            %>
            
        <%
        //File creation
        String strPath = "C:/apache-tomcat-8.0.18/tomcat1/webapps/2018-agileteam10/exams/blabla.txt";
        File strFile = new File(strPath);
        boolean fileCreated = strFile.createNewFile();
        //File appending
        Writer objWriter = new BufferedWriter(new FileWriter(strFile));
        objWriter.write("This is a test12345");
        objWriter.flush();
        objWriter.close();
        %> 
      
    </body>
</html>
