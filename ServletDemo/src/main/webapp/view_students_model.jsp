<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h2>Student Table</h2>
	<table border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Age</th>
			<th>DOB</th>
		</tr>
		<c:forEach var="tempStudent" items="${studentsData}">
		<tr>
			<td>${tempStudent.firstName}</td>
			<td>${tempStudent.lastName}</td>
			<td>${tempStudent.age}</td>
			<td>${tempStudent.dob}</td>
		<tr/>
		</c:forEach>
	</table>
</body>
</html>