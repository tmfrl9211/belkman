<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>  
<%@ page import="java.text.DecimalFormat" %>  
<%
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   ResultSet rs;
%>
<!DOCTYPE html>  <!-- myinfo.jsp -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=myinfo_section>  
<!-- myinfo시작  -->    
 <div id=first> MY ACCOUNT </div>
 <div id=second>
  <%
    String userid=session.getAttribute("userid").toString();
    String sql="select price,su,member.point, mem_point, cou_point, porder.point";
    sql=sql+" as ppoint from porder, member, product where member.userid='"+userid+"'";
    sql=sql+" and member.userid=porder.userid and porder.pcode=product.pcode";
    rs=stmt.executeQuery(sql);
    // mem_point, cou_point, ppoint의 값을 모두 누적해야된다..
    int mem_point=0;
    int cou_point=0;
    int ppoint=0;
    int chong=0;
    int num=0;
    while(rs.next())
    {
    	mem_point=mem_point+rs.getInt("mem_point");
    	cou_point=cou_point+rs.getInt("cou_point");
    	ppoint=ppoint+rs.getInt("ppoint");
    	chong=chong+(rs.getInt("price")*rs.getInt("su"));
    	num++;
    }
    // porder테이블에 레코드가 하나도 없으면 가용포인트출력에서 에러
    int point;
    if(num != 0) // 레코드가 있다..
    {
      rs.first(); // <-> rs.last();
      point=rs.getInt("point");
    }
    else // 레코드가 없으면
    {
    	sql="select point from member where userid='"+userid+"'";
    	rs=stmt.executeQuery(sql);
    	rs.next();
    	point=rs.getInt("point");
    }
    // rs.beforeFirst(); => 
    
    DecimalFormat df=new DecimalFormat("#,###");
    String cho=df.format(chong);
  %>  
    <ul>
     <li> 가용포인트 <%=point%>P  </li>
     <li> 총포인트 <%=ppoint%>P </li>
     <li> 사용포인트 <%=(cou_point+mem_point)%>P </li>
     <li> 총주문 <%=cho%>원(<%=num%>회) </li>
    </ul>
 </div>  <!-- 포인트 내역, 주문내역 -->
 <div id=third>
    <div> 나의 주문 처리 현황 </div> 
    <%
       // porder테이블에서 나의 주문을 전부 읽어와서 해당되는 현황 +
       sql="select * from porder where userid='"+userid+"'";
       rs=stmt.executeQuery(sql);
       // 반복문을 통해 각 현황의 변수에 값을 1씩 더한다..
       int[] arr=new int[8]; // [0]=> 입금전, [1]=>결제완료....[7]=>반품
       while(rs.next())
       {
    	   arr[rs.getInt("bae_step")]++; // 0~7까지의 값
       }
    %>
    <ul>
      <li> 입금전 <p> <%=arr[0]%> </li>
      <li> 결제완료 <p> <%=arr[1]%> </li>
      <li> 배송준비중 <p> <%=arr[2]%> </li>
      <li> 배송중 <p> <%=arr[3]%> </li>
      <li> 배송완료 <p> <%=arr[4]%> </li>
      <li> 취소 <p> <%=arr[5]%> </li>
      <li> 교환 <p> <%=arr[6]%> </li>
      <li> 반품 <p> <%=arr[7]%> </li>
    </ul>
 </div> <!--  주문처리현황 -->
 <div id=fourth> 
   <table width=800>
     <tr>
       <td onclick="location='myjumun.jsp'"> ORDER주문내역조회 <p>
           고객님께서 주문하신 상품의 주문내역을 확인하실 수 있습니다. <br>
비회원의 경우, 주문서의 주문번호와 비밀번호로 주문조회가 가능합니다.
       </td>
       <td onclick="location='../login/member_update.jsp'"> PROFILE회원정보 <p> 회원의 정보등을 수정한다..</td>
     </tr>
     <tr>
       <td> POINT 포인트 </td>
       <td> BOARD 게시물관리 </td>
     </tr>
     <tr>
       <td onclick="location='../myshop/wish_list.jsp'"> WISHLIST 관심상품 <br>
       관심상품으로 등록하신 상품의 목록을 보여드립니다.
        </td>
       <td onclick="location='../myshop/bae_view.jsp'"> ADDRESS 배송주소록관리  </td>
     </tr>
   </table>
 </div> <!-- 조회,정보변경,게시판등등     -->
<!-- myinfo 끝   -->  
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>
<%
   conn.close();
%>

<!--  id=right의 종료 -->