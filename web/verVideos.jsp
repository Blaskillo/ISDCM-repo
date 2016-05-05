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
                                <h1>Ver videos</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container">
                    <div class="row">
                        <h4>Introduce los par�metros del video que desees visualizar.</h4>

                        <div class="col-md-4">
                            <form id="buscarVideos-form" action="BuscarYVerVideosControllerClient" method="post">
                                <div class="form-group">
                                    <input id="tituloBuscar" name="titulo" placeholder="T�tulo" tabindex="1" type="text" class="form-control" title="">
                                </div>
                                <div class="form-group">
                                    <input id="autorBuscar" name="autor" placeholder="Autor" tabindex="1" class="form-control" title="" type="text">
                                </div>
                                <div class="form-group">
                                    <input id="fechaBuscar" name="fechaCreacion" placeholder="Fecha de creaci�n" tabindex="1" type="date" class="form-control" title="">
                                </div>
                                <button type="submit" id="buscarVideo-submit" class="btn btn-primary">Buscar</button>
                            </form>
                        </div>
                        <div class="col-md-2">
                        </div>
                        <div id="reproductor" class="col-md-4">
                            
                        </div>
                    </div>
                    <div id="table" class="table-editable">
                        <table class="table">
                            <br>
                            <c:if test="${not empty videosArray}">
                                <h4>Resultados de la b�squeda:</h4>
                                <tr>
                                    <th>T�tulo</th>
                                    <th>Autor</th>
                                    <th>Fecha de creaci�n</th>
                                    <th>Duraci�n</th>
                                    <th>Visualizaciones</th>
                                    <th>Descripci�n</th>
                                    <th>Formato</th>
                                    <th>Ver</th>
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
                                    <td>
                                        <span class="table-play glyphicon glyphicon-play"></span>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                    </div> 
                </div>
            </div>
            <%@ include file="includes/scripts.html" %>
    </body>
</html>