
package Service;

import DataAccessObject.DataBase;
import Model.Voter;
import com.mysql.jdbc.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

public class OperationWS {
    
    private Connection conn;
    private DataBase database;
    
    public ArrayList getListVoter(){
        
        ArrayList<Voter> list = new ArrayList();
        String sql = "SELECT * FROM voter;";
        try{
            database = DataBase.Connect();
            conn = database.GetConn();
            try (Statement stmt = conn.createStatement()) {
                ResultSet result = stmt.executeQuery(sql);
                Voter voter;
                while(result.next()){
                    
                    voter = new Voter();
                    voter.setId(result.getInt("id"));
                    voter.setNif(result.getString("nif"));
                    voter.setFirstName(result.getString("first_name"));
                    voter.setLastName(result.getString("last_name"));
                    voter.setResidence(result.getString("residence"));
                    voter.setBornDate(result.getDate("born_date").toLocalDate());
                    voter.setPassword(result.getString("password"));
                    voter.setVoted(result.getString("voted"));
                    voter.setRole(result.getString("role"));
                    list.add(voter);
                    
                }
            }
        }catch(SQLException | ClassNotFoundException ex){
            //
        }

        return list;
        
    }
    
    /*
    public ArrayList getListVoter(){
        
        ArrayList<Voter> list = new ArrayList();
        String sql = "SELECT * FROM voter;";
        try{
            database = DataBase.Connect();
            conn = database.GetConn();
            try (Statement stmt = conn.createStatement()) {
                ResultSet result = stmt.executeQuery(sql);
                Voter voter;
                while(result.next()){
                    
                    voter = new Voter();
                    voter.setId(result.getInt("id"));
                    voter.setNif(result.getString("nif"));
                    voter.setFirstName(result.getString("first_name"));
                    voter.setLastName(result.getString("last_name"));
                    voter.setResidence(result.getString("residence"));
                    voter.setBornDate(result.getDate("born_date").toLocalDate());
                    voter.setPassword(result.getString("password"));
                    voter.setVoted(result.getString("voted"));
                    voter.setRole(result.getString("role"));
                    list.add(voter);
                    
                }
            }
        }catch(SQLException | ClassNotFoundException ex){
            //
        }

        return list;
        
    }
    */
}
