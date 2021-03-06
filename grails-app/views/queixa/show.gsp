<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'queixa.label', default: 'Queixa')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: queixaInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.tipo.label" default="Tipo de queixa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: queixaInstance, field: "tipo")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.nome_cidadao.label" default="Cidadão responsável" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: queixaInstance, field: "nome_cidadao")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.data_queixa.label" default="Data da queixa" /></td>
                            
                            <td valign="top" class="value"><g:formatDate format="dd/MM/yyyy" date="${queixaInstance?.data_queixa}" /></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.status.label" default="Status" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: queixaInstance, field: "status") ? "Aberto" : "Fechado"}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="queixa.queixa.label" default="Queixa" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: queixaInstance, field: "queixa")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${queixaInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
