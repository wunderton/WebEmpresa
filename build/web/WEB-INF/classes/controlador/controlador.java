/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;
import org.hibernate.Session;

public class controlador extends HttpServlet {

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

        String oper = request.getParameter("op");
        if (oper == null) {
            oper = "";
        }

        RequestDispatcher rd;

        switch (oper) {
            case "altaSede":
                response.sendRedirect("frmNuevaSede.jsp");
                break;
            case "editarSede":
                rd = request.getRequestDispatcher("editarSede.jsp");
                rd.forward(request, response);
                break;
            case "insertSede":
                rd = request.getRequestDispatcher("procNuevaSede.jsp");
                rd.forward(request, response);
                break;
            case "muestraSede":
                rd = request.getRequestDispatcher("muestraSede.jsp");
                rd.forward(request, response);
                break;
            case "borrarSede":
                
                int idSede = Integer.parseInt(request.getParameter("idSede"));
                ORM.Sede aux = new ORM.Sede();
                aux.setIdSede(idSede);
                aux.setNomSede("luis");
                
                Session s2 = ORM.NewHibernateUtil.getInstance().getSessionFactory().openSession();
                s2.beginTransaction();
                s2.delete(aux);
                s2.getTransaction().commit();
                s2.close();
                response.sendRedirect("home.jsp");
                break;
            case "procEditarSede":
                rd = request.getRequestDispatcher("procEditarSede.jsp");
                rd.forward(request, response);
                break;
            default:
                response.sendRedirect("home.jsp");
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
