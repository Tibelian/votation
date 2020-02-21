
package Controller.Party;

import DataAccessObject.DataBase;
import DataAccessObject.QueryParty;
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

public class doVote extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 
        int partyId = Integer.parseInt(request.getParameter("party"));
        
        try {
            
            DataBase database = DataBase.Connect();
            Connection conn = database.GetConn();
            HttpSession session = request.getSession(true);
            if(session.getAttribute("voter") instanceof Voter){
                
                Voter voter = (Voter) session.getAttribute("voter");
                if(voter.isVoted()){
                    response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=already-voted");
                    return;
                }
                
                try{
                    conn.setAutoCommit(false);
                    new QueryParty().increaseVote(conn, partyId);
                    new QueryVoter().setVoted(conn, voter);
                    conn.commit();
                    conn.setAutoCommit(true);
                    session.invalidate();
                    response.sendRedirect( WebSite.getUrl() + "/View/Default/Error.jsp?code=vote-ok");
                }catch(SQLException se){
                    conn.rollback();
                    conn.setAutoCommit(true);
                    response.sendRedirect( WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + se.getMessage());
                }
                
            }else{
                response.sendRedirect( WebSite.getUrl() + "/View/Default/Error.jsp?code=no-vote-login");
            }
            
        } catch (SQLException | ClassNotFoundException ex) {
            response.sendRedirect( WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + ex.getMessage());
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
