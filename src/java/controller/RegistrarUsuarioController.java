/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "RegistrarUsuarioController", urlPatterns = {"/RegistrarUsuarioController"})
public class RegistrarUsuarioController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {

        Connection connection = null;
        try {
            String nombre = request.getParameter("name");
            String apellidos = request.getParameter("surname");
            String correo = request.getParameter("email");
            String password = request.getParameter("password");
            String nickname = request.getParameter("nickname");

            Usuario user = new Usuario(nombre, apellidos, correo, password, nickname);
            request.getSession().setAttribute("usuarioSession", user);
            request.getSession().setAttribute("usuarioRegistro", true);
            request.getSession().setAttribute("controlAcceso", false);

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/ISCDMBD;user=iscdm;password=iscdm");
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.setQueryTimeout(30);

            ResultSet rs = statement.executeQuery("SELECT * FROM USUARIOS");
            boolean find = false;
            if (!rs.first()) {
                statement.executeUpdate("insert into USUARIOS values ('" + nombre + "','" + apellidos + "','" + correo + "','" + nickname + "','" + password + "')");
                Cookie loginCookie = new Cookie("user", nickname);
                loginCookie.setMaxAge(30 * 60);
                response.addCookie(loginCookie);
                response.sendRedirect("home.jsp");
            } else {
                while (!rs.isAfterLast() && !find) {
                    find = (rs.getString("nickname").equals(user.getNickname()) || rs.getString("email").equals(user.getCorreo()));
                    rs.next();
                }
                if (!find) {
                    statement.executeUpdate("insert into USUARIOS values ('" + nombre + "','" + apellidos + "','" + correo + "','" + nickname + "','" + password + "')");
                    Cookie loginCookie = new Cookie("user", nickname);
                    loginCookie.setMaxAge(30 * 60);
                    response.addCookie(loginCookie);
                    response.sendRedirect("home.jsp");
                } else {
                    RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.html");
                    PrintWriter out = response.getWriter();
                    out.println("<div class=\"alert alert-danger\" "
                            + "style=\"display: block;width:500px;position:absolute;right:550px;bottom: 180px;\">\n"
                            + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                            + "    <strong>Cuidado!</strong> El nombre de usuario " + nickname + " ya existe. Por favor utiliza otro nombre.\n"
                            + "  </div>");
                    rd.include(request, response);
                }
            }

        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                System.err.println(e.getMessage());
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegistrarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarUsuarioController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
