package br.com.triadworks.issuetracker.controller;

import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.triadworks.issuetracker.dao.IssueDao;
import br.com.triadworks.issuetracker.dao.ProjetoDao;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Issue;

@Resource
public class IssueController {
	
	private final IssueDao dao;
	private final Validator validator;
	private final Result result;
	private final ProjetoDao projetoDao;
	private final UsuarioDao usuarioDao;

	public IssueController(IssueDao dao, ProjetoDao projetoDao, 
			UsuarioDao usuarioDao, Validator validator, Result result) {
		this.dao = dao;
		this.projetoDao = projetoDao;
		this.usuarioDao = usuarioDao;
		this.validator = validator;
		this.result = result;
	}
	
	public List<Issue> lista() {
		List<Issue> issues = dao.listaTudo();
		return issues;
	}
	
	public void novo() {
		result.include("projetos", projetoDao.listaTudo());
		result.include("usuarios", usuarioDao.listaTudo());
	}
	
	public void adiciona(Issue issue) {
		// TODO: validar
		dao.salva(issue);
		result.redirectTo(this).lista();
	}
	
	public Issue edita(Long id) {
		result.include("projetos", projetoDao.listaTudo());
		result.include("usuarios", usuarioDao.listaTudo());
		Issue issue = dao.carrega(id);
		return issue;
	}
	
	public void altera(Issue issue) {
		// TODO: validar
		dao.atualiza(issue);
		result.redirectTo(this).lista();
	}
	
	public void remove(Long id) {
		Issue issue = dao.carrega(id);
		dao.remove(issue);
		result.redirectTo(this).lista();
	}
	
}
