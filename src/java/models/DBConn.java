/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package models;

import controllers.Starter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author End User
 */
public class DBConn {
    private static String host = "127.0.0.1";
    private static int netTime = 2000;
    private static String user = "root";
    private static String pass = "";
    private static String database = "wis_db";
    private static String dbUrl = "jdbc:mysql://" + host + "/" + database;
    
    private static Connection conn;
    private static Connection conn2;
    
    void startConn() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, user, pass);
        } catch (Exception ex) {
            System.out.println("DBConn 34: "+ex.getMessage());
        }
    }
    
    void startConn2() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn2 = DriverManager.getConnection(dbUrl, user, pass);
        } catch (Exception ex) {
            System.out.println("DBConn 43: "+ex.getMessage());
        }
    }
    
    public Connection getConn() {
        try {
            if (null == conn || conn.isClosed()) {
                startConn();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connection cannot be established!!");
            Starter.setError("Database is down!");
        }
        return conn;
    }
    
    public Connection getConn2() {
        try {
            if (null == conn2 || conn2.isClosed()) {
                startConn2();
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Connection 2 cannot be established!!");
            Starter.setError("Database is down!");
        }
        return conn2;
    }
}
