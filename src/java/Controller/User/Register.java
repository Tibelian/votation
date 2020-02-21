/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.User;

import DataAccessObject.DataBase;
import DataAccessObject.QueryVoter;
import Model.Voter;
import Model.WebSite;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            
            String nif = request.getParameter("username");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String password = request.getParameter("password");
            String residence = request.getParameter("residence");
            LocalDate bornDate = LocalDate.parse(request.getParameter("bornDate"));
            Voter voter = new Voter(nif, firstName, lastName, residence, bornDate, password);
            
            DataBase database = DataBase.Connect();
            Connection conn = database.GetConn();
            
            if (new QueryVoter().insert(conn, voter) == 1) {
                response.sendRedirect(WebSite.getUrl() + "/View/User/Register.jsp?ok=1");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + ex.getMessage());
        } catch(DateTimeParseException ed) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=miss-data");
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
