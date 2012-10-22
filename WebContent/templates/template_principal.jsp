<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>

<!DOCTYPE html>
<html>
	<head>
		<%@ include file="/templates/head.jsp" %>
		<!-- head que muda! -->
		<decorator:head />
	</head>
	<body>

		<%@ include file="/templates/menu.jsp" %>
	
		<div class="wrapper">
			<div class="container">
				
				<%@ include file="/templates/messages.jsp" %>
				<!-- body que muda! -->
				<decorator:body />
				
			</div>
		</div>
		
		<%@ include file="/templates/footer.jsp" %>
		
	</body>
</html>