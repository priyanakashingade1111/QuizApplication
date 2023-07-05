<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="calendar_box2">

	<div class="calendar_box_content">

		<h1>Welcome to my Site</h1>
		<marquee direction="left" style="color: navy;" onmouseover="stop()"
			onmouseout="start()">
			<B>Assess Yourself by taking quizs on various sunject</B>
		</marquee>

		<form method="get" action="get1.jsp">
			<table>
				<tr>
					<td>
						<%
						String question = (String) session.getAttribute("question");
						String option1 = (String) session.getAttribute("option1");
						String option2 = (String) session.getAttribute("option2");
						String option3 = (String) session.getAttribute("option3");
						String option4 = (String) session.getAttribute("option4");
						out.print(question);
						%> <%
 if ((String) request.getParameter("radio") != null) {
 	String ans = (String) request.getParameter("radio");
 	System.out.println("ans on set" + ans);
 	session.setAttribute("ans", ans);

 }
 %>
					</td>
				</tr>
				<tr>
					<td><input type="radio" name="radio" value="<%=option1%>" /><%=option1%></td>
				</tr>
				<tr>
					<td><input type="radio" name="radio" value="<%=option2%>" /><%=option2%></td>
				</tr>
				<tr>
					<td><input type="radio" name="radio" value="<%=option3%>" /><%=option3%></td>
				</tr>
				<tr>
					<td><input type="radio" name="radio" value="<%=option4%>" /><%=option4%></td>
				</tr>

				<tr>
					<td></td>
					<td><input type="submit" value="Next" /></td>
				</tr>
			</table>
		</form>



	</div>
</div>

</body>
</html>