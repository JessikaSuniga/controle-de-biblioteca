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
		livro1.setTitulo("Estudar JSP");
		livro1.setAutor("Estudar JSP");
		livro1.setEditora("Estudar JSP");
		repositorio.cadastrar(livro1);
		
		Livro livro2 = new Livro();
		livro2.setTitulo("Estudar CSS");
		livro2.setAutor("Estudar CSS");
		livro2.setEditora("Estudar CSS");
		repositorio.cadastrar(livro2);
		
		Livro livro3 = new Livro();
		livro3.setTitulo("Estudar HTML");
		livro3.setAutor("Estudar HTML");
		livro3.setEditora("Estudar HTML");
		repositorio.cadastrar(livro3);
	}
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		req.setAttribute("listaLivros", repositorio.buscarTodos());
		RequestDispatcher dispatcher = req.getRequestDispatcher("/index.jsp");
		dispatcher.forward(req, resp);
		
	}

}