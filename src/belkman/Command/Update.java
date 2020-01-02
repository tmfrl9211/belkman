package belkman.Command;

import java.sql.Connection;
import java.sql.SQLException;

import belkman.Dao.Dao;
import belkman.Dto.Dto;
import belkman.jdbc.Connect;

public class Update 
{
   public Dto update_exe(String userid) throws SQLException // 필요한 값 생성후 Dao에 있는 update()메소드를 호출
   {
	   Connection conn=Connect.connection2();
	   Dao dao=new Dao();
	   Dto dto=dao.update(conn,userid); // 회원정보를 select해서 다시 돌려주는 역할
	   return dto;
   }
}
