package belkman.Command;

import java.sql.*;
import java.util.ArrayList;

import belkman.Dto.Product;
import belkman.jdbc.Connect;

public class Pro_list
{
   // jsp에서 동작하던 내용을 여기에 코딩
   // pro_list()는 product테이블에 있는 내용을 가져와서
   // jsp문서내에서 사용할수 있게 해준다..
   public ArrayList<Product> pro_list(String param,int k) throws SQLException
   {
	   // DB연결
	   Connection conn=Connect.connection2();
	   // 쿼리문 작성
	   // param의 값 => 상품번호, 1, 2 (문자열) => equals
	   String sql="";
	   
	   if(param.equals("1"))
	      sql="select * from product order by poutput desc limit 0,24";
	   else if(param.equals("2"))
		      sql="select * from product order by id desc limit 0,24";
	        else if(k==1)
	               sql="select * from product where pcode like '"+param+"%' limit 0,24";
	             else
	               sql="select * from product where pname like '%"+param+"%'";
	    
	   PreparedStatement pstmt=conn.prepareStatement(sql);
	   // 쿼리문 실행
	   ResultSet rs=pstmt.executeQuery();
 
	   ArrayList<Product> list=new ArrayList<Product>();
	   // rs의 내용을 ArrayList를 통해 전달
	   while(rs.next())
	   {
		   list.add(new Product(rs)); // Product클래스의 객체를 생성후에 해당 객체를 list에 저장
	   }
	   // list객체에 모든 내용이 들어있다
	   // jsp문서로 전달
	   return list;  
	    /* Product pro=new Product();
	     pro.setId(rs.getInt("id"));
	     pro.setPlist(rs.getString("plist"));
	     pro.setPname(rs.getString("pname")); 
	     pro.setPrice(rs.getString("price")); 
	     list.add(pro);*/
   }
}
