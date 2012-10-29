<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
		<link href="${ctx}/css/login.css" rel="stylesheet">
	</head>
	<body>
		<div class="container_">
			<%@ include file="/templates/messages.jsp" %>
			<div class="login-form">
				<form action="${ctx }/login" method="post">
					<h2>Login</h2>
					<input type="text" placeholder="Usuário">
					<input type="password" placeholder="Senha">
					<button class="btn btn-primary" type="submit">Logar</button>
				</form>
			</div>
		</div>
	</body>
</html>