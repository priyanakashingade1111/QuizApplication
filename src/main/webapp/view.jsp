<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ page import="java.sql.*" %>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
</head>
<body>
  <form action="" method="post">
  <%
  String subject= request.getParameter("t1");
  System.out.println(subject);
  %>
	 <center><div><br><table border="1">
                        <h4>CHECK YOUR QUESTIONS /REVIEW IT</h4>
                    <tr><th>Question No.</th><th>Question</th><th>A:</th><th>B:</th><th>C:</th><th>D:</th><th>CORRECT ANSWER:</th><th>delete</th><th>edit</th></tr>
       <%  
       
           Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize","root","" );
                String query = "select * from "+ subject;
                
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
                    <button type="button">
				<a href="createquiz.jsp?subject="+subject>Add Question</a>
			</button>
			
	</form>
</body>
</html>