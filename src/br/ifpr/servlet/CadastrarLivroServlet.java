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


@WebServlet("/livros/cadastrar")
public class CadastrarLivroServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	
	ILivroRepositorio repositorio = new LivroRepositorioMemoria();
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String tituloLivro = req.getParameter("inputTituloLivro");
		String nomeAutor = req.getParameter("inputNomeAutor");
		String nomeEditora = req.getParameter("inputNomeEditora");
		
		Livro livro = new Livro();
		livro.setTitulo(tituloLivro);
		livro.setAutor(nomeAutor);
		livro.setEditora(nomeEditora);
		
		try {
			repositorio.cadastrar(livro);
			resp.sendRedirect("/CadastroLivros");
			
		} catch(IllegalArgumentException e) {
			req.setAttribute("erros", e.getMessage());
			RequestDispatcher disp = req.getRequestDispatcher("/CadastroLivros");
			disp.forward(req, resp);
		}
	
}
	
}
