<%@page import="br.ifpr.entidade.Livro" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" /> 
<link rel="preconnect" href="https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Roboto+Slab:wght@600&display=swap" rel="stylesheet">

	<style type="text/css">
		
				
   		.separador {
   		width: 100%;
  		border-bottom: 1px solid red;
   		}
   		
   		h2{
   			font-family: East Sea Dokdo;
   			font-size: 78px;
   		}
   		
   		th{
   			font-family: Roboto Slab;
   		}
   		
  	</style>

</head>
<body>

	<%
		List<Livro> listaLivrosJSP = new ArrayList<Livro>();
	
		if(request.getAttribute("listaLivros") != null){
		 listaLivrosJSP = (List<Livro>) request.getAttribute("listaLivros");
		}
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/YYYY");
		
		String mensagemErro = (String) request.getAttribute("erros");
	%>

		<div class="container">
		
			<header class="row align-item-center mt-3">
				<h2 class="font-italic">LIVROS CADASTRADOS</h2>
			</header>
			
			<form action="/CadastroLivros/livros/cadastrar" method="post" class="form-inline mt-3 mb-3">
				
	
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");}  %>" type="text" name="inputTituloLivro" placeholder="TÍTULO DO LIVRO" />
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");}  %>" type="text" name="inputNomeAutor" placeholder="AUTOR(A)" />
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");}  %>" type="text" name="inputNomeEditora" placeholder="EDITORA"/>
				<button type="submit" class="btn btn-outline-secondary mb-2 ">CADASTRAR</button>
				<small class="form-text text-mute"> <% if(mensagemErro != null){ out.println(mensagemErro); } %> </small>
				
			
			</form>
			
			<table class="table table-borderless">
				
				<% for(Livro livro: listaLivrosJSP){ %>
				<tr class="table-info">
					<th>#ID</th>
					<th>DATA DE CADASTRO</th>
					<th>STATUS</th>
				</tr>
				<tr>
					<td><%= livro.getId() %></td>	
					<td><%= dateFormat.format(livro.getDataCriacao()) %></td>
					<td><%= livro.getStatus() %></td>
				</tr>
					
				<tr class="table-info">
					<th>TÍTULO</th>
					<th>AUTOR</th>	
					<th>EDITORA</th>
				</tr>
				<tr>
					<td><%= livro.getTitulo() %></td>
					<td><%= livro.getAutor() %></td>
					<td><%= livro.getEditora() %></td>
				</tr>
				
				
				<tr class="table-success">
					<th>OPERAÇÕES</th>
					<th></th>
					<th></th>
				</tr>		
				<tr>
					
						<td><a class="btn btn-dark mb-2 mr-sm-4" href="/CadastroLivros/livros/alterar-status?id=<%= livro.getId() %>&status=disponivel">LIVRO DISPONÍVEL</a>
						<a class="btn btn-dark mb-2 mr-sm-4" href="/CadastroLivros/livros/alterar-status?id=<%= livro.getId() %>&status=emprestado">LIVRO EMPRESTADO</a></td>
						<td><a class="btn btn-danger" href="/CadastroLivros/livros/excluir?id=<%= livro.getId() %>">EXCLUIR LIVRO</a></td>
										
				</tr>
				
				<%}  %>
			</table>	
		</div>
</body>
</html>