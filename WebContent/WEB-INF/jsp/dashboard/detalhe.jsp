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
			<div class="row">
				<div class="span1">
					<c:set var="status_class" value="${issue.fechada ? 'label-important' : 'label-success'}" />
					<span class="label ${status_class }">${issue.status }</span>
				</div>
				<div class="span8">${issue.descricao }</div>
			</div>
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
				name="comentario"></textarea>
			<div>
				<div class="pull-right">
					<button type="submit" class="btn btn-success"><i class="icon-comment icon-white"></i> Comentar</button>
					<button type="submit" class="btn btn-danger"><i class="icon-check icon-white"></i> Fechar e Comentar</button>
				</div>
			</div>
		</form>
		
	</body>
</html>