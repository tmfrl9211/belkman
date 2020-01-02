<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %> 
<%
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   String id=request.getParameter("id");
   String su=request.getParameter("su");
  
   String sql="update cart set su="+su+" where id="+id;
   stmt.executeUpdate(sql);
  
   
   out.print("ok");
%>