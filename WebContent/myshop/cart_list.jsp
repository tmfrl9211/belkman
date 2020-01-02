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
    <section class=cart_list_section>
<!--  관심상품 시작  -->  
  <!-- 관심상품내용출력 -->
    <div id=first align=center> CART </div>
    <%@ page import="java.sql.*" %>
    <%@ page import="belkman.jdbc.Connect" %>
    <%@ page import="belkman.Util.Util" %>   
 
    <%
      
      Connection conn=Connect.connection2();
      String sql="select cart.su, cart.psize, product.id as pid ,product.pcode, cart.id, product.pmain, product.pname";
      sql=sql+", product.price, product.point from cart,product where ";
      sql=sql+"cart.userid='"+session.getAttribute("userid")+"'";
      sql=sql+" and product.id=cart.pid"; 
      Statement stmt=conn.createStatement();
      ResultSet rs=stmt.executeQuery(sql);
      //out.print(sql);
    %>
    <!-- wish_list랑 다른내용
    1. wish테이블대신 cart테이블 사용
    2. section태그의 id => cart_list_section 
    3. 제일오른쪽 선택 열은 삭제(주문버튼,장바구니버튼)
    4. 사이즈(상품명 다음줄) , 수량(열을 하나 추가)
    5. main.css 에서 wish_list_section 부분만 복사 => 붙여넣기
       붙여넣기한 이름을 cart_list_section으로 변경 -->
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
	    location="cart_delete.jsp?del_num="+del_num;
	  else
		alert("하나도 선택되지 않았습니다");
  }
  function one_del(del_num)
  {
	  location="cart_delete.jsp?del_num="+del_num;
  }
  function all_del()
  {   // confirm() => 사용자에 한번 더 물어보는것
	  if(confirm("정말 삭제하시겠습니까?"))
	    location="cart_all_delete.jsp";
  }
</script>         
    <div id=second>
    <table width=800 border=0 cellspacing=0>
      <tr align=center height=40>
        <td> <input type=checkbox id=mainchk onclick=all_check(this.checked)> </td>
        <td> 이미지 </td>
        <td> 상품정보 </td>
        <td> 판매가 </td>
        <td> 수량 </td>
        <td> point </td>
        <td> 배송구분 </td>
        <td> 배송비 </td>
        <td> 합계 </td>
        <td> 삭제 </td>
      </tr>
      <% 
        while(rs.next())
        { 
        	String psize;
            switch(rs.getInt("psize"))
            {
              case 1: psize="95"; break;
              case 2: psize="100"; break;
              case 3: psize="105"; break;
              default:psize="XXX";
            }
      %>
      <input type=hidden value="<%=rs.getString("pcode")%>" class=cart_pcode>
      <input type=hidden value=<%=rs.getInt("price")%> class=cart_price>
      <input type=hidden value=<%=rs.getInt("psize")%> class=cart_psize>
      <input type=hidden value=<%=rs.getInt("id")%> class=cart_id>
      <tr align=center>
        <td> <input value="<%=rs.getInt("id")%>" type=checkbox class=subchk onclick=one_chk()> </td>
        <td> <img src="../product/img/<%=rs.getString("pmain")%>" width=80> </td>
        <td align=left> <%=rs.getString("pname")%> <p> [옵션 : <%=psize %> ] </td>
        <td align=right> <%=Util.comma(rs.getInt("price"))%> </td>
        <td> <input type=text name=su class=sss size=1 value=<%=rs.getInt("su")%>> </td>
        <td> <span id=juk>적</span><span class=cpoint><%=Util.comma(((rs.getInt("price")*rs.getInt("point"))/100)*rs.getInt("su"))%></span>P </td>
        <td> 기본배송 </td>
        <td> 무료 </td>
        <td align=right> <span class=chap><%=Util.comma(rs.getInt("price")*rs.getInt("su"))%></span> </td>
        <td> <span class=ddel onclick=one_del(<%=rs.getInt("id")%>)>X</span> </td>
      </tr>
     <%
        }
     %>
    </table>
  
 <script>  // 절대 따라하지 마시오
   $(function()
   {
	     $(".sss").spinner(
	     {
	    	 min:1,
	    	 max:100,
	    	 spin:function(event,ui)  // $(this).index();  // 인덱스값
	    	 {  
	    		// 수량변경에따른 포인트값과 합계금액의 변경ㅊ
	    		// 수량, 상품1개의 가격
	    		var su=ui.value;  // 수량
	    		var $test=$(".sss");
	    		var n=$test.index(this);
	    		//alert(n);
	    		var price=document.getElementsByClassName("cart_price")[n].value;  // 가격, hidden의 class=cart_price
                
	    		var hap=su*price;  // 합계금액
	    		var point=hap/100;  // 포인트
	    		document.getElementsByClassName("cpoint")[n].innerText=comma(point);  // 합계금액
	    		document.getElementsByClassName("chap")[n].innerText=comma(hap);  // 포인트
	    		/* var $test=$(".sss");
	    		var n=$test.index(this); */ // spin될때마다 실행할 내용을 정의하면 된다..
	    	 }
	    	
	     });
	     $(".sss").on("keypress",function() // 키보드로 숫자만 입력가능
	     {
	    	 if(event.keyCode<48 || event.keyCode>57)
	    	   return false;    	
	     });
	     
	     // 100까지
	     
	     $(".sss").on("spinstop",function() // 키보드로 바꿀때
    	 {
	       
   	   		var $test=$(".sss");
	    	var n=$test.index(this); // 몇번째에서 실행되었는지 
	    	//alert(n);
	    	var su=document.getElementsByClassName("sss")[n].value;
	    	if(su>100)
	    	{
	    		alert("100이상은 안 팔아요!!");
	    		document.getElementsByClassName("sss")[n].value=100;
	    		su=100;
	    	}
	    	var price=document.getElementsByClassName("cart_price")[n].value;  // 가격, hidden의 class=cart_price
               
	    	var hap=su*price;  // 합계금액
	    	var point=hap/100;  // 포인트
	    	document.getElementsByClassName("cpoint")[n].innerText=comma(point);  // 합계금액
	    	document.getElementsByClassName("chap")[n].innerText=comma(hap);  // 포인트
	    	/* var $test=$(".sss");
	    	var n=$test.index(this); */ // spin될때마다 실행할 내용을 정의하면 된다..
	    	cart_change(su,document.getElementsByClassName("cart_id")[n].value);
	    	//alert(su+document.getElementsByClassName("cart_id")[n].value);
    	 });
	     
	     
	     $(".btn1").mouseover(function()
	     {
	    	//$(this).addClass("cart_btn");
	    	$(this).css("background","black");
	    	$(this).css("color","white");
	     });
	     $(".btn1").mouseout(function()
	     {
	       	//$(this).removeClass("cart_btn");  // 잘안됨 확인해보세요
	    	$(this).css("background","white");
		    $(this).css("color","black");
	     });
	     
	     $(".ddel").mouseover(function()
	     {
	    	$(this).css("background","black");
		    $(this).css("color","white");
	     });
	     $(".ddel").mouseout(function()
	     {
	       	$(this).css("background","white");
	        $(this).css("color","black");
	     });
   });
   
   // cart 수량변경
   var cart1=new XMLHttpRequest();  // cart테이블에 저장하는 ajax통해
 
  function cart_change(su,id)   
  {   
	 // 수량과 사이즈값을 가져오기
	 url="cart_change.jsp?id="+id+"&su="+su;
	 alert(url);
	 cart1.open("get",url);
	 cart1.send();
  }
 cart1.onreadystatechange=function()
 {
	 if(cart1.readyState == 4)  
	 {    
	     if(cart1.responseText.trim()=="ok") // cart_ok.jsp에서 out.print() 내용
	     {  // 레이어 보이기
	    	alert(cart1.responseText);
	     }
	 }
 } 
 
 
   function select_del() // cart테이블에서 선택된 상품 삭제
   {
	   // 삭제할 상품의 id를 하나의 변수에 저장
	   var del_num="";
	   var subchk=document.getElementsByClassName("subchk");
	   var n=subchk.length; // 총 서브체크박스의 갯수
	   
	   for(i=0;i<n;i++)
	   {
		 if(subchk[i].checked) // 체크가 되어 있는 상품  
	       del_num=del_num+subchk[i].value+",";	   
	   }
	   
	   if(del_num.length != 0) // 최소 하나는 체크되었다는 것
	     location="cart_delete.jsp?del_num="+del_num;
	   else
		 alert("선택된 상품이 없습니다");
   }
   function one_del(del_num)
   {
 	  location="cart_delete.jsp?del_num="+del_num;
   }
 </script>
 <style>
  .cart_btn {
     color:white;
     background:black;
   }
   #sss {
     width:20px;
     height:10px;
   }
   .ddel {
     display:inline-block; /* 가로,세로크기를 주기위해 */
     width:20px;
     height:20px;
     
     border:1px solid black; /* 외곽선 */
     border-radius:10px;     /* 원형으로 */
     
     display:flex;
     align-items:center;
     justify-content:center; /* X글자를 상하,좌우 중앙으로 */
     
     cursor:pointer;  /* 커서를 손모양으로 */
   }
 </style>
    <table width=800 id=third border=0>
     <tr>
       <td colspan=4 align=left>
         <input type=button class=btn1 onclick=select_del() value=선택상품삭제>
         <input type=button class=btn1 onclick="location='cart_alldel.jsp'" value=장바구니비우기>
         <input type=button class=btn1 value=견적서출력>  
       </td>
       <!-- 선택상품주문 => 체크된 cart테이블의 (id, psize, su)
       전체상품주문 => 체크구분없이 모든 cart테이블의 (id, psize, su) -->
       <td colspan=6 align=right>
         <input type=button class=btn2 onclick="select_jumun()" value=선택상품주문>  
         <input type=button class=btn2 onclick="all_jumun()" value=전체상품주문>  
       </td>
     </tr>
    </table>
   </div>
  <script>
   function select_jumun() // 선택된 상품주문 (cart.id, psize, su)
   {
	   var pcode="";
	   var psize="";
	   var su="";
	   var subchk=document.getElementsByClassName("subchk");
	   var cart_pcode=document.getElementsByClassName("cart_pcode");
	   var cart_psize=document.getElementsByClassName("cart_psize");
	   var sss=document.getElementsByClassName("sss");
	   for(i=0;i<subchk.length;i++)
		  if(subchk[i].checked)
		  {
			  pcode=pcode+cart_pcode[i].value+",";
			  psize=psize+cart_psize[i].value+",";
			  su=su+sss[i].value+",";
		  }
	   
	   
	   location="../product/pro_jumun.jsp?pcode="+pcode+"&psize="+psize+"&su="+su;
   }
   function all_jumun()  // 전체상품 주문
   {
	   var pcode="";
	   var psize="";
	   var su="";
	   var cart_id=""; // cart테이블의 id를 저장
	   var subchk=document.getElementsByClassName("subchk");
	   var cart_psize=document.getElementsByClassName("cart_psize");
	   var cart_pcode=document.getElementsByClassName("cart_pcode");
	   var sss=document.getElementsByClassName("sss");
	   var cart_idclass=document.getElementsByClassName("cart_id");
	   // cart테이블의 id를 가지고 있는 태그
	   for(i=0;i<subchk.length;i++)
	   {
              pcode=pcode+cart_pcode[i].value+",";
			  psize=psize+cart_psize[i].value+",";
			  su=su+sss[i].value+",";
			  cart_id=cart_id+cart_idclass[i].value+","; // cart테이블의 id
			   
	   }
	   
	   location="../product/pro_jumun.jsp?pcode="+pcode+"&psize="+psize+"&su="+su+"&cart_id="+cart_id;
	   
   }
  </script>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>
<%
   conn.close();
%>