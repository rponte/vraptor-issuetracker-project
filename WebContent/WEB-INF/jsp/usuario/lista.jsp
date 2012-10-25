<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<legend>Cadastro de Usuários</legend>
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
					<th>Login</th>
					<th>E-mail</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="usuario" items="${usuarioList}">
					<tr>
						<td>${usuario.id }</td>
						<td>${usuario.nome }</td>
						<td>${usuario.login }</td>
						<td>${usuario.email }</td>
						<td class="nowrap">
							<a href="edita?id=${usuario.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
   							<a href="remove?id=${usuario.id }" onclick="return confirm('Deseja realmente remover esse usuário?');"><i class="icon-trash"></i> Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>