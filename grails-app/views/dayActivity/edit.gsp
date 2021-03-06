

<%@ page import="triplab.DayActivity" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dayActivity.label', default: 'DayActivity')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dayActivityInstance}">
            <div class="errors">
                <g:renderErrors bean="${dayActivityInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${dayActivityInstance?.id}" />
                <g:hiddenField name="version" value="${dayActivityInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dayDistrict"><g:message code="dayActivity.dayDistrict.label" default="Day District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayActivityInstance, field: 'dayDistrict', 'errors')}">
                                    <g:select name="dayDistrict.id" from="${triplab.DayDistrict.list()}" optionKey="id" value="${dayActivityInstance?.dayDistrict?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="activity"><g:message code="dayActivity.activity.label" default="Activity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayActivityInstance, field: 'activity', 'errors')}">
                                    <g:select name="activity.id" from="${triplab.Activity.list()}" optionKey="id" value="${dayActivityInstance?.activity?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="priority"><g:message code="dayActivity.priority.label" default="Priority" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayActivityInstance, field: 'priority', 'errors')}">
                                    <%-- <g:textField name="priority" value="${fieldValue(bean: dayActivityInstance, field: 'priority')}" /> --%>
                                    <g:select name="priority" from="${1..10}" value="${fieldValue(bean: dayActivityInstance, field: 'priority')}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
