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

<%-- Check for empty form fields... empty = redirect to login --%>
<c:if test="${empty param.uname || empty param.password}">
    <%-- Redirect for true condition --%>
    <c:redirect url="AdminLogin.jsp">
        <%-- Display error message in url --%>
        <c:param name="errMsg" value="Enter a username and password"/>
    </c:redirect>
</c:if>
<%-- Make sure form fields were not empty --%>
<c:if test="${not empty param.uname && not empty param.password}">
    <%-- Establish connection to database --%>
    <sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mydb" user="root" password=""/>
    <%-- Create the query for login --%>
    <sql:query var="result" dataSource="${con}">
        <%-- select count(*) as info to count the number of rows where conditons are true for query --%>
        Select count(*) as info from administrator where user_name = '${param.uname}' and password = '${param.password}'
    </sql:query>
        <%-- loop through results to country number of true rows --%>
        <c:forEach var="row" items="${result.rows}">
            <c:choose>
                <%-- check if number of rows is equal to 1... this should be one because of uniqueness to username and password combinations --%>
                <c:when test="${row.info == 1}">
                    <%-- Establish a session variable that is equal to the username of the person logging in --%>
                    <c:set scope="session" var="userLogin" value="${param.uname}"/>
                    <%-- redirect to target page upon valid login --%>
                    <c:redirect url="AdminControlPanel.jsp"/>
                </c:when>
                <%-- if username and/or password were incorrect, display error message in url and redirect to login page --%>
                <c:otherwise>
                    <%-- redirect to login page --%>
                    <c:redirect url="AdminLogin.jsp">
                        <%-- diaply error message in url --%>
                        <c:param name="errMsg" value="Username or password is incorrect!"/>
                    </c:redirect>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </c:if>


</body>
</html>
