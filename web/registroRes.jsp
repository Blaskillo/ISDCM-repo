<%-- 
    Document   : registroRes
    Created on : 01-mar-2016, 11:50:21
    Author     : Alex
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="model.Usuario"%>
<%
    Usuario user = (Usuario) request.getSession().getAttribute("usuarioSession");
    Boolean usuarioInvalido = (Boolean) request.getSession().getAttribute("usuarioInvalido");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Respuesta</title>
        <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7; IE=EmulateIE9">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <div class="jumbotron">
            <div class="container">
                <div class="starter-template">
                    <h2> 
                        <c:choose>
                            <c:when test ="${usuarioInvalido}">
                                <strong>El nombre de usuario "<%= user.getNickname().toString()%>" ya existe.</strong>
                            </c:when>
                            <c:otherwise>
                                <strong>Hola, <%= user.getNickname().toString()%>.</strong>
                            </c:otherwise>
                        </c:choose>
                    </h2>
                </div> 
                <c:choose>
                    <c:when test ="${usuarioInvalido}">
                        <p>
                            Por favor, introduce otro nombre de usuario.
                        </p>
                        <p>
                            <a class="btn btn-primary" href="index.html">Volver</a>
                        </p>
                    </c:when>
                    <c:otherwise>
                        <p> 
                            Tu usuario se ha introducido correctamente.
                        </p>
                        <br>
                        <h4>
                            <strong>Datos del usuario:</strong> 
                        </h4>
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Nombre</th>
                                        <th>Apellidos</th>
                                        <th>Email</th>
                                        <th>Nombre de usuario</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><%= user.getNombre().toString()%></td>
                                        <td><%= user.getApellidos().toString()%></td>
                                        <td><%= user.getCorreo().toString()%></td>
                                        <td><%= user.getNickname().toString()%></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <a class="btn btn-primary" href="index.html">Volver</a>
                    </c:otherwise>
                </c:choose>
            </div>
    </body>
</html>
