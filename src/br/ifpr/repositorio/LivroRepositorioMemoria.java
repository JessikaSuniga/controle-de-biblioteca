package br.ifpr.repositorio;

import java.util.ArrayList;
import java.util.List;

import br.ifpr.entidade.Livro;
import br.ifpr.entidade.LivroStatus;

public class LivroRepositorioMemoria implements ILivroRepositorio {
	
	private static List<Livro> livros = new ArrayList<Livro>();


	public List<Livro> buscarTodos() {
		return livros;
	}

	public Livro buscarPorId(String id) {
		
		for(Livro livro : livros) {
			if(id.equals(livro.getId())) {
				return livro;
			}
		}
		
		throw new IllegalArgumentException("id inexistente");
	}

	@Override
		public Livro cadastrar(Livro livro) throws IllegalArgumentException {
				
				if(livro.getTitulo() == null || livro.getTitulo().isEmpty()) {
					
					throw new IllegalArgumentException("O campo Titulo não pode ser vazio!");
					
				} else if(livro.getTitulo().length()  < 2) {
					
					throw new IllegalArgumentException("O Titulo do Livro nao pode ter menos que 2 caracteres");
				
				}
				
				if(livro.getAutor() == null || livro.getAutor().isEmpty()) {
					
					throw new IllegalArgumentException("O campo Titulo não pode ser vazio!");
					
				} else if(livro.getAutor().length()  < 2) {
					
					throw new IllegalArgumentException("O Titulo do Livro nao pode ter menos que 2 caracteres");
				
				}
				
				if(livro.getEditora() == null || livro.getEditora().isEmpty()) {
					
					throw new IllegalArgumentException("O campo Editora não pode ser vazio!");
					
				} else if(livro.getEditora().length()  < 2) {
					
					throw new IllegalArgumentException("O nome da Editora nao pode ter menos que 2 caracteres");
				
				}
				
				livros.add(livro);
				
				return livro;
			}
	
		public void alterarStatus(String id, String status) throws IllegalArgumentException {
				
				Livro livro = this.buscarPorId(id);
				
				switch(status) {
					case "disponivel":
						livro.setStatus(LivroStatus.DISPONIVEL);
						break;
					
					case "emprestado":
						livro.setStatus(LivroStatus.EMPRESTADO);
						break;
						
					default:
						throw new IllegalArgumentException("Status inválido");
				}
			}


			public void excluir(String id) {
			
			for (int index = 0; index < livros.size(); index++) {
				
				Livro livro = livros.get(index);
				
				if(livro.getId().equals(id)) {
					livros.remove(index);
				}
				
			}
	

	
}



}
