package br.com.triadworks.issuetracker.service;

import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.*;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

public class AutenticadorImplTest {

	@Mock
	UsuarioDao usuarioDao;
	
	private Autenticador autenticador;
	
	@Before
	public void setup() {
		MockitoAnnotations.initMocks(this);
		autenticador = new AutenticadorImpl(usuarioDao);
	}
	
	@Test
	public void deveriaAutenticarUsuario() {
		
		when(usuarioDao.buscaPor("rponte", "1234")).thenReturn(new Usuario());
		
		Usuario usuario = autenticador.autentica("rponte", "1234");

		assertNotNull(usuario);
		
	}

}
