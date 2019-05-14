<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/14/2019
  Time: 8:12 AM
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
<p>Search for games and find out their release dates and their sequels</p>

<form method="POST">
    <input type="text" name="search">
    <input type="submit" value="Search">
</form>
<sql:setDataSource var="con" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/mydb" user="root" password=""/>

<c:if test="${pageContext.request.method=='POST'}">
    <sql:query var="result" sql="Select * from games" dataSource="${con}"/>
<c:forEach var="row" items="${result.rows}">
    <p><c:out value="Results"/></p>
        <c:choose>
            <c:when test="${param.search == row.title}">
                <table>
                    <tr>
                        <th>Title</th>
                        <th>Title ID</th>
                        <th>Release Date</th>
                        <th>Sequel</th>
                    </tr>
                    <tr>
                        <td><c:out value="${row.title}"/></td>
                        <td><c:out value="${row.title_id}"/></td>
                        <td><c:out value="${row.release_date}"/></td>
                        <td><c:out value="${row.sequel}"/></td>
                    </tr>
                </table>
            </c:when>
        </c:choose>

</c:forEach>
</c:if>

</body>
</html>