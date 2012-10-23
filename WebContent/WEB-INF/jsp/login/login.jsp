<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
		<link href="${ctx}/css/login.css" rel="stylesheet">
	</head>
	<body>
		<div class="wrapper">
			<div class="container">
				<%@ include file="/templates/messages.jsp" %>
				<div class="content">
					<div class="row">
						<div class="login-form">
							<h2>Login</h2>
							<form action="${ctx }/login" method="post">
								<fieldset>
									<div class="clearfix">
										<input type="text" placeholder="Usuário"
											name="login">
									</div>
									<div class="clearfix">
										<input type="password" placeholder="Senha"
											name="senha">
									</div>
									<button class="btn btn-primary" type="submit">Logar</button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div> <!-- /container -->
		</div>
	</body>
</html>