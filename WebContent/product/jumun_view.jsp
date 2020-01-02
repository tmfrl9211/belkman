<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!--  jumun_view.jsp  : 사용자가 주문한 내역을 보여준다   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
</head>
<body onload=view_price()>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=jumun_view_section>  
    
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>
<%
    Connection conn=Connect.connection2();
    //String id=request.getParameter("id"); // porder 테이블의 id
    String num=request.getParameter("num"); // num보다 큰값이 주문한 내용
    String sql="";
    if(request.getParameter("cc")==null) // cart에서 넘어온경우
    	sql="select * from porder,product where userid='"+session.getAttribute("userid")+"' and porder.pcode=product.pcode and porder.id > "+num;
    else if(request.getParameter("cc").equals("1"))
        sql="select * from porder,product where porder.pcode=product.pcode and porder.id="+request.getParameter("id");
    else
    	sql="select * from porder as p1, product as p2 where p1.pcode=p2.pcode and p1.userid='"+request.getParameter("userid")+"'";
    
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery(sql);
 %>
   <div id=fourth>
      <div> 결제정보 </div>
      <table width=800>
       <tr>
        <td width=150> 최종결제금액 </td> <!-- 상품개당가격 * 구입수량 -->
        <td> <span id=hap></span> </td>
       </tr>
       <tr>
        <td> 결제수단 </td> <!--  porder의 pay_method -->
        
        <td> <span id=pay_method></span> </td>
       </tr>
      </table>
   </div>
   <div id=fifth>  <!-- 주문상품정보 -->
     <div> 주문 상품 정보 </div>
     <table width=800>
       <tr>
         <td> 이미지 </td>
         <td> 상품정보 </td>
         <td> 판매가 </td>
         <td> 수량 </td>
         <td> point </td>
         <td> 배송구분 </td>
         <td> 합계 </td>
       </tr>
       <%
       String imsi="";
       int hap=0; // 합계금액
       int pay_method=0;
       while(rs.next())
       {
    	   pay_method=rs.getInt("pay_method"); // 결제방법에 대한 내용
    	   imsi=rs.getString("id");
    	   hap=hap+(rs.getInt("price")*rs.getInt("su"));
       %>
       <tr> <!-- 상품의 기본내용을 보기 -->
         <td> <img src="img/<%=rs.getString("pmain")%>" width=150> </td>
         <td> 
             <%=rs.getString("pname")%> <p>
             [옵션 : <%=rs.getString("psize")%>]
         </td>
         <td> <%=rs.getString("price")%> </td>
         <td> <%=rs.getString("su")%> </td>
         <td> <%=rs.getString("point")%> </td>
         <td> 기본배송 </td>
         <td> <%=rs.getInt("price")*rs.getInt("su")%> </td>
       </tr>
       <%
       }
       %>
       <tr>
         <td colspan=2> [기본배송] </td>
         <td colspan=5>
            상품구매금액<%=hap%>+
            배송비 0 +지역별배송비 0 = 합계 : <%=hap%>
         </td>
       </tr>
     </table>
   <script>
     function view_price() // body onload해야된다.
     {
    	 var hap=<%=hap%>; //총결제금액
    	 document.getElementById("hap").innerText=comma(hap);
    	                       // 총합계금액
    	 var pay_method=<%=pay_method%>; // var pay_method=0;
    	 var pkc=document.getElementById("pay_method"); // 결제방법
    	 switch(pay_method)
    	 {
    	   case 0: pkc.innerText="무통장입금"; break;
    	   case 1: pkc.innerText="카드 결제"; break;
    	   case 2: pkc.innerText="에스크로(실시간 계좌이체)"; break;
    	   case 3: pkc.innerText="휴대폰결제"; break;
    	   default: pkc.innerText="예외발생";
    	 }
     }
   </script>
   </div>  <!-- 주문상품정보끝 -->
   <%
    // 배송정보가 비회원은 unmember에 있고 , 회원은 baesong테이블에 있으므로
     if(request.getParameter("cc").equals("2")) 
    	 sql="select * from unmember where bunho='"+request.getParameter("userid")+"'";
     else  
         sql="select * from porder as p , baesong as b where p.id="+imsi+" and b.id=p.bid";
   
     rs=stmt.executeQuery(sql);
     rs.next();
     
     String name="";
     String bae_msg=""; // name필드는 필드명이 틀리므로, bae_msg는 unmember에는 없는 필드
     if(request.getParameter("cc").equals("2"))
     {
    	 name=rs.getString("name");
     }
     else
     {
    	 name=rs.getString("bname");
    	 bae_msg=rs.getString("bae_msg");
     }
   %>
   <div id=sixth> <!-- 배송정보 -->
     <div>배송지 정보</div>
     <table width=800>
       <tr>
         <td> 받으시는분 </td>
         <td> <%=name%></td>
       </tr>
       <tr>
         <td> 우편번호 </td>
         <td> <%=rs.getString("zip")%></td>
       </tr>
       <tr>
         <td> 주소 </td>
         <td> <%=rs.getString("juso1")%> <%=rs.getString("juso2") %></td>
       </tr>
       <tr>
         <td> 일반전화 </td>
         <td> <%=rs.getString("phone")%></td>
       </tr>
       <tr>
         <td> 휴대전화 </td>
         <td> <%=rs.getString("hphone")%></td>
       </tr>
       <tr>
         <td> 배송메세지 </td>
         <td> <%=bae_msg %> </td>
       </tr>
     </table>
     <div>
       <input type=button value="쇼핑계속하기">
       <input type=button value="주문확인하기">
     </div>
   </div>
   </section>
   <jsp:include page="../footer.jsp" flush="false" />
 </div> <!--  id=right의 종료 -->