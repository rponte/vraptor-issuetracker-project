package br.com.triadworks.issuetracker.controller.interceptor;

import java.util.Arrays;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.triadworks.issuetracker.controller.LoginController;
import br.com.triadworks.issuetracker.controller.UsuarioWeb;

@Intercepts
public class AutenticacaoInterceptor implements Interceptor {
	
	private final UsuarioWeb usuario;
	private final Result result;
	
	public AutenticacaoInterceptor(UsuarioWeb usuario, Result result) {
		this.usuario = usuario;
		this.result = result;
	}

	@Override
	public boolean accepts(ResourceMethod method) {
		
		boolean naoEhPaginaDeLogin = !method.getMethod().getDeclaringClass().equals(LoginController.class);
		boolean usuarioNaoLogado = !usuario.isLogado();
		
		return usuarioNaoLogado && naoEhPaginaDeLogin;
	}

	@Override
	public void intercept(InterceptorStack stack, 
			ResourceMethod method, Object resourceInstance) throws InterceptionException {

		result.include("errors", Arrays.asList(new ValidationMessage("Usuário não está logado", "Login")));
		result.redirectTo(LoginController.class).login();
	}

}
