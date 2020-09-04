<%-- 
    Document   : add
    Created on : 03.07.2020., 20.55.14
    Author     : milos
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<div>
    
    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert mb-2">${message}</div>        
    </c:if>

    <div class="container">
        <form:form action="${pageContext.request.contextPath}/sala/save" method="post" modelAttribute="sala">

            <div class="form-group">
                <label for="broj"><fmt:message key="sala.brojSale"/>:</label>
                <div><form:input type="number" class="form-control" id="broj" path="brojSale" required="true"/></div>
                <div class="text-danger">
                    <form:errors path="brojSale" cssClass="error" />
                </div>
            </div>

            <div class="form-group">    
                <label for="sedista"><fmt:message key="sala.brojSedista"/>:</label>
                <div><form:input type="number" class="form-control" id="sedista" path="brojSedista" required="true"/></div>
                <div class="text-danger">
                    <form:errors path="brojSedista" cssClass="error" />
                </div>
            </div>
            
            <p/>
            <div><button id="save" class="btn btn-primary"><fmt:message key="save"/></button> </div>
            <p/>
        </form:form>
    </div>

</div>
