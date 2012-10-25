<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<a href="${ctx}/dashboard"><i class="icon-arrow-left"></i> Voltar ao Dashboard</a>
	
		<h2>
				#${issue.id } &nbsp; ${issue.sumario}
		</h2>
		
		<p>
			<dl class="dl-horizontal">
				<dt>
					<c:if test="${issue.fechada}">
						<span class="label label-important">${issue.status }</span>
					</c:if>
					<c:if test="${!issue.fechada}">
						<span class="label label-success">${issue.status }</span>
					</c:if>
				</dt>
				<dd>${issue.descricao }</dd>
			</dl>
		</p>
		
		<hr />
		
		<c:forEach var="comentario" items="${issue.comentarios }">
			<blockquote>
				<p>${comentario.descricao }</p>
				<small>${comentario.autor.nome} comentou em 
					<fmt:formatDate value="${comentario.criadaEm }" pattern="dd/MM/yyyy 'as' HH:mm"/>
				</small>
			</blockquote>
		</c:forEach>
		
		<form action="comenta">
			<label>Comente nesta issue</label>
			<textarea rows="4" class="span9_" style="width: 99%;"
				name="issue.descricao"></textarea>
			<div>
				<div class="pull-right">
					<button type="submit" class="btn btn-success">Comentar</button>
					<button type="submit" class="btn btn-danger">Fechar e Comentar</button>
				</div>
			</div>
		</form>
		
	</body>
</html>