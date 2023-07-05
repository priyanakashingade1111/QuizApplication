<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="css/viewquestion1.css" rel="stylesheet"/>
</head>
<body style=" background-color:lightgreen">
<center>
  <form>
    <center>
        <select name="t1" id="t1">
                        <option value="Java" name="Java">Java</option>
                        <option value="Angular" name="Angular">Angular</option>
                        <option value="Python" name="Python">Python</option>
                        
                    </select>
                    </center><br><br>
                    <center>
                 
                    <button type="button"><a href="createquiz.jsp" class="nav">Add Question</a></button>
                    <button type="button"><a href="feedback.jsp" class="nav">Feedback</a></button>
                 
                    </center>
   
             <center>

         
            <center><div><br><table border="1">
                        <h4>CHECK YOUR QUESTIONS /REVIEW IT</h4>
                    <tr><th>Question No.</th><th>Question</th><th>A:</th><th>B:</th><th>C:</th><th>D:</th><th>CORRECT ANSWER:</th><th>delete</th><th>edit</th></tr>
       <%  //String a=request.getParameter("t1");
       String subject=(String)session.getAttribute("t1");
           Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize","root","" );
                String query = "select * from java";
                
                PreparedStatement ps1 = con.prepareStatement(query);
                ResultSet rs= ps1.executeQuery(); 
                int id=0;
                 while (rs.next()) {
                    id++; 
                   String qid=rs.getString(1);
                   String b=rs.getString(2);
                   String c=rs.getString(3);
                   String d=rs.getString(4);
                   String e=rs.getString(5);
                   String f=rs.getString(6);
                   String g=rs.getString(7);
            %>
                <tr><th><%= qid %></th>
                <td><%= b %></td>
                <td><%= c %></td>
                <td><%= d %></td>
                <td><%= e %></td>
                <td><%= f %></td>
                <td><%= g %></td>
                <td><a href='DeleteController?qid=<%= qid %>'>delete</a></td>
                <td><a href='EditServlet?qid=<%= qid %>'>update</a></td>
                <%   } %>
                    </table></div></center>
                </form>
                </center>
                </body>
</html>