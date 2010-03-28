

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'queixa.label', default: 'Queixa')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${queixaInstance}">
            <div class="errors">
                <g:renderErrors bean="${queixaInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="tipo"><g:message code="queixa.tipo.label" default="Tipo" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: queixaInstance, field: 'tipo', 'errors')}">
                                    <g:select name="tipo" from="${queixaInstance.constraints.tipo.inList}" value="${queixaInstance?.tipo}" valueMessagePrefix="queixa.tipo"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="nome_cidadao"><g:message code="queixa.nome_cidadao.label" default="Nomecidadao" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: queixaInstance, field: 'nome_cidadao', 'errors')}">
                                    <g:textField name="nome_cidadao" maxlength="100" value="${queixaInstance?.nome_cidadao}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="data_queixa"><g:message code="queixa.data_queixa.label" default="Dataqueixa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: queixaInstance, field: 'data_queixa', 'errors')}">
                                    <g:datePicker name="data_queixa" precision="day" value="${queixaInstance?.data_queixa}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="status"><g:message code="queixa.status.label" default="Status" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: queixaInstance, field: 'status', 'errors')}">
                                    <g:select name="status" from="${queixaInstance.constraints.status.inList}" value="${fieldValue(bean: queixaInstance, field: 'status')}" valueMessagePrefix="queixa.status"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="queixa"><g:message code="queixa.queixa.label" default="Queixa" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: queixaInstance, field: 'queixa', 'errors')}">
                                    <g:textArea name="queixa" cols="40" rows="5" value="${queixaInstance?.queixa}" />
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
