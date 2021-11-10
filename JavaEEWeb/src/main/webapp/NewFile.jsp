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
		<h2>Name</h2>
		<input type="text" name="name"/>
		
		<h2>Pets Own</h2>
		<input type="checkbox" name="pets" value="Cat"/>Cat
		<input type="checkbox" name="pets" value="Parrot"/>Parrot
		<input type="checkbox" name="pets" value="Hamster"/>Hamster
		<input type="checkbox" name="pets" value="Fish"/>Fish
		
		<input type="submit" value="submit"/>
	</form>
	<jsp:include page="my-footer.jsp"/>
</body>
</html>