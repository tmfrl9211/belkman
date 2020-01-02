<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="belkman.Dto.Dto" %>   
<%@page import="belkman.jdbc.Connect" %>
<%
   request.setCharacterEncoding("utf-8");

   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   
   String name=request.getParameter("name");
   String hphone=request.getParameter("hphone");
   
   String sql="select * from member where name='"+name+"', hphone="+hphone;
   
   ResultSet rs=stmt.executeQuery(sql);
   
   if(rs.next())
	   out.print("<b style='color:blue'>"+rs.getString("userid")+"</b>");
   else
   {
	   response.sendRedirect("find_id.jsp");
   }
%>