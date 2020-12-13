<%@page import="br.ifpr.entidade.Livro" %>
<%@page import="br.ifpr.entidade.LivroStatus" %>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
	<!--  meta charset="ISO-8859-1"> -->
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Cadastro livros</title>

	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" /> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=East+Sea+Dokdo&family=Roboto+Slab:wght@600&display=swap" rel="stylesheet">

	<style type="text/css">
				
   		.separador {
	   		width: 100%;
	  		border-bottom: 1px solid red;
   		}
   		
   		h2.title{
   			margin-left: 15px;
   			font-family: East Sea Dokdo;
   			font-size: 78px;
   		}
   		
   		label{
   			font-family: Roboto Slab;
   		}
   		
   		.logo {
   			margin-top: 6px;
			margin-left: 42%;
   		}
   		
   		.tc {text-align: center;}
   		.tl {text-align: left;}
   		.tr {text-align: right;}
   		
   		.buttom-block {
	   		display: block;
		    width: 100%;
		    height: calc(1.5em + .75rem + 2px);
		    padding: .375rem .75rem;
		    font-size: 1rem;
		    font-weight: 400;
		    line-height: 1.5;
		    color: #495057;
		    background-color: #fff;
		    background-clip: padding-box;
		    border: 1px solid #ced4da;
		    border-radius: .25rem;
		    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
	    }
	    
	    ::-webkit-scrollbar {
		    width: 0px;
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
				<h2 class="title font-italic">LIVROS CADASTRADOS</h2>
				
				<img class="logo" src="https://www.flaticon.com/svg/static/icons/svg/3627/3627777.svg" alt="some text" width=80 height=80>
			</header>
			
			<form action="/CadastroLivros/livros/cadastrar" method="post" class="form-inline mt-3 mb-3">
				
	
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");} %>" type="text" name="inputTituloLivro" placeholder="TITULO DO LIVRO" />
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");} %>" type="text" name="inputNomeAutor" placeholder="AUTOR(A)" />
				<input class="form-control mb-2 mr-sm-2 <% if(mensagemErro != null){ out.println("is-invalid");} %>" type="text" name="inputNomeEditora" placeholder="EDITORA"/>
				<button type="submit" class="btn btn-outline-secondary mb-2 ">CADASTRAR</button>
				<small class="form-text text-mute"> <% if(mensagemErro != null){ out.println(mensagemErro); } %> </small>
				
			
			</form>
  
				<% 
					int i = 0;
					for(Livro livro: listaLivrosJSP)
					{ 
						i++;
				%>
				
		 		<div class="accordion-item" style="margin-bottom:5px">
			  		<button class="btn btn-outline-secondary btn-block tl" type="button" data-bs-toggle="collapse" data-bs-target="#id<%= i %>" aria-expanded="false" aria-controls="id<%= livro.getId() %>">
					    <%
					    	String icon = "";
					    	if( livro.getStatus() == LivroStatus.DISPONIVEL)
					    		icon = "https://www.flaticon.com/svg/static/icons/svg/148/148767.svg";
					    	else
					    		icon = "https://www.flaticon.com/svg/static/icons/svg/458/458594.svg";
					    %>
					    
				    	<img src="<%= icon %>" alt="some text" width=20 height=20>
				    
				    	<span style="margin-left: 20px">#<%= i %> - <%= livro.getTitulo() %></span>
			    
				  	</button>
				</div>
				<div class="collapse" id="id<%= i %>" style="margin-bottom:10px; margin-top:-5px">
				  	<div class="card card-header">
				  		<form class="row g-3" style="margin-bottom: 10px">
					  		<div style="width: 50%; margin-left: 10px">
					    		<label for="inputId<%= i %>" class="visually-hidden">#ID</label>
					    		<input type="text" disabled class="buttom-block tc" id="inputId<%= i %>" value="<%= livro.getId() %>" />
					  		</div>
							<div style="width: 25%; margin-left: 10px">
								<label for="inputDataCriacao<%= i %>" class="visually-hidden">DATA DE CADASTRO</label>
								<input type="text" disabled class="buttom-block tc" id="inputDataCriacao<%= i %>" value="<%= dateFormat.format(livro.getDataCriacao()) %>">
							</div>
							<div style="width: 20%; margin-left: 10px">
								<label for="inputStatus<%= i %>" class="visually-hidden">STATUS</label>
								<input type="text" disabled class="buttom-block tc" id="inputStatus<%= i %>" value="<%= livro.getStatus() %>">
							</div>
						</form>

						<form class="row g-3" style="margin-bottom: 10px">
							<div style="width: 50%; margin-left: 10px">
								<label for="inputTitulo<%= i %>" class="visually-hidden">TÍTULO</label>
								<input type="text" disabled class="buttom-block tc" id="inputTitulo<%= i %>" value="<%= livro.getTitulo() %>">
							</div>
							<div style="width: 25%; margin-left: 10px">
								<label for="inputAutor<%= i %>" class="visually-hidden">AUTOR</label>
								<input type="text" disabled class="buttom-block tc" id="inputAutor<%= i %>" value="<%= livro.getAutor() %>">
							</div>
							<div style="width: 20%; margin-left: 10px">
								<label for="inputEditora<%= i %>" class="visually-hidden">EDITORA</label>
								<input type="text" disabled class="buttom-block tc" id="inputEditora<%= i %>" value="<%= livro.getEditora() %>">
							</div>
						</form>
					
						<form class="row g-3" style="margin-bottom: 10px">
							<div style="width: 100%; margin-left: 10px">
								<label for="inputTitulo<%= i %>" class="visually-hidden">OPERAÇõES</label>
							</div>
						</form>
					  
						<form class="row g-3">
							<div style="width: 45%; margin-left: 10px">
								<a class="btn btn-dark mb-2 mr-sm-4" href="/CadastroLivros/livros/alterar-status?id=<%= livro.getId() %>&status=disponivel">LIVRO DISPONÍVEL</a>
								<a class="btn btn-dark mb-2 mr-sm-4" href="/CadastroLivros/livros/alterar-status?id=<%= livro.getId() %>&status=emprestado">LIVRO EMPRESTADO</a>
							</div>
							<div style="width: calc(52% - 2px);" class="tr">
								<a class="btn btn-danger" href="/CadastroLivros/livros/excluir?id=<%= livro.getId() %>">EXCLUIR LIVRO</a>
							</div>
						</form>

					</div>
				</div>
			<%}  %>	
		</div>
		
</body>
</html>