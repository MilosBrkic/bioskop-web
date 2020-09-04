<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<div>

    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert mb-2">${message}</div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="alert alert-danger" role="alert mb-2">${error}</div>
    </c:if>

    <h4 class="text-center"><fmt:message key="projekcija.home"/></h4>

    <form:form class="ml-2 mb-2 form-inline" action="${pageContext.request.contextPath}/projekcija/search" method="get" modelAttribute="projekcija">
        <label for="datum"><fmt:message key="datum"/>:</label>
        <input class="form-control ml-2" type="date" name="datum">
        <p></p>
        <button id="search" class="ml-2 mr-2 btn btn-primary"><fmt:message key="pretrazi" /></button>
        <a href="${pageContext.request.contextPath}/projekcija"><fmt:message key="projekcija.home"/></a>
    </form:form>


    <div class="container-fluid">
        <table class="table table-sm">
            <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">ID</th>
                    <th scope="col"><fmt:message key="film.naziv"/></th>
                    <th scope="col"><fmt:message key="sala"/></th>
                    <th scope="col"><fmt:message key="datum"/></th>
                    <th scope="col"><fmt:message key="vreme"/></th>
                    <th scope="col"><fmt:message key="akcija"/></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach
                    items="${projekcije}"
                    var="pro"
                    varStatus="loop">
                    <tr>
                        <td>${loop.index+1}</td>
                        <td>${pro.id}</td>
                        <td>${pro.film.naziv}</td>
                        <td>${pro.sala.brojSale}</td>
                        
                        <c:set var="today" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>                           
                            <c:if test="${pro.datum > today}">
                                <td>${pro.getFormatDatum()}</td>
                                <td>${pro.vreme}</td>
                            </c:if>
                            <c:if test="${pro.datum <= today}">
                                <td><p class="text-muted">${pro.getFormatDatum()}</p></td>
                                <td><p class="text-muted">${pro.vreme}</p></td>
                            </c:if>                     
                       
                        <td>
                            <ul class="navbar-nav mr-auto d-flex justify-content-end">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        <fmt:message key="akcija"/>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="<c:url value = "/projekcija/${pro.id}/view/"></c:url>"><fmt:message key="view"/></a>
                                        <a class="dropdown-item" href="<c:url value = "/projekcija/${pro.id}/delete/"></c:url>"><fmt:message key="delete"/></a>
                                        <a class="dropdown-item" href="<c:url value = "/projekcija/${pro.id}/edit/"></c:url>"><fmt:message key="edit"/></a>
                                        <c:if test="${pro.datum > today}">
                                        <a class="dropdown-item" href="<c:url value = "/karta/${pro.id}/sell/"></c:url>"><fmt:message key="sell"/></a>
                                        </c:if>
                                        </div>
                                    </div>
                                </ul>
                            </td>
                        </tr>
                </c:forEach>


            </tbody>
        </table>
    </div>

</div>