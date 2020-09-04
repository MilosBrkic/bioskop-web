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
        <div class="row">
            <div class="col-sm">
                <form:form action="${pageContext.request.contextPath}/karta/save" method="post" modelAttribute="karta">

                    <div class="form-group">
                        <label for="projekcija"><fmt:message key="projekcija"/> ID:</label>
                        <div><form:input type="number" class="form-control" id="projekcija" path="projekcija" value="${karta.projekcija.id}" readonly="true"/></div>
                        <div class="text-danger">
                            <form:errors path="projekcija" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="film"><fmt:message key="film.naziv"/>:</label>
                        <div><form:input type="text" class="form-control" id="film" path="" value="${karta.projekcija.film.naziv}" disabled="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="sala"><fmt:message key="sala"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${karta.projekcija.sala}" disabled="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="sala"><fmt:message key="datum"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${karta.projekcija.datum}" disabled="true"/></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="sala"><fmt:message key="vreme"/>:</label>
                        <div><form:input type="text" class="form-control" id="sala" path="" value="${karta.projekcija.vreme}" disabled="true"/></div>
                    </div>

                    <div class="form-group">
                        <label for="broj"><fmt:message key="karta.red"/>:</label>
                        <div><form:input type="number" class="form-control" id="broj" path="brojReda" required="true" max="9999"/></div>
                        <div class="text-danger">
                            <form:errors path="brojReda" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">    
                        <label for="sedista"><fmt:message key="karta.sediste"/>:</label>
                        <div><form:input type="number" class="form-control" id="sedista" path="brojSedista" required="true" max="9999"/></div>
                        <div class="text-danger">
                            <form:errors path="brojSedista" cssClass="error" />
                        </div>
                    </div>

                    <div class="form-group">    
                        <label for="cena"><fmt:message key="karta.cena"/>:</label>
                        <div><form:input type="number" class="form-control" id="cena" path="cena" step="any" required="true" max="9999999"/></div>
                        <div class="text-danger">
                            <form:errors path="cena" cssClass="error" />
                        </div>
                    </div>    

                    
                    <p>
                    <div><button id="save" class="btn btn-primary"><fmt:message key="sell"/></button> </div>
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
                            <th scope="col"><fmt:message key="akcija"/></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach
                            items="${karta.projekcija.karte}"
                            var="karta"
                            varStatus="loop">
                            <tr>
                                <td>${loop.index+1}</td>
                                <td>${karta.brojReda}</td>
                                <td>${karta.brojSedista}</td>
                                <td>${karta.cena}</td>
                                <td>${karta.status}</td>
                                <td><a class="btn btn-danger" href="<c:url value = "/karta/${karta.id}/delete/"></c:url>"><fmt:message key="delete" /></a></td>
                            </tr>
                        </c:forEach>


                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
