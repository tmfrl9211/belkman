<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>     
<%
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    
    String[] del=request.getParameterValues("del");

    //out.print(del.length); // 배열의 길이
    for(int i=0;i<del.length;i++)
    {
      String sql="delete from baesong where id="+del[i];
      //out.print(sql+"<p>");
      stmt.executeUpdate(sql);
    }
    stmt.close();
    conn.close();
    response.sendRedirect("bae_list.jsp");
%>