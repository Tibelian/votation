
package DataAccessObject;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 
 * Singleton pattern
 * to keep the connection
 * on our website
 * 
 */

public class DataBase {
    
    protected String host = "localhost";
    protected String user = "root";
    protected String pass = "";
    protected String name = "votation";
    protected String port = "3306";
    
    private static DataBase uniqueConnection = null;
    private Connection conn;
    
    private DataBase() throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://" + this.host + ":" + this.port + "/" + this.name;
        this.conn = (Connection) DriverManager.getConnection(url, this.user, this.pass);
   }
    
    public synchronized static DataBase Connect() throws SQLException, ClassNotFoundException{
        if(uniqueConnection == null){
            uniqueConnection = new DataBase();
        }
        return uniqueConnection;
    }

    public Connection GetConn() {
        return conn;
    }

    public void Destroy() throws SQLException {
        conn.close();
    }

    
}
