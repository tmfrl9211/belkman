<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=myjumun_section>
<!-- myjumun.jsp 시작 -->
 <div id=first> 주 문 조 회 </div>
 <div id=second> 
   <ul>
     <li> 주문내역조회 </li>
     <li> 취소/반품/교환 내역 </li>
     <li> </li>
   </ul>
 </div>
 <div id=third>
   <select>
    <option>전체주문처리상태 </option>
   </select>
   <!-- form태그말고 자바스크립트로 보내기 -->
   <ul>
    <li onclick=myjumun(0)> 오늘 </li>
    <li onclick=myjumun(1)> 1주일 </li>
    <li onclick=myjumun(2)> 1개월 </li>
    <li onclick=myjumun(3)> 3개월 </li>
    <li onclick=myjumun(4)> 6개월 </li>
   </ul>
   <input type=text name=start id=start> ~
   <input type=text name=end id=end> <input type=button onclick=myjumun(5) value=조회>
   <script>
     function myjumun(n) // myjumun.jsp에 검색할 날짜를 가지고 간다..
     {   // ul태그내의 날짜 혹은 start,end값이 있는지 여부
 
    	switch(n)
    	{
    	  case 0: location="myjumun.jsp?nal=0"; break;
    	  case 1: location="myjumun.jsp?nal=1"; break;
    	  case 2: location="myjumun.jsp?nal=2"; break;
    	  case 3: location="myjumun.jsp?nal=3"; break;
    	  case 4: location="myjumun.jsp?nal=4"; break;
    	  case 5: 
    		  s=document.getElementById("start").value;
    		  e=document.getElementById("end").value;
    		  location="myjumun.jsp?nal=5&s="+s+"&e="+e;
    		                       // nal=5&s=2019-10-16&e=2019-10-17
    	}
     }
     
     $(function()
     {
    	$("#start").datepicker(
        {
           dateFormat:"yy-mm-dd" 	
        });
    	$("#end").datepicker(
 	    {
    	   dateFormat:"yy-mm-dd" 	
    	});
     });
   </script>
 </div>
 <div id=fourth> <!-- 주문내용출력 -->
    <div> 주문 상품 정보 </div>
    <%@ page import="java.sql.*" %>
    <%@ page import="belkman.jdbc.Connect" %>
    <%@ page import="belkman.Util.Util" %>
    <%
      String nal=request.getParameter("nal");
      String chuga="";
      if(nal==null) // 기본(3개월)
        chuga="and porder.writeday > date_sub(curdate(),interval 3 month)";
      else if(nal.equals("0")) // 오늘
    	  chuga="and porder.writeday > curdate()"; // > '2019-10-16'
      else if(nal.equals("1")) // 1주일
    	  chuga="and porder.writeday > date_sub(curdate(),interval 7 day)";
      else if(nal.equals("2")) // 1개월
    	  chuga="and porder.writeday > date_sub(curdate(),interval 1 month)";
      else if(nal.equals("3")) // 3개월
    	  chuga="and porder.writeday > date_sub(curdate(),interval 3 month)";
      else if(nal.equals("4")) // 6개월
    	  chuga="and porder.writeday > date_sub(curdate(),interval 6 month)";
      else if(nal.equals("5")) // 기간
           {
    	     String s=request.getParameter("s");
    	     String e=request.getParameter("e");
    	     chuga="and porder.writeday >= '"+s+"' and porder.writeday <= date_add('"+e+"',interval 1 day)";
    	                                                                // date_add('2019-10-16',interval 1 day)                                   
    	     // porder.writeday >= '2019-10-16' and proder.writeday <= '2019-10-17' 
           }
    
      Connection conn=Connect.connection2();
      String sql="select porder.id, substring(porder.writeday,1,10) as writeday, product.plist, product.pname, psize";
      sql=sql+", su,product.price, bae_step from porder,product where ";
      sql=sql+"porder.userid='"+session.getAttribute("userid")+"'";
      sql=sql+" and product.pcode=porder.pcode "+chuga;
      Statement stmt=conn.createStatement();
      ResultSet rs=stmt.executeQuery(sql);
 
    %>
    <table width=800>
      <tr>
        <td> 주문일자 <br> [주문번호] </td>
        <td> 이미지 </td>
        <td> 상품정보 </td>
        <td> 수량 </td>
        <td> 상품구매금액 </td>
        <td> 주문처리상태 </td>
        <td> 취소/교환/반품 </td>
      </tr>
      <% 
        while(rs.next())
        { 
      %>
      <tr>
        <%
          String wday=rs.getString("writeday").replace("-","");
          String num=rs.getString("id");
          int n=5-num.length();
          for(int i=0;i<n;i++)  
        	  num="0"+num;
          num=wday+"-"+num;
          String psize;
          switch(rs.getInt("psize"))
          {
            case 0: psize="95"; break;
            case 1: psize="100"; break;
            case 2: psize="105"; break;
            default:psize="XXX";
          }
          String bae_step="";
          switch(rs.getInt("bae_step"))
          {
            case 0: bae_step="입금전"; break;
            case 1: bae_step="결제완료"; break;
            case 2: bae_step="배송준비중"; break;
            case 3: bae_step="배송중"; break;
            case 4: bae_step="배송완료"; break;
            case 5: bae_step="취소"; break;
            case 6: bae_step="교환"; break;
            case 7: bae_step="반품"; break;
          }
        %>
        <td> <%=rs.getString("writeday") %> <br> [<%=num%>] </td>
        <td> <img src="../product/img/<%=rs.getString("plist")%>" width=50> </td>
        <td> <%=rs.getString("pname")%> <p> [옵션:사이즈 <%=psize%>] </td>
        <td> <%=rs.getString("su")%> </td>
        <td> <%=Util.comma(rs.getInt("price")*rs.getInt("su"))%> </td>
        <td> <%=bae_step%> </td>
        <td> - </td>
      </tr>
     <%
        }
     %>
    </table>
 </div>
<!-- myjumun.jsp 끝     -->
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
 </body>
</html>
