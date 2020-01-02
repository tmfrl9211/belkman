package belkman.Dto;

import java.text.DecimalFormat;
import java.util.*;
import java.sql.*;

public class Product 
{
  // 상품리스트 출력에 필요한 필드의 값을 가져올 변수정의
	private int id; // 상품상세내용 이동시 필요한 값
	private String plist;
	private String pname;
	private String price;  // 콤마추가
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlist() {
		return plist;
	}
	public void setPlist(String plist) {
		this.plist = plist;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Product(ResultSet rs) throws SQLException {
		super();
		DecimalFormat df=new DecimalFormat("#,###");
		this.id = rs.getInt("id");
		this.plist = rs.getString("plist");
		this.pname = rs.getString("pname");
		this.price = df.format(rs.getInt("price")); // price DB에는 int, 여기문서는 String
	}
	
	
}
