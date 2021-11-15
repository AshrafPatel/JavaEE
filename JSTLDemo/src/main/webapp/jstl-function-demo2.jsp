<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
	<c:set var="strCities" value="Dubai,Toronto,London,New York,Texas"/>
</head>
<body>
	<h3>Split Demo</h3>
	<c:set var="citiesArr" value="${fn:split(strCities, ',')}"/>
	
	<c:forEach var="currentCity" items="${citiesArr}">
		<p>${currentCity}</p>
	</c:forEach>
	
	<c:set var="citiesJoin" value="${fn:join(citiesArr, ' ')}"/>
	
	<p>${citiesJoin}</p>
</body>
</html>