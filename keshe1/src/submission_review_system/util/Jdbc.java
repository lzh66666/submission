package submission_review_system.util;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static submission_review_system.util.Config.*;

public class Jdbc {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (Exception e) {
            Exception exception = new Exception("JDBC: 注册驱动失败！" + System.lineSeparator());
            exception.printStackTrace();
        }
    }

    private Connection connection;
    private PreparedStatement preparedStatement;
    private Integer index;

    public void setConnection(String url, String user, String password) throws Exception {
        Assert.isNull(this.connection);
        this.connection = Assert.notNull(DriverManager.getConnection(url, user, password));
    }

    public Jdbc() throws Exception {
        setConnection(JDBC_DATABASE_URL, JDBC_DATABASE_USER, JDBC_DATABASE_PASSWORD);
        this.preparedStatement = null;
    }

    public Jdbc setSql(String sql) throws Exception {
        this.preparedStatement = Assert.notNull(connection.prepareStatement(Assert.notNull(sql)));
        index = 0;
        return this;
    }

    public Jdbc setString(String str) throws Exception {
        preparedStatement.setString(++index, str);
        return this;
    }

    public Jdbc setLong(Long num) throws Exception {
        preparedStatement.setLong(++index, num);
        return this;
    }

    public Jdbc setInteger(Integer num) throws Exception {
        preparedStatement.setInt(++index, num);
        return this;
    }

    public Integer executeUpdate() throws Exception {
        return this.preparedStatement.executeUpdate();
    }

    public ResultSet executeQuery() throws Exception {
        return this.preparedStatement.executeQuery();
    }

    public void backup() throws IOException {
        Runtime.getRuntime().exec("C:/Windows/System32/cmd.exe /c F:/jsp_code/idea2019/keshe/keshe1/dbbackup.bat");
    }

    public void restore() throws IOException {
        Runtime.getRuntime().exec("C:/Windows/System32/cmd.exe /c F:/jsp_code/idea2019/keshe/keshe1/dbrestore.bat");
    }
}