<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="belkman.jdbc.Connect" %>  
<%@ page import="java.sql.*" %>   
<%
   // DB 연결
   request.setCharacterEncoding("utf-8");
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
 
   String gubun=request.getParameter("gubun");
   String name=request.getParameter("name");
   String email=request.getParameter("email");
   String hphone=request.getParameter("hphone");
   
   String sql=null;
   int chk=0;
   if(!email.equals(""))
   {
	   sql="select * from member where name='"+name+"' and email='"+email+"'";
	   chk=0;
   }
   else if(!hphone.equals(""))
       {
	     sql="select * from member where name='"+name+"' and hphone='"+hphone+"'";
	     chk=1;
       }
       else
    	  System.out.println("에러"); // 에러처리는 나중에!!
	   
   ResultSet rs=stmt.executeQuery(sql);
   if(rs.next())
   {
	   String sel;
	   String val;
	   if(chk==0)
	   {
		   sel="이메일";
		   val=rs.getString("email");
	   }
	   else
	   {
		   sel="휴대폰번호";
		   val=rs.getString("hphone");
	   }
		   
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css?after">
<script src="../etc/main.js"></script>
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=id_search_ok_section>
      <div id=first> 아이디 찾기 </div>
      
      <div id=search_main align=center>
        <div id=sub> 아이디 찾기 </div>
        <div id=sub> 고객님 아이디 찾기가 완료되었습니다 </div>
        <div id=sub>
            <div id=sub_first> 
              저희 쇼핑몰을 이용해 주셔서 감사합니다. <br>
              다음정보로 가입된 아이디가 총 1개 있습니다.
            </div>
            <div id=sub_second>
                <div style="float:left" class=aaa> <img src=img/sajin.png> </div>
                <div style="float:right" class=bbb>
                   이름 : <%=rs.getString("name")%> <p>
         <%=sel%> : <%=val%> <p>
                   <input type=radio checked> <%=rs.getString("userid")%> (개인회원, <%=rs.getString("writeday")%>) <p>
                   고객님 즐거운 쇼핑하세요!!
                   
                </div>
            </div>
        </div>
        <div id=sub>
           고객님의 아이디 찾기가 성공적으로 이루어졌습니다. 항상 고객님의  <br>
 즐겁고 편리한 쇼핑을 위해 최선의 노력을 다하는 쇼핑몰이 되도록 하겠습니다. 
        </div>
        <div id=sub>
            <input type=button value=로그인 onclick="location='../login/login.jsp'" class=btn1>
            <input type=button value=비밀번호찾기 class=btn2 onclick="location='../login/pwd_search.jsp'">
        </div>
      </div>
    
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div> 
</body>
</html>
<%

   }
   else
   {
%>	   
      <script>
        alert("정보를 잘못입력");
        history.back();
      </script>
<%	   
   }
%>
