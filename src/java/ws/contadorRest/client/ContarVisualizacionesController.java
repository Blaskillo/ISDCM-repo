/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.contadorRest.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Alex
 */
@WebServlet(name = "contarVisualizacionesController", urlPatterns = {"/contarVisualizacionesController"})
public class ContarVisualizacionesController extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String jsonString = request.getParameter("jsonObject");
            JSONArray array = new JSONArray(jsonString);
            JSONObject jsonObj = array.getJSONObject(0);

            String titulo = jsonObj.getString("título");
            String visualizaciones = jsonObj.getString("visualizaciones");

            RestClient cliente = new RestClient();
            cliente.contador(String.class, visualizaciones, titulo);

            RequestDispatcher rd = getServletContext().getRequestDispatcher("/verVideos.jsp");

            switch (titulo) {
                case "Shrek":
                    {
                        request.getSession().setAttribute("mostrarPeli", "shrek");
                        RequestDispatcher view = request.getRequestDispatcher("verVideos.jsp");
                        view.forward(request, response);
                        break;
                    }
                case "Tarzan":
                    {
                        request.getSession().setAttribute("mostrarPeli", "tarzan");
                        RequestDispatcher view = request.getRequestDispatcher("verVideos.jsp");
                        view.forward(request, response);
                        break;
                    }
                case "Shutter island":
                    {
                        request.getSession().setAttribute("mostrarPeli", "shutter");
                        RequestDispatcher view = request.getRequestDispatcher("verVideos.jsp");
                        view.forward(request, response);
                        break;
                    }
                default:
                    {
                        request.getSession().setAttribute("mostrarPeli", "");
                        RequestDispatcher view = request.getRequestDispatcher("verVideos.jsp");
                        view.forward(request, response);
                        break;
                    }
            }

        } catch (Exception ex) {
            Logger.getLogger(ContarVisualizacionesController.class.getName()).log(Level.SEVERE, null, ex);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
