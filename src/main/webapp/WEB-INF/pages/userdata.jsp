<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix ="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix ="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="form" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix ="from" %>
<%@ page session="false" %>



<html>
<head>
<title>UserData</title>

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

<h1 align="center">User Details</h1>

<table align="center" class ="tg">

    <tr>
        <th width="80">ID</th>
        <th width="120">Name</th>
        <th width="120">Age</th>
        <th width="100">Admin</th>
        <th width="120">Created Date</th>
    </tr>

        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.age}</td>
            <td>
              <c:if test="${not user.admin}">No</c:if>
                <c:if test="${user.admin}">Yes</c:if>
            </td>
            <td>${user.createdDate}</td>
        </tr>

</table>

<h1 align="center">Edit User</h1>

<c:url var="addAction" value="/users/add"/>

<form:form action="${addAction}" commandName="user">
    <table align="center">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>

                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>


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
                           value="<spring:message text="Edit User"/>"/>
            </td>
        </tr>
    </table>
</form:form>

</body>
</html>