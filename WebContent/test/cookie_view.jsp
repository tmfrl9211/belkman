<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
  Cookie[] cookie=request.getCookies(); // 클래스[] 객체변수=request.객체에넣을값();
  
  out.print(cookie.length); //쿠키의 갯수
  out.print(cookie[0].getName()+cookie[0].getValue());
  out.print("<p>");
  out.print(cookie[1].getName()+cookie[1].getValue());
%>
</body>
</html>