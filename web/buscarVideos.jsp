<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <%@ include file="includes/head.html" %>
    <body>
        <%
            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                }
            }
            if (userName == null) {
                response.sendRedirect("index.html");
            }
        %>
        <div class="body">
            <%@ include file="includes/header.html" %>
            <div role="main" class="main">
                <section class="page-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <ul class="breadcrumb">
                                    <li><a href="#">Home</a></li>
                                    <li class="active">Videos</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h1>Buscar videos</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container">
                    <h4>Introduce los parámetros que desees y pulsa Buscar.</h4>
                    <div class="row">
                        <div class="col-md-4">
                            <form id="buscarVideos-form" action="BuscarVideosControllerClient" method="post">
                                <div class="form-group">
                                    <input id="tituloBuscar" name="titulo" placeholder="Título" tabindex="1" type="text" class="form-control" title="">
                                </div>
                                <div class="form-group">
                                    <input id="autorBuscar" name="autor" placeholder="Autor" tabindex="1" class="form-control" title="" type="text">
                                </div>
                                <div class="form-group">
                                    <input id="fechaBuscar" name="fechaCreacion" placeholder="Fecha de creación" tabindex="1" type="date" class="form-control" title="">
                                </div>
                                <button type="submit" id="buscarVideo-submit" class="btn btn-primary">Buscar</button>
                            </form> 
                        </div>
                    </div>

                    <div id="table" class="table-editable">
                        <table class="table">
                            <br>
                            <c:if test="${not empty videosArray}">
                                <h4>Resultados de la búsqueda:</h4>
                                <tr>
                                    <th>Título</th>
                                    <th>Autor</th>
                                    <th>Fecha de creación</th>
                                    <th>Duración</th>
                                    <th>Visualizaciones</th>
                                    <th>Descripción</th>
                                    <th>Formato</th>
                                </tr>
                            </c:if>
                            <c:forEach items="${videosArray}" var="VideosArray">
                                <tr>
                                    <td>${VideosArray.titulo}</td>
                                    <td>${VideosArray.autor}</td>
                                    <td>${VideosArray.creacion}</td>
                                    <td>${VideosArray.duracion}</td>
                                    <td>${VideosArray.visualizaciones}</td>
                                    <td>${VideosArray.descripcion}</td>
                                    <td>${VideosArray.formato}</td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div> 
                </div>
            </div>
            <%@ include file="includes/scripts.html" %>
    </body>
</html>