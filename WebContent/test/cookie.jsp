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
  Cookie cookie=new Cookie("name","batman");   //Cookie("변수","값")
  cookie.setMaxAge(300);
  response.addCookie(cookie);
  Cookie cookie2=new Cookie("name2","superman");
  cookie.setMaxAge(300);
  response.addCookie(cookie2);
  %>
</body>
</html>