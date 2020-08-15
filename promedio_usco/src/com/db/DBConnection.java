package com.db;
import java.sql.*;

public class DBConnection {
	
	
	public Connection get_connection(){
	        
        Connection connect = null;
        
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/usco_db_model?serverTimezone=UTC", "root", "1234");
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
        
        return connect;
    }
	
}




















