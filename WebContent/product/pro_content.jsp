<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="belkman.jdbc.Connect" %> 
<%@ page import="java.text.DecimalFormat" %>    
<%
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    
    String id=request.getParameter("id"); // product테이블의 id
    
    String sql="select * from product where id="+id;
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
    
    Cookie[] cookies = request.getCookies();
    int n=cookies.length;
    n=n-1;
    Cookie cookie=new Cookie("pcode"+n,rs.getString("pcode"));
    cookie.setMaxAge(600);
    response.addCookie(cookie);
    
    //out.print(n);
    // 숫자에 콤마 관련
    DecimalFormat df=new DecimalFormat("#,###");
 %>
 
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <!-- 파일을 서버로 다운받은후 사용하는 방법 -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 

  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
<script>
  $(function()
  {		  
	   $("#su").spinner(
 	   {		   
		 min:1,
		 max:100 
 
 	   });
	   // spinner의 값이 바뀔때 이벤트 체크
	   $("#su").on("spinstop",function()
	   {
	       //alert(document.getElementById("su").value);
		   var su=parseInt(document.getElementById("su").value);
		   var imsi_price=<%=rs.getInt("price")%>*su;
		   imsi_price=comma(imsi_price); // comma()는 3자리마다 ,처리
		   //alert(imsi_price);
		   document.getElementById("price").innerText=imsi_price; 
	   });
  });
</script>
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=content_section>
    <form method=post action=pro_jumun_old.jsp>
     <input type=hidden name=pcode value=<%=rs.getString("pcode")%>>
 
<!-- pro_content.jsp시작 -->
 <div class=first>   <!-- 1층 : 메인이미지, 상품명, 가격등등 -->
   <div id=left> <img src="img/<%=rs.getString("pmain")%>"> </div>
   <div id=right> 
       <div id=right1> <%=rs.getString("pname")%> </div>
       <div id=right2> <%=df.format(rs.getInt("price"))%> </div>
       <div id=right3> <%=rs.getInt("point")%>P </div>
       <div id=right4>
         <select name=psize id=psize>
           <option value=0> 선 택 </option>
           <option value=1> S(90) </option>
           <option value=2> M(100) </option>
           <option value=3> L(110) </option>
         </select>
       </div>
       <div id=right5> 최소주문수량 1개 이상 <br>
           위 옵션선택 박스를 선택하시면 아래에 상품이 추가됩니다
       </div>
      
       
       <div id=right6>
          <input type=text name=su value=1 id=su style="width:30px">
          <span id=price><%=df.format(rs.getInt("price"))%></span>원
       </div> <!-- 구매수량선택 -->
       <div id=right7>
          <button id=buynow> BUY NOW </button>
          <input type=button id=cart onclick=move_cart(<%=id%>) value="ADD TO CART">
          <input type=button id=wish onclick=move_wish(<%=id%>) value="ADD TO WISH">
       </div>                        
       <div id=right8> 네이버 </div>
   </div>
 </div>
 <div class=second> <img src="img/<%=rs.getString("pdt_img")%>" width=800> </div>
 <div class=third>
   <table width=800 cellspacing=0 border=1>
    <tr>
      <td> 세탁정보 </td>
      <td> 제조국 </td>
      <td> 생산자 </td>
      <td> 제조일자 </td>
      <td> 품질보증기간 </td>
      <td> A/S문의처 </td>
    </tr>
    <tr>
     <%
        String ss;
        switch(rs.getInt("pwash"))
        {
          case 0: ss="물세탁"; break;
          case 1: ss="손세탁"; break; 
          case 2: ss="드라이크리닝"; break; 
          case 3: ss="울세탁"; break; 
          default: ss="모름";	  
        }
        // 제조국 0 ~ 4까지  상품코드 : ex) p010203020001  
        String pcode=rs.getString("pcode");
        pcode=pcode.substring(5,7); // 인덱스 5부터 7앞에까지
        switch(pcode)
        {
          case "01": pcode="모름"; break;
          case "02": pcode="대한민국"; break;
          case "03": pcode="미국"; break;
          case "04": pcode="중국"; break;
          case "05": pcode="일본"; break;
          default: pcode="???";
        }
        // 제조회사 
        String pmade=rs.getString("pcode");
        pmade=pmade.substring(7,9);  
        switch(pmade)
        {
          case "01": pmade="모름"; break;
          case "02": pmade="LG"; break;
          case "03": pmade="코오롱"; break;
          case "04": pmade="동대문"; break;
          case "05": pmade="제일모직"; break;
          default: pmade="???";
        }
     %>
      <td> <%=ss%> </td>  <!-- 0,1,2,3 이렇게 저장되어 있으므로 switch처리 -->
      <td> <%=pcode%> </td>
      <td> <%=pmade%> </td>
      <td> <%=rs.getString("proday")%> </td>
      <td> 구입후 1년내 </td>
      <td> 02-1564-4566 </td>
    </tr>
   </table>
 </div> <!-- 세탁정보, 제조국 ,생산자 등등 -->
 <div class=fourth> 어울리는 코디 </div>
 <div class=fifth> 안내내용 </div>
 <div class=sixth> 리뷰 </div>
 <div class=seventh> Q/A </div>

<!-- pro_content.jsp끝  -->   
    </form>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
  
<!--   장바구니관련 레이어,  관심상품관련 레이어 -->
<div id=cart_layer>
   <p align=center> 장바구니에 상품을 담았습니다!! </p>
   <p align=center>
      <button id=cart_move onclick=page_cart()>장바구니로 이동</button>
      <button id=move_not onclick=not_cart()>쇼핑계속하기</button>
   </p>
</div>
<div id=wish_layer>
   <p align=center> 관심상품에 상품을 담았습니다!! </p>
   <p align=center>
      <button id=wish_move onclick=page_wish()>관심상품으로 이동</button>
      <button id=wish_not onclick=not_wish()>쇼핑계속하기</button>
   </p>
</div>
</body>
</html>
<%
  stmt.close();
  conn.close();
%>