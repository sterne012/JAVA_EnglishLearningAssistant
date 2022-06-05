package util;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class jdbcUtils {
    private static DataSource ds;

    static{
        Properties pro=new Properties();
        InputStream is = jdbcUtils.class.getClassLoader().getResourceAsStream("druid.properties");
        try {
            pro.load(is);
            ds=DruidDataSourceFactory.createDataSource(pro);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    //获取连接池对象
    public static DataSource getDs(){
        return ds;
    }
    //获取连接connection对象
    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
}
