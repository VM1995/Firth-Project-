<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="f" uri="/WEB-INF/tld/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty param.language}">
    <c:set var="locale" scope="session" value="${param.language}"/>
</c:if>
<c:if test="${empty sessionScope.locale}">
    <c:set var="locale" scope="session" value="en"/>
    <fmt:setLocale value="en"/>
</c:if>
<c:if test="${sessionScope.locale eq 'en'}">
    <fmt:setLocale value="en"/>
</c:if>
<c:if test="${sessionScope.locale eq 'ru'}">
    <fmt:setLocale value="ru"/>
</c:if>

<fmt:setBundle basename="internationalization"/>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<link rel="stylesheet" href="/css/style.css">
<script src="/js/changeLanguage.js"></script>
<script src="/js/validation.js"></script>

<link rel="stylesheet" href="/css/bootstrap.css">
<script src="/js/jquery.js"></script>
<script src="/js/vue.js"></script>

<script src="/js/multuselect.js"></script>
<link rel="stylesheet" href="/css/multiselect.css">

<link rel="stylesheet" href="/css/vue-good-table.css">
<script src="/js/vue-good-table.js"></script>

<script src="/js/pommer.js"></script>
<script src="/js/bootstrap.js"></script>