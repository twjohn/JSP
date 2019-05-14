<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/14/2019
  Time: 1:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
<head>
    <title>JSP JSTL JDBC Test</title>
    <link rel="stylesheet" type="text/css" href="jspStylesheet.css">
</head>
<div id="title"><h1> JDBC JSTL & JSP Database interaction</h1></div>
<body>
<a href="index.jsp">index</a>
<a href="conditional.jsp">conditional</a>
<a href="arithmetic.jsp">arithmetic</a>
<a href="JDBC.jsp">Java Database connection</a>

<%-- form to send values via POST metod. action redirects to authentication page --%>
<form method="POST" action="loginAuthenticator.jsp">
    <input type="text" name="uname">
    <input type="text" name="password">
    <input type="submit" value="Login">
</form>

</body>
</html>
