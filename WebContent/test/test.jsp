<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import=belkman.test.Test1 %>
    <%@ page import=java.util.ArrayList %>
    <%@ page import=belkman.test.ArrayList_Test %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
ArrayList list=ArrayList_Test.output();
out.print(list.get(0));
// Test1 t1=new Test1();
// out.print(t1.hap());

%>