package br.com.triadworks.issuetracker.controller;

import java.util.List;

import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.com.caelum.vraptor.view.Results;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

@Resource
public class UsuarioController {

	private final UsuarioDao dao;
	private final Result result;
	private final Validator validator;

	public UsuarioController(UsuarioDao dao, Result result, Validator validator) {
		this.dao = dao;
		this.result = result;
		this.validator = validator;
	}
	
	public List<Usuario> lista() {
		return dao.listaTudo();
	}
	
	public void novo() {
	}
	
	public void adiciona(Usuario usuario, String confirmacaoDeSenha) {
		
		valida(usuario, confirmacaoDeSenha);
		validator.onErrorUsePageOf(this).novo();
		
		dao.salva(usuario);
		result.include("notice", "Usuário adicionado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	public Usuario edita(Long id) {
		Usuario usuario = dao.carrega(id);
		return usuario;
	}
	
	public void altera(Usuario usuario, String confirmacaoDeSenha) {
		
		valida(usuario, confirmacaoDeSenha);
		validator.onErrorUsePageOf(this).edita(usuario.getId());
		
		dao.atualiza(usuario);
		result.include("notice", "Usuário atualizado com sucesso!");
		result.redirectTo(this).lista();
	}
	
	/**
	 * Removendo usuário SEM Ajax
	 */
//	public void remove(Long id) {
//		Usuario usuario = dao.carrega(id);
//		dao.remove(usuario);
//		result.include("notice", "Usuário removido com sucesso!");
//		result.redirectTo(this).lista();
//	}
	/**
	 * Removendo usuário COM Ajax
	 */
	public void remove(Long id) {
		Usuario usuario = dao.carrega(id);
		dao.remove(usuario);
		result.use(Results.json())
			.withoutRoot().from(usuario)
//			.from(usuario, "usuario")
			.exclude("senha")
			.serialize();
	}
	
	private void valida(Usuario usuario, String confirmacaoDeSenha) {
		if (usuario.getNome() == null
				|| usuario.getLogin().length() < 3) {
			validator.add(new ValidationMessage("Campo obrigatório e precisa ter mais de 3 letras", "Nome"));
		}
		if (usuario.getLogin() == null
				|| usuario.getLogin().length() < 4) {
			validator.add(new ValidationMessage("Campo obrigatório e precisa ter mais de 4 letras", "Login"));
		}
		if (usuario.getEmail() == null
				|| usuario.getEmail().isEmpty()) {
			validator.add(new ValidationMessage("Campo obrigatório", "E-mail"));
		} else {
			if (!usuario.getEmail().contains("@")) {
				validator.add(new ValidationMessage("Endereço eletrônico inválido", "E-mail"));
			}
		}
		if (usuario.getSenha() == null
				|| usuario.getSenha().isEmpty()) {
			validator.add(new ValidationMessage("Campo obrigatório", "Senha"));
		} else {
			if (!usuario.getSenha().equals(confirmacaoDeSenha)) {
				validator.add(new ValidationMessage("Confirmação de senha não confere com senha", "Confirmação de senha"));
			}
		}
	}
	
}
