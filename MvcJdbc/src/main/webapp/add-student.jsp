<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
<link rel="stylesheet" type="text/css" href="css/add-student-style.css"/>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Huber College</h2>
		</div>
		
		<div id="container">
			<h3>Add Student</h3>
			<form action="StudentControllerServlet" method="POST">
				<input type="hidden" name="command" value="ADD"/>
				
				<table>
					<tbody>
						<tr>
							<td><label>First Name</label></td>
							<td><input type="text" name="fName"/></td>
						</tr>
						
						<tr>
							<td><label>Last Name</label></td>
							<td><input type="text" name="lName"/></td>
						</tr>
						
						<tr>
							<td><label>Email</label></td>
							<td><input type="text" name="email"/></td>
						</tr>
						
						<tr>
							<td><label>Age</label></td>
							<td><input type="number" min="18" max="150" name="age"/></td>
						</tr>
						
						<tr>
							<td><label>Course</label></td>
							<td><input type="text" name="course"/></td>
						</tr>
						
						<tr>
							<td><label></label></td>
							<td><input type="submit" value="Save" class="save"/></td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div style="clear: both;"></div>
		
		<p><a href="StudentControllerServlet">Back to List</a></p>
	</div>
</body>
</html>