<%@page import="newpackage.MyExam"%>
<%@page import="com.mysql.jdbc.Driver"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import = "java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
	<link rel="icon" href="favicon.ico" type="image/x-icon">
	<link href="uploadcss.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<!--               vvv This needs to be used in order to have animated and colored progress bars, but interferes with ^^^^
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">-->

	<nav class="navbar navbar-default">
            <div class="container-fluid">
            <div class="navbar-header">
                <a href="Dashboard">
                    <img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
                </a>
            </div>
            Hello <% String mail=(String)session.getAttribute("username");
                    out.println(mail);%>
            <a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
            </div>
        </nav>
        <title>Exam Review System</title>
    </head>
    
    <body>
        <script>
            function testFunction(stg, i) {
                if(stg === "New"){
                    document.getElementById("progBar" + i).style.width = "20%";
                    document.getElementById("progBar" + i).innerHTML = "New";
                    document.getElementById("progBar" + i).className = "progress-bar bg-danger progress-bar-striped progress-bar-animated";
                } else if (stg === "Internal Moderation") {
                    document.getElementById("progBar" + i).style.width = "40%";
                    document.getElementById("progBar" + i).innerHTML = "Internal Moderation";
                    document.getElementById("progBar" + i).className = "progress-bar bg-warning progress-bar-striped progress-bar-animated";
                } else if (stg === "Exam Vetting") {
                    document.getElementById("progBar" + i).style.width = "60%";
                    document.getElementById("progBar" + i).innerHTML = "Exam Vetting";
                    document.getElementById("progBar" + i).className = "progress-bar bg-info progress-bar-striped progress-bar-animated";
                } else if (stg === "External Moderation") {
                    document.getElementById("progBar" + i).style.width = "80%";
                    document.getElementById("progBar" + i).innerHTML = "External Moderation";
                    document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                } else if (stg === "Completed") {
                    document.getElementById("progBar" + i).style.width = "100%";
                    document.getElementById("progBar" + i).innerHTML = "Completed";
                    document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                }
            }
	</script>
       
        <div class = "dashbg"></div>
        
	<div class = "sidebar">
            <h1> Account settings </h1>
            <br>
            <li> Current account: 
                    <% //String mail=(String)session.getAttribute("username");
                    out.println(mail);%>
            </li>
            <br>
            <li> Not you? <a href = "logout.jsp"> Switch Account </a>  </li>
            <br>
            <li> <a href = ""> Change Password </a> </li>
            <br>
            <br>
            <h2> School Office Tools </h2>
            <br>
            <li> <a href = "completedExams.jsp">Completed Exams</a> </li>
            <%
                if(session.getAttribute("admin").equals("1"))
                {
                    %>
                    <h2> Admin Tools </h2>
                    <br>
                    <li> <a href = "accountSetting.jsp"> Account Settings </a></li>
                    <li> <a href = "fullExamList.jsp">Full Exam listing </a></li>
                    <br>
                    <%
                }
                %>
            
        </div>
            <br>    
        </div>
		
        <div class = "exambox">
            <h1> Open Exams: </h1>
        <%
            String username = (String)session.getAttribute("username");
            int x = 0;
            String stage = "";
            String name = "";
            String defaultName = "progBar";
            ArrayList exams = (ArrayList ) request.getAttribute("examsList");
            ArrayList<MyExam> examsConverted = new ArrayList<MyExam>();
            ArrayList<Integer> internalModIndex = new ArrayList<Integer>();
            ArrayList<Integer> examVetIndex = new ArrayList<Integer>();
            ArrayList<Integer> externalModIndex = new ArrayList<Integer>();
            ArrayList<Integer> examSetIndex = new ArrayList<Integer>();
            if (exams != null)
            {
                for (Object exam : exams) {
                        String fields[] = exam.toString().split(",");
                        int i = 0;
                        examsConverted.add(new MyExam(fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++], fields[i++]));
                        if(examsConverted.get(examsConverted.size() - 1).getIntMod().equals(username))
                        {
                            internalModIndex.add(examsConverted.size() - 1);
                        }
                        if(examsConverted.get(examsConverted.size() - 1).getExVet().equals(username))
                        {
                            examVetIndex.add(examsConverted.size() - 1);
                        }
                        if(examsConverted.get(examsConverted.size() - 1).getExMod().equals(username))
                        {
                            externalModIndex.add(examsConverted.size() - 1);
                        }
                        if(examsConverted.get(examsConverted.size() - 1).getAuthor().equals(username))
                        {
                            examSetIndex.add(examsConverted.size() - 1);
                        }
                }
                
                out.println("<p> Exam Setter: </p>");
                for (int i = 0; i < examSetIndex.size(); i++) {
                    
                    x++;
                    name = defaultName.concat(Integer.toString(x));
                    out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(examSetIndex.get(i)).getModuleCode() + "&role=exSet" +  "' >");
                    out.println(examsConverted.get(examSetIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(examSetIndex.get(i)).getModuleTitle());
                    out.println(" </a> </li>");
                    stage = examsConverted.get(examSetIndex.get(i)).getStatus();
                    %>
                        <div class="progress">
                            <div id="<%=name%>" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%" ></div>
                            <script>testFunction("<%=stage%>", <%=x%>)</script>
                        </div>
                    <%
                }
                out.println("<p> Internal Mod: </p>");
                for (int i = 0; i < internalModIndex.size(); i++) {
                        
                        x++;
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(internalModIndex.get(i)).getModuleCode() + "&role=intMod" +  "' >");
                        out.println(examsConverted.get(internalModIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(internalModIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                        stage = examsConverted.get(internalModIndex.get(i)).getStatus();
                        %>
                            <div class="progress">
                                <div id="<%=name%>" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%" ></div>
                                <script>testFunction("<%=stage%>", <%=x%>)</script>
                            </div>
                        <%
                       
                    }
                out.println("<p> Exam Vetting: </p>");
                for (int i = 0; i < examVetIndex.size(); i++) {
                        
                        x++;
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(examVetIndex.get(i)).getModuleCode() + "&role=exVet" + "' >");
                        out.println(examsConverted.get(examVetIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(examVetIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                        stage = examsConverted.get(examVetIndex.get(i)).getStatus();
                        %>
                            <div class="progress">
                                <div id="<%=name%>" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%" ></div>
                                <script>testFunction("<%=stage%>", <%=x%>)</script>
                            </div>
                        <%
                       
                    }
                out.println("<p> External Mod: </p>");
                for (int i = 0; i < externalModIndex.size(); i++) {
                        
                        x++;
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(externalModIndex.get(i)).getModuleCode() + "&role=exMod" + "' >");
                        out.println(examsConverted.get(externalModIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(externalModIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                        stage = examsConverted.get(externalModIndex.get(i)).getStatus();
                        %>
                            <div class="progress">
                                <div id="<%=name%>" class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar"  aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 0%" ></div>
                                <script>testFunction("<%=stage%>", <%=x%>)</script>
                            </div>
                        <%
                       
                    }
                 out.print(" <div>");
            }
                             
            out.print("<script> var n; n =");
            out.print(x + "</script>");

  
  
        %>
        
	<a href="createexam.jsp"> <button type="button" class="btn btn-default navbar-btn">Upload New</button>  </a>
	</div>
        
    </body>
</html>
