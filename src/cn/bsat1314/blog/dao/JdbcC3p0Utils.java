package cn.bsat1314.blog.dao;

import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class JdbcC3p0Utils {

    public static DataSource dataSource = null;
    public static Connection connection = null;

    private static DataSource ds;

    static {
        //获取C3P0连接池对象
        ds = new ComboPooledDataSource();
    }

    public static DataSource getDataSource() {
        return ds;
    }

    public static Connection getConnection() {
        try {
            connection = dataSource.getConnection();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

}
