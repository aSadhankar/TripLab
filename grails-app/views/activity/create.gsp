

<%@ page import="triplab.Activity" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'activity.label', default: 'Activity')}" />
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
            <g:hasErrors bean="${activityInstance}">
            <div class="errors">
                <g:renderErrors bean="${activityInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title"><g:message code="activity.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${activityInstance?.title}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="district"><g:message code="activity.district.label" default="District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'district', 'errors')}">
                                    <g:select name="district.id" from="${triplab.District.list()}" optionKey="id" value="${activityInstance?.district?.id}"  />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user"><g:message code="activity.author.label" default="Author" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'author', 'errors')}">
                                  <g:select name="author.id" from="${activityInstance.author}" optionKey="id" value="${activityInstance?.author?.id} />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category"><g:message code="activity.category.label" default="Category" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'category', 'errors')}">
                                    <%-- <g:textField name="category" value="${activityInstance?.category}" /> --%>
                                  <g:select name="category" from="${['Accommodations', 'Business', 'Food', 'Event', 'Sightseeing', 'Transport']}" noSelection="['':'']" value="${fieldValue(bean: activityInstance, field: 'category')}/>
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="url"><g:message code="activity.url.label" default="URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'url', 'errors')}">
                                    <g:textField name="url" value="${activityInstance?.url}" />
                                </td>
                            </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description"><g:message code="activity.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: activityInstance, field: 'description', 'errors')}">
                                    <g:textField name="description" value="${activityInstance?.description}" />
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
