<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
	
		<legend>Cadastro de Projetos</legend>
		<form action="${ctx }/projetos" method="GET">
			<div class="pull-right">
				<a href="${ctx }/projetos/novo" class="btn">Novo</a>
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
							<a href="${ctx }/projetos/${projeto.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
							<form action="${ctx }/projetos/${projeto.id }" method="POST" class="link-excluir">
								<button class="btn btn-link" 
									type="submit" onclick="return confirm('Deseja realmente remover esse projeto?');">
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