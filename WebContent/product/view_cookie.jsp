<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="belkman.jdbc.Connect" %>   
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    String sql;
    ResultSet rs;
	Cookie[] cookies = request.getCookies();
	int n=cookies.length;
 
 
		for (int i = n-2 ; i>=0&&i>n-7  ; i--) {
             sql="select * from product where pcode='"+cookies[i].getValue()+"'";
             rs=stmt.executeQuery(sql);
             rs.next();
             out.print(cookies[i].getName());
 
%>
         <img src="img/<%=rs.getString("plist")%>" width=100> 
<%             
             
		}
		%>
</body>
</html>