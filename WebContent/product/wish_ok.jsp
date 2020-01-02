<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="belkman.jdbc.Connect" %>     
<%// cart_ok.jsp => cart 테이블에 pid, size, su 저장하고 out.print()에 ok
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();

    // 값 가져오기
    String pid=request.getParameter("pid");
    String userid=session.getAttribute("userid").toString();
    // 쿼리 작성
    String sql="insert into wish(pid,userid) values("+pid+",'"+userid+"')";
    stmt.executeUpdate(sql);
    
    stmt.close();
    conn.close();
    out.print("ok");
 %>
 
 