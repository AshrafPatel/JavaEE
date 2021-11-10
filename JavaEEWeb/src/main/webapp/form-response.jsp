<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="my-header.jsp"/>
	<% 
	String name = request.getParameter("name");
	out.println("<p>" + name + "</p>");
	
	String pets[] = request.getParameterValues("pets");
	if (pets != null) {
		out.println("<ul>");
		for(String pet:pets) {
			out.println("<li>" + pet + "</li>");
		}
		out.println("</ul>");
	}
	%>
	<jsp:include page="my-footer.jsp"/>
</body>
</html>