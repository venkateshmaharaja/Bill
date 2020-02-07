package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
 

public class connection_test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing","root","");
        System.out.print("connection succesfully");
    }
        catch(Exception ex){
            
            System.out.println(ex);
        }
    }
  
}
