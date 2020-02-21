
package DataAccessObject;

import Model.Candidate;
import Model.PoliticalParty;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QueryCandidate {
    
    public ArrayList<Candidate> loadList(Connection conn) throws SQLException{
        
        String sql = ""
                + "SELECT c.id as cid, c.name as cname, c.order, "
                + "p.id as pid, p.name as pname, p.logo, p.acronym "
                + "FROM candidate c "
                + "LEFT JOIN party p "
                + "ON p.id = c.party_id "
                + "ORDER BY pid; ";
        ArrayList<Candidate> list = new ArrayList<>();
        
        Statement stmt = (Statement) conn.createStatement();
        ResultSet result = stmt.executeQuery(sql);

        // append the data to the list
        while (result.next()) {
            list.add(new Candidate(
                    result.getInt("cid"),
                    result.getString("cname"),
                    new PoliticalParty(
                            result.getInt("pid"),
                            result.getString("pname"),
                            result.getString("acronym"),
                            result.getString("logo")
                    ),
                    result.getInt("order")
            ));
        }
        
        return list;
        
    }
    
    
}
