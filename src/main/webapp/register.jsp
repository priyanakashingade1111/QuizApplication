<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body  style="background-color:lightgreen">
<center>
<br><br>
 <h1>Rgistration</h1>
    <form action="register" method="post"  >
		<table>
			<tr>
				<td>Username</td>
				<td><input type="text" name="username" required/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password" required/></td>
			</tr>
			
			<tr>
				<td>Category</td>
				<td>
				<select name="category">
					<option>Select a Category</option>
					<option>Teacher</option>
					<option>Student</option>
					</select>
					
				</td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="email" required/></td>
			</tr>
			
			<tr>
				<td><input type="submit" value="Register"/></td>
                <td><input type="reset"/></td>
			</tr>
              	
		</table>
		
		 
		
	</form>
	<a href="#"><img src="images/ri.png" alt="" title="" class="left_img" border="0"></a>
		
	</center> 
</body>
</html>