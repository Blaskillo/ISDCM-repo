<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>

        <!-- Basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">	

        <title>Videos | ISDCM - Gestor de Videos</title>	

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
        <link rel="apple-touch-icon" href="img/apple-touch-icon.png">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

        <!-- Web Fonts  -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800%7CShadows+Into+Light" rel="stylesheet" type="text/css">

        <!-- Vendor CSS -->
        <link rel="stylesheet" href="vendor/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="vendor/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="vendor/simple-line-icons/css/simple-line-icons.min.css">
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.carousel.min.css">
        <link rel="stylesheet" href="vendor/owl.carousel/assets/owl.theme.default.min.css">
        <link rel="stylesheet" href="vendor/magnific-popup/magnific-popup.min.css">

        <!-- Theme CSS -->
        <link rel="stylesheet" href="css/theme.css">
        <link rel="stylesheet" href="css/theme-elements.css">
        <link rel="stylesheet" href="css/theme-blog.css">
        <link rel="stylesheet" href="css/theme-shop.css">
        <link rel="stylesheet" href="css/theme-animate.css">

        <!-- Current Page CSS -->
        <link rel="stylesheet" href="vendor/rs-plugin/css/settings.css" media="screen">
        <link rel="stylesheet" href="vendor/rs-plugin/css/layers.css" media="screen">
        <link rel="stylesheet" href="vendor/rs-plugin/css/navigation.css" media="screen">
        <link rel="stylesheet" href="vendor/circle-flip-slideshow/css/component.css" media="screen">

        <!-- Skin CSS -->
        <link rel="stylesheet" href="css/skins/default.css">

        <!-- Theme Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!-- Head Libs -->
        <script src="vendor/modernizr/modernizr.min.js"></script>


        <link rel="stylesheet" href="css/tablaVideos.css">


    </head>
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
            <header id="header" data-plugin-options='{"stickyEnabled": true, "stickyEnableOnBoxed": true, "stickyEnableOnMobile": true, "stickyStartAt": 57, "stickySetTop": "-57px", "stickyChangeLogo": true}'>
                <div class="header-body">
                    <div class="header-container container">
                        <div class="header-row">
                            <div class="header-column">
                                <div class="header-logo">
                                    <a href="home.jsp">
                                        <img alt="Video" width="250" height="80" data-sticky-width="150" data-sticky-height="50" data-sticky-top="40" src="img/videosLogo.png">
                                    </a>
                                </div>
                            </div>
                            <div class="header-column">
                                <div class="header-row">
                                    <div class="header-search hidden-xs">

                                    </div>
                                    <nav class="header-nav-top">
                                        <ul class="nav nav-pills">
                                            <li>
                                                <span class="ws-nowrap"><i class="fa fa-users"></i> Àlex Blasco y Sergio Moyano</span>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                                <div class="header-row">
                                    <div class="header-nav">
                                        <button class="btn header-btn-collapse-nav" data-toggle="collapse" data-target=".header-nav-main">
                                            <i class="fa fa-bars"></i>
                                        </button>
                                        <div class="header-nav-main header-nav-main-effect-1 header-nav-main-sub-effect-1 collapse">
                                            <nav>
                                                <ul class="nav nav-pills" id="mainNav">
                                                    <li >
                                                        <a href="home.jsp">
                                                            HOME
                                                        </a>
                                                    </li>
                                                    <li >
                                                        <a href="CargarVideosBDController">
                                                            VIDEOS
                                                        </a>
                                                    </li>
                                                    <li class="dropdown dropdown-mega dropdown-mega-signin signin logged" id="headerAccount">
                                                        <a class="dropdown-toggle" href="page-login.html">
                                                            <i class="fa fa-user"></i> <%=userName%>
                                                        </a>
                                                        <ul class="dropdown-menu">
                                                            <li>
                                                                <div class="dropdown-mega-content">

                                                                    <div class="row">
                                                                        <div class="col-md-8">
                                                                            <div class="user-avatar">
                                                                                <div class="img-thumbnail">
                                                                                    <img src="img/user.png" alt="">
                                                                                </div>
                                                                                <p><strong><%=userName%></strong><span>Usuario Estándar</span></p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-4">
                                                                            <ul class="list-account-options">
                                                                                <li>
                                                                                    <a href="#">Mi Cuenta</a>
                                                                                </li>
                                                                                <li>
                                                                                    <form action="LogoutUsuarioController" method="post">
                                                                                        <input type="submit" class="btn btn-primary" value="Logout" >
                                                                                    </form>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </header>

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
                                <h1>Videos</h1>
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

                    <submit id="export-btn" class="btn btn-primary">Guardar Datos</submit>
                    <br><br>
                    <div id="export" >   
                    </div>
                </div>
            </div>

            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="vendor/jquery.appear/jquery.appear.min.js"></script>
            <script src="vendor/jquery.easing/jquery.easing.min.js"></script>
            <script src="vendor/jquery-cookie/jquery-cookie.min.js"></script>
            <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
            <script src="vendor/common/common.min.js"></script>
            <script src="vendor/jquery.validation/jquery.validation.min.js"></script>
            <script src="vendor/jquery.stellar/jquery.stellar.min.js"></script>
            <script src="vendor/jquery.easy-pie-chart/jquery.easy-pie-chart.min.js"></script>
            <script src="vendor/jquery.gmap/jquery.gmap.min.js"></script>
            <script src="vendor/jquery.lazyload/jquery.lazyload.min.js"></script>
            <script src="vendor/isotope/jquery.isotope.min.js"></script>
            <script src="vendor/owl.carousel/owl.carousel.min.js"></script>
            <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
            <script src="vendor/vide/vide.min.js"></script>
            <script src="js/theme.js"></script>
            <script src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
            <script src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
            <script src="vendor/circle-flip-slideshow/js/jquery.flipshow.min.js"></script>
            <script src="js/views/view.home.js"></script>
            <script src="js/custom.js"></script>
            <script src="js/theme.init.js"></script>
            <script src="js/tablaVideosFunctions.js"></script>

    </body>
</html>