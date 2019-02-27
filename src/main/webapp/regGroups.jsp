<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <%@ include file="parts/head.jsp" %>
    <title>Create group</title>

    <script src="/js/onePageEditor.js"></script>
    <script src="/js/jquery.redirect.js"></script>

</head>
<body>

<fmt:message key="catalog.tts" var="headerTitle"/>
<fmt:message key="catalog.description" var="headerDesc"/>
<%@ include file="parts/header.jsp" %>

<main role="main" class="container">
    <div class="row">
        <div class="col-md-3"></div>
        <form method="post" class="col-md-6" onsubmit="return onSubmitCreateGroup()">
            <c:if test="${requestScope.error != null}">
                <div style="color:red;">${requestScope.error}</div>
            </c:if>
            <c:if test="${requestScope.needUniver}">
                <div class="form-group">
                    <label for="univer"><fmt:message key="stat.university"/>:</label>
                    <select name="univer" id="univer" class="form-control">
                        <option value=""></option>
                        <c:forEach items="${requestScope.universities}" var="un">
                            <option value="${un.getId()}">${un.getName()}</option>
                        </c:forEach>
                    </select>
                    <small id="univerMessage" class="form-text"></small>
                </div>
            </c:if>

            <div class="form-group">
                <label for="fac"><fmt:message key="stat.faculty"/>:</label>
                <input name="fac" id="fac" placeholder="<fmt:message key="reg.enterfaculty"/>" class="form-control">
                <small id="facMessage" class="form-text"></small>
            </div>

            <div class="form-group">
                <label for="dep"><fmt:message key="stat.department"/>:</label>
                <input name="dep" id="dep" placeholder="<fmt:message key="reg.enterdepartment"/>" class="form-control">
                <small id="depMessage" class="form-text"></small>
            </div>

            <div class="form-group">
                <label for="group"><fmt:message key="stat.group"/>:</label>
                <input name="group" id="group" placeholder="<fmt:message key="reg.entergroup"/>" class="form-control">
                <small id="groupMessage" class="form-text"></small>
            </div>

            <button type="submit" class="btn btn-primary"><fmt:message key="registration.register"/></button>
        </form>
        <div class="col-md-3"></div>
    </div>
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <ul class="list-group list-group-flush">
                <c:if test="${!requestScope.needUniver}">
                    <c:forEach items="${requestScope.faculties}" var="q">
                        <li class="list-group-item">
                                ${q.name}
                            <ul class="list-group list-group-flush">
                                <c:forEach items="${q.getDepartments()}" var="qd">
                                    <li class="list-group-item">
                                            ${qd.name}
                                        <ul class="list-group list-group-flush">
                                            <c:forEach items="${qd.getGroups()}" var="qdg">
                                                <li class="list-group-item">${qdg.name}</li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </c:if>
                <c:if test="${requestScope.needUniver}">
                    <c:forEach items="${requestScope.universities}" var="un">
                        <li class="list-group-item">
                                ${un.name}
                            <ul class="list-group list-group-flush">
                                <c:forEach items="${un.getFaculties()}" var="q">
                                    <li class="list-group-item">
                                            ${q.name}
                                        <ul class="list-group list-group-flush">
                                            <c:forEach items="${q.getDepartments()}" var="qd">
                                                <li class="list-group-item">
                                                        ${qd.name}
                                                    <ul class="list-group list-group-flush">
                                                        <c:forEach items="${qd.getGroups()}" var="qdg">
                                                            <li class="list-group-item">${qdg.name}</li>
                                                        </c:forEach>
                                                    </ul>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
        <div class="col-md-3"></div>
    </div>
</main>

<%@ include file="parts/footer.jsp" %>

</body>
</html>
