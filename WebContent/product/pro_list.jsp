<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
<%
request.setCharacterEncoding("utf-8");
String pcode=request.getParameter("pcode");
String best=request.getParameter("best");
String new1=request.getParameter("new1");
String search=request.getParameter("search"); 
int sea=0;
if(request.getParameter("sea")!=null)
  sea=Integer.parseInt(request.getParameter("sea"));
  
  String param="";
  int k=0;
  if(pcode!=null)
  {
	  k=1;
	  param=pcode;  // p01010010203
  }
  else if(best!=null)
	     param=best;   // 1
       else if(new1!=null)
    	       param=new1;  // 2
    	       else if(search!=null)
    	    	   param=search;
    	       
  // pcode 일때만 k=1, 나머지는 0
  if(k==1)
  {
%>
<script>
 window.onload=function()
 {  
	// 모든 하위메뉴 클래스를 숨기기
	   for(i=0;i<=6;i++)
	   {
		document.getElementsByClassName("menu")[i].style.display="none";
		// 하위메뉴를 숨기기
		document.getElementsByClassName("main")[i].style.height="25px";
		// 하위메뉴가 속한  li태그의 높이를 원래대로
	   }
	   // 하위메뉴에 해당되는 class=menu 에게 display=>block : 보이기
	    var n; // 주메뉴중에 몇번째 인지
	    var hei; // 부메뉴의 높이
	    switch("<%=pcode.substring(0,3)%>")
	    {
	      case "p01": n=0; hei=180; break;
	      case "p02": n=1; hei=120; break;
	      case "p03": n=2; hei=140; break;
	      case "p04": n=3; hei=160; break;
	      case "p05": n=4; hei=140; break;
	      case "p06": n=5; hei=140; break;
	      case "p07": n=6; hei=300; 
	    }
		document.getElementsByClassName("menu")[n].style.display="block";
		document.getElementsByClassName("main")[n].style.height=hei+"px"; // 주메뉴가 있는 li태그
		
		document.getElementById("<%=pcode%>").style.borderBottom="1px solid red";
		//document.querySelector("#start_menu .menu(0) a:eq(1)").style.color="red";
 }
</script>
<%
  } // pcode값으로 호출되었을때
%>
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=list_section>
<!-- pro_list.jsp 시작 -->
<%@ page import="java.sql.*" %> 
<%@ page import="belkman.jdbc.Connect" %> 
<%@ page import="java.text.DecimalFormat" %><!--  숫자에 콤마 -->
<%@ page import="belkman.Command.Pro_list" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="belkman.Dto.Product" %>
<%
   // pcode올 경우, 1, 2
   String chul="";
if(sea==1)
{
	chul="SEARCH <p>";
	chul=chul+"<form name=search_form method='post' action='../product/pro_list.jsp'>";
    chul=chul+"<input type=hidden name=sea value=1>";
	   chul=chul+"<input type=text onclick=junsong(this.form) name=search value="+param+">";
}
   if(param.equals("1"))
	   chul="BEST";
   else if(param.equals("2"))
	       chul="NEW";
   else if(k==1)  // 상품코드 앞 3자리를 잘라서 p01=> suits , p02=> top ....
   {
	   switch(param.substring(0,3))
	   {
	     case "p01": chul="SUITS"; break;
	     case "p02": chul="TOP"; break;
	     case "p03": chul="SHIRTS"; break;
	     case "p04": chul="PANTS"; break;
	     case "p05": chul="OUTER"; break;
	     case "p06": chul="SHOES"; break;
	     case "p07": chul="ACCESSORY"; break;
	     default: chul="";
	   }
   }
%>
  <!-- caption에 들어갈 내용은 대분류명, best, new -->
 <table width=800 cellspacing=30 border=0 style="margin-top:50px">
  <caption style="height:50px"> <h3> <%=chul%> </h3></caption>
  <tr>
<%  // pro_list.jsp

 Pro_list plist=new Pro_list();
 ArrayList<Product> list=plist.pro_list(param,k); //레코드의 값을 리턴

                                     // 상품번호,1,2
 for(int i=1;i<=list.size();i++) // 레코드 내용을 하나씩
 {
%>
  <td style="cursor:pointer" onclick=move_content(<%=list.get(i-1).getId()%>)> 
    <p align=center>
     <img width=90 height=250 src="img/<%=list.get(i-1).getPlist()%>">
    </p>
    <p align=center><%=list.get(i-1).getPname()%> </p>
    <p align=right>￦<%=list.get(i-1).getPrice()%> </p>
  </td> 
<% 
  if(i%4 == 0) 
   { 
%>
 </tr>
 <tr>
<%	 
   }  // if의 끝
 }  // for의 끝
%>
 </tr>
</table>
<!-- pro_list.jsp 끝  -->     
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>






























