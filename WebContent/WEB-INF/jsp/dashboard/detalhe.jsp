<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
		<script type="text/javascript">
			$(function(){
				
				$("#form").validate({
					onkeyup: false,
					rules: {
						"comentario.descricao": {
							required: true
						}
					},
				});
				
				$("#btn_fecha").click(function(){
					var action = $("#form").attr("action");
					var novaAction = action.replace("comenta", "fecha");
					$("#form").attr("action", novaAction);
				});
				
			});
		</script>
	</head>
	<body>
	
		<a href="${ctx}/dashboard"><i class="icon-arrow-left"></i> Voltar ao Dashboard</a>
	
		<h2>
				#${issue.id } &nbsp; ${issue.sumario}
		</h2>
		<p>
			<div class="row">
				<div class="span1">
					<c:set var="status_class" value="${issue.fechada ? 'label-important' : 'label-success'}" />
					<span class="label ${status_class }">${issue.status }</span>
				</div>
				<div class="span8 lead">${issue.descricao }</div>
			</div>
		</p>
		
		<hr />
		
		<c:forEach var="comentario" items="${issue.comentarios }">
			<div class="media span9">
				<a class="pull-left" href="#">
			      <i class="icon-comment"></i>
			    </a>
				<div class="media-body">
					<h4 class="media-heading">${comentario.autor.nome} 
						<small> » <fmt:formatDate value="${comentario.criadaEm }" pattern="dd/MM/yyyy',' HH:mm "/></small>
					</h4>
					${comentario.descricao }
					<hr />
				</div>
			</div>
		</c:forEach>
		
		<c:set var="disabled" value="${issue.fechada ? 'disabled' : ''}" />
		
		<form id="form" action="${ctx }/dashboard/issues/${issue.id}/comenta" method="post">
			<div class="control-group required">
				<label class="control-label">Comente nesta issue</label>
				<div class="controls">
					<textarea rows="4" class="span9_" style="width: 99%;"
						name="comentario.descricao" ${disabled }></textarea>
				</div>
			</div>
			<div class="pull-right">
				<button id="btn_comenta" type="submit" 
					class="btn btn-success" ${disabled }><i class="icon-comment icon-white"></i> Comentar</button>
				<button id="btn_fecha" type="submit" 
					class="btn btn-danger" ${disabled }><i class="icon-check icon-white"></i> Fechar e Comentar</button>
			</div>
		</form>
		
	</body>
</html>