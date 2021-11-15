<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*, com.ashraf.jstldemo.Student" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
	List<Student> students = new ArrayList<>();
	
	students.add(new Student("Ashraf", "Patel", true));
	students.add(new Student("Faridah", "Motara", true));
	students.add(new Student("Yusuf", "Patel", false));
	students.add(new Student("Almash", "Ali", false));
	
	pageContext.setAttribute("students", students);
%>
</head>
<body>
	<table>
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>VIP</th>
		</tr>
		<c:forEach var="currentStudent" items="${students}">
		<tr>
			<td>${currentStudent.firstName}</td>
			<td>${currentStudent.lastName}</td>
			<c:choose>
			<c:when test="${currentStudent.vipStudent}">
				<td>Yes</td>
			</c:when>
			<c:otherwise>
				<td>No</td>
			</c:otherwise>
			</c:choose>
		</tr>
		</c:forEach>
	</table>
</body>
</html>