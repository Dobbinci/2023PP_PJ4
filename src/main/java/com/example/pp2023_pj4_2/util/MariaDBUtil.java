package com.example.pp2023_pj4_2.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MariaDBUtil {
    //Maria Db connection
    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection("");
        } catch (ClassNotFoundException e) {
            System.out.println("Driver error!");
            throw new RuntimeException(e);
        } catch (SQLException e) {
            System.out.println("DB error!");
            throw new RuntimeException(e);
        }

        return conn;
    }

    public static void main(String args[]) {
        Connection con = getConnection();
        if (con == null)
            System.out.println("No Connection");
        else
            System.out.println("Connected Successfully");
    }
}

