<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<legend>Cadastro de Projetos</legend>
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
					<th>Nome</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="projeto" items="${projetoList}">
					<tr>
						<td>${projeto.id }</td>
						<td>${projeto.nome }</td>
						<td class="nowrap">
							<a href="edita?id=${projeto.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
   							<a href="remove?id=${projeto.id }" onclick="return confirm('Deseja realmente remover esse projeto?');"><i class="icon-trash"></i> Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>