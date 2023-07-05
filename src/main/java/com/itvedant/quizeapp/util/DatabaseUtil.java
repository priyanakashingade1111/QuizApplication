package com.itvedant.quizeapp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseUtil {
	static Connection con = null;
	public static Connection createConnection() 
					throws ClassNotFoundException, SQLException {
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			String url = "jdbc:mysql://localhost:3306/quize";
			String username = "root";
			String category= "";
			
			con = DriverManager.getConnection(url,username,category);
			
			return con;
		}
	public static void stopConnection() 
				throws SQLException {
			con.close();
		}
}
