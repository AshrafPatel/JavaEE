<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:set var="name" value="Ashraf Patel"/>
	<p>The length of the String <b>${name}</b> is ${fn:length(name)}</p>
	<p>The Uppercase version of the String <b>${name}</b> is ${fn:toUpperCase(name)}</p>
</body>
</html>