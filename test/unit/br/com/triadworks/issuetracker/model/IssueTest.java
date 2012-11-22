package br.com.triadworks.issuetracker.model;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.Test;

public class IssueTest {

	@Test
	public void deveriaIssueIniciarComStatusDeAberta() {
		
		Issue issue = new Issue();
		
		assertEquals("status", Status.ABERTA, issue.getStatus());
		assertFalse("status da issue", issue.isFechada());
	}
	
	@Test
	public void deveriaIssueEstarFechada() {
		
		Issue issue = new Issue();
		issue.setStatus(Status.FECHADA);
		
		assertTrue("status da issue", issue.isFechada());
	}

	@Test
	public void deveriaComentarUmaIssue() {
		
		Usuario autor = new Usuario();
		autor.setId(1L);
		autor.setLogin("rponte");
		
		Comentario comentario = new Comentario();
		comentario.setDescricao("Meu comentário");
		comentario.setAutor(autor);
		comentario.setCriadaEm(new Date());
		
		Issue issue = new Issue();
		issue.comenta(comentario);
		
		assertEquals("quantidade de comentarios", 1, issue.getComentarios().size());
	}
	
	@Test(expected=IllegalArgumentException.class)
	public void deveriaNaoComentarUmaIssueQuandoComentarioNaoPossuiAutor() {
		
		Comentario comentario = new Comentario();
		comentario.setDescricao("Meu comentário");
		comentario.setAutor(null);
		comentario.setCriadaEm(new Date());
		
		Issue issue = new Issue();
		issue.comenta(comentario);
	}
	
	@Test
	public void deveriaFecharUmaIssue() {
		
		Usuario autor = new Usuario();
		autor.setId(1L);
		autor.setLogin("rponte");
		
		Comentario comentario = new Comentario();
		comentario.setDescricao("Meu comentário");
		comentario.setAutor(autor);
		comentario.setCriadaEm(new Date());
		
		
		Issue issue = new Issue();
		issue.fecha(comentario);
		
		assertTrue("status da issue", issue.isFechada());
		assertEquals("quantidade de comentarios", 1, issue.getComentarios().size());
	}
	
}
