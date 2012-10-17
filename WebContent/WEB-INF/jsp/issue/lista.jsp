<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="ctx">${pageContext.request.contextPath}</c:set>

<!DOCTYPE html>
<html>
	<head>
		<title>Issue Tracker</title>
		<!-- Bootstrap -->
		<link href="${ctx}/css/bootstrap.css" rel="stylesheet">
		<link href="${ctx}/css/bootstrap-responsive.css" rel="stylesheet">
		<link href="${ctx}/css/issuetracker.css" rel="stylesheet">
		<script src="${ctx}/js/jquery-1.8.2.js"></script>
		<script src="${ctx}/js/bootstrap.js" ></script>
	</head>
	<body>

		<div class="navbar navbar-inverse navbar-fixed-top">
			<div class="navbar-inner">
				<div class="container-fluid">
					<a class="brand" href="#">Issue Tracker</a>
					<div class="nav-collapse collapse">
						<ul class="nav">
							<li class="active"><a href="${ctx}/dashboard/lista">Dashboard</a></li>
							<li><a href="${ctx}/projeto/lista">Projetos</a></li>
							<li><a href="${ctx}/usuario/lista">Usuários</a></li>
							<li><a href="${ctx}/issue/lista">Issues</a></li>
						</ul>
						<ul class="nav pull-right">
	                      <li><a href="#"><span class="badge badge-success">Rafael Ponte</span></a></li>
	                      <li class="divider-vertical"></li>
	                      <li><a href="#">Sair</a></li>
	                    </ul>
					</div>
				</div>
			</div>
		</div>
	
		<div class="wrapper">
			<div class="container">
				<div class="alert alert-error">
					<strong>Warning!</strong> Best check yo self, you're not looking too good.
				</div>
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
								<td><fmt:formatDate value="${issue.atualizadoEm }" type="both"/></td>
								<td>${issue.assinadoPara.nome }</td>
								<td class="nowrap">
									<a href="edita?id=${issue.id }"><i class="icon-pencil"></i> Editar</a> &nbsp;
	    							<a href="#"><i class="icon-trash"></i> Excluir</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		
		<footer>
			<div class="container">
				<p><a href="${ctx}">Issue Tracker</a> - Registrando Bugs e Features para toda a vida.</p>
			</div>
		</footer>
		
	</body>
</html>