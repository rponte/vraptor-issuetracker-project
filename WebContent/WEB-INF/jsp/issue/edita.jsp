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
				<div class="alert alert-success">
					<strong>Success!</strong> Best check yo self, you're not looking too good.
				</div>
				<form
					action="altera" 
					method="post" class="form-horizontal">
					
					<input type="hidden" name="issue.id" value="${issue.id }">
					
					<legend>Cadastro de Issues</legend>
					<div class="control-group required">
						<label class="control-label">Sumário</label>
						<div class="controls">
							<input type="text" class="span7"
								name="issue.sumario" value="${issue.sumario }">
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Descrição</label>
						<div class="controls">
							<textarea rows="4" class="span7"
								name="issue.descricao">${issue.descricao }</textarea>
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Projeto</label>
						<div class="controls">
							<select class="span4" disabled="disabled">
								<option value="${issue.projeto.id}">${issue.projeto.nome}</option>
							</select>
							<input type="hidden" name="issue.projeto.id" value="${issue.projeto.id }">
						</div>
					</div>
					<div class="control-group required">
						<label class="control-label">Tipo</label>
						<div class="controls">
							<label class="radio">
								<input type="radio" name="issue.tipo" disabled="disabled"
									value="BUG" ${issue.tipo == 'BUG' ? 'checked' : '' }>
								Bug
							</label>
							<label class="radio">
								<input type="radio" name="issue.tipo" disabled="disabled"
									value="FEATURE" ${issue.tipo == 'FEATURE' ? 'checked' : '' }>
								Feature
							</label>
							<input type="hidden" name="issue.tipo" value="${issue.tipo }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Reportado em</label>
						<div class="controls">
							<fmt:formatDate var="reportadoEm" value="${issue.reportadoEm }" type="both"/>
							<input type="text" class="span2"
								name="issue.reportadoEm" readonly="readonly"
								value="${reportadoEm }">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Reportado por</label>
						<div class="controls">
							<input type="text" class="span4" 
								value="Rafael Ponte" readonly="readonly">
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Assinado para</label>
						<div class="controls">
							<select class="span4" disabled="disabled">
								<option value="${issue.assinadoPara.id}">${issue.assinadoPara.nome}</option>
							</select>
							<input type="hidden" name="issue.assinadoPara.id" value="${issue.assinadoPara.id }">
						</div>
					</div>
					<div class="form-actions">
						<div class="pull-right">
							<a href="lista" class="btn">Cancelar</a>
							<button type="submit" class="btn btn-primary">Salvar</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		
		<footer>
			<div class="container">
				<p><a href="${ctx}">Issue Tracker</a> - Registrando Bugs e Features para toda a vida.</p>
			</div>
		</footer>
		
	</body>
</html>