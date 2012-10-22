<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			$(function() {
				$("#form").validate({
					rules: {
						"issue.sumario": {
							required: true,
							minlength: 3
						},
						"issue.descricao": {
							required: true,
							minlength: 10,
							maxlength: 100
						},
						"issue.projeto.id": {
							required: true
						},
						"issue.tipo": {
							required: true
						},
						"issue.reportadoEm": {
							required: true
						},
						"issue.assinadoPara.id": {
							required: true
						}
					}
				});
			});
		</script>
	</head>
	<body>

		<form
			id="form"
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
			<div class="control-group required">
				<label class="control-label">Reportado em</label>
				<div class="controls">
					<fmt:formatDate var="reportadoEm" value="${issue.reportadoEm }" pattern="dd/MM/yyyy HH:mm"/>
					<input type="text" class="span2"
						name="issue.reportadoEm" readonly="readonly"
						value="${reportadoEm }">
				</div>
			</div>
			<div class="control-group required">
				<label class="control-label">Reportado por</label>
				<div class="controls">
					<input type="text" class="span4" 
						value="Rafael Ponte" readonly="readonly">
				</div>
			</div>
			<div class="control-group required">
				<label class="control-label">Assinado para</label>
				<div class="controls">
					<select class="span4" name="issue.assinadoPara.id">
						<option value="">-- Selecione um usuário --</option>
						<c:forEach var="usuario" items="${usuarios}">
							<c:choose>
								<c:when test="${usuario.id == issue.assinadoPara.id}">
									<option value="${usuario.id}" selected="selected">${usuario.nome}</option>
								</c:when>
								<c:otherwise>
									<option value="${usuario.id}">${usuario.nome}</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
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