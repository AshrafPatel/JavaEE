<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.net.URLDecoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%
	String favLang = "Java";
	
	Cookie[] allCookies = request.getCookies();
	
	if (allCookies != null) {
		for (Cookie temp : allCookies) {
			if ("myFavLang".equals(temp.getName())) {
				favLang = URLDecoder.decode(temp.getValue(), "UTF-8");
				break;
			}
		}
	}
%>
</head>
<body>
	<h4>New Books for <%= favLang %></h4>
	<ul>
		<li>Blah</li>
		<li>Blah</li>
		<li>Blah</li>
	</ul>
	
	<h4>Latest New Reports for <%= favLang %></h4>
	<ul>
		<li>Blah</li>
		<li>Blah</li>
		<li>Blah</li>
	</ul>
	
	<h4>Hot Jobs for <%= favLang %></h4>
	<ul>
		<li>Blah</li>
		<li>Blah</li>
		<li>Blah</li>
	</ul>
	<a href="cookies-form.jsp">Personalise this Page</a>
</body>
</html>