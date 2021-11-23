<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<c:set var="language" value="${not empty param.language ? param.language : pageContext.request.locale }" scope="session" />
<fmt:setLocale value="${language}"/>
<fmt:setBundle basename="com.ashraf.i18n.resources.mylabels"/>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="i18n-test.jsp?language=en_UK">English (UK)</a>
	|
	<a href="i18n-test.jsp?language=es_ES">Spanish (ES)</a>
	|
	<a href="i18n-test.jsp?language=fr_FR">French (FR)</a><br/>
	
	<fmt:message key="label.greeting"/><br/>
	<fmt:message key="label.firstname"/>Ashraf<br/>
	<fmt:message key="label.lastname"/>Patel<br/>
	<fmt:message key="label.welcome"/>
	
	<hr>
	Selected ${language}
</body>
</html>