<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				$("#form").validate({
					rules: {
						"usuario.nome": {
							required: true, minlength: 3
						},
						"usuario.login": {
							required: true, minlength: 4
						},
						"usuario.email": {
							required: true, email: true
						},
						"usuario.senha": {
							required: true
						},
						"confirmacaoDeSenha": {
							equalTo: "#senha"
						}
					}
				});
			});
		</script>
	</head>
	<body>

		<form id="form"
			action="altera" 
			method="post" class="form-horizontal">
			
			<input type="hidden" name="usuario.id" value="${usuario.id }">
			
			<legend>Cadastro de Usuários</legend>
			<div class="control-group required">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input type="text" class="span4"
						name="usuario.nome" value="${usuario.nome }">
				</div>
			</div>
			<div class="control-group required">
				<label class="control-label">Login</label>
				<div class="controls">
					<input type="text" class="span2"
						name="usuario.login" readonly="readonly"
						value="${usuario.login }">
				</div>
			</div>
			<div class="control-group required">
				<label class="control-label">E-mail</label>
				<div class="controls">
					<div class="input-prepend">
						<span class="add-on"><i class="icon-envelope"></i></span>
						<input type="text" class="span3"
							name="usuario.email" value="${usuario.email }">
					</div>
				</div>
			</div>
			<legend><small>Entre com a senha e confirmação de senha</small></legend>
			<div class="control-group required ">
				<label class="control-label">Senha</label>
				<div class="controls">
					<input type="password" class="span2" name="usuario.senha" id="senha">
				</div>
			</div>
			<div class="control-group required">
				<label class="control-label">Confirma</label>
				<div class="controls">
					<input type="password" class="span2" name="confirmacaoDeSenha">
				</div>
			</div>
			<div class="form-actions">
				<div class="pull-right">
					<a href="lista" class="btn">Cancelar</a>
					<button type="submit" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</form>
		
	</body>
</html>