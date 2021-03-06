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
			<h3>Update Student</h3>
			<form action="StudentControllerServlet" method="POST">
				<input type="hidden" name="command" value="UPDATE"/>
				<input type="hidden" name="studId" value="${STUDENT.id}"/>
				
				<table>
					<tbody>
						<tr>
							<td><label>First Name</label></td>
							<td><input type="text" name="fName" value="${STUDENT.firstName}"/></td>
						</tr>
						
						<tr>
							<td><label>Last Name</label></td>
							<td><input type="text" name="lName" value="${STUDENT.lastName}"/></td>
						</tr>
						
						<tr>
							<td><label>Email</label></td>
							<td><input type="text" name="email" value="${STUDENT.email}"/></td>
						</tr>
						
						<tr>
							<td><label>Age</label></td>
							<td><input type="number" min="18" max="150" name="age" value="${STUDENT.age}"/></td>
						</tr>
						
						<tr>
							<td><label>Course</label></td>
							<td><input type="text" name="course" value="${STUDENT.course}"/></td>
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