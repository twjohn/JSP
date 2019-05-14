<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/14/2019
  Time: 1:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<html>
<head>
    <title>Authenticate</title>
</head>
<body>

<c:if test="${empty param.uname || empty param.password}">
    <c:redirect url="AdminLogin.jsp">
        <c:param name="errMsg" value="Enter a username and password"/>
    </c:redirect>
</c:if>
<c:if test="${not empty param.uname && not empty param.password}">
    <sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mydb" user="root" password=""/>
    <sql:query var="result" dataSource="${con}">
        Select count(*) as kount from administrator where user_name = '${param.uname}' and password = '${param.password}'
    </sql:query>
        <c:forEach var="row" items="${result.rows}">
            <c:choose>
                <c:when test="${row.kount > 0}">
                    <c:set scope="session" var="userLogin" value="${param.uname}"/>
                    <c:redirect url="AdminControlPanel.jsp"/>
                </c:when>
                <c:otherwise>
                    <c:redirect url="AdminLogin.jsp">
                        <c:param name="errMsg" value="Username or password is incorrect!"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>


</body>
</html>
