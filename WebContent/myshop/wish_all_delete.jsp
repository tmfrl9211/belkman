<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %> 
<%
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   
   String sql="delete from wish where userid='"+session.getAttribute("userid")+"'";
   stmt.executeUpdate(sql);
   response.sendRedirect("../main/index.jsp");
   
   stmt.close();
   conn.close();
%>