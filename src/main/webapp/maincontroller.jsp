
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" import="java.util.*"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to QuizYourIQ</title>
<link href="css/mainC.css" rel="stylesheet" />
</head>
<body style="background-color: lightgreen">
	<form action="TableController" method="post">
		<%
		HttpSession s2 = request.getSession(false);
		String name = (String) s2.getAttribute("username");
		System.out.println(name);
		%>

		<center>
			<div>

				<center>
					<table border="1">
						<%
						out.println("<center><h2>WELCOME TO QuizYourIQ! ALL THE BEST:</h2><h5>USERNAME:  " + name + "</h5></center>");
						int current = 0;
						int num = 1;
						Object qlist = s2.getAttribute("qlist");
						Object qlist2 = s2.getAttribute("qlist1");
						List qlist1 = (ArrayList) qlist;
						List qlist3 = (ArrayList) qlist2;
						ListIterator itr = qlist1.listIterator();
						ListIterator itr2 = qlist3.listIterator();
						String qid = request.getParameter("qid");
						response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
						response.setHeader("Pragma", "no-cache");
						response.setHeader("Expires", "0");
						if (request.getParameter("hidden") != null) {
							current = Integer.parseInt(request.getParameter("hidden"));
						}
						if (current == 10) {
							response.sendRedirect("CheckS");
						}
						for (int i = 0; i < current; i++) {
							itr.next();
							itr.next();
							itr.next();
							itr.next();
							itr.next();
							itr.next();
							itr.next();
							num++;
						}
						for (int j = 0; j < current; j++) {
							itr2.next();
							itr2.next();
							itr2.next();
							itr2.next();
						}
						if (itr.hasNext()) {
						%>
						<tr>
							<td><input type="hidden" name="qid" value="<%=itr.next()%>"><input
								type="text" name="qid" Disabled Readonly id="qid"
								value="<%=num%>" style="background-color: white" /></td>
							<td><textarea name="question" cols="50" rows="5" Disabled
									Readonly id="question" style="background-color: white"><%=itr.next()%></textarea></td>
						<tr>
							<td>A)</td>
							<td><input type="radio" name="option"
								value="<%=itr2.next()%>"><%=itr.next()%></td>
						</tr>
						<tr>
							<td>B)</td>
							<td><input type="radio" name="option"
								value="<%=itr2.next()%>"><%=itr.next()%></td>
						</tr>
						<tr>
							<td>C)</td>
							<td><input type="radio" name="option"
								value="<%=itr2.next()%>"><%=itr.next()%></td>
						</tr>
						<tr>
							<td>D)</td>
							<td><input type="radio" name="option"
								value="<%=itr2.next()%>"><%=itr.next()%></td>
						</tr>
						<input type="hidden" name="corans" value="<%=itr.next()%>">
					</table>
				</center>
				<br> <br> <input type="hidden" name="hidden"
					value="<%=current + 1%>"> <input type="submit"
					value="NEXT QUESTION"><br> <br> <input
					type="button" value="FINISH EXAM" onclick="location.href='CheckS'">
				<%
				}
				%>
			
	</form>
	</table>
	</div>
	</center>


</body>
</html>