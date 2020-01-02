<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
   <% 
   // String pcode=request.getParameter("pcode"); 
  %>  
 <script>
   $(function()
   {
	 $("#logo").mouseover(function()
	 {	
		$(this).stop().animate(
		{
			color:"#bbbbbb"		
		},500);
	 });   
	 $("#logo").mouseout(function()
	 {
		 $(this).animate(
		 {
			color:"black"		
	 	 },500);
	 });
   });
/*    window.onload=function()
   { */
		<%-- // 모든 하위메뉴 클래스를 숨기기
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
	    switch("<%=pcode%>")
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
  --%>
  /*  } */
  function view_search()
  {
	  document.getElementById("search_form").style.display="inline";
  }
  function junsong(pp)
  {
	  if(event.keyCode==13)
		 document.search_form.submit();
	     //pp.submit();                   -> 두가지 방법 다 사용 가능
  }
 </script>
 
  <nav>
    <div id=logo> <span style="cursor:pointer" onclick="location='../main/index.jsp'"> C H A N N Y </span></div>
    <ul id=start_menu>  <!-- li태그를 클릭하면 해당되는 하위메뉴의 ul태그를 보여라 -->
      <li class=main onclick=view(0,this,180)> <a href="../product/pro_list.jsp?pcode=p01"> SUITS </a> 
        <ul class=menu>    <!-- 하위메뉴의 이름은 class=menu -->
          <li> <a href="../product/pro_list.jsp?pcode=p0101" id=p0101> 싱글수트 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0102" id=p0102> 스트라이프수트 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0103" id=p0103> 비즈니스수트 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0104" id=p0104> 더블수트 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0105" id=p0105> 체크수트 </a> </li> 
          <li> <a href="../product/pro_list.jsp?pcode=p0106" id=p0106> 드레스슈즈 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0107" id=p0107> 수트악세사리</a> </li>
        </ul>
      </li> 
      <li class=main onclick=view(1,this,120)> <a href="../product/pro_list.jsp?pcode=p02"> TOP </a>
        <ul class=menu>
          <li> <a href="../product/pro_list.jsp?pcode=p0201" id=p0201> 긴팔티셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0202" id=p0202> 반팔티셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0203" id=p0203> 헨리넥 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0204" id=p0204> 니트 </a> </li>
        </ul>
      </li>
      <li class=main onclick=view(2,this,140)> <a href="../product/pro_list.jsp?pcode=p03"> SHIRTS </a>
        <ul class=menu>
          <li> <a href="../product/pro_list.jsp?pcode=p0301" id=p0301> 스트라이프셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0302" id=p0302> 오픈카라셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0303" id=p0303> 솔리드셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0304" id=p0304> 체크셔츠 </a> </li>
          <li> <a href="../product/pro_list.jsp?pcode=p0305" id=p0305> Etc </a> </li>
        </ul>
      </li>
      <li class=main onclick=view(3,this,160)> PANTS 
        <ul class=menu>
          <li> 슬랙스 </li>
          <li> 면바지 </li>
          <li> 청바지 </li>
          <li> 반바지 </li>
          <li> 조거팬츠 </li>
          <li> Etc </li>
        </ul>
      </li>
      <li class=main onclick=view(4,this,140)> OUTER
        <ul class=menu>
          <li> 코트 </li>
          <li> 자켓/블레이저 </li>
          <li> 가디건 </li>
          <li> 베스트 </li>
          <li> 점퍼 </li>
        </ul>  
      </li>
      <li class=main onclick=view(5,this,140)> SHOES  
        <ul class=menu>
          <li> 드레스슈즈 </li>
          <li> 스니커즈 </li>
          <li> 벨크만슈즈 </li>
          <li> 부츠/워커 </li>
          <li> Etc </li>
        </ul>
      </li>
      <li class=main onclick=view(6,this,300)> ACCESSORY 
        <ul class=menu>
          <li> 타이/행거치프 </li>
          <li> 머플러/스카프 </li>
          <li> 목걸이/팔찌 </li>
          <li> 벨트/서스펜더 </li>
          <li> 아이웨어 </li>
          <li> 모자 </li>
          <li> 가방 </li>
          <li> 타이핀/부토니에 </li>
          <li> 양말 </li>
          <li> 시계 </li>
          <li> 벨크만악세사리 </li>
          <li> 방향제 </li>
          <li> Etc</li>
        </ul>
      </li>
      <li> &nbsp; </li>
      <li> <a href="../product/pro_list.jsp?best=1"> BEST </a></li>
      <li> <a href="../product/pro_list.jsp?new1=2"> NEW </a></li>
    </ul>
    
    <ul>
      <li> 
      <form name=search_form method=post action="../product/pro_list.jsp">
       <img src=../aa.png onclick="view_search()"> 
       <input type=hidden name=sea value=1>
       <span id=search_form style="display:none">
        <input type=text name=search size=10 onkeyup="junsong(this.form)">
        <!-- <input type=submit value="검색"> -->
       </span>
      </form>
      </li>
    </ul>
    
    <ul>
      <li>
       <%
        if(session.getAttribute("userid")==null)
        {
       %>
        <a href="../login/login.jsp"> LOGIN </a>
       <%
        }
        else
        {
       %> 
        <a href="../login/logout.jsp"> LOGOUT </a>
       <%
        }
       %>
      </li>
      <li> 
      <%
        if(session.getAttribute("userid")==null)
        {
      %>
        <a href="../login/login.jsp"> MY ACCOUNT </a>
      <%
        }
        else
        {
      %> 
        <a href="../myshop/myinfo.jsp"> MY ACCOUNT </a> 
      <%
        }
      %>
        </li>
      <li>
      <%
        if(session.getAttribute("userid")==null)
        {
      %>
        <a href="../login/login.jsp"> CART </a>
      <%
        }
        else
        {
      %> 
        <a href="../myshop/cart_list.jsp"> CART </a> 
      <%
        }
      %>
      </li>
      <li> Q&A / REVIEW </li>
    </ul>
  </nav>
  
  
  
  
  
  
  
  
  
  
  
  
  
 