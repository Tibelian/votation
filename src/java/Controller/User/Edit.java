
package Controller.User;

import DataAccessObject.DataBase;
import DataAccessObject.QueryVoter;
import Model.Voter;
import Model.WebSite;
import com.mysql.jdbc.Connection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Edit extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String firstName = request.getParameter("first_name");
        String lastName = request.getParameter("last_name");
        String password = request.getParameter("password");
        String residence = request.getParameter("residence");
        LocalDate bornDate = LocalDate.parse(request.getParameter("born_date"));

        try{

            DataBase database = DataBase.Connect();
            Connection conn = database.GetConn();
            
            HttpSession session = request.getSession(true);
            if(session.getAttribute("voter") instanceof Voter){
                
                Voter voter = (Voter)session.getAttribute("voter");
                voter.setFirstName(firstName);
                voter.setLastName(lastName);
                voter.setBornDate(bornDate);
                voter.setResidence(residence);
                if("".equals(password)){
                    voter.setPassword(null);
                }else{
                    voter.setPassword(password);
                }
                
                new QueryVoter().update(conn, voter);
                response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=edit-ok");
            
            }else{
                response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=must-login");
            }

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
