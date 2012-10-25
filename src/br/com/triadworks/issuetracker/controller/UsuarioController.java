package br.com.triadworks.issuetracker.controller;

import java.util.List;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

@Resource
public class UsuarioController {

	private final UsuarioDao dao;
	private final Result result;

	public UsuarioController(UsuarioDao dao, Result result) {
		this.dao = dao;
		this.result = result;
	}
	
	public List<Usuario> lista() {
		return dao.listaTudo();
	}
	
	public void novo() {
		
	}
	
	public void adiciona(Usuario usuario) {
		dao.salva(usuario);
		result.include("notice", "Usuário adicionado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public Usuario edita(Long id) {
		Usuario usuario = dao.carrega(id);
		return usuario;
	}
	
	public void altera(Usuario usuario) {
		dao.atualiza(usuario);
		result.include("notice", "Usuário atualizado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public void remove(Long id) {
		Usuario usuario = dao.carrega(id);
		dao.remove(usuario);
		result.include("notice", "Usuário removido com sucesso!");
		result.redirectTo(this).lista();
	}
	
}
