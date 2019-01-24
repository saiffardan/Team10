package anothertrial;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class DbManager {
	public Connection getConnection() {
		try {
			Class.forName("con.mysql.jbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://silva.computing.dundee.ac.uk:3306/18agileteam10","18agileteam10","7621.at10.1267");
			return conn;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	
	}

}
