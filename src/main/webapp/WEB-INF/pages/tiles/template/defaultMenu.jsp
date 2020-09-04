<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top mb-2">

    <a class="navbar-brand" href="<c:url value = "/home"/>">Bioskop</a>
    <ul class="navbar-nav mr-auto d-flex justify-content-end">
       
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="sala"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<c:url value = "/sala"/>"><fmt:message key="sala.home"/></a>
          <a class="dropdown-item" href="<c:url value = "/sala/add"/>"><fmt:message key="sala.add"/></a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="distributer"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<c:url value = "/distributer"/>"><fmt:message key="distributer.home"/></a>
          <a class="dropdown-item" href="<c:url value = "/distributer/add"/>"><fmt:message key="distributer.add"/></a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="filmovi"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<c:url value = "/film"/>"><fmt:message key="film.home"/></a>
          <a class="dropdown-item" href="<c:url value = "/film/add"/>"><fmt:message key="film.add"/></a>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="projekcije"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<c:url value = "/projekcija"/>"><fmt:message key="projekcija.home"/></a>
          <a class="dropdown-item" href="<c:url value = "/projekcija/add"/>"><fmt:message key="projekcija.add"/></a>
        </div>
      </li>
      
      <sec:authorize  access="hasAuthority('ADMIN')">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle text-light" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="admin"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="<c:url value = "/register"/>"><fmt:message key="register"/></a>
        </div>
      </li>
      </sec:authorize>
            
    </ul>
    <ul class="navbar-nav ml-auto d-flex justify-content-end">
        
        <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <fmt:message key="jezik"/>
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="?lang=sr"><fmt:message key="jezik.srpski"/></a>
          <a class="dropdown-item" href="?lang=en"><fmt:message key="jezik.engleski"/></a>
        </div>
      </li>
        
        
        <li class="nav-item">
            <a class="btn btn-secondary" href="<c:url value = "/logout"/>"><fmt:message key="logout"/> <u><sec:authentication property="principal.username" /></u></a>
        <li>
    </ul>
</nav>
