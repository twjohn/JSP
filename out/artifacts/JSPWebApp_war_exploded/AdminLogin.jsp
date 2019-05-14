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


<form method="POST" action="loginAuthenticator.jsp">
    <input type="text" name="uname">
    <input type="text" name="password">
    <input type="submit" value="Login">
</form>

</body>
</html>
