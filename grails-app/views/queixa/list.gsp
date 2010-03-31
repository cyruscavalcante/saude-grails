<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'queixa.label', default: 'Queixa')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
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
                        
                            <g:sortableColumn property="id" title="${message(code: 'queixa.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="tipo" title="${message(code: 'queixa.tipo.label', default: 'Tipo da queixa')}" />
                        
                            <g:sortableColumn property="nome_cidadao" title="${message(code: 'queixa.nome_cidadao.label', default: 'Cidadão responsável')}" />
                        
                            <g:sortableColumn property="data_queixa" title="${message(code: 'queixa.data_queixa.label', default: 'Data')}" />
                        
                            <g:sortableColumn property="queixa" title="${message(code: 'queixa.queixa.label', default: 'Queixa')}" />
							<th></th>
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${queixaInstanceList}" status="i" var="queixaInstance">
						<g:if test="${queixaInstance.status}">
                        	<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            	<td><g:link action="show" id="${queixaInstance.id}">${fieldValue(bean: queixaInstance, field: "id")}</g:link></td>
                        
                            	<td>${fieldValue(bean: queixaInstance, field: "tipo")}</td>
                        
                            	<td>${fieldValue(bean: queixaInstance, field: "nome_cidadao")}</td>
                        
                            	<td><g:formatDate format="dd/MM/yyyy" date="${queixaInstance.data_queixa}" /></td>
                        
                            	<td>${fieldValue(bean: queixaInstance, field: "queixa")}</td>
								<td><g:link action="fechar" id="${queixaInstance.id}">Fechar queixa</g:link></td>
                        
                        	</tr>
						</g:if>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${queixaInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
