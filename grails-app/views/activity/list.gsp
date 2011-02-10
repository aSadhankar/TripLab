
<%@ page import="triplab.Activity" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <%-- <g:sortableColumn property="id" title="${message(code: 'activity.id.label', default: 'Id')}" /> --%>
                        
                            <g:sortableColumn property="title" title="${message(code: 'activity.title.label', default: 'Title')}" />

                            <th><g:message code="activity.district.label" default="District" /></th>

                            <th><g:message code="activity.author.label" default="Author" /></th>
                        
                            <g:sortableColumn property="category" title="${message(code: 'activity.category.label', default: 'Category')}" />

                            <g:sortableColumn property="url" title="${message(code: 'activity.url.label', default: 'URL')}" />

                            <g:sortableColumn property="description" title="${message(code: 'activity.description.label', default: 'Description')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${activityInstanceList}" status="i" var="activityInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <%-- <td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "id")}</g:link></td> --%>
                        
                            <td><g:link action="show" id="${activityInstance.id}">${fieldValue(bean: activityInstance, field: "title")}</g:link></td>

                            <td>${fieldValue(bean: activityInstance, field: "district")}</td>

                            <td>${fieldValue(bean: activityInstance, field: "author")}</td>
                        
                            <td>${fieldValue(bean: activityInstance, field: "category")}</td>

                            <td><a href="${activityInstance?.url}" target="_blank">link</a></td>

                            <td>${fieldValue(bean: activityInstance, field: "description")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${activityInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
