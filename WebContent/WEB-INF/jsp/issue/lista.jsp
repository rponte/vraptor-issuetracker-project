<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<legend>Cadastro de Issues</legend>
		<form action="${ctx }/issues" method="get">
			<div class="pull-right">
				<a href="${ctx }/issues/novo" class="btn">Novo</a>
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
							<a href="${ctx }/issues/${issue.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
							<form action="${ctx }/issues/${issue.id }" method="POST" class="link-excluir">
								<button class="btn btn-link" 
									type="submit" onclick="return confirm('Deseja realmente remover essa issue?');">
									<i class="icon-trash"></i> Excluir
								</button> 
								<input type="hidden" name="_method" value="DELETE">
   							</form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>