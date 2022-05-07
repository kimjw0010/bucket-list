package com.induk.bucketlist.memberTest.JDBCTest;

import static org.junit.Assert.fail;
import org.junit.jupiter.api.Test;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCTest {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testConnection() {

        try(Connection con =
                    DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/bucketlist?&serverTimezone=UTC&autoReconnect=true&allowMultiQueries=true&characterEncoding=UTF-8",
                            "root",
                            "root")){
            System.out.println(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }

    }

}
