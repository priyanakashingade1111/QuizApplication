<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/login.css" rel="stylesheet"/>
</head>
<body  style="background-color:lightgreen">
<center>
 <a href="#"><img src="images/l.jpg"  height=10% width=30%></a>
	</center>
<center>
    <h1>Welcome to my Site</h1>
    </center>
                	<center>	 
                		<form method="post" action="login" >
					<table>
					<tr><td style="color:navy;"><h3> Login Form</h3></td></tr>
				
					<tr><td>User Name:</td><td><input type="text" name="username" /></td></tr>
								
					<tr><td>Password:</td><td><input type="password" name="password"/></td></tr>	
						
					<tr><td></td><td><input type="submit" value="Sign in"/> <a href="register.jsp">Register</a></td></tr>	
					</table>
                     </form>
    </center>
   
    
</body>
</html>