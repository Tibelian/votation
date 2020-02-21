
package DataAccessObject;

import Model.Voter;
import com.mysql.jdbc.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public class QueryVoter {
    
    // login query
    public Voter getVoterWhere(Connection conn, String _nif, String _password) throws SQLException, ExceptionQuery{
    
        String sql = ""
                + "SELECT * "
                + "FROM `voter` "
                + "WHERE `nif` = ? "
                + "AND `password` = PASSWORD(?)"
                + "LIMIT 1;"
                + "";
        
        // prepare the query
        PreparedStatement stmt = conn.prepareStatement(sql);

        // insert the data into the query
        stmt.setString(1, _nif);
        stmt.setString(2, _password);

        // execute the query and return the result
        ResultSet result = stmt.executeQuery();
        Voter voter = new Voter();

        // get the data
        while(result.next()){

            int id = result.getInt("id");
            String nif = result.getString("nif");
            String firstName = result.getString("first_name");
            String lastName = result.getString("last_name");
            String residence = result.getString("residence");
            LocalDate bornDate = result.getDate("born_date").toLocalDate();
            String password = result.getString("password");
            String voted = result.getString("voted");
            String role = result.getString("role");

            voter.setId(id);
            voter.setNif(nif);
            voter.setFirstName(firstName);
            voter.setLastName(lastName);
            voter.setResidence(residence);
            voter.setBornDate(bornDate);
            voter.setPassword(password);
            voter.setVoted(voted);
            voter.setRole(role);

        }

        result.close();
        stmt.close();

        if(voter.getId() == 0){
            throw new ExceptionQuery("Not found", 404);
        }

        return voter;
        
    }

    // register query
    public int insert(Connection conn, Voter voter) throws SQLException{
    
        String sql = ""
                + "INSERT INTO voter "
                + "(id, nif, first_name, last_name, residence, born_date, password) "
                + "VALUES(NULL, ?, ?, ?, ?, ?, PASSWORD(?)); "
                + "";
        
        PreparedStatement stmt = conn.prepareStatement(sql);
        
        String nif = voter.getNif();
        String firstName = voter.getFirstName();
        String lastName = voter.getLastName();
        String residence = voter.getResidence();
        Date bornDate = Date.valueOf(voter.getBornDate());
        String password = voter.getPassword();
        
        stmt.setString(1, nif);
        stmt.setString(2, firstName);
        stmt.setString(3, lastName);
        stmt.setString(4, residence);
        stmt.setDate(5, bornDate);
        stmt.setString(6, password);

        int result = stmt.executeUpdate();
        return result;
        
    }

    // delete account query
    public boolean delete(Connection conn, int id) throws SQLException {
        
        String sql = "DELETE FROM voter WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);
        return stmt.execute();
        
    }
    public boolean delete(Connection conn, String nif) throws SQLException {
        
        String sql = "DELETE FROM voter WHERE nif = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nif);
        return stmt.execute();
        
    }
    
    // update voted status query
    public int setVoted(Connection conn, Voter voter) throws SQLException{
        
        String sql = "UPDATE voter SET voted = 'Y' WHERE id = ?";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, voter.getId());
        return stmt.executeUpdate();
        
    }

    // update the user data query
    public int update(Connection conn, Voter voter) throws SQLException{
    
        String sql;
        if(voter.getPassword() != null){
            sql = ""
                + "UPDATE voter "
                + "SET first_name = ?, "
                + "last_name = ?, "
                + "residence = ?, "
                + "born_date = ?, "
                + "password = PASSWORD(?) "
                + "WHERE id = ? "
                + "";
        }else{
            sql = ""
                + "UPDATE voter "
                + "SET first_name = ?, "
                + "last_name = ?, "
                + "residence = ?, "
                + "born_date = ?"
                + "WHERE id = ? "
                + "";
        }
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, voter.getFirstName());
        stmt.setString(2, voter.getLastName());
        stmt.setString(3, voter.getResidence());
        stmt.setDate(4, Date.valueOf(voter.getBornDate()));
        if(voter.getPassword() != null){
            stmt.setString(5, voter.getPassword());
            stmt.setInt(6, voter.getId());
        }else{
            stmt.setInt(5, voter.getId());
        }
        return stmt.executeUpdate();
        
    }
    
}
