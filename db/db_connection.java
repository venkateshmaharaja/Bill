package db;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author AV-IT-PC345
 */
public class db_connection {

    public Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
//        Connection con = DriverManager.getConnection("jdbc:mysql://10.44.50.115:3306/ats_tracker", "remote", "");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/billing", "root", "");
        System.out.print("connection sucessfully");
        return con;
    }
}
