<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="todo.jsp">
		Add new item: <input type="text" name="theItem"/>
		<input type="submit" value="Submit"/>
	</form>
	
	<%
		List<String> items = (List<String>) session.getAttribute("myToDoList");
	
		if (items==null) {
			items = new ArrayList<String>();
			session.setAttribute("myToDoList", items);
		}
		
		String theItem = request.getParameter("theItem");
		if (theItem != null) {
			if (!theItem.trim().equals("")) {
				theItem = theItem.trim();
				items.add(theItem);
			}
		}
	%>
	<hr>
	<b>ToDo List Items</b>
	<br>
	<ol>
		<%
			for (String temp : items) {
				temp = temp.trim();
				if (!temp.trim().equals("") || temp != null ) {
					out.println("<li>" + temp + "</li>");
				}
			}
		%>		
	</ol>
	
</body>
</html>