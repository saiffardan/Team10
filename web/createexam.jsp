<%-- 
    Document   : createexam
    Created on : 23-Jan-2019, 12:38:37
    Author     : danchoatanasov
--%>
<%@page import="java.io.File"%>
<%@page import="java.text.DateFormatSymbols"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Date"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<!Peter - this allows a java file to read html code >
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="uploadcss.css" rel="stylesheet" type="text/css"> 
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <title>Create Exam</title>
        
        <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <a href="Dashboard">
				<img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
		    </a>
          </div>
            <button type="button" class="btn btn-default navbar-btn"style="float:right">Sign in</button>
        </div>
  
        </nav>
    </head>
    <body>
        <%
         
            // if(request.getParameter("comment") != null){
        if(request.getParameter("submit")!= null){
             try{   
                String modulecode = request.getParameter("modulecode");   
                String moduletitle = request.getParameter("moduletitle"); 
                String author = request.getParameter("author"); 
                String year = request.getParameter("year");  
                String semester = request.getParameter("semester");
                String papertype = request.getParameter("platform");
                String examtype = request.getParameter("examtype");
                String level = request.getParameter("level");
                String status =  "New";
                String intMod =  "";
                String exVet =  "";
                String exMod =  "";


                Date date = Calendar.getInstance().getTime();  
                DateFormat dateFormat = new SimpleDateFormat("dd-MM-YYY");
                String strDate = dateFormat.format(date); 

                Class.forName("com.mysql.jdbc.Driver").newInstance();   
                String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
                Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
                Statement st = conn.createStatement();
                PreparedStatement ps = null;
                String qry = "insert into exam(moduleTitle, moduleCode, author, semester, year, examType, level, paperType, date, intMod, exVet, exMod, status)  values(?,?,?,?,?,?,?,?,?,?,?,?,?)";

                ps = conn.prepareStatement(qry);
                ps.setString(1, moduletitle);
                ps.setString(2, modulecode);
                ps.setString(3, author);
                ps.setString(4, semester);
                ps.setString(5, year);
                ps.setString(6, examtype);
                ps.setString(7, level); 
                ps.setString(8, papertype);
                ps.setString(9, strDate);
                ps.setString(10, intMod);
                ps.setString(11, exVet);
                ps.setString(12, exMod);
                ps.setString(13, status);


                int i = ps.executeUpdate();
    //            if(i > 0){
    //                out.println("WORKS!!");
    //            }else {
    //                out.println("NOT!!");
    //            }
                String path = getServletContext().getRealPath("/") + "/exams/" + modulecode + "_" + year;
                new File(path).mkdirs();
                String commentPath = path + "/" + modulecode + "-Comments.txt";
                File commentFile = new File(commentPath);
                commentFile.createNewFile();
       
          
            }        
             catch(Exception e){
            out.println(e);
            }
            
            
        }
        %>
        
        <div class=container>
            <form class="form-signup" action="createexam.jsp" method="post">
                    <h1 class="h3 mb-3 font-weight-normal">Create New Exam</h1>
                    
                    <label for="inputModuleCode" class="sr-only">Module Code</label>
                    
                    <input type="text" id="inputModuleCode" name="modulecode" class="form-control" placeholder="Module Code" required autofocus>
                    
                    <label for="inputModuleTitle" class="sr-only">Module Title</label>
                    
                    <input type="text" id="inputModuleTitle" name="moduletitle" class="form-control" placeholder="Module Title" required autofocus>
                    
                    <label for="inputAuthor" class="sr-only">Author</label>
                    
                   <input type="text" id="inputAuthor" name="author" value="<%= session.getAttribute("username")%>" class="form-control" >
                    
                    <label for="inputYear" class="sr-only">Academic Year</label>
                    
                    <input type="text" id="inputYear" name="year" class="form-control" placeholder="Academic Year" required>
                    
                    <label for="inputSemester" class="sr-only">Semester</label>
                    
                    <select id="inputSemester" name="semester" class="form-control" placeholder="Semester" required>
                        
                            <option value="" disabled selected>Semester</option>
                            <option>First</option>
                            <option>Second</option>
                    </select>
                    <label for="inputOnline" class="sr-only">Online or Paper</label>
                    <select id="inputOnline" name="platform" class="form-control" placeholder="Online or Paper" required>
                            <option value="" disabled selected>Online or Paper</option>
                            <option>Online</option>
                            <option>Paper</option>
                    </select>
                    <select id="inputMain" name="examtype" class="form-control" placeholder="Main or Resit" required>
                            <option value="" disabled selected>Main or Resit</option>
                            <option>Main</option>
                            <option>Resit</option>
                    </select>
                    <select id="inputUndergrad" name="level" class="form-control" placeholder="Undergraduate or Postgraduate" required>
                            <option value="" disabled selected>Undergraduate or Postgraduate</option>
                            <option>Undergraduate</option>
                            <option>Postgraduate</option>
                    </select>
                    </div>
                    <div class= "upload">
                    <button type="button" class="btn btn-lg btn-primary">Upload</button>
					<button class="btn btn-lg btn-primary" type="submit" name="submit">Create</button>
                    </div>
                    
                    
                    
            </form>
	  <br>

        <div class = "historybox">
        <br>
        <br> <br>
        <br> <br>
        Exam Deadlines:
        <br>
        22/1/19, Agile software: NOT UPLOADED
        <br>
        29/3/19, Games programming: UPLOADED
        <br>
        9/9/19, Multi Paradigm: UPLOADED

        </div>
    </body>
</html>
 