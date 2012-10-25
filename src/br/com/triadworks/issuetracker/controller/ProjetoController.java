package br.com.triadworks.issuetracker.controller;

import java.util.List;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.triadworks.issuetracker.dao.ProjetoDao;
import br.com.triadworks.issuetracker.model.Projeto;

@Resource
public class ProjetoController {

	private final ProjetoDao dao;
	private final Result result;

	public ProjetoController(ProjetoDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	public List<Projeto> lista() {
		return dao.listaTudo();
	}
	
	public void novo() {
		
	}
	
	public void adiciona(Projeto projeto) {
		dao.salva(projeto);
		result.include("notice", "Projeto adicionado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public Projeto edita(Long id) {
		Projeto projeto = dao.carrega(id);
		return projeto;
	}
	
	public void altera(Projeto projeto) {
		dao.atualiza(projeto);
		result.include("notice", "Projeto atualizado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public void remove(Long id) {
		Projeto projeto = dao.carrega(id);
		dao.remove(projeto);
		result.include("notice", "Projeto removido com sucesso!");
		result.redirectTo(this).lista();
	}
	
}
