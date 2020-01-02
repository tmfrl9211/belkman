<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>
<%@ page import="belkman.Dto.Dto" %>
<!-- DB연결 -->
<%
   Connection conn=Connect.connection2();
   request.setCharacterEncoding("utf-8");
%>

<!-- useBean사용해서 dto에 값입력 -->
<jsp:useBean id="dto" class="belkman.Dto.Dto">   
  <jsp:setProperty name="dto" property="*" />
</jsp:useBean>

<!-- update쿼리문을 사용해서 수정 -->
<%
 String sql="update member set pwd=?,pwd_qu=?,pwd_an=?,name=?,zip=?";
 sql=sql+",juso1=?, juso2=?, phone=?, hphone=?, chk3=?, email=?";
 sql=sql+", chk4=?, sung=?, birth=?";
 sql=sql+" where userid='"+session.getAttribute("userid")+"'";
 PreparedStatement pstmt=conn.prepareStatement(sql);
 pstmt.setString(1,dto.getPwd());
 pstmt.setInt(2,dto.getPwd_qu());
 pstmt.setString(3,dto.getPwd_an());
 pstmt.setString(4,dto.getName());
 pstmt.setString(5,dto.getZip());
 pstmt.setString(6,dto.getJuso1());
 pstmt.setString(7,dto.getJuso2());
 pstmt.setString(8,dto.getPhone());
 pstmt.setString(9,dto.getHphone());
 pstmt.setInt(10,dto.getChk3());
 pstmt.setString(11,dto.getEmail());
 pstmt.setInt(12,dto.getChk4());
 pstmt.setInt(13,dto.getSung());
 pstmt.setString(14,dto.getBirth());
 pstmt.executeUpdate();
%>

<!-- 수정후에 member_update.jsp로 이동 -->
<%
  response.sendRedirect("member_update.jsp");
%>
 
   
