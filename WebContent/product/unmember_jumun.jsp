<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- unmember_jumun.jsp -->
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>
<%@ page import="belkman.Util.Util" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
request.setCharacterEncoding("utf-8");
String pcode=request.getParameter("pcode");
String psize=request.getParameter("psize");
String su=request.getParameter("su");
String halin=request.getParameter("halin");
String buga=request.getParameter("buga");
String point=request.getParameter("point");
String mem_point=request.getParameter("mem_point");
String cou_point=request.getParameter("cou_point");
String pay_sudan;  // 체크가 된것과 안된것 2가지중 하나
if(request.getParameter("pay_sudan")==null)
	   pay_sudan="0";
else
	   pay_sudan="1";
	   
String pay_method=request.getParameter("pay_method");
String ipgum=request.getParameter("ipgum");
String ipbank=request.getParameter("ipbank");

// bae_step 만들기 : 카드결제,휴대폰결제(1), 무통장,에스크로(0)
String bae_step="";
switch(request.getParameter("pay_method"))
{
  case "0": bae_step="0"; break;
  case "1": bae_step="1"; break;
  case "2": bae_step="0"; break;
  case "3": bae_step="1";
}
   String name=request.getParameter("name");
   String zip=request.getParameter("zip");
   String juso1=request.getParameter("juso1");
   String juso2=request.getParameter("juso2");
   String phone=request.getParameter("p1")+"-"+request.getParameter("p2")+"-"+request.getParameter("p3");
   String hphone=request.getParameter("hp1")+"-"+request.getParameter("hp2")+"-"+request.getParameter("hp3");
   String email=request.getParameter("email1")+"@"+request.getParameter("email2");
   
   // 주문번호를 만들기
   Date today=new Date();
   SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd");
   String bunho=sdf.format(today)+"-"+request.getParameter("p2")+request.getParameter("p3");
   out.print(bunho);
   // unmember 테이블에 저장, porder테이블에 저장
   Connection conn=Connect.connection2();
   String sql="insert into unmember(name,zip,juso1,juso2,phone,hphone,email,bunho,writeday)";
   sql=sql+" values(?,?,?,?,?,?,?,?,now())";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setString(1, name);
   pstmt.setString(2, zip);
   pstmt.setString(3, juso1);
   pstmt.setString(4, juso2);
   pstmt.setString(5, phone);
   pstmt.setString(6, hphone);
   pstmt.setString(7, email);
   pstmt.setString(8, bunho);
   pstmt.executeUpdate();
   
// 쿼리 작성 => porder 테이블에 저장
   sql="insert into porder(pcode,psize,su,userid";
   sql=sql+",bid,halin,buga,point,mem_point,cou_point";
   sql=sql+",pay_sudan,pay_method,ipgum,ipbank,writeday";
   sql=sql+",bae_step,bae_msg) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
   pstmt=conn.prepareStatement(sql);
   pstmt.setString(1,pcode);
   pstmt.setString(2,psize);
   pstmt.setString(3,su);
   pstmt.setString(4,bunho);
   pstmt.setString(5,"0");
   pstmt.setString(6,halin);
   pstmt.setString(7,buga);
   pstmt.setString(8,point);
   pstmt.setString(9,mem_point);
   pstmt.setString(10,cou_point);
   pstmt.setString(11,pay_sudan);
   pstmt.setString(12,pay_method);
   pstmt.setString(13,ipgum);
   pstmt.setString(14,ipbank);
   pstmt.setString(15,bae_step);
   pstmt.setString(16,"비회원");
   pstmt.executeUpdate();
   out.print(bunho);
   pstmt.close();
   conn.close();
%>