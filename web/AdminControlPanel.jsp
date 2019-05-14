<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/14/2019
  Time: 2:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
<head>
    <title>Admin Control Panel</title>
    <link rel="stylesheet" type="text/css" href="jspStylesheet.css">
</head>
<div id="title"><h1> JDBC JSTL & JSP Database interaction</h1></div>
<body>
        <%-- checks session scope for a empty value. if it is empty, redirect to login page --%>
        <c:if test="${empty sessionScope['userLogin']}">
            <%-- redirect to login page --%>
            <c:redirect url="AdminLogin.jsp"/>
        </c:if>

        <%-- display the session variable value and give option to logout --%>
        <c:out value="Welcome ${sessionScope['userLogin']}"/>
        <%-- logout button that redirects to logout file --%>
        <a href="logout.jsp"><input type="button" value="Logout"></a>
</body>
</html>
