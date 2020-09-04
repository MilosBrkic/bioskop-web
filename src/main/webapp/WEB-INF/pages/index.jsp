
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>

<div class="container">
    <h3><fmt:message key="najnovije"/>:</h3>
        <div class="card-columns">       
            <c:forEach
                items="${filmovi}"
                var="film"
                end="5"
                varStatus="loop">

                <div class="card" style="width: 18rem;">
                    <img class="card-img-top" src="${film.url}" alt="Slika nedostaje">
                    <div class="card-body">
                        <h5 class="card-title"><a href="<c:url value = "/film/${film.id}/view/"></c:url>">${film.naziv}</a></h5>
                    </div>
                </div>

            </c:forEach>
        </div>
</div>