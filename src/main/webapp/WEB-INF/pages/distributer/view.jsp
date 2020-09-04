<%-- 
    Document   : view
    Created on : 23.07.2020., 15.55.14
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
        <form:form action="${pageContext.request.contextPath}/distributer/${distributer.id}/delete" method="get" modelAttribute="distributer">

            <br>
            <div class="row">
                <div class="col-7">
                    
                    <div class="form-group">
                        <label for="id"><b>ID:</b> ${distributer.id}</label>
                    </div>

                    <div class="form-group">
                        <label for="broj"><b><fmt:message key="naziv"/></b>: ${distributer.naziv}</label>
                    </div>

                    <div class="form-group">    
                        <label for="sedista"><b><fmt:message key="telefon"/></b>: ${distributer.telefon}</label>
                    </div>
                    
                    <div class="form-group">    
                        <label for="sedista"><b>Email</b>: ${distributer.email}</label>
                    </div>
                    
                </div>
            </div>
         
            <p>
            <div>
                <button id="delete" class="btn btn-danger"><fmt:message key="delete"/></button>            
            </div>
            </p>

        </form:form>
                      
    </div>

</div>
