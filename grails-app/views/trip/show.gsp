
<%@ page import="triplab.Trip" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'trip.label', default: 'Trip')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" />: ${tripInstance.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <%-- <tr class="prop">
                            <td valign="top" class="name"><g:message code="trip.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tripInstance, field: "id")}</td>
                            
                        </tr> --%>
                    
                        <%-- <tr class="prop">
                            <td valign="top" class="name"><g:message code="trip.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: tripInstance, field: "name")}</td>
                            
                        </tr> --%>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="trip.startDate.label" default="Start Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${tripInstance?.startDate}" /></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="trip.endDate.label" default="End Date" /></td>

                            <td valign="top" class="value"><g:formatDate date="${tripInstance?.endDate}" /></td>

                        </tr>

                    </tbody>
                </table>
            </div>

            <%-- Day List --%>
                        <div class="list">
                <table>
                    <thead>
                        <tr>

                            <%-- <g:sortableColumn property="id" title="${message(code: 'day.id.label', default: 'Id')}" /> --%>

                            <%-- <th><g:message code="day.trip.label" default="Trip" /></th> --%>

                            <g:sortableColumn property="date" title="${message(code: 'day.date.label', default: 'Day')}" />

                        </tr>
                    </thead>
                    <tbody>
                    <g:set var="dayList" value="${triplab.Day?.withCriteria { eq('trip.id', tripInstance?.id) } }" />
                    <g:each in="${dayList}" status="i" var="dayInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">

                            <%-- <td><g:link action="show" id="${dayInstance.id}">${fieldValue(bean: dayInstance, field: "id")}</g:link></td> --%>

                            <%-- <td>${fieldValue(bean: dayInstance, field: "trip")}</td> --%>

                            <td><g:link controller="day" action="show" id="${dayInstance.id}"><g:formatDate date="${dayInstance.date}" /></g:link></td>

                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${tripInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
