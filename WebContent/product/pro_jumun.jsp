<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %>
<%@ page import="belkman.Util.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
<!-- daum 도로명주소검색 API 시작 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
  function juso_search(n)  // 우편번호 버튼 클릭시 호출 함수명
  {
    new daum.Postcode({
        oncomplete: function(data) {
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(n==0) //주문자정보
            {
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.pkc.zip.value = data.zonecode; // 우편번호
            document.pkc.juso1.value = addr;  // 주소
            // 커서를 상세주소 필드로 이동한다.
            document.pkc.juso2.value="";
            document.pkc.juso2.focus();
            }
            else  // 배송지정보
            {
            	// 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.pkc.bzip.value = data.zonecode; // 우편번호
                document.pkc.bjuso1.value = addr;  // 주소
                // 커서를 상세주소 필드로 이동한다.
                document.pkc.bjuso2.value="";
                document.pkc.bjuso2.focus();
            }	
        }
    }).open();
  }

</script>
<!-- daum 도로명주소검색 API 끝 -->
</head>
<body onload="jumun_init()" oncontextmenu="return false">
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=jumun_section>  
    <form method=post action=pro_jumun_ok.jsp name=pkc>
     
<!-- 주문 : pro_jumun.jsp 시작 -->

 <div id=first align=center> 주문서 작성</div>
 <div id=second> <img src="img2/img_order_step2.gif" width=800> </div> 
 <div id=third> 
   <div id=left>혜택정보</div>
   <div id=right> 
      <div id=ff1 align=left style="border-bottom:1px solid #eeeeee"> <%=session.getAttribute("name")%>님은, [일반회원]이십니다.</div>
      <div id=ff2 align=left> 가용point:500p  쿠폰:0개</div>
   </div>
 </div>
<!--  상품하나출력 시작 -->
<%
   // DB연결
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   // pcode을 get  문제점 : pro_content => pcode , cart_list => id
   String[] pcode=request.getParameter("pcode").split(",");
   String[] psize=request.getParameter("psize").split(",");
   String[] su=request.getParameter("su").split(",");
   // "2,4,5,"
   
   String[] cart_id=request.getParameter("cart_id").split(",");
   // pro_jumun_ok.jsp로 전달
%> 
<script>
  function main_chk() // 메인이체크되면 서브는 전부체크, 해제도 마찬가지
  {
	  var subchk=document.getElementsByClassName("subchk");
      var n=subchk.length;
      
	  if(document.getElementById("mainchk").checked)
	  {  // subchk를 전부 체크 => subchk의 checked속성을 true
		for(i=0;i<n;i++)   
		  subchk[i].checked=true;
	  }
	  else // subchk를 전부 해제 => subchk의 checked속성을 false
	  {
		for(i=0;i<n;i++)   
		  subchk[i].checked=false;  
	  }	  
  }
  function sub_chk() // subchk가 전부 체크 => 대장 체크 , 하나라도 해제 => 대장 해제
  {
	 var subchk=document.getElementsByClassName("subchk");
     var n=subchk.length;
     
     // subchk의 체크여부를 판단
     var chk=0;
     for(i=0;i<n;i++)
       if(!subchk[i].checked)// (subchk[i].checked==false)
    	   chk=1;
     
	 if(chk==0)
	    document.getElementById("mainchk").checked=true;
	 else
		document.getElementById("mainchk").checked=false;
  }
  function sel_del()
  {
	  var subchk=document.getElementsByClassName("subchk");
	  var n=subchk.length;
	  alert(n);
	  for(i=n-1;i>=0;i--)
	  {	 
		 if(subchk[i].checked)
		 {	 
	       $(".data").eq(i).remove();
	       $(".ho1").eq(i).remove();
	       $(".ho2").eq(i).remove();
	       $(".ho3").eq(i).remove();
		 }
	  }
	  
	  // class 이름 : data, ho1, ho2, ho3을 숨기기 (조건:checked가 참)
  }
</script>

 <div id=fourth> <!-- 주문내역 -->
   <table width=800 border=0>
     <tr>
       <td colspan=9> ! 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다 </td>
     </tr>
     <tr>
       <td colspan=6> 국내배송상품 주문내역 </td>
       <td colspan=3> <input type=button value="이전페이지" onclick="history.back()"> </td>
     </tr>
     <tr>
       <td> <input type=checkbox id=mainchk onclick=main_chk()> </td>
       <td> 이미지 </td>
       <td> 상품정보 </td>
       <td> 판매가 </td>
       <td> 수량 </td>
       <td> point </td>
       <td> 배송구분 </td>
       <td> 배송비 </td>
       <td> 합계 </td>
     </tr>
<%
// 구입하는 상품의 갯수만큼 반복문을 통해 상품정보를 출력
int chong_jumun=0; // 총주문금액을 구할변수 : price, su
int halin=0; // 할인금액
int buga=0;  // 부가금액
int chong_point=0;
for(int i=0; i<pcode.length; i++)
{
  String sql="select * from product where pcode='"+pcode[i]+"'";
  ResultSet rs=stmt.executeQuery(sql);
  rs.next();
  // for문내에서 만들어진 변수는 지역변수(for문종료되면 사라진다)
  //int chong=Integer.parseInt(su)*rs.getInt("price");
  // 총주문금액 누적
  chong_jumun=chong_jumun+(rs.getInt("price")*Integer.parseInt(su[i]));
  chong_point=chong_point+(rs.getInt("point")*rs.getInt("price")*Integer.parseInt(su[i]))/100;
%>   
<div class=data>  
 <input type=hidden name=pcode value="<%=pcode[i]%>">
 <input type=hidden name=psize value="<%=psize[i]%>">
 <input type=hidden name=su value="<%=su[i]%>">
 <input type=hidden name=cart_id value="<%=cart_id[i]%>">
 <input type=hidden name=halin value="<%=0%>">
 <input type=hidden name=buga value="<%=0%>">
 <input type=hidden name=point value="<%=(rs.getInt("point")*rs.getInt("price"))/100%>">
 <input type=hidden name=mem_point value="<%=0%>">
 <input type=hidden name=cou_point value="<%=0%>">
</div>    
     <tr class="ho1">
       <td> <input type=checkbox class=subchk onclick="sub_chk()"> </td>
       <td> <img src="img/<%=rs.getString("plist")%>" width=50> </td>
       <td>
         <%=rs.getString("pname")%> <p>
         [옵션 : <%=psize[i]%>]
       </td>
       <td> <%=Util.comma(rs.getInt("price"))%> </td>
       <td> <%=su[i]%> </td>
       <td> <%=Util.comma((rs.getInt("point")*rs.getInt("price")*Integer.parseInt(su[i]))/100)%> </td>
       <td> 기본배송 </td>
       <td> [무료] </td>
       <td> <%=rs.getInt("price")*Integer.parseInt(su[i]) %></td>
                        <!-- 합계금액 -->
     </tr>
     <tr class="ho2">
       <td>&nbsp;</td>
       <td colspan=3> [기본배송] </td>
       <td colspan=5> 상품구매금액
        <span id=gu1><%=rs.getInt("price")*Integer.parseInt(su[i]) %></span>
        +배송비 0[무료]=합계 : <span id=gu2><%=rs.getInt("price")*Integer.parseInt(su[i]) %></span>
     </tr>
     <tr class="ho3">
       <td colspan=5> 선택상품을 <input type=button class=hobtn value="x 삭제하기"> </td>
       <td colspan=4> <input type=button  value="이전페이지"> </td>
     </tr>

<% 
 }  // 상품출력 반복문 완료
%>
    <tr>
      <td colspan="9"> <input type="button" onclick=sel_del() value="선택상품삭제"> </td>
    </tr>
   </table>
 </div>
<!-- 상품하나 출력끝 -->
<!--  주문정보 시작 : 현재 로그인 한 사람의 정보를 가져와서 출력 -->
<%
    String sql="select * from member where userid='"+session.getAttribute("userid")+"'";
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
%>
 <div id=fifth> 
   <table width=800 border=1>
     <tr>
       <td> 주문정보 </td>
       <td> *필수입력사항 </td>
     </tr>
     <tr>
       <td> 주문하시는분 * </td>
       <td> <input type=text name=name value="<%=rs.getString("name")%>"> </td>
     </tr> 
     <tr>
       <td rowspan=3> 주소 * </td>
       <td>
        <input type=text name=zip value="<%=rs.getString("zip")%>">
        <input type=button value=우편번호 onclick=juso_search(0)> 
       </td>
     </tr> 
     <tr>
       <td> <input type=text name=juso1 value="<%=rs.getString("juso1")%>"> </td>
     </tr> 
     <tr>
       <td> <input type=text name=juso2 value="<%=rs.getString("juso2")%>"> </td>
     </tr>
     <%
         String phone=rs.getString("phone");  // phone="02-1564-4646"
         String[] pho=phone.split("-");
     %>
     <tr>
       <td> 일반전화 * </td>
       <td> 
         <select name=p1 id=p1>
           <option value=02> 02 </option>
           <option value=031> 031 </option>
           <option value=032> 032 </option>
           <option value=033> 032 </option>
         </select>
         <input type=text name=p2 value="<%=pho[1]%>">
         <input type=text name=p3 value="<%=pho[2]%>">
       </td>
     </tr> 
     <%
         String hphone=rs.getString("hphone");  // phone="02-1564-4646"
         String[] hpho=hphone.split("-");
     %>     
     <tr>
       <td> 휴대전화  </td>
       <td> 
         <select name=hp1 id=hp1>
           <option value=010> 010 </option>
           <option value=011> 011 </option>
           <option value=016> 016 </option>
           <option value=017> 017 </option>
         </select>
         <input type=text name=hp2 value="<%=hpho[1]%>">
         <input type=text name=hp3 value="<%=hpho[2]%>">
       </td>
     </tr> 
     <%
         String email=rs.getString("email");  // phone="02-1564-4646"
         String[] ema=email.split("@");
     %>  
     <tr>
       <td> 이메일 * </td>
       <td> 
         <input type=text name=email1 class=in3 value="<%=ema[0]%>"> @
         <input type=text name=email2 class=in3 value="<%=ema[1]%>">
         <select name=email_server onchange=email_chg(this)>
           <option value=""> 직접입력 </option>
           <option value="naver.com"> naver.com </option>
           <option value="daum.net"> daum.net </option>
           <option value="google.com"> google.com </option>
           <option value="hotmail.com"> hotmail.com </option>
         </select>
         
       </td>
     </tr> 
   </table>
 </div>
<!-- 주문정보 끝 -->
 <!-- 배송정보 시작   -->
 <div id=sixth> 
   <input type=hidden name=bid>
    
    <!-- 배송지테이블에 저장된 주소를 사용할경우 여기에 값을 전달 : baesong id -->
   <table width=800 border=1>
     <tr>
       <td> 배송정보 </td>
       <td> *필수입력사항 </td>
     </tr>
     <tr>
       <td> 배송지 선택 </td>
       <td> 
           <input type=radio name=bae onclick=bae_juso(1) checked> 주문자정보와 동일 
           <input type=radio name=bae onclick=bae_juso(2)> 새로운 배송지
           <input type=button value=주소록보기 onclick=bae_open()>
          <!--  DB에 있는 등록된 배송지 주소를 가져오기 -->
     </tr>
     <tr>
       <td> 받으시는분 * </td>
       <td> <input type=text name=bname value="<%=rs.getString("name")%>"> </td>
     </tr> 
     <tr>
       <td rowspan=3> 주소 * </td>
       <td>
        <input type=text name=bzip value="<%=rs.getString("zip")%>">
        <input type=button value=우편번호 onclick=juso_search(1)> 
       </td>
     </tr> 
     <tr>
       <td> <input type=text name=bjuso1 value="<%=rs.getString("juso1")%>"> </td>
     </tr> 
     <tr>
       <td> <input type=text name=bjuso2 value="<%=rs.getString("juso2")%>"> </td>
     </tr>
     <tr>
       <td> 일반전화 * </td>
       <td> 
         <select name=bp1 id=bp1>
           <option value=02> 02 </option>
           <option value=031> 031 </option>
           <option value=032> 032 </option>
           <option value=033> 032 </option>
         </select>
         <input type=text name=bp2 value="<%=pho[1]%>">
         <input type=text name=bp3 value="<%=pho[2]%>">
       </td>
     </tr> 
     <tr>
       <td> 휴대전화  </td>
       <td> 
         <select name=bhp1 id=bhp1>
           <option value=010> 010 </option>
           <option value=011> 011 </option>
           <option value=016> 016 </option>
           <option value=017> 017 </option>
         </select>
         <input type=text name=bhp2 value="<%=hpho[1]%>">
         <input type=text name=bhp3 value="<%=hpho[2]%>">
       </td>
     </tr> 
     <tr>
       <td> 배송메세지 </td>
       <td> <textarea cols=50 rows=3 name=bae_msg></textarea> </td>     
     </tr> 
   </table>
 </div>
<!-- 배송정보 끝 -->
 <div id=seventh> 
   <div> 결제예정금액 </div>
   <table width=800 border=1>
     <tr>
       <td> 총 주문 금액 <input type=button value=내역보기> </td>
       <td> 총할인 + 부가결제 금액  </td>
       <td> 총 결제 예정 금액 </td>
     </tr>
     <tr>
       <td> <span id=chong> <%=Util.comma(chong_jumun)%> </span> </td>
       <td> <span id=halin> <%=Util.comma(halin+buga) %> </span> </td>
       <td> <span id=hap> <%=Util.comma(chong_jumun-(halin+buga)) %> </span> </td>
     </tr>
   </table>
   <table width=800 border=1>
     <tr>
       <td> 총 할인 금액 </td>
       <td> <span id=halin1> <%=halin%> </span> </td>
     </tr>
     <tr>
       <td> 총 부가결제 금액 </td>
       <td> <span id=buga> <%=buga%> </span> </td>
     </tr>
   </table> 
 </div>
 <div id=eighth> 
   <div> 결제수단 <input type=checkbox name=pay_sudan value=1> 결제수단과 입력정보를 다음에도 사용 </div>
   <table width=800 border=1>
    <tr>
      <td width=600> <!-- 결제수단의 왼쪽부분 -->
        <div id=top>
          <input type=radio value=0 name=pay_method checked onclick=pay_view(0)>무통장입금
          <input type=radio value=1 name=pay_method onclick=pay_view(1)>카드결제
          <input type=radio value=2 name=pay_method onclick=pay_view(2)>에스크로(실시간 계좌이체)
          <input type=radio value=3 name=pay_method onclick=pay_view(3)>휴대폰결제
        </div>
        <div id=bottom>
           <div class=pay_method>  <!-- 무통장입금 -->
             <table width=500 border=1>
               <tr>
                 <td> 입금자명 </td>
                 <td> <input type=text name=ipgum> </td>
               </tr>
               <tr>
                 <td> 입금은행 </td>
                 <td>
                     <select name=ipbank>
                       <option value=0> 선택해주세요 </option>
                       <option value=1> 농협123-45-67890 </option>
                       <option value=2> 신한123-45-123456 </option>
                     </select> <br>
                     <input type=button value="은행사이트 바로가기">
                 </td>
               </tr>
             </table>
             <div> ! 최소결제 가능금액은 결제금액에서 배송비를 제외한 금액입니다 </div>
           </div>
           <div class=pay_method> <!-- 카드결제 -->
              ! 최소결제 가능금액은 결제금액에서 배송비를 제외한 금액입니다 <p>
              ! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다. 
           </div>
           <div class=pay_method> <!-- 에스크로 -->
             <table width=500 border=1>
               <tr>
                 <td> 예금주명 </td>
                 <td> <input type=text name=ipgum> </td>
               </tr>
               <tr>
                 <td> &nbsp; </td>
                 <td> <input type=checkbox>에스크로(구매안전)서비스를 적용합니다.
               </tr>
             </table>
             <div> ! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다. </div>
           </div>
           <div class=pay_method> <!-- 휴대폰결제 -->
               ! 소액결제의 경우 PG사 정책에 따라 결제금액 제한이 있을수 있습니다.
           </div>
        </div>
      </td>
      <td>     <!-- 결제수단의 오른쪽 부분 -->
         <div> <span id=pay_sudan></span> 최종결제금액</div>
         <div id=pay_hap><%=Util.comma(chong_jumun-(halin+buga)) %></div>
         <div> <input type=submit value=결제하기> </div>
         <div> 
            <table>
              <tr>
                <td> 총 적립예정금액 </td>
                <td> <span id=chong_juk> <%=Util.comma(chong_point) %></span>P </td>
              </tr>
              <tr>
                <td> 회원 point </td>
                <td> <span id=mem_juk> 0 </span>P </td>
              </tr>
              <tr>
                <td> 쿠폰 point </td>
                <td> <span id=cou_juk> 0 </span>P </td>
              </tr>
            </table>
         </div>
      </td>
    </tr>
   </table>
 </div>
 <div id=ninth> 
   <div>무이자할부이용안내</div>
   <div>
   - 무이자할부가 적용되지 않은 상품과 무이자할부가 가능한 상품을 동시에 구매할 경우 전체 주문 상품 금액에 대해 무이자할부가 적용되지 않습니다.
   - 무이자할부를 원하시는 경우 장바구니에서 무이자할부 상품만 선택하여 주문하여 주시기 바랍니다.
   </div> 
 </div>
 <div id=tenth> 
    <div>이용 안내</div>
    <div> <jsp:include page="an.txt"/></div>
 </div>
</form>
<!-- 주문 : pro_jumun.jsp 끝 -->
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
  <script>
    function jumun_init()
    {
    	var p="<%=pho[0]%>";  // 02
    	var hp="<%=hpho[0]%>"; // 010
    	var p1=document.getElementById("p1");
    	var hp1=document.getElementById("hp1");
    	
    	for(i=0;i<p1.length;i++)
    	{  // alert(p1[i].value+" "+p)
    		if(p1[i].value==p)
    			{
    			p1.selectedIndex=i;
    			document.getElementById("bp1").selectedIndex=i;
    			}
    	}
    	
    	for(i=0;i<hp1.length;i++)
    	{  //alert(hp1[i].value+" "+hp)
    		if(hp1[i].value==hp)
    			{
    			hp1.selectedIndex=i;
    			document.getElementById("bhp1").selectedIndex=i;
    			}
    	}
    }
    $(function()
    {
    	$(".hobtn").click(function()
    	{
    		var $test=$(".hobtn");
    		var n=$test.index(this); // 연속적이지 않은 클래스의 인덱스값을 구하기
    		$(".ho1").eq(n).remove();
    		$(".ho2").eq(n).remove();
    		$(".ho3").eq(n).remove();
    		$(".data").eq(n).remove();
    	});
    });
    document.onkeydown=reload_no;
    function reload_no()
    {
    	if(event.keyCode==116)
    		return false;
    }
  </script>
</body>
</html>
 <%
   stmt.close();
   conn.close();
 %>
















