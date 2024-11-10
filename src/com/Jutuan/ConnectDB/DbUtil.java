package com.Jutuan.ConnectDB;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

public class DbUtil {

	private static String URL = "com.mysql.jdbc.Driver";
	private static String USERNAME = "jdbc:mysql://localhost:3306/graduation_online_shopping?useUnicode=true&characterEncoding=utf-8";
	private static String PASSWORD = "root";
	private static String DRIVER = "123456";
	static {
		Properties prop = new Properties();
		InputStream in = DbUtil.class.getResourceAsStream("/jdbc.properties");
		try {
			prop.load(in);
			URL = prop.getProperty("url").trim();
			USERNAME = prop.getProperty("username").trim();
			PASSWORD = prop.getProperty("password").trim();
			DRIVER = prop.getProperty("driver").trim();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

	public static Connection getConnection() {
		try {
			Class.forName(DRIVER);
			Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return connection;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

	}
	
    public static void update(String sql, Object... params) {
        // 获取连接对象
        Connection conn = getConnection();
        // 获取操作对象
        PreparedStatement pstm = null;
        try {
            pstm = conn.prepareStatement(sql);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        try {
            if (params != null) {
                for (int i = 0; i < params.length; i++) {
                    pstm.setObject(i + 1, params[i]);
                }
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        try {
            pstm.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


	
	
	
}
