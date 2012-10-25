<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
		<div class="page-header">
			<h1>Dashboard <small>do ${usuarioWeb.usuario.nome }</small></h1>
		</div>
		
		<table class="table table-striped ">
			<thead>
				<tr>
					<th>#</th>
					<th>Sumário</th>
					<th>Projeto</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Última Autalização</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="issue" items="${issueList}">
					<tr>
						<td><a href="${ctx }/dashboard/issues/${issue.id }"><fmt:formatNumber pattern="0000" value="${issue.id }" /></a></td>
						<td><a href="${ctx }/dashboard/issues/${issue.id }">${issue.sumario }</a></td>
						<td>${issue.projeto.nome }</td>
						<td>${issue.tipo }</td>
						<td>
							<c:if test="${issue.fechada}">
								<span class="label label-important">${issue.status }</span>
							</c:if>
							<c:if test="${!issue.fechada}">
								<span class="label label-success">${issue.status }</span>
							</c:if>
						</td>
						<td class="nowrap"><fmt:formatDate value="${issue.atualizadoEm }" pattern="dd/MM/yyyy hh:mm"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>