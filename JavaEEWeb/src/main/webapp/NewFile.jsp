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
	<form action="form-response.jsp">
		<input type="text" name="name"/>
		<input type="submit" value="submit"/>
	</form>
	<jsp:include page="my-footer.jsp"/>
</body>
</html>