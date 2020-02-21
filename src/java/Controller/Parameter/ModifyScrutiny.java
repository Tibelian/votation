
package Controller.Parameter;

import DataAccessObject.DataBase;
import DataAccessObject.QueryParameter;
import Model.Voter;
import Model.WebSite;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ModifyScrutiny extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(true);
        if(session.getAttribute("voter") != null){
            Voter voter = (Voter) session.getAttribute("voter");
            if(voter.getRole().equals("Administrator")){
                if(request.getParameter("new_scrutiny") != null){
                    try{
                        
                        String status = request.getParameter("new_scrutiny");
                        DataBase database = DataBase.Connect();
                        Connection conn = database.GetConn();
                        new QueryParameter().updateScrutiny(conn, status);
                        response.sendRedirect(WebSite.getUrl() + "/View/Scrutiny.jsp");
                        
                    } catch (SQLException | ClassNotFoundException ex) {
                        response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + ex.getMessage());
                    }
                }else{
                    response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=miss-data");
                }
            }else{
                response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=403");
            }
        }else{
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=must-login");
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
