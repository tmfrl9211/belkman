package belkman.Dto;

import java.text.DecimalFormat;
import java.util.*;
import java.sql.*;

public class Product 
{
  // ��ǰ����Ʈ ��¿� �ʿ��� �ʵ��� ���� ������ ��������
	private int id; // ��ǰ�󼼳��� �̵��� �ʿ��� ��
	private String plist;
	private String pname;
	private String price;  // �޸��߰�
	
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
		this.price = df.format(rs.getInt("price")); // price DB���� int, ���⹮���� String
	}
	
	
}
