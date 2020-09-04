<%-- 
    Document   : login
    Created on : 03.07.2020., 20.55.14
    Author     : milos
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<div>
    <div class="jumbotron jumbotron-fluid mb-3 text-center">
        <div class="container">
            <h1 class="display-3">Bioskop</h1>
        </div>
    </div>
    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert mb-2">${message}</div>
    </c:if>
        
    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert mb-2">${error}</div>
    </c:if>

    <div class="container">
              
        <form action="${pageContext.request.contextPath}/login" method="post">

            <div class="form-group">
                <label for="broj">Username:</label>
                <div><input type="text" class="form-control" id="username" name="username" required/></div>
            </div>

            <div class="form-group">    
                <label for="sedista">Password:</label>
                <div><input type="password" class="form-control" id="password" name="password" required/></div>
            </div>
                
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            
            <p>
            <div><button id="save" class="btn btn-primary">Login</button></div>
            </p>
        </form>
    </div>

</div>
