<%@page import="java.io.FileInputStream"%>
<%@ page contentType="application/octet-stream" language="java" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<title>Download JSP Page</title>
</head>
<body>

<h1>Download JSP Page</h1>

<form action="download.jsp" method="post">
<input type="hidden" name="filename" value="Ticket.jsp">
<input type="submit" value="Download">
</form>

</body>
</html>



