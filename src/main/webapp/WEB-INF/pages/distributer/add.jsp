<%-- 
    Document   : add
    Created on : 9.8.2020., 15.55.14
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
        <form:form action="${pageContext.request.contextPath}/distributer/save" method="post" modelAttribute="distributer">

            <br>
            

                    <div class="form-group">
                        <label for="naziv"><b><fmt:message key="naziv"/></b>: ${distributer.naziv}</label>
                        <div><form:input type="text" class="form-control" id="naziv" path="naziv" required="true"/></div>
                        <div class="text-danger">
                            <form:errors path="naziv" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">    
                        <label for="telefon"><b><fmt:message key="telefon"/></b>: ${distributer.telefon}</label>
                        <div><form:input type="text" class="form-control" id="broj" path="telefon" required="true"/></div>
                        <div class="text-danger">
                            <form:errors path="telefon" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">    
                        <label for="email"><b>Email</b>: ${distributer.email}</label>
                        <div><form:input type="email" class="form-control" id="email" path="email" required="true"/></div>
                        <div class="text-danger">
                            <form:errors path="email" cssClass="error" />
                        </div>
                    </div>
                    
            
         
            <p/>
            <div><button id="save" class="btn btn-primary"><fmt:message key="save"/></button> </div>
            <p/>

        </form:form>
                      
    </div>

</div>
