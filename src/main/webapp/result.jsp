<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="exam.jsp">
                	<p>
                	<font style="color: navy;"><B>Your <%=request.getAttribute("total") %> questions are correct</B></font><BR/>
                	<input type="submit" value="view description">            
                	</p>
					</form>
</body>
</html>