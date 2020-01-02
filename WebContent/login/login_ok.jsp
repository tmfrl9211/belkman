<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%@ page import="belkman.jdbc.Connect" %>  
<%@ page import="java.sql.*" %>   
<%
   // DB 연결
   request.setCharacterEncoding("utf-8");
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   // 아이디 , 비밀번호 request
   String userid=request.getParameter("userid");
   String pwd=request.getParameter("pwd");
   //buynow에서 올경우 아래의 값이 존재하게 됨
   String pcode=request.getParameter("pcode");
   String psize=request.getParameter("psize");
   String su=request.getParameter("su");
   
   // 회원인지 아닌지 체크
   String sql="select * from member where userid='"+userid+"' ";
   sql=sql+" and pwd='"+pwd+"'";
   ResultSet rs=stmt.executeQuery(sql);
   
   //
   if(rs.next()) // true => 회원 ,  false => 회원이 아니다
   { // 회원이면  => 세션변수 
	   session.setAttribute("userid",rs.getString("userid"));
	   session.setAttribute("name",rs.getString("name"));
	   
	   if(session.getAttribute("userid").equals("admin"))
	   {
		   response.sendRedirect("../admin/index.jsp");
	   }
	   else
	   {
	   if(pcode.equals(null)) // buynow를 통해 오지 않을 경우 login.jsp에서 문자열 null이 넘어온다.
		   response.sendRedirect("../main/index.jsp");
	   else
	      response.sendRedirect("../product/pro_jumun_old.jsp?pcode="+pcode+"&psize="+psize+"&su="+su);
   }
   }
   else
   { // 회원이 아니다 => 경고창
%>
     <script>
       alert("회원정보가 일치하지 않거나 회원이 아닙니다");
       history.back();
     </script>
<%	   
   }
%>    


