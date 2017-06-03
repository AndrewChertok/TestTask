<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix ="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="from" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<html>
<head>
    <title>Users Page</title>

    <style type="text/css">
        .tg{
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }
        .tg td{
            font-family:Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color:#fff;
        }

        .tg th{
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color:#f0f0f0;
        }

        .tg .tg-4eph{
            background-color:#f9f9f9;
        }

    </style>



</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Users List</h1>

<tr>Search by name</tr>
<tr>
<form:form method="get">
    <input type="text" name="searchName" value="${searchName}"/><br/>
    <input type="submit"
           value="Lookup User" />
</form:form>
    <form:form method="get">
        <input type="hidden" name="searchName" value="">
        <input type="submit"
               value="Escape" />
    </form:form>
</tr>
<c:if test="${!empty listUsers}">
    <table class ="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="120">Age</th>
            <th width="120">Admin</th>
            <th width="120">Created Date</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items = "${listUsers}" var = "user">
            <tr>
                <td>${user.id}</td>
                <td><a href="/userdata/${user.id}" target="_blank">${user.name}</a> </td>
                <td>${user.age}</td>
                <td>
                    <c:if test ="${not user.admin}"> No</c:if>
                    <c:if test ="${user.admin}"> Yes</c:if>
                </td>
                <td>
                    <fmt:formatDate value="${user.createdDate}" pattern="dd-MM-yyyy HH:mm:ss" />
                </td>
                <td><a href="<c:url value='/userdata/${user.id}'/>"> Edit</a></td>
                <td><a href="<c:url value='/remove/${user.id}'/>"> Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    <tr>
        <div id="pagination">
            <c:url value="/users" var="prev">
                <c:param name="page" value="${page-1}"/>
            </c:url>
            <c:if test="${page > 1}">
            <a href="<c:out value="${prev}" />" class="pn prev">Prev</a>
            </c:if>
            <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
            <c:choose>
            <c:when test="${page == i.index}">
            <span>${i.index}</span>
            </c:when>
            <c:otherwise>
            <c:url value="/users" var="url">
                <c:param name="page" value="${i.index}"/>
            </c:url>
            <a href='<c:out value="${url}" />'>${i.index}</a>
            </c:otherwise>
            </c:choose>
            </c:forEach>
            <c:url value="/users" var="next">
                <c:param name="page" value="${page + 1}"/>
            </c:url>
            <c:if test="${page + 1 <= maxPages}">
            <a href='<c:out value="${next}" />' class="pn next">Next</a>
            </c:if>
    </tr>
</c:if>


<h1>Add User</h1>


<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <table>

        <tr>
            <td>
                <form:label path="name">
                    <spring:message text="Name"/>
                </form:label>
            </td>

            <td>
                <form:input path="name"/>
            </td>
        </tr>

        <tr>
            <td>
                <form:label path="age">
                    <spring:message text="Age"/>
                </form:label>
            </td>

            <td>
                <form:input path="age"/>
            </td>
        </tr>


        <tr>

            <td>Admin?</td>
            <td>
                <form:radiobutton path="admin" value="true" /> YES
                <form:radiobutton path="admin" value="false" /> No
            </td>

        </tr>

        <tr>
            <td colspan="2">
                    <input type="submit"
                           value="<spring:message text="Add User"/>"/>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
