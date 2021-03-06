<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>

<html>

<style type="text/css">
    .tg {
        border-collapse: collapse;
        border-spacing: 0;
        border-color: #ccc;
    }

    .tg td {
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
        background-color: #fff;

    }

    .tg th {
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
        background-color: #fff;

    }

    .tg .tg-4eph {
        background-color: #f9f9f9;
    }

</style>
<head>
    <title>Title</title>
</head>
<body>
<a href="../../../src/main/webapp/index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Product list</h1>

<c:if test="${!empty listProducts}">
    <table class="tg">
        <tr>
            <th width="80">ID</th>
            <th width="120">Product name</th>
            <th width="120">Manufacturer</th>
            <th width="120">Prise</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listProducts}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.productName}</td>
                <td>${product.manufacturer}</td>
                <td>${product.prise/100}.${product.prise%100}</td>
                <td><a href="<c:url value='/edit/${product.id}'/>">">Edit</a></td>
                "
                <td><a href="<c:url value='/remove/${product.id}'/>">">Delete</a></td>
                "
            </tr>
        </c:forEach>
    </table>
</c:if>

<h1>Add a Product to GOODS</h1>

<c:url var="addAction" value="/products/add">

    <form:form action="${addAction}" commandName="product">
        <table>
            <c:if test="${!empty product.productName}">
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
            </c:if>
            <tr>
                <td>
                    <form:label path="productName">
                        <spring:message text="Name"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="productName"/>
                </td>

            </tr>
            <tr>
                <td>
                    <form:label path="manufacturer">
                        <spring:message text="Manufacturer"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="manufacturer"/>
                </td>
            </tr>
            <tr>
                <td>
                    <form:label path="prise">
                        <spring:message text="Prise"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="prise"/>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <c:if test="${!empty product.productName}">
                        <input type="submit"
                               value="<spring:message text="Edit Product"/>"/>
                    </c:if>
                    <c:if test="${empty product.productName}">
                        <input type="submit"
                               value="<spring:message text="Add Product"/>"/>
                    </c:if>

                </td>
            </tr>
        </table>
    </form:form>
</c:url>
</body>
</html>
