package br.ifpr.entidade;

import java.util.Date;
import java.util.UUID;

/**
 * @author jessikaSuniga
 *
 */
public class Livro {
	
	
	private String id;
	private String titulo;
	private String autor;
	private String editora;
	private Date dataCriacao;
	private LivroStatus status;
	
	public Livro() {
		this.id = UUID.randomUUID().toString();
		this.dataCriacao = new Date();
		this.status = LivroStatus.DISPONIVEL;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	
	public String getAutor() {
		return autor;
	}

	public void setAutor(String autor) {
		this.autor = autor;
	}
	
	public String getEditora() {
		return editora;
	}


	public void setEditora(String editora) {
		this.editora = editora;
	}


	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public LivroStatus getStatus() {
		return status;
	}
	public void setStatus(LivroStatus status) {
		this.status = status;
	}
	
	

}
