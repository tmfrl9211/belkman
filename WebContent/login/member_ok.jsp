<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="belkman.Dto.Dto" %>   
<%@page import="belkman.jdbc.Connect" %>
<%
   request.setCharacterEncoding("utf-8");

/*
   Connect connect=new Connect();
   Connection conn = connect.connection(); */
   
   Connection conn=Connect.connection2();
   
%>
<jsp:useBean id="dto" class="belkman.Dto.Dto">
  <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>
 

<%
 
   String sql="insert into member(gubun, userid, pwd, pwd_qu, pwd_an";
   sql=sql+", name, zip, juso1, juso2, phone, hphone, email, sung, birth";
   sql=sql+", chk1, chk2, chk3, chk4, writeday) ";
   sql=sql+"value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,now())";
   PreparedStatement pstmt=conn.prepareStatement(sql);
   pstmt.setInt(1,dto.getGubun());   
   pstmt.setString(2,dto.getUserid());   
   pstmt.setString(3,dto.getPwd());   
   pstmt.setInt(4,dto.getPwd_qu());   
   pstmt.setString(5,dto.getPwd_an());   
   pstmt.setString(6,dto.getName());   
   pstmt.setString(7,dto.getZip());   
   pstmt.setString(8,dto.getJuso1());
   pstmt.setString(9,dto.getJuso2());   
   pstmt.setString(10,dto.getPhone());   //  
   pstmt.setString(11,dto.getHphone());  //
   pstmt.setString(12,dto.getEmail());   // 
   pstmt.setInt(13,dto.getSung());   
   pstmt.setString(14,dto.getBirth());   // 
   pstmt.setInt(15,dto.getChk1());   
   pstmt.setInt(16,dto.getChk2());   
   pstmt.setInt(17,dto.getChk3());  
   pstmt.setInt(18,dto.getChk4());
   pstmt.execute(); 
   
   response.sendRedirect("../main/index.jsp");
   
   
%>
 
 