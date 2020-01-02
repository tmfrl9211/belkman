package belkman.Dao;

import java.sql.*;

import belkman.Dto.Dto;

public class Dao 
{
    public Dto update(Connection conn,String userid) throws SQLException
    {
    	// userid에 해당하는 정보가져오기
    	String sql="select * from member where userid='"+userid+"'";
    	Statement stmt=conn.createStatement();
    	ResultSet rs=stmt.executeQuery(sql);
    	Dto dto=new Dto(rs); // 생성자에 rs객체를 넘겨준다..
    	return dto;
    }
}