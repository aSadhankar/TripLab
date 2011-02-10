

<%@ page import="triplab.Rating" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'rating.label', default: 'Rating')}" />
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
            <g:hasErrors bean="${ratingInstance}">
            <div class="errors">
                <g:renderErrors bean="${ratingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${ratingInstance?.id}" />
                <g:hiddenField name="version" value="${ratingInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="vote"><g:message code="rating.vote.label" default="Vote" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ratingInstance, field: 'vote', 'errors')}">
                                    <%-- <g:textField name="vote" value="${fieldValue(bean: ratingInstance, field: 'vote')}" /> --%>
                                  <g:select name="vote" from="${1..10}" value="${fieldValue(bean: ratingInstance, field: 'vote')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="activity"><g:message code="rating.activity.label" default="Activity" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ratingInstance, field: 'activity', 'errors')}">
                                    <g:select name="activity.id" from="${triplab.Activity.list()}" optionKey="id" value="${ratingInstance?.activity?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="user"><g:message code="rating.user.label" default="User" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: ratingInstance, field: 'user', 'errors')}">
                                    <g:select name="user.id" from="${triplab.User.list()}" optionKey="id" value="${ratingInstance?.user?.id}"  />
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
