package br.com.triadworks.issuetracker.controller;

import java.util.List;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.triadworks.issuetracker.dao.IssueDao;
import br.com.triadworks.issuetracker.dao.ProjetoDao;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Issue;

@Resource
public class IssueController {
	
	private final IssueDao dao;
	private final Result result;
	private final ProjetoDao projetoDao;
	private final UsuarioDao usuarioDao;

	public IssueController(IssueDao dao, ProjetoDao projetoDao, 
			UsuarioDao usuarioDao, Result result) {
		this.dao = dao;
		this.projetoDao = projetoDao;
		this.usuarioDao = usuarioDao;
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
		dao.salva(issue);
		result.include("notice", "Issue adicionada com sucesso!");
		result.redirectTo(this).lista();
	}

	public Issue edita(Long id) {
		result.include("usuarios", usuarioDao.listaTudo());
		Issue issue = dao.carrega(id);
		return issue;
	}
	
	public void altera(Issue issue) {
		dao.atualiza(issue);
		result.include("notice", "Issue atualizada com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public void remove(Long id) {
		Issue issue = dao.carrega(id);
		dao.remove(issue);
		result.include("notice", "Issue removida com sucesso!");
		result.redirectTo(this).lista();
	}
	
}
