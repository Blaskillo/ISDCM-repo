<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Usuario"%>
<html>
    <%@ include file="includes/head.html" %>
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
            <%@ include file="includes/header.html" %>
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
            <%@ include file="includes/scripts.html" %>
        </div>
    </body>
</html>