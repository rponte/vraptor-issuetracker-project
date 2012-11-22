package br.com.triadworks.issuetracker.dao.impl;

import static org.junit.Assert.*;

import java.net.URL;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import base.DatabaseHelper;
import br.com.triadworks.issuetracker.dao.UsuarioDao;
import br.com.triadworks.issuetracker.model.Usuario;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {
		"file:./WebContent/WEB-INF/config/spring/applicationContext.xml",
		"file:./WebContent/WEB-INF/config/spring/applicationContext-persistence.xml",
		"classpath:applicationContext-test.xml"
		})
@Transactional
public class UsuarioDaoImplTest {
	
	private static final URL DATASET = UsuarioDaoImplTest.class.getResource("UsuarioDaoImplTest.xml");
	
	@Autowired
	UsuarioDao usuarioDao;
	
	@Autowired
	DatabaseHelper databaseHelper;
	
	@Before
	public void setup() {
		databaseHelper.cleanAndInsert(DATASET);
	}

	@Test
	public void deveriaListarTodosOsUsuarios() {
		
		List<Usuario> usuarios = usuarioDao.listaTudo();
		
		assertEquals("quantidade de usuarios", 1, usuarios.size());
	}
	
	@Test
	public void deveriaCarregarUsuarioPorId() {
		
		Usuario usuario = usuarioDao.carrega(1L);
		
		assertEquals("login", "rponte", usuario.getLogin());
	}
	
	@Test
	public void inserirNovoUsuario() {
		
		Usuario usuario = new Usuario();
		usuario.setLogin("jose");
		usuario.setNome("José Carlos");
		usuario.setEmail("jose@carlos");
		usuario.setSenha("secreta");
		
		usuarioDao.salva(usuario);
		
		List<Usuario> usuarios = usuarioDao.listaTudo();
		assertEquals("quantidade de usuarios", 2, usuarios.size());
	}

}
