
<%@ page import="triplab.DayActivity" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dayActivity.label', default: 'DayActivity')}" />
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'dayActivity.id.label', default: 'Id')}" />

                            <th><g:message code="dayActivity.activity.label" default="Activity" /></th>

                            <g:sortableColumn property="priority" title="${message(code: 'dayActivity.priority.label', default: 'Priority')}" />
                        
                            <th><g:message code="dayActivity.dayDistrict.label" default="Day District" /></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${dayActivityInstanceList}" status="i" var="dayActivityInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${dayActivityInstance.id}">${fieldValue(bean: dayActivityInstance, field: "id")}</g:link></td>

                            <td>${fieldValue(bean: dayActivityInstance, field: "activity")}</td>

                            <td>${fieldValue(bean: dayActivityInstance, field: "priority")}</td>
                        
                            <td>${fieldValue(bean: dayActivityInstance, field: "dayDistrict")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${dayActivityInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
