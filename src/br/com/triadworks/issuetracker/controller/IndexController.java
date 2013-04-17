package br.com.triadworks.issuetracker.controller;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class IndexController {

	private final Result result;

	public IndexController(Result result) {
		this.result = result;
	}
	
	@Get("/")
	public void index() {
		result.redirectTo(LoginController.class).login();
	}
	
}
