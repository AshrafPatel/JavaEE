<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
	String[] cities = {"Toronto", "London", "Blackburn", "Mississauga", "New York"};

	pageContext.setAttribute("cities", cities);
%>
</head>
<body>
	<ul>
	<c:forEach var="tempCity" items="${cities}">
		<li>${tempCity}</li>
	</c:forEach>
	</ul>
</body>
</html>