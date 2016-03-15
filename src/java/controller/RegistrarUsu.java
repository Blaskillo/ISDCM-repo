/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Usuario;

/**
 *
 * @author Alex
 */
@WebServlet(name = "RegistrarUsu", urlPatterns = {"/RegistrarUsu"})
public class RegistrarUsu extends HttpServlet {

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

            Class.forName("org.apache.derby.jdbc.ClientDriver");
            connection = DriverManager.getConnection("jdbc:derby://localhost:1527/ISDCM;user=isdcm;password=isdcm");
            Statement statement = connection.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            statement.setQueryTimeout(30);

            ResultSet rs = statement.executeQuery("SELECT * FROM USUARIOS");
            boolean find = false;

            if (!rs.first()) {
                statement.executeUpdate("insert into USUARIOS values ('" + nickname + "','" + nombre + "','" + apellidos + "','" + correo + "','" + password + "')");
                request.getSession().setAttribute("usuarioInvalido", false);
                request.getRequestDispatcher("registroRes.jsp").forward(request, response);           
            } else {
                while (!rs.isAfterLast() && !find) {
                    find = (rs.getString("nickname").equals(user.getNickname()));
                    rs.next();
                }
                if (!find) {
                    statement.executeUpdate("insert into USUARIOS values ('" + nickname + "','" + nombre + "','" + apellidos + "','" + correo + "','" + password + "')");
                    request.getSession().setAttribute("usuarioInvalido", false);
                    request.getRequestDispatcher("registroRes.jsp").forward(request, response);
                } else {
                    request.getSession().setAttribute("usuarioInvalido", true);
                    request.getRequestDispatcher("registroRes.jsp").forward(request, response);
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
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegistrarUsu.class.getName()).log(Level.SEVERE, null, ex);
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
