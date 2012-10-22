<%@ page pageEncoding="UTF-8"%>
<%@ include file="/templates/jstl.jsp" %>

				<!-- Error Messages -->
				<c:if test="${not empty errors }">
					<div class="alert alert-error">
						<button type="button" class="close" data-dismiss="alert">×</button>
						<h4>Erro(s):</h4>
						<ul class="clearfix">
							<c:forEach items="${errors}" var="error">
								<li><strong>${error.category}</strong> - ${error.message}</li>
							</c:forEach>
						</ul>
					</div>
				</c:if>
				<!-- Success Messages -->
				<c:if test="${not empty notice }">
					<div class="alert alert-success">
						<button type="button" class="close" data-dismiss="alert">×</button>
						${notice }
					</div>
				</c:if>