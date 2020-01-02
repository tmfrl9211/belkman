<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
<!-- jquery에 필요 -->
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=wish_list_section>
<!--  관심상품 시작  -->  
  <!-- 관심상품내용출력 -->
    <div id=first align=center> 관심상품 </div>
    <%@ page import="java.sql.*" %>
    <%@ page import="belkman.jdbc.Connect" %>
    <%@ page import="belkman.Util.Util" %>   
 
    <%
      
      Connection conn=Connect.connection2();
      String sql="select product.id as pid ,product.pcode, wish.id, product.pmain, product.pname";
      sql=sql+", product.price, product.point from wish,product where ";
      sql=sql+"wish.userid='"+session.getAttribute("userid")+"'";
      sql=sql+" and product.id=wish.pid"; 
      Statement stmt=conn.createStatement();
      ResultSet rs=stmt.executeQuery(sql);
      //out.print(sql);
    %>
<script>
  function all_check(pp)
  {
	  var subchk=document.getElementsByClassName("subchk");
	  //alert(subchk.length);
	  //alert(document.getElementById("mainchk").checked);
	  if(pp) //if(document.getElementById("mainchk").checked)  // 체크가 되었다면 => 서브 전부체크
	  {
		for(i=0;i<subchk.length;i++)
		  subchk[i].checked=true;
	  }
	  else   // 체크가 안되었다면 => 서브 전부해제
	  {
		for(i=0;i<subchk.length;i++)
		  subchk[i].checked=false;
	  } 
  }
  function one_chk()
  {
	  var chk=0;
	  var n=document.getElementsByClassName("subchk").length;
	  for(i=0;i<n;i++)
	    if(document.getElementsByClassName("subchk")[i].checked==false)
		  chk=1;
	  
	  if(chk == 0) // 대장체크박스 체크
	  {
		  document.getElementById("mainchk").checked=true;
	  }
	  else  // 대장체크박스 해제
	  {
		  document.getElementById("mainchk").checked=false;
	  }
  }
  function select_del() // 선택된 상품들을 삭제하기 위한 함수
  {
	  // 삭제할 상품의 id를 모아야된다.   var del_num="11,22,33"
	  var del_num=""; // wish_delete.jsp에 보낼 삭제할 상품의 id정보
	  var subchk=document.getElementsByClassName("subchk");
	  var n=subchk.length; // 서브체크박스의 총갯수
	  
	  for(i=0;i<n;i++)
	  {
		  if(subchk[i].checked) // 각각의 서브체크박스가 체크되었느냐?
		     del_num=del_num+subchk[i].value+","; 		  
	  }
	  
	  //alert(del_num); // 삭제할 상품의 id를 모은 변수 확인

	  if(del_num.length!=0) // 레코드가 0이 아닐때
	    location="wish_delete.jsp?del_num="+del_num;
	  else
		alert("하나도 선택되지 않았습니다");
  }
  function one_del(del_num)
  {
	  location="wish_delete.jsp?del_num="+del_num;
  }
  function all_del()
  {   // confirm() => 사용자에 한번 더 물어보는것
	  if(confirm("정말 삭제하시겠습니까?"))
	    location="wish_all_delete.jsp";
  }
</script>    
    <div id=second>
    <table width=800 border=0 cellspacing=0>
      <tr align=center height=40>
        <td> <input type=checkbox id=mainchk onclick=all_check(this.checked)> </td>
        <td> 이미지 </td>
        <td> 상품정보 </td>
        <td> 판매가 </td>
        <td> point </td>
        <td> 배송구분 </td>
        <td> 배송비 </td>
        <td> 합계 </td>
        <td> 선택 </td>
      </tr>
      <% 
        while(rs.next())
        { 
      %>
      <tr align=center>
        <td> <input value="<%=rs.getInt("id")%>" type=checkbox class=subchk onclick=one_chk()> </td>
        <td> <img src="../product/img/<%=rs.getString("pmain")%>" width=80> </td>
        <td align=left> <%=rs.getString("pname")%> <p> <button class=btn> 옵션변경 &nbsp; <font color=red> > </font> </button> </td>
        <td align=right> <%=Util.comma(rs.getInt("price"))%> </td>
        <td> <span id=juk>적</span><%=Util.comma((rs.getInt("price")*rs.getInt("point"))/100)%>P </td>
        <td> 기본배송 </td>
        <td> 무료 </td>
        <td align=right> <%=Util.comma(rs.getInt("price"))%> </td>
        <td>
          <button class=btn2 onclick=wish_jumun("<%=rs.getString("pcode")%>")> 주문하기 > </button>  <br>
          <button class=btn onclick=cart_jumun(<%=rs.getInt("pid")%>)> 장바구니담기 </button> <br>
          <button class=btn onclick=one_del(<%=rs.getInt("id")%>)>x 삭제</button> 
        </td>
      </tr>
     <%
        }
     %>
    </table>
 <div id=jumun_layer>
   <form name=jumun_form method=post action="../product/pro_jumun.jsp">
     <!-- 전송해야될 값을 처리해줘야 된다. -->
     <input type=hidden name=pcode>
     사이즈 : <select name=psize>
       <option value=0> 선택 </option>
       <option value=1> 95 </option>
       <option value=2> 100 </option>
       <option value=3> 105 </option>
     </select> <p>
     수량 : <input type=text name=su class=sss size=1 value=1> <p>
     <input type=submit value="바로주문"> 
     <input type=button value="장바구니 담기">
   </form>
 </div> 
 <div id=cart2_layer>
   <form name=cart_form method=post action="../product/cart_ok.jsp">
     <!-- 전송해야될 값을 처리해줘야 된다. -->
     <input type=hidden name=cart_ok_move value=1>
     <input type=hidden name=pid><!--  product테이블의 id -->
     사이즈 : <select name=psize>
       <option value=0> 선택 </option>
       <option value=1> 95 </option>
       <option value=2> 100 </option>
       <option value=3> 105 </option>
     </select> <p>
     수량 : <input type=text name=su class=sss size=1 value=1> <p>
     <input type=submit value="장바구니 담기">
   </form>
 </div>
 <script>  // 절대 따라하지 마시오
   $(function()
   {
	     $(".sss").spinner(
	     {
	    	 min:1,
	    	 max:100,
	    	 spin:function()
	    	 {
	    		 // spin될때마다 실행할 내용을 정의하면 된다..
	    	 }
	     });
   });
   function wish_jumun(pcode)
   {   // event.clientX, event.clientY => 마우스의 좌표
	   var jr=document.getElementById("jumun_layer");
	   jr.style.left=(event.clientX-300)+"px";
	   jr.style.top=(event.clientY+document.documentElement.scrollTop)+"px";
	   jr.style.visibility="visible";
       // pcode 값을 hidden에 전달
       document.jumun_form.pcode.value=pcode;
       // 폼태그에 있는 상품코드값을 가지는 input태그에 전달
   }
   function cart_jumun(pid)
   {    
	   var cr=document.getElementById("cart2_layer");
	   cr.style.left=(event.clientX-300)+"px";
	   cr.style.top=(event.clientY+document.documentElement.scrollTop)+"px";
	   cr.style.visibility="visible";
	   document.cart_form.pid.value=pid;
   }
 </script>
 <style>
   #sss {
     width:20px;
     height:10px;
   }
   #jumun_layer {
     position:absolute;
     left:0px;
     top:0px;
     visibility:hidden;
     width:200px;
     height:100px;
     background:white;
     border:1px solid red;
   }
   #cart2_layer { 
     position:absolute;
     left:0px;
     top:0px;
     visibility:hidden;
     width:200px;
     height:100px;
     background:white;
     border:1px solid red;
   }
 </style>
    <table width=800 id=third border=0>
     <tr>
       <td colspan=4 align=left>
        선택상품을 <button class=btn2 onclick=select_del()> x 삭제하기 </button>
        <button class=btn> 장바구니 담기</button>
       </td>
       <td colspan=5 align=right>
         <button class=btn3> 전체상품주문 </button>
         <button class=btn4 onclick=all_del()> 관심상품 비우기 </button>
       </td>
     </tr>
    </table>
   </div>
    
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>
<%
   conn.close();
%>