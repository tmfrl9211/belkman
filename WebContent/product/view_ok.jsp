<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="belkman.jdbc.Connect" %>     
<%
    Connection conn=Connect.connection2();    
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <%
     String pcode=request.getParameter("pcode");
     Statement stmt=conn.createStatement();
     String sql="select * from product where pcode like '"+pcode+"%'";
     ResultSet rs=stmt.executeQuery(sql);
     
     while(rs.next())
     { 
    	 out.print(rs.getString("pcode")+" : ");
    	 out.print(rs.getString("pname")+"<br>");
     }
     
 %>
</body>
</html>