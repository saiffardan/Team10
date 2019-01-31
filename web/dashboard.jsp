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
                <a href="dashboard.jsp">
                    <img alt="Uni of Dundee crest" src="Dundeebadge.png" height="50" width="50"> 
                </a>
            </div>
            Hello cramsay@dundee.ac.uk!
            <a href="logout.jsp"> <button type="button" class="btn btn-default navbar-btn"style="float:right">Logout</button>  </a>
            </div>
        </nav>
        <title>Exam Review System</title>
    </head>
    
    <body onload="testFunction()">
        <div class = "dashbg"></div>
        
	<div class = "sidebar">
            <h1> Account settings </h1>
            <br>
            <li> Current account: 
                    <% String mail=(String)session.getAttribute("username");
                    out.println(mail);%>
            </li>
            <br>
            <li> Not you? <a href = ""> Switch Account </a>  </li>
            <br>
            <li> <a href = ""> Change Password </a> </li>
            <br>
            <br>
            <h2> Staff Tools </h2>
            <br>
            <li> <a href = "">Exam Progress Tracker</a> </li>
            <br>
            <li> <a href = "">  </a> </li>
            <br>
        </div>
		
        <div class = "exambox">
            <h1> Open Exams: </h1>
        
                    <%--<%
                                        
                    
                     try{
                /* try{*/     
     
        Date d1 = new Date();
        
        
        Class.forName("com.mysql.jdbc.Driver").newInstance();   
       String connName = "jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10db";
       Connection conn = DriverManager.getConnection(connName,"18agileteam10","7621.at10.1267");
       Statement st = conn.createStatement();
               ResultSet rs =  st.executeQuery("SELECT * FROM exam");
               //int x = 0;
               String defaultName = "progBar";
               //String name;  
                 while(rs.next()){
                 //x++;
//                 name = defaultName.concat(Integer.toString(x));   
                 out.println("<li> <a href = 'exam.jsp?folder='>");
       out.println( rs.getString(2)  + " - " + rs.getString(3) + "<br>");
        out.println(" </a> </li>");
                %> --%>
                
        <%
            String username = (String)session.getAttribute("username");
            int x = 0;
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
                
                for (int i = 0; i < examSetIndex.size(); i++) {
                        out.println("<p> Exam Setter: </p>");
                        x++;
                        //int index = 
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(examSetIndex.get(i)).getModuleCode() + "&role=exSet" +  "' >");
                        out.println(examsConverted.get(examSetIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(examSetIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                    }
                for (int i = 0; i < internalModIndex.size(); i++) {
                        out.println("<p> Internal Mod: </p>");
                        x++;
                        //int index = 
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(internalModIndex.get(i)).getModuleCode() + "&role=intMod" +  "' >");
                        out.println(examsConverted.get(internalModIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(internalModIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                    }
                for (int i = 0; i < examVetIndex.size(); i++) {
                        out.println("<p> Exam Vetting: </p>");
                        x++;
                        //int index = 
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(examVetIndex.get(i)).getModuleCode() + "&role=exVet" + "' >");
                        out.println(examsConverted.get(examVetIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(examVetIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                    }
                for (int i = 0; i < externalModIndex.size(); i++) {
                        out.println("<p> External Mod: </p>");
                        x++;
                        //int index = 
                        name = defaultName.concat(Integer.toString(x));
                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(externalModIndex.get(i)).getModuleCode() + "&role=exMod" + "' >");
                        out.println(examsConverted.get(externalModIndex.get(i)).getModuleCode() + " - " +  examsConverted.get(externalModIndex.get(i)).getModuleTitle());
                        out.println(" </a> </li>");
                    }
                
//                for(int i = 0; i < examsConverted.size(); i++)
//                {
//                    if(examsConverted.get(i).getIntMod().equals(session.getAttribute("username")))
//                    {
//                        out.println("<p> Internal mod </p>");
//                        x++;
//                        name = defaultName.concat(Integer.toString(x));
//                        out.println("<li> <a href = 'Exam?moduleCode=" + examsConverted.get(i).getModuleCode() + "' >");
//                        out.println(examsConverted.get(i).getModuleCode() + " - " +  examsConverted.get(i).getModuleTitle());
//                        out.println(" </a> </li>");
//                    }
//                    
//                }
                
//                for (MyExam exam : examsConverted) {
//                    x++;
//                    name = defaultName.concat(Integer.toString(x));
//                    out.println("<li> <a href = 'Exam?moduleCode=" + exam.get + "' >");
//                    out.println(exam.toString());
//                    out.println(" </a> </li>");
//                }
            }
                             
            out.print("<script> var n; n =");
            out.print(x + "</script>");
        %>
	<a href="createexam.jsp"> <button type="button" class="btn btn-default navbar-btn">Upload New</button>  </a>
	</div>

        <div class = "historybox">
            <h1> Admin tools </h1>
            <li> <a href = "accountSetting.jsp"> Account Settings</li>
            <br>
            <li> <a href = "createAccount.jsp">  Create Account</li>
            <br>
            <li> <a href = "exam.jsp">Full Exam listing</li>
            <br>
        </div>
		
        <script>
            function testFunction() {
                var i;
                var stage;
                // Saif - This is a temporary functionality which shows how progress bars will look like
                // - A dynamic solution to change more than one progress bar at once
                for (i = 1; i <= n; i++) { 
                    stage = Math.floor((Math.random() * 4) + 1);
                    if(stage === 1){
                        document.getElementById("progBar" + i).style.width = "25%";
                        document.getElementById("progBar" + i).innerHTML = "Stage 1";
                        document.getElementById("progBar" + i).className = "progress-bar bg-danger progress-bar-striped progress-bar-animated";
                    } else if (stage === 2) {
                        document.getElementById("progBar" + i).style.width = "50%";
                        document.getElementById("progBar" + i).innerHTML = "Stage 2";
                        document.getElementById("progBar" + i).className = "progress-bar bg-warning progress-bar-striped progress-bar-animated";
                    } else if (stage === 3) {
                        document.getElementById("progBar" + i).style.width = "75%";
                        document.getElementById("progBar" + i).innerHTML = "Stage 3";
                        document.getElementById("progBar" + i).className = "progress-bar bg-info progress-bar-striped progress-bar-animated";
                    } else if (stage === 4) {
                        document.getElementById("progBar" + i).style.width = "100%";
                        document.getElementById("progBar" + i).innerHTML = "Stage 4";
                        document.getElementById("progBar" + i).className = "progress-bar bg-success progress-bar-striped progress-bar-animated";
                    }
//                            if(document.getElementById("progBar" + i).style.width === "0%"){
//                                document.getElementById("progBar" + i).style.width = "25%";
//                            }else if(document.getElementById("progBar" + i).style.width === "25%") {
//                                document.getElementById("progBar" + i).style.width = "50%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "50%") {
//                                document.getElementById("progBar" + i).style.width = "75%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "75%") {
//                                document.getElementById("progBar" + i).style.width = "100%"; 
//                            }else if(document.getElementById("progBar" + i).style.width === "100%") {
//                                document.getElementById("progBar" + i).style.width = "0%"; 
//                            }
                }
            }
	</script>
    </body>
</html>
