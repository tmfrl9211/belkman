package belkman.Dto;

import java.sql.*;

public class Dto 
{  // 데이터베이스의 테이블 구조랑 동일하게 정의
	private int id;
	private int gubun;
	private String userid;
	private String pwd;
	private int pwd_qu;
	private String pwd_an;
	private String name;
	private String zip;
	private String juso1;
	private String juso2;
	private String phone;
	private String hphone;
	private String email;
	private int sung;
	private String birth;
	private int chk1;
	private int chk2;
	private int chk3;
	private int chk4; // java에서 정수의 초기값은 0이된다.
	private String writeday;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGubun() {
		return gubun;
	}
	public void setGubun(int gubun) {
		this.gubun = gubun;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getPwd_qu() {
		return pwd_qu;
	}
	public void setPwd_qu(int pwd_qu) {
		this.pwd_qu = pwd_qu;
	}
	public String getPwd_an() {
		return pwd_an;
	}
	public void setPwd_an(String pwd_an) {
		this.pwd_an = pwd_an;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getJuso1() {
		return juso1;
	}
	public void setJuso1(String juso1) {
		this.juso1 = juso1;
	}
	public String getJuso2() {
		return juso2;
	}
	public void setJuso2(String juso2) {
		this.juso2 = juso2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getHphone() {
		return hphone;
	}
	public void setHphone(String hphone) {
		this.hphone = hphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getSung() {
		return sung;
	}
	public void setSung(int sung) {
		this.sung = sung;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getChk1() {
		return chk1;
	}
	public void setChk1(int chk1) {
		this.chk1 = chk1;
	}
	public int getChk2() {
		return chk2;
	}
	public void setChk2(int chk2) {
		this.chk2 = chk2;
	}
	public int getChk3() {
		return chk3;
	}
	public void setChk3(int chk3) {
		this.chk3 = chk3;
	}
	public int getChk4() {
		return chk4;
	}
	public void setChk4(int chk4) {
		this.chk4 = chk4;
	}
	public String getWriteday() {
		return writeday;
	}
	public void setWriteday(String writeday) {
		this.writeday = writeday;
	}
 
	public String atoString() {
		return "Dto [id=" + id + ", gubun=" + gubun + ", userid=" + userid + ", pwd=" + pwd + ", pwd_qu=" + pwd_qu
				+ ", pwd_an=" + pwd_an + ", name=" + name + ", zip=" + zip + ", juso1=" + juso1 + ", juso2=" + juso2
				+ ", phone=" + phone + ", hphone=" + hphone + ", email=" + email + ", sung=" + sung + ", birth=" + birth
				+ ", chk1=" + chk1 + ", chk2=" + chk2 + ", chk3=" + chk3 + ", chk4=" + chk4 + ", writeday=" + writeday
				+ "]";
		
 
	}
	//매개변수를 가지는 생성자를 생성시에는 꼭 비어있는 생성자를 만들어야 함
	public Dto() {}
    public Dto(ResultSet rs) throws SQLException
    {   
   	 rs.next();
   	 this.id=rs.getInt("id");
   	 this.gubun=rs.getInt("gubun");
   	 this.userid=rs.getString("userid");
   	 this.pwd=rs.getString("pwd");
   	 this.pwd_qu=rs.getInt("pwd_qu");
   	 this.pwd_an=rs.getString("pwd_an");
        this.name=rs.getString("name");
   	 this.zip=rs.getString("zip");
   	 this.juso1=rs.getString("juso1");
   	 this.juso2=rs.getString("juso2");
   	 this.phone=rs.getString("phone");
   	 this.hphone=rs.getString("hphone");
   	 this.email=rs.getString("email");
   	 this.sung=rs.getInt("sung");
   	 this.birth=rs.getString("birth");
   	 this.chk1=rs.getInt("chk1");
   	 this.chk2=rs.getInt("chk2");
   	 this.chk3=rs.getInt("chk3");
   	 this.chk4=rs.getInt("chk4"); // java에서 정수의 초기값은 0이된다.
   	 this.writeday=rs.getString("writeday");
    }
     
	
}



