package com.kh.mvc.common.jdbc;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	public static Connection getConnection() {
		
		//driver.property
		//db.driver=oracle.jdbc.driver.OracleDriver
		//db.url=jdbc:oracle:thin:@localhost:1521:xe
		//db.username=PROJECT
		//db.password=PROJECT
		Connection connection = null;
		Properties prop = new Properties();
		String fileName = JDBCTemplate.class.getResource("./driver.properties").getPath();
		 
		try {
			prop.load(new FileReader(fileName));
			Class.forName(prop.getProperty("db.driver"));
			
			connection = DriverManager.getConnection(
					prop.getProperty("db.url"), 
					prop.getProperty("db.username"), 
					prop.getProperty("db.password")
			);
			
			connection.setAutoCommit(false);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return connection;
	}
	
	public static void commit(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {
				connection.commit();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void rollback(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {
				connection.rollback();				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Connection connection) {
		try {
			if(connection != null && !connection.isClosed()) {
				connection.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(Statement statusment) {
		try {
			if(statusment != null && !statusment.isClosed()) {
				statusment.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void close(ResultSet resultSet) {
		try {
			if(resultSet != null && !resultSet.isClosed()) {
				resultSet.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}