

<%@ page import="triplab.Day" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'day.label', default: 'Day')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dayInstance}">
            <div class="errors">
                <g:renderErrors bean="${dayInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="trip"><g:message code="day.trip.label" default="Trip" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayInstance, field: 'trip', 'errors')}">
                                    <g:select name="trip.id" from="${triplab.Trip.list()}" optionKey="id" value="${dayInstance?.trip?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="date"><g:message code="day.date.label" default="Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayInstance, field: 'date', 'errors')}">
                                    <g:datePicker name="date" precision="day" value="${dayInstance?.date}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
