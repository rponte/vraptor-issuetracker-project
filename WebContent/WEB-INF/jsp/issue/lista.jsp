<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<legend>Cadastro de Issues</legend>
		<form action="lista" method="get">
			<div class="pull-right">
				<a href="novo" class="btn">Novo</a>
				<button class="btn btn-primary" type="submit">Listar</button>
			</div>
		</form>
		<br /><br />
		<table class="table table-striped ">
			<thead>
				<tr>
					<th>#</th>
					<th>Sumário</th>
					<th>Projeto</th>
					<th>Tipo</th>
					<th>Status</th>
					<th>Última Autalização</th>
					<th>Assinado para</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="issue" items="${issueList}">
					<tr>
						<td>${issue.id }</td>
						<td>${issue.sumario }</td>
						<td>${issue.projeto.nome }</td>
						<td>${issue.tipo }</td>
						<td>${issue.status }</td>
						<td><fmt:formatDate value="${issue.atualizadoEm }" pattern="dd/MM/yyyy hh:mm"/></td>
						<td>${issue.assinadoPara.nome }</td>
						<td class="nowrap">
							<a href="edita?id=${issue.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
   							<a href="remove?id=${issue.id }" onclick="return confirm('Deseja realmente remover essa issue?');"><i class="icon-trash"></i> Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>