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
                                    <li class="active">Vídeos</li>
                                </ul>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <h1>Reproductor de vídeos</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <h4>Introduce los parámetros del video que desees reproducir.</h4>
                            <form id="buscarVideos-form" class="col-md-6" action="BuscarYVerVideosControllerClient" method="post">
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

                        <c:if test="${mostrarPeli eq 'shrek'}">
                            <div id="reproductor" class="col-md-4">
                                <a class='cerrar' href='javascript:void(0);' onclick=document.getElementById("reproductor").className='oculto'>x</a>
                                <div>
                                    <video width="380" height="230" src="video/Shrek.mp4" controls autoplay loop muted preload="auto"></video>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${mostrarPeli eq 'tarzan'}">
                            <div id="reproductor" class="col-md-4">
                                <a class='cerrar' href='javascript:void(0);' onclick=document.getElementById("reproductor").className='oculto'>x</a>
                                <div>
                                    <video width="380" height="230" src="video/Tarzan.mp4" controls autoplay loop muted preload="auto"></video>
                                </div>
                            </div>
                        </c:if>
                        <c:if test="${mostrarPeli eq 'shutter'}">
                            <div id="reproductor" class="col-md-4">
                                <a class='cerrar' href='javascript:void(0);' onclick=document.getElementById("reproductor").className='oculto'>x</a>
                                <div>
                                    <video width="380" height="230" src="video/ShutterIsland.mp4" controls autoplay loop muted preload="auto"></video>
                                </div>
                            </div>
                        </c:if>

                        <style>
                            #reproductor {
                                width: 455px;  /* Ancho de la ventana */
                                height: 230px;  /* Alto de la ventana */
                                background: #000000;  /* Color de fondo */
                                position: absolute;
                                top: 290px;
                                left: 50%;
                                margin-left: 100px;
                                box-shadow: 0 5px 25px rgba(0,0,0,.1);  /* Sombra */
                                z-index:999;
                            }
                            #reproductor .cerrar {
                                float: right;
                                color: #999;
                                background: black;
                                line-height: 17px;
                                text-decoration: none;
                                padding: 0px 14px;
                                font-family: Arial;
                                border-radius: 0 0 0 5px;
                                box-shadow: -1px 1px white;
                                font-size: 18px;
                                -webkit-transition: .3s;
                                -moz-transition: .3s;
                                -o-transition: .3s;
                                -ms-transition: .3s;
                            }
                            #reproductor .cerrar:hover {
                                background: #ff6868;
                                color: black;
                                text-decoration: none;
                                text-shadow: -1px -1px red;
                                border-bottom: 1px solid red;
                                border-left: 1px solid red;
                            }
                            #reproductor #contenedor .contenido {
                                padding: 15px;
                                box-shadow: inset 1px 1px white;
                                background: #deffc4;  /* Fondo del mensaje */
                                border: 1px solid #9eff9e;  /* Borde del mensaje */
                                font-size: 20px;  /* Tamaño del texto del mensaje */
                                color: #555;  /* Color del texto del mensaje */
                                text-shadow: 1px 1px white;
                                margin: 0 auto;
                                border-radius: 4px;
                            }
                            .oculto {-webkit-transition:1s;-moz-transition:1s;-o-transition:1s;-ms-transition:1s;opacity:0;-ms-opacity:0;-moz-opacity:0;visibility:hidden;}
                        </style>

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
                                <submit id="play-btn" class="table-play glyphicon glyphicon-play"></submit>
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