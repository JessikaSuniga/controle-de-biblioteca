package br.ifpr.repositorio;

import java.util.List;
import br.ifpr.entidade.Livro;

public interface ILivroRepositorio {
	
	public List<Livro> buscarTodos();
	
	public Livro buscarPorId(String id);
	
	public Livro cadastrar(Livro tarefa);
	
	public void alterarStatus(String id, String status) throws IllegalArgumentException;

	public void excluir(String id);
}
