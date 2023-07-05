<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!DOCTYPE html>
<html>
<head>
<link href="css/feedback.css" rel="stylesheet" />

</head>
<body style="background-color: lightgreen">

	<center>
		<center>
			<h1 style="color: white">SHOW FEEDBACK OF USERS</h1>
		</center>
		<div>
			<center>
				<br>
				<br>

				<table border="1">
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>COUNT</th>
						<th>FEEDBACK</th>
					</tr>
					<%
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/quize", "root", "");
					String query = "select id, name,count,feedback from reports";
					PreparedStatement ps1 = con.prepareStatement(query);
					ResultSet rs = ps1.executeQuery();
					int id = 0;
					while (rs.next()) {
						id++;
						String id1 = rs.getString(1);

						String name = rs.getString(2);
						
						String count = rs.getString(3);

						String feedback = rs.getString(4);
					%>
					<tr>
						<td><%=id1%></td>
						<td><%=name%></td>
						<td><%=count%></td>
						<td><%=feedback%></td>
					<tr>
						<%
						}
						%>
					
				</table>
			</center>
		</div>
	</center>

</body>
</html>