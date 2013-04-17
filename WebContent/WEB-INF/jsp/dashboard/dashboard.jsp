<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<!-- Meus imports -->
	</head>
	<body>
		<div class="page-header">
			<h1>Dashboard <small>do ${usuarioWeb.usuario.nome }</small></h1>
		</div>
		
		<div class="tabbable tabs-left">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab1" data-toggle="tab">Minhas Issues</a></li>
				<li><a href="#tab2" data-toggle="tab">Todas</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab1">
					<table class="table table-striped ">
						<tbody>
							<c:forEach var="issue" items="${issueList}">
								<tr>
									<td>#${issue.id }</td>
									<td>
										<strong>
											<span class="muted">${issue.projeto.nome } »</span>
											<a href="${ctx }/dashboard/issues/${issue.id }">${issue.sumario }</a>
										</strong>
										<p>
											<small>
												Aberto por <b>${issue.reportadoPor.nome }</b> em 
												<fmt:formatDate value="${issue.reportadoEm }" pattern="dd/MM/yyyy 'as' hh:mm"/>
											</small>
										</p>
									</td>
									<td>
										<c:if test="${issue.fechada}">
											<span class="label label-important">${issue.status }</span>
										</c:if>
										<c:if test="${!issue.fechada}">
											<span class="label label-success">${issue.status }</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="tab-pane" id="tab2">
					<table class="table table-striped ">
						<tbody>
							<c:forEach var="issue" items="${todasAsIssues}">
								<tr>
									<td>#${issue.id }</td>
									<td>
										<strong>
											<span class="muted">${issue.projeto.nome } »</span>
											<a href="${ctx }/dashboard/issues/${issue.id }">${issue.sumario }</a>
										</strong>
										<p>
											<small>
												Aberto por <b>${issue.reportadoPor.nome }</b> em 
												<fmt:formatDate value="${issue.reportadoEm }" pattern="dd/MM/yyyy 'as' hh:mm"/>
											</small>
										</p>
									</td>
									<td>
										<c:if test="${issue.fechada}">
											<span class="label label-important">${issue.status }</span>
										</c:if>
										<c:if test="${!issue.fechada}">
											<span class="label label-success">${issue.status }</span>
										</c:if>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		
	</body>
</html>