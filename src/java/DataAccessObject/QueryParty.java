package DataAccessObject;

import Model.PoliticalParty;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class QueryParty {

    // return an arraylist of political party object
    public ArrayList<PoliticalParty> loadList(Connection conn) throws SQLException {

        // list to return
        ArrayList<PoliticalParty> parties = new ArrayList<>();

        // execute the query
        String sql = "SELECT * FROM party";
        Statement stmt = (Statement) conn.createStatement();
        ResultSet result = stmt.executeQuery(sql);

        // append the data to the list
        while (result.next()) {
            int id = result.getInt("id");
            String name = result.getString("name");
            String acronym = result.getString("acronym");
            String image = result.getString("logo");
            int votes = result.getInt("votes");
            parties.add(new PoliticalParty(id, name, acronym, image, votes));
        }

        return parties;

    }
    
    // increase the vote to a political party
    public int increaseVote(Connection conn, int partyId) throws SQLException{
    
        String sql = "UPDATE party SET votes = votes + 1 WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, partyId);
        return stmt.executeUpdate();
        
    }

}
