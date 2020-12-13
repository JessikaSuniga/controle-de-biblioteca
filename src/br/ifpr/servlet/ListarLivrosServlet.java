package br.ifpr.servlet;


import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.ifpr.entidade.Livro;
import br.ifpr.repositorio.ILivroRepositorio;
import br.ifpr.repositorio.LivroRepositorioMemoria;

@WebServlet("/livros/listar")

@SuppressWarnings("serial")
public class ListarLivrosServlet extends HttpServlet {
	
	ILivroRepositorio repositorio = new LivroRepositorioMemoria();
	
	public void init() throws ServletException {
		
		Livro livro1 = new Livro();
		livro1.setTitulo("Boneco de Neve");
		livro1.setAutor("Jo Nesbo");
		livro1.setEditora("Record");
		repositorio.cadastrar(livro1);
		
		Livro livro2 = new Livro();
		livro2.setTitulo("O Morro dos Ventos Uivantes");
		livro2.setAutor("Emily Bronte");
		livro2.setEditora("Pé da Letra");
		repositorio.cadastrar(livro2);
		
		Livro livro3 = new Livro();
		livro3.setTitulo("A Mulher na Janela");
		livro3.setAutor("A.J. Finn");
		livro3.setEditora("Arqueiro");
		repositorio.cadastrar(livro3);
		
		Livro livro4 = new Livro();
		livro4.setTitulo("A menina que roubava livros");
		livro4.setAutor("Markus Zusak");
		livro4.setEditora("Intrínseca");
		repositorio.cadastrar(livro4);
		
		Livro livro5 = new Livro();
		livro5.setTitulo("O homem de Giz");
		livro5.setAutor("C.J. Tudor");
		livro5.setEditora("Intrínseca");
		repositorio.cadastrar(livro5);
		
		Livro livro6 = new Livro();
		livro6.setTitulo("A pequena livraria dos sonhos");
		livro6.setAutor("Jenny Colgan");
		livro6.setEditora("Arqueiro");
		repositorio.cadastrar(livro6);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setAttribute("listaLivros", repositorio.buscarTodos());
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
		
	}

}