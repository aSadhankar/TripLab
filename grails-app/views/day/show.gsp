
<%@ page import="triplab.Day" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'day.label', default: 'Day')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <%-- <h1><g:message code="default.show.label" args="[entityName]" /></h1> --%>
            <h1>Day ${dayInstance.id} </h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <%-- <tr class="prop">
                            <td valign="top" class="name"><g:message code="day.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: dayInstance, field: "id")}</td>
                            
                        </tr> --%>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="day.trip.label" default="Trip" /></td>
                            
                            <td valign="top" class="value"><g:link controller="trip" action="show" id="${dayInstance?.trip?.id}">${dayInstance?.trip?.encodeAsHTML()}</g:link></td>
                            
                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="day.date.label" default="Date" /></td>
                            
                            <td valign="top" class="value"><g:formatDate date="${dayInstance?.date}" /></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>

            <%-- Day District List --%>
            <div class="list">
                <%--<table>--%>
                    <%--<thead>--%>
                        <%--<tr>--%>

                            <%-- <g:sortableColumn property="id" title="${message(code: 'dayDistrict.id.label', default: 'Id')}" /> --%>

                            <%-- <th><g:message code="dayDistrict.day.label" default="Day" /></th> --%>

                            <%--<th><g:message code="dayDistrict.district.label" default="District" /></th>--%>

                        <%--</tr>--%>
                    <%--</thead>--%>
                    <%--<tbody>--%>
                    <g:set var="dayDistrictList" value="${triplab.DayDistrict?.withCriteria { eq('day.id', dayInstance?.id) } }" />
                    <g:each in="${dayDistrictList}" status="i" var="dayDistrictInstance">
                        <%--<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">--%>

                            <%-- <td><g:link action="show" id="${dayDistrictInstance.id}">${fieldValue(bean: dayDistrictInstance, field: "id")}</g:link></td> --%>

                            <%-- <td><g:link controller="dayDistrict" action="show" id="${dayDistrictInstance.id}">${fieldValue(bean: dayDistrictInstance, field: "day")}</g:link></td> --%>
                            </br>
                            <td><g:link controller="dayDistrict" action="show" id="${dayDistrictInstance.id}">${fieldValue(bean: dayDistrictInstance, field: "district")}</g:link></td>

                            <%-- Day Activity List--%>
                            <div class="list">
                                <table>
                                    <thead>
                                        <tr>

                                            <%-- <g:sortableColumn property="id" title="${message(code: 'dayActivity.id.label', default: 'Id')}" /> --%>

                                            <th><g:message code="dayActivity.activity.label" default="Activity" /></th>

                                            <g:sortableColumn property="priority" title="${message(code: 'dayActivity.priority.label', default: 'Priority')}" />

                                            <%-- <th><g:message code="dayActivity.dayDistrict.label" default="Day District" /></th> --%>

                                            <g:sortableColumn property="rating" title="Rating" />

                                        </tr>
                                    </thead>
                                    <tbody>
                                    <g:set var="dayActivityList" value="${triplab.DayActivity?.withCriteria { eq('dayDistrict.id', dayDistrictInstance?.id) } }" />
                                    <g:each in="${dayActivityList}" status="j" var="dayActivityInstance">
                                        <g:set var="activityRating" value="${triplab.Rating?.withCriteria { eq('activity.id', dayActivityInstance?.id) } }" />
                                        <g:set var="rating" value="${0}" />
                                        <g:each in="${activityRating}" status="k" var="activityRatingInstance">
                                            <g:set var="rating" value="${rating + activityRatingInstance.vote}" />
                                        </g:each>
                                        <tr class="${(j % 2) == 0 ? 'odd' : 'even'}">

                                            <%-- <td><g:link action="show" id="${dayActivityInstance.id}">${fieldValue(bean: dayActivityInstance, field: "id")}</g:link></td> --%>

                                            <td><g:link controller="dayActivity" action="show" id="${dayActivityInstance.id}">${fieldValue(bean: dayActivityInstance, field: "activity")}</g:link></td>

                                            <td>${fieldValue(bean: dayActivityInstance, field: "priority")}</td>

                                            <%-- <td>${fieldValue(bean: dayActivityInstance, field: "dayDistrict")}</td> --%>

                                            <td>${rating}</td>

                                        </tr>
                                    </g:each>
                                    </tbody>
                                </table>
                            </div>

                            </br>


                        <%--</tr>--%>



                    </g:each>
                    <%--</tbody>--%>
                <%-- </table> --%>
            </div>

            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${dayInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
