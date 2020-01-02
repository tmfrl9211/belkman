<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  <!-- member_view.jsp -->
        <!--  회원테이블에 있는 회원의 정보를 가져오기 -->
        <table width=800>
         <tr>
          <td> 회원아이디 </td>
          <td> 회원명 </td>
          <td> 전화번호 </td>
          <td> 성별 </td>
          <td> 구입횟수 </td>
          <td> 작성일 </td>
          <td> 탈퇴여부 </td>
          <%@page import="java.sql.*" %>
<%@page import="belkman.jdbc.Connect" %>
<%
Connection conn=Connect.connection2();
Statement stmt=conn.createStatement();
String sql="select * from member";
ResultSet rs=stmt.executeQuery(sql);

while(rs.next())
{
	String sung="";
	if(rs.getString("sung").equals("0"))
		sung="남자";
	else
		sung="여자";
	
	String memchk="";
	if(rs.getInt("memchk")==0)
		memchk="현재회원";
	else
		memchk="탈퇴회원";
	
	String sql1="select count(id) as cnt from porder where userid='"+rs.getString("userid")+"'";
	Statement stmt1=conn.createStatement();
	ResultSet rs1=stmt1.executeQuery(sql);

%>
   <tr>
    <td> <%=rs.getString("userid") %> </td>
    <td> <%=rs.getString("name") %> </td>
    <td> <%=rs.getString("phone") %> </td>
    <td> <%="sung"%> </td>
    <td> <%=rs1.getString("cnt") %> </td>
    <td> <%=rs.getString("writeday") %> </td>
    <td> <%=rs.getString("memchk") %> </td>
   </tr>
   
         </tr>
         <%
   }
   %>
        </table>
</body>
</html>