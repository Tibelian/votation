
package Controller.User;

import DataAccessObject.DataBase;
import DataAccessObject.ExceptionQuery;
import DataAccessObject.QueryParameter;
import DataAccessObject.QueryVoter;
import Model.Parameter;
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


public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get the parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if (username == null || password == null || "".equals(username) || "".equals(password)) {
            response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=miss-data");
        }else{

            try {

                // instance session and database connection
                HttpSession session = request.getSession(true);
                DataBase database = DataBase.Connect();
                Connection conn = database.GetConn();

                // search voter into the database
                Voter voter = new QueryVoter().getVoterWhere(conn, username, password);
                Parameter parameter = new QueryParameter().load(conn);

                // check if can access to plataform
                if (voter.isVoted() && "Voter".equals(voter.getRole())) {
                    if(!"Finished".equals(parameter.getScrutiny())){
                        response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=already-voted");
                        return;
                    }
                }

                // create the session   
                session.setAttribute("voter", voter);

                // user logged in successfully
                response.sendRedirect(WebSite.getUrl() + "/View/User/Welcome.jsp");

            } catch (ExceptionQuery e) {

                // incorrect login
                response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=wrong-login");

            } catch (ClassNotFoundException | SQLException eConn) {

                // connection error
                response.sendRedirect(WebSite.getUrl() + "/View/Default/Error.jsp?code=sql&message=" + eConn.toString());

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
