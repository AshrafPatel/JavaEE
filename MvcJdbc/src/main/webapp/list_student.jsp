<%--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, com.ashraf.web.jbdc.*"	%>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Student List</title>
	<%--
		List<Student> students = (List<Student>)request.getAttribute("STUDENTS");
	--%>
	<link type="text/css" rel="stylesheet" href="css/style.css"/>
</head>
<body>
	<div id="wrapper">
		<div id="header">
			<h2>Huber College Student Records</h2>
		</div>
	</div>
	<div id="container">
		<div id="content">
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Age</th>
					<th>Course</th>
				</tr>
				<%--
				<% for (Student tempStudent : students) { %>
				<tr>
					<td><%= tempStudent.getFirstName() %></td>
					<td><%= tempStudent.getLastName() %></td>
					<td><%= tempStudent.getEmail() %></td>
					<td><%= tempStudent.getAge() %></td>
					<td><%= tempStudent.getCourse() %></td>
				</tr>
				<% } %>
				--%>
				
				<c:forEach var="temp" items="${STUDENTS}">
				<tr>
					<td>${temp.firstName}</td>
					<td>${temp.lastName}</td>
					<td>${temp.email}</td>
					<td>${temp.age}</td>
					<td>${temp.course}</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>