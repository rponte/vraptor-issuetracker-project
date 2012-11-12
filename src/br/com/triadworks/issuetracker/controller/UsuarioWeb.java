package br.com.triadworks.issuetracker.controller;

import java.io.Serializable;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;
import br.com.triadworks.issuetracker.model.Usuario;

@Component
@SessionScoped
public class UsuarioWeb implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private Usuario usuario;
	
	public void loga(Usuario usuario) {
		this.usuario = usuario;
	}

	public void logout() {
		this.usuario = null;
	}
	
	public boolean isLogado() {
		return this.usuario != null;
	}

	public Usuario getUsuario() {
		return usuario;
	}
	
}
