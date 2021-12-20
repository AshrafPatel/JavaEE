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
			<input 
				type="button" 
				value="Add Student" 
				onclick="window.location.href='add-student.jsp'; return false;" 
				class="add-student-button"
			/>
			<!--  add a search box -->
            <form action="StudentControllerServlet" method="GET">
                <input type="hidden" name="command" value="SEARCH" />
                Search student: <input type="text" name="searchTerm" />
                <input type="submit" value="Search" class="add-student-button" />
            </form>
            
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Age</th>
					<th>Course</th>
					<th>Action</th>
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
				<%-- CREATE THE URL --%>
				<c:url var="tempURLUpdate" value="StudentControllerServlet">
					<c:param name="command" value="LOAD"/>
					<c:param name="student" value="${temp.id }"/>
				</c:url>
				<c:url var="tempURLDelete" value="StudentControllerServlet">
					<c:param name="command" value="DELETE"/>
					<c:param name="student" value="${temp.id}"/>
				</c:url>
				
				<tr>
					<td>${temp.firstName}</td>
					<td>${temp.lastName}</td>
					<td>${temp.email}</td>
					<td>${temp.age}</td>
					<td>${temp.course}</td>
					<td>
						<a href="${tempURLUpdate}">Update</a> | 
						<a href="${tempURLDelete}" onclick="if (!(confirm('Are you sure you wish to delete this student?'))) return false;">Delete</a>
					</td>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>