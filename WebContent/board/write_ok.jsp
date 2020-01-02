<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="belkman.Dto.Dto2" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
%>
 <!-- useBean을 통해 Dto 값을 전달 -->
 <jsp:useBean id="Dto2" class="belkman.Dto.Dto2">
    <jsp:setProperty name="Dto2" property="*"/>
 </jsp:useBean>
 <%
    out.print(Dto2.getName());
    //belkman.Command 패키지에 있는 Write클래스 호출
    out.print(Dto2.getTitle());
 %>
</body>
</html>