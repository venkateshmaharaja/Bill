
package sample;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class db_connection {
    public Connection getConnection() throws ClassNotFoundException,SQLException{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url,username,password;
        url="jdbc:sqlserver://10.44.50.15;databaseName=test_db";
        username="balaji_sap";
        password="sap123";
        Connection con = null;
        con = DriverManager.getConnection(url,username,password);
        return con;
    }
}
