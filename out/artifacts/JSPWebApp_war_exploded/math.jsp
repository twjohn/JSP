<%--
  Created by IntelliJ IDEA.
  User: tjohnston
  Date: 5/13/2019
  Time: 2:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="java.sql.*"%>
<html>
<head>
    <title>JSP JSTL JDBC Test</title>
</head>
<body>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.driver" url="jdbc:mysql://localhost/myDB"/>
    <sql:query var="result" dataSource="${snapshot}" sql="..."/>

</body>
</html>
