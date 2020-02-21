package Controller.User;

import DataAccessObject.DataBase;
import DataAccessObject.QueryVoter;
import Model.Voter;
import Model.WebSite;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Delete extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // check if user has logged in
        HttpSession session = request.getSession(true);
        if (session.getAttribute("voter") == null) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=delete-failed-01");
            return;
        }

        // check if parameter delete has been received by POST or GET
        if (request.getParameter("delete") == null) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=delete-failed-02");
            return;
        }

        try {
            
            // connect to database and delete the voter
            DataBase database = DataBase.Connect();
            Connection conn = database.GetConn();
            Voter voter = (Voter) session.getAttribute("voter");
            new QueryVoter().delete(conn, voter.getNif());
            
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=delete-ok");

        } catch (SQLException | ClassNotFoundException ex) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + ex.getMessage());
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
