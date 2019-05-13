<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/13/2019
  Time: 11:26 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>If/else</title>
    <link rel="stylesheet" type="text/css" href="jspStylesheet.css">
</head>
<body>
    <p>
        <h1>JSP with JSTL Testing Grounds</h1>
        Links to other pages</br>
        <a href="index.jsp">index</a>
        <a href="arithmetic.jsp">arithmetic</a>
    </p>
    <p>
        <h1>This is a if statement</h1>
        <%-- IF & CHOOSE STATEMENT TESTING JSTL --%>
        <c:if test="${pageContext.request.method=='POST'}">

        <p>The value submitted was <c:out value="${param.num1}"/></p>
        </br>

        <c:choose>

            <c:when test="${param.num1=='1'}">
                This will be visible if the value was exactly 1...
            </c:when>

            <c:when test="${param.num1=='1000'}">
                This will be visible if the value was exactly 1000...
            </c:when>

            <c:when test="${param.num1==''}">
                No value was entered...
            </c:when>

            <c:otherwise>
                This will be visible if the value was anything but 1 and 1000...
            </c:otherwise>

        </c:choose>

        </c:if>
    </p>
<%-------------------------------%>

    <form method="post">
        <input type="number" name="num1">
        <input type="submit" value="Submit Value">
    </form>

</body>
</html>
