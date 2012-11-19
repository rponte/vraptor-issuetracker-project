<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
		<script type="text/javascript">
			function remove(id) {
				
				var confirmacao = confirm('Deseja realmente remover essa issue?');
				if (!confirmacao) {
					return false;
				}
				
				var ctx = "${ctx}"; // EL do JSP
				var url = ctx + "/issues/" + id;
				
				$.ajax({
					type: "DELETE",
					url: url,
					success: function(retorno) {
						
						//alert("Issue removida com sucesso!");
						//$("#issue_" + id).remove();
						
						$("#issue_" + id)
							.children().css("background-color", "yellow")
							.fadeOut(1000, function() {
								$("#issue_" + id).remove();
							});
						
					}
				});

				return false;
				
			}
		</script>
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
					<tr id="issue_${issue.id }">
						<td>${issue.id }</td>
						<td>${issue.sumario }</td>
						<td>${issue.projeto.nome }</td>
						<td>${issue.tipo }</td>
						<td>${issue.status }</td>
						<td><fmt:formatDate value="${issue.atualizadoEm }" pattern="dd/MM/yyyy hh:mm"/></td>
						<td>${issue.assinadoPara.nome }</td>
						<td class="nowrap">
							<a href="${ctx }/issues/${issue.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
							<a href="#" onclick="return remove(${issue.id});"><i class="icon-trash"></i> Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>