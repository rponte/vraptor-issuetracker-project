<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(document).ready(function() {
				
 				$(".link-exclusao").click(function() {
					var confirmacao = confirm('Deseja realmente remover esse usuário?');
					if (!confirmacao) {
						return false;
					}
				
					var link = $(this);
					var uri = link.attr("href");
					
					$.ajax({
						type: "DELETE", // tanto faz pois nao é REST
						url: uri,
						success: function(retorno) {
							var tr = link.parents("tr");
							tr.children()
								.css("background-color", "yellow")
								.fadeOut(1000, function(){
									tr.remove();
								});
						}
					});
					
					return false; // nao pode esquecer! 
 				});
			});
		</script>
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
   							<a class="link-exclusao" href="remove?id=${usuario.id }"><i class="icon-trash"></i> Excluir</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		
	</body>
</html>