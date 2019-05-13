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
    <title>arithmetic</title>
    <link rel="stylesheet" type="text/css" href="jspStylesheet.css">
</head>

<div id="title"><h1> JSP With JSTL Testing Grounds</h1></div>
    <p>
        Links to other pages</br>
        <a href="index.jsp">index</a>
        <a href="conditional.jsp">conditional</a>
    </p>
    <h1>This is some arithmetic</h1>

    </p>

    <p class="arithmetic">
        <c:if test="${pageContext.request.method=='POST'}">
            <fmt:parseNumber var="mathVal1" type="number" value="${param.mathVal1}"/>
            <fmt:parseNumber var="mathVal2" type="number" value="${param.mathVal2}"/>

            <c:choose>
                <c:when test="${param.op=='+'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:out value="${mathVal1+mathVal2}"/>
                </c:when>
                <c:when test="${param.op=='-'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:out value="${mathVal1-mathVal2}"/>
                </c:when>
                <c:when test="${param.op=='*'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:out value="${mathVal1*mathVal2}"/>
                </c:when>
                <c:when test="${param.op=='/'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:out value="${mathVal1/mathVal2}"/>
                </c:when>
                <c:when test="${param.op=='%'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:out value="${mathVal1%mathVal2}"/>
                </c:when>
                <c:when test="${param.op=='sqrt'}">


                    <c:if test="${mathVal1 > 0}">
                        <c:out value="√"/>
                        <c:out value="${param.mathVal1}"/>
                        <c:out value="="/>
                        <%
                            double num1 = Double.parseDouble(request.getParameter("mathVal1"));
                            double val;
                            double sqrt = num1/2;

                            do{
                                val = sqrt;
                                sqrt = (val+(num1/val))/2;
                            }while((val-sqrt)!=0);
                        %>
                        <%=sqrt%>
                    </c:if>
                    <c:if test="${mathVal1 <= 0}">
                        <c:out value="√"/>
                        <c:out value="${param.mathVal1}"/>
                        <c:out value="="/>
                        <c:out value="NaN"/>
                    </c:if>
                </c:when>

                <c:when test="${param.op=='^'}">
                    <c:out value="${param.mathVal1}"/>
                    <c:out value="${param.op}"/>
                    <c:out value="${param.mathVal2}"/>
                    <c:out value="="/>
                    <c:set var="temp"/>
                    <fmt:parseNumber var="temp" type="number" value="1"/>
                    <c:forEach var="i" begin="1" end="${mathVal2}">
                        <c:set var="temp" value="${temp*mathVal1}"/>
                    </c:forEach>
                    <c:out value="${temp}"/>
                </c:when>
            </c:choose>
        </c:if>
    </p>

    <form method="post">
        <input type="number" name="mathVal1" placeholder="Number 1">
        <select name="op">
            <option value="+" selected>+</option>
            <option value="-">-</option>
            <option value="/">/</option>
            <option value="*">*</option>
            <option value="%">%</option>
            <option value="sqrt">√</option>
            <option value="^">^</option>
        </select>
        <input type="number" name="mathVal2" placeholder="Number 2">
        <input type="submit" name="Calculate">
    </form>

</body>
</html>
