

<%@ page import="triplab.DayDistrict" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'dayDistrict.label', default: 'DayDistrict')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <%-- <h1><g:message code="default.create.label" args="[entityName]" /></h1> --%>
          
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${dayDistrictInstance}">
            <div class="errors">
                <g:renderErrors bean="${dayDistrictInstance}" as="list" />
            </div>
            </g:hasErrors>
          <h1>${dayDistrictInstance?.day?.trip}</h1>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="day"><g:message code="dayDistrict.day.label" default="Day" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayDistrictInstance, field: 'day', 'errors')}">
                                    <g:select name="day.id" from="${triplab.Day.list()}" optionKey="id" value="${dayDistrictInstance?.day?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="district"><g:message code="dayDistrict.district.label" default="District" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: dayDistrictInstance, field: 'district', 'errors')}">
                                    <g:select name="district.id" from="${triplab.District.list()}" optionKey="id" value="${dayDistrictInstance?.district?.id}"  />
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
