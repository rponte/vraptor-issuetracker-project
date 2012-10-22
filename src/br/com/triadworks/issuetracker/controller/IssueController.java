package br.com.triadworks.issuetracker.controller;

import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
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
		
		valida(issue);
		validator.onErrorUsePageOf(this).novo();
		
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
		
		valida(issue);
		validator.onErrorUsePageOf(this).edita(null);
		
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
	
	private void valida(Issue issue) {
		if (issue.getSumario() == null
				|| issue.getSumario().length() < 3) {
			validator.add(new ValidationMessage("Campo obrigatório e precisa ter mais de 3 letras", "Sumário"));
		}
		if (issue.getDescricao() == null
				|| issue.getDescricao().isEmpty()) {
			validator.add(new ValidationMessage("Campo obrigatório", "Descrição"));
		}
		if (issue.getProjeto() == null
				|| issue.getProjeto().getId() == null) {
			validator.add(new ValidationMessage("Campo obrigatório", "Projeto"));
		}
		if (issue.getTipo() == null) {
			validator.add(new ValidationMessage("Campo obrigatório", "Tipo"));
		}
		if (issue.getReportadoEm() == null) {
			validator.add(new ValidationMessage("Campo obrigatório", "Reportado em"));
		}
		if (issue.getAssinadoPara() == null
				|| issue.getAssinadoPara().getId() == null) {
			validator.add(new ValidationMessage("Campo obrigatório", "Assinado para"));
		}
	}
	
}
