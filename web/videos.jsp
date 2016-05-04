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
                                <h1>Subir videos</h1>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="container">
                    <div id="table" class="table-editable">
                        <span class="btn-sm btn-success table-add glyphicon glyphicon-plus"></span>
                        <table class="table">
                            <tr>
                                <th>Título</th>
                                <th>Autor</th>
                                <th>Fecha de creación</th>
                                <th>Duración</th>
                                <th>Visualizaciones</th>
                                <th>Descripción</th>
                                <th>Formato</th>
                                <th></th>
                                <th></th>
                            </tr>
                            <c:forEach items="${videosArray}" var="VideosArray">
                                <tr>
                                    <td contenteditable="true">${VideosArray.titulo}</td>
                                    <td contenteditable="true">${VideosArray.autor}</td>
                                    <td contenteditable="true">${VideosArray.creacion}</td>
                                    <td contenteditable="true">${VideosArray.duracion}</td>
                                    <td contenteditable="true">${VideosArray.visualizaciones}</td>
                                    <td contenteditable="true">${VideosArray.descripcion}</td>
                                    <td contenteditable="true">${VideosArray.formato}</td>
                                    <td>
                                        <span class="table-remove glyphicon glyphicon-remove"></span>
                                    </td>
                                    <td>
                                        <span class="table-up glyphicon glyphicon-arrow-up"></span>
                                        <span class="table-down glyphicon glyphicon-arrow-down"></span>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- This is our clonable table line -->
                            <tr class="hide">
                                <td contenteditable="true">Indefinido</td>
                                <td contenteditable="true"><%=userName%></td>
                                <td contenteditable="true">aaaa-mm-dd</td>
                                <td contenteditable="true">00:00:00</td>
                                <td contenteditable="true">0</td>
                                <td contenteditable="true">Indefinido</td>
                                <td contenteditable="true">Indefinido</td>
                                <td>
                                    <span class="table-remove glyphicon glyphicon-remove"></span>
                                </td>
                                <td>
                                    <span class="table-up glyphicon glyphicon-arrow-up"></span>
                                    <span class="table-down glyphicon glyphicon-arrow-down"></span>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <submit id="export-btn" class="btn btn-success">Guardar Datos</submit>
                    <br><br>
                    <div id="export" >   
                    </div>
                </div>
                
            </div>     
            <%@ include file="includes/scripts.html" %>
    </body>
</html>