<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				$("#form").validate({
					rules: {
						"projeto.nome": {
							required: true, minlength: 3
						}
					}
				});
			});
		</script>
	</head>
	<body>

		<form id="form"
			action="${ctx }/projetos" 
			method="post" class="form-horizontal">
			<legend>Cadastro de Projetos</legend>
			<div class="control-group required">
				<label class="control-label">Nome</label>
				<div class="controls">
					<input type="text" class="span7"
						name="projeto.nome">
				</div>
			</div>
			<div class="form-actions">
				<div class="pull-right">
					<a href="${ctx }/projetos" class="btn">Cancelar</a>
					<button type="submit" class="btn btn-primary">Salvar</button>
				</div>
			</div>
		</form>
		
	</body>
</html>