/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws.buscador.client;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.WebServiceRef;
import ws.buscador.BuscadorVideosWS_Service;
import ws.buscador.ClassNotFoundException_Exception;
import ws.buscador.Video;

/**
 *
 * @author Alex
 */
@WebServlet(name = "BuscarYVerVideosControllerClient", urlPatterns = {"/BuscarYVerVideosControllerClient"})
public class BuscarYVerVideosControllerClient extends HttpServlet {

    @WebServiceRef(wsdlLocation = "WEB-INF/wsdl/localhost_8080/BuscadorVideosWS/BuscadorVideosWS.wsdl")
    private BuscadorVideosWS_Service service;

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

        String titulo = request.getParameter("titulo");
        String autor = request.getParameter("autor");
        String fechaCreacion = request.getParameter("fechaCreacion");

        try {
            List<Video> result = buscarVideos(titulo, autor, fechaCreacion);
            if (result.isEmpty()) {
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/verVideos.jsp");
                PrintWriter out = response.getWriter();
                out.println("<div class=\"alert alert-danger\" "
                        + "style=\"display: block;width:400px;position:absolute;right:970px;bottom: 180px;\">\n"
                        + "    <a href=\"#\" class=\"close\" data-dismiss=\"alert\" aria-label=\"close\">&times;</a>\n"
                        + "    La busqueda realizada no obtuvo ningún resultado.\n"
                        + "  </div>");
                rd.include(request, response);
            } else {
                request.setAttribute("videosArray", result);
                RequestDispatcher view = request.getRequestDispatcher("verVideos.jsp");
                view.forward(request, response);
            }
        } catch (ClassNotFoundException_Exception | ServletException | IOException ex) {
            Logger.getLogger(BuscarYVerVideosControllerClient.class.getName()).log(Level.SEVERE, null, ex);
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

    private int add(int i, int j) {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        ws.buscador.BuscadorVideosWS port = service.getBuscadorVideosWSPort();
        return port.add(i, j);
    }

    private java.util.List<ws.buscador.Video> buscarVideos(java.lang.String tituloParam, java.lang.String autorParam, java.lang.String fechaCreacionParam) throws ClassNotFoundException_Exception {
        // Note that the injected javax.xml.ws.Service reference as well as port objects are not thread safe.
        // If the calling of port operations may lead to race condition some synchronization is required.
        ws.buscador.BuscadorVideosWS port = service.getBuscadorVideosWSPort();
        return port.buscarVideos(tituloParam, autorParam, fechaCreacionParam);
    }

}
