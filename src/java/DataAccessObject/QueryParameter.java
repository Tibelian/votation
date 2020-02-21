
package DataAccessObject;

import Model.Parameter;
import com.mysql.jdbc.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class QueryParameter {
    
    
    public Parameter load(Connection conn) throws SQLException{
        
        String sql = "SELECT * FROM parameter LIMIT 1;";
        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery(sql);
        Parameter parameter = new Parameter();
        while(result.next()){
            parameter.setCircumscription(result.getString("circumscription"));
            parameter.setDateQuery(result.getDate("date_query").toLocalDate());
            parameter.setNumCandidates(result.getInt("num_candidates"));
            parameter.setScrutiny(result.getString("status_scrutiny"));
            parameter.setTypeQuery(result.getString("type_query"));
        }
        return parameter;
        
    }
    
    
    public void updateScrutiny(Connection conn, String status) throws SQLException{
    
        String sql = "UPDATE parameter SET status_scrutiny = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, status);
        stmt.executeUpdate();
        
    }
    
}
