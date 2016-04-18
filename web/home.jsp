<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Usuario"%>
<html>
    <head>

        <!-- Basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">	

        <title>Home | ISDCM - Gestor de Videos</title>	

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

    </head>
    <body>
        <%
            Boolean usuarioRegistro = (Boolean) request.getSession().getAttribute("usuarioRegistro");
            Usuario user = (Usuario) request.getSession().getAttribute("usuarioSession");
            Boolean controlAcceso = (Boolean) request.getSession().getAttribute("controlAcceso");
        %>
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
                <div class="slider-container rev_slider_wrapper" style="height: 700px;">
                    <div id="revolutionSlider" class="slider rev_slider" data-plugin-revolution-slider data-plugin-options='{"delay": 9000, "gridwidth": 800, "gridheight": 700}'>
                        <ul>
                            <li data-transition="fade">
                                <img src="img/landing-page-slide-1.jpg"  
                                     alt=""
                                     data-bgposition="center center" 
                                     data-bgfit="cover" 
                                     data-bgrepeat="no-repeat" 
                                     class="rev-slidebg">

                                <div class="tp-caption"
                                     data-x="center" data-hoffset="-150"
                                     data-y="center" data-voffset="-95"
                                     data-start="1000"
                                     style="z-index: 5"
                                     data-transform_in="x:[-300%];opacity:0;s:500;"><img src="img/slide-title-border.png" alt=""></div>

                                <div class="tp-caption top-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="-95"
                                     data-start="500"
                                     style="z-index: 5"
                                     data-transform_in="y:[-300%];opacity:0;s:500;">HOLA <%=userName%>,</div>

                                <div class="tp-caption"
                                     data-x="center" data-hoffset="150"
                                     data-y="center" data-voffset="-95"
                                     data-start="1000"
                                     style="z-index: 5"
                                     data-transform_in="x:[300%];opacity:0;s:500;"><img src="img/slide-title-border.png" alt=""></div>

                                <div class="tp-caption main-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="-45"
                                     data-start="1500"
                                     data-whitespace="nowrap"						 
                                     data-transform_in="y:[100%];s:500;"
                                     data-transform_out="opacity:0;s:500;"
                                     style="z-index: 5"
                                     data-mask_in="x:0px;y:0px;">GESTIONA TUS VIDEOS</div>

                                <div class="tp-caption bottom-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="5"
                                     data-start="2000"
                                     style="z-index: 5"
                                     data-transform_in="y:[100%];opacity:0;s:500;">Revisa tus últimas actualizaciones.</div>

                                <a class="tp-caption btn btn-lg btn-primary btn-slider-action"
                                   data-hash
                                   data-hash-offset="85"
                                   href="CargarVideosBDController"
                                   data-x="center" data-hoffset="0"
                                   data-y="center" data-voffset="80"
                                   data-start="2200"
                                   data-whitespace="nowrap"						 
                                   data-transform_in="y:[100%];s:500;"
                                   data-transform_out="opacity:0;s:500;"
                                   style="z-index: 5"
                                   data-mask_in="x:0px;y:0px;">Acceder a videos</a>

                            </li>

                            <li data-transition="fade">
                                <img src="video/landing.jpg"  
                                     alt=""
                                     data-bgposition="center center" 
                                     data-bgfit="cover" 
                                     data-bgrepeat="no-repeat" 
                                     class="rev-slidebg">

                                <div class="rs-background-video-layer" 
                                     data-forcerewind="on" 
                                     data-volume="mute" 
                                     data-videowidth="100%" 
                                     data-videoheight="100%" 
                                     data-videomp4="video/landing.mp4" 
                                     data-videopreload="preload" 
                                     data-videoloop="none" 
                                     data-forceCover="1" 
                                     data-aspectratio="16:9" 
                                     data-autoplay="true" 
                                     data-autoplayonlyfirsttime="false" 
                                     data-nextslideatend="true" 
                                     ></div>

                                <div class="tp-caption"
                                     data-x="center" data-hoffset="-160"
                                     data-y="center" data-voffset="-95"
                                     data-start="1000"
                                     style="z-index: 5"
                                     data-transform_in="x:[-300%];opacity:0;s:500;"><img src="img/slide-title-border.png" alt=""></div>

                                <div class="tp-caption top-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="-95"
                                     data-start="500"
                                     style="z-index: 5"
                                     data-transform_in="y:[-300%];opacity:0;s:500;">HOLA <%=userName%>,</div>

                                <div class="tp-caption"
                                     data-x="center" data-hoffset="160"
                                     data-y="center" data-voffset="-95"
                                     data-start="1000"
                                     style="z-index: 5"
                                     data-transform_in="x:[300%];opacity:0;s:500;"><img src="img/slide-title-border.png" alt=""></div>

                                <div class="tp-caption main-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="-45"
                                     data-start="1500"
                                     data-whitespace="nowrap"						 
                                     data-transform_in="y:[100%];s:500;"
                                     data-transform_out="opacity:0;s:500;"
                                     style="z-index: 5"
                                     data-mask_in="x:0px;y:0px;">ERES UN USUARIO NUEVO?</div>

                                <div class="tp-caption bottom-label"
                                     data-x="center" data-hoffset="0"
                                     data-y="center" data-voffset="5"
                                     data-start="2000"
                                     style="z-index: 5"
                                     data-transform_in="y:[100%];opacity:0;s:500;">Comprueba nuestra forma de gestionar tus videos.</div>

                                <a class="tp-caption btn btn-lg btn-primary btn-slider-action"
                                   data-hash
                                   data-hash-offset="85"
                                   href="CargarVideosBDController"
                                   data-x="center" data-hoffset="0"
                                   data-y="center" data-voffset="80"
                                   data-start="2200"
                                   data-whitespace="nowrap"						 
                                   data-transform_in="y:[100%];s:500;"
                                   data-transform_out="opacity:0;s:500;"
                                   style="z-index: 5"
                                   data-mask_in="x:0px;y:0px;">Empieza ahora!</a>

                                <div class="tp-dottedoverlay tp-opacity-overlay"></div>

                            </li>
                        </ul>
                    </div>
                </div>

            </div>

            <!-- Vendor -->
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

            <!-- Theme Base, Components and Settings -->
            <script src="js/theme.js"></script>

            <!-- Current Page Vendor and Views -->
            <script src="vendor/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
            <script src="vendor/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
            <script src="vendor/circle-flip-slideshow/js/jquery.flipshow.min.js"></script>
            <script src="js/views/view.home.js"></script>

            <!-- Theme Custom -->
            <script src="js/custom.js"></script>

            <!-- Theme Initialization Files -->
            <script src="js/theme.init.js"></script>

        </div>
    </body>
</html>