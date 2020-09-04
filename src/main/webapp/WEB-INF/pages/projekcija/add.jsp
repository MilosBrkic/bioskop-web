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
        <form:form action="${pageContext.request.contextPath}/projekcija/save" method="post" modelAttribute="projekcija">
                      
            <div class="form-group">  
                <label for="film"><fmt:message key="film"/>:</label>
                <form:select name="film" path="film" class="form-control">              
                    <form:options items = "${filmovi}" itemLabel="naziv" itemValue="id" />
                </form:select>   
            </div>
            <div class="text-danger">
                <form:errors path="film" cssClass="error" />
            </div> 
                      
            <div class="form-group">  
                <label for="sala"><fmt:message key="sala"/>:</label>
                <form:select name="sala" path="sala" class="form-control">              
                    <form:options items = "${sale}"  itemValue="brojSale" />
                </form:select>   
            </div>
                
            <div class="form-group">
                <label for="datum"><fmt:message key="datum"/>:</label>
                <div><form:input type="date" class="form-control" id="datum" path="datum"/></div>
                <div class="text-danger">
                    <form:errors path="datum" cssClass="error" />
                </div>
            </div>

            <div class="form-group">    
                <label for="vreme"><fmt:message key="vreme"/>:</label>
                <div><form:input type="time" class="form-control" id="vreme" path="vreme" /></div>
                <div class="text-danger">
                    <form:errors path="vreme" cssClass="error" />
                </div>
            </div>
                
            <div class="text-danger">
                <form:errors path="sala" cssClass="error" />
            </div> 

                                                                                           
            <p>
            <div><button id="save" onClick="selectAll()" class="btn btn-primary"><fmt:message key="save"/></button> </div>
            </p>
        </form:form>
    </div>

</div>
