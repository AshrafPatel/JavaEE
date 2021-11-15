<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<%
		String favLang = request.getParameter("favLang");
	
		favLang = URLEncoder.encode(favLang, "UTF-8");
	
		Cookie aCookie = new Cookie("myFavLang", favLang);
		
		aCookie.setMaxAge(60*60*24*360); //second/minute/day/year
		
		response.addCookie(aCookie);
	%>
</head>
<body>
	Thanks we set your favourite language to: <%=request.getParameter("favLang")%>
	<br/>
	<a href="cookies-hompage.jsp">Return to Homepage</a>
</body>
</html>