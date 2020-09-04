<%-- 
    Document   : view
    Created on : 14.07.2020., 20.55.14
    Author     : milos
--%>

<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<div>
    
    <c:if test="${not empty message}">
        <div class="alert alert-info" role="alert mb-2">${message}</div>
    </c:if>

    <div class="container">
        <div class="row">
            <div class="col-sm">
                <form:form action="${pageContext.request.contextPath}/projekcija/${projekcija.id}/edit" method="get" modelAttribute="projekcija">

                    <div class="form-group">
                        <label for="projekcija"><fmt:message key="projekcija"/> ID:</label>
                        <div><form:input type="text" class="form-control" id="projekcija" path="" value="${projekcija.id}" readonly="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="film"><fmt:message key="film.naziv"/>:</label>
                        <div><form:input type="text" class="form-control" id="film" path="" value="${projekcija.film.naziv}" disabled="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="sala"><fmt:message key="sala"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${projekcija.sala}" disabled="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="sala"><fmt:message key="datum"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${projekcija.datum}" disabled="true"/></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sala"><fmt:message key="vreme"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${projekcija.vreme}" disabled="true"/></div>
                    </div>
                  
                    
                    <p>
                    <button id="save" class="btn btn-primary"><fmt:message key="edit"/></button>
                    <c:set var="today" value="<%=new Date(new Date().getTime() - 60*60*24*1000)%>"/>                           
                            <c:if test="${projekcija.datum > today}">
                                <a href="<c:url value = "/karta/${projekcija.id}/sell"/>" class="btn btn-primary"><fmt:message key="sell"/></a>
                            </c:if>
                    
                    </p>
                    <p>
                    <a href="<c:url value = "/projekcija"/>"><fmt:message key="projekcija.nazad"/></a>
                    </p>

                </form:form>
            </div>
              <div class="col-sm">  
                  <br>
                <h5><fmt:message key="karta.prodate"/>:</h5>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col"><fmt:message key="karta.red"/></th>
                            <th scope="col"><fmt:message key="karta.sediste"/></th>
                            <th scope="col"><fmt:message key="karta.cena"/></th>
                            <th scope="col">Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${projekcija.karte}"
                            var="karta"
                            varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${karta.brojReda}</td>
                                <td>${karta.brojSedista}</td>
                                <td>${karta.cena}</td>
                                <td>${karta.status}</td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
