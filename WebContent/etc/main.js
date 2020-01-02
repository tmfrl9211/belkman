// bae_list.jsp
function opener_input(bid,n,z,j1,j2,p,hp) // 이름, 우편번호, 주소1, 주소2, 전화번호, 휴대폰
{    
	opener.document.pkc.bid.value=bid;
	opener.document.pkc.bname.value=n;
	opener.document.pkc.bzip.value=z;
	opener.document.pkc.bjuso1.value=j1;
	opener.document.pkc.bjuso2.value=j2;
	var pp=p.split("-"); // 전화번호
	var hh=hp.split("-"); // 휴대폰
	opener.document.pkc.bp1.value=pp[0];
	opener.document.pkc.bp2.value=pp[1];
	opener.document.pkc.bp3.value=pp[2];
	opener.document.pkc.bhp1.value=hh[0];
	opener.document.pkc.bhp2.value=hh[1];
	opener.document.pkc.bhp3.value=hh[2];
	close();
}
function chk_state2()
{  // 하위에 있는 체크박스가 하나라도 해제되어있다면 메인체크박스가 해제
   // 하위에 있는 체크박스의 해제 여부를 판단 
	var n=document.getElementsByClassName("bae_sub").length;
	var chk=0;
	for(i=0;i<n;i++)
	   if(document.getElementsByClassName("bae_sub")[i].checked==false)
		   chk=1;  // 하나라도 체크가 해제되면 chk값은 1이 된다.
	
	if(chk==0) // 체크가 해제된 것이 하나라도 없다면 chk는 0을 가진다.
		document.getElementById("bae_main").checked=true;
	else
		document.getElementById("bae_main").checked=false;
}
function chk_state(pp) // 배송주소록 체크관련
{
	var n=document.getElementsByClassName("bae_sub").length;
	if(pp.checked) // input type=checkbox의 체크여부 (true, false)
    {   // 밑에 있는 체크박스를 전부 체크시킨다.
	    for(i=0;i<n;i++)
	      document.getElementsByClassName("bae_sub")[i].checked=true;
	}
	else
	{   // 밑에 있는 체크박스를 전부 체크해제
		for(i=0;i<n;i++)
		  document.getElementsByClassName("bae_sub")[i].checked=false;
	}	
}

//pro_jumun.jsp
function pay_view(n) // 결제수단에 따른 하위내용 변화
{
	// 기존에 보였던 내용을 숨기기
	var pay=document.getElementsByClassName("pay_method");
	for(i=0;i<4;i++)
		pay[i].style.display="none"; // 모두 숨기기
	// 선택된 결제수단의 내용을 보이기
	pay[n].style.display="block";
}
function bae_open() // 배송지 주소를 새창으로 띄우기
{
   window.open("bae_list.jsp","","width=800,height=600");  // 오픈할문서, 창이름, 창의 속성	
}

function bae_juso(chk)
{
   if(chk==1)  // 주문자 정보와 동일
   {
	   document.pkc.bname.value=document.pkc.name.value;
	   document.pkc.bzip.value=document.pkc.zip.value;
	   document.pkc.bjuso1.value=document.pkc.juso1.value;
	   document.pkc.bjuso2.value=document.pkc.juso2.value;
	   document.pkc.bp1.selectedIndex=document.pkc.p1.selectedIndex;
	   document.pkc.bp2.value=document.pkc.p2.value;
	   document.pkc.bp3.value=document.pkc.p3.value;
	   document.pkc.bhp1.selectedIndex=document.pkc.hp1.selectedIndex;
	   document.pkc.bhp2.value=document.pkc.hp2.value;
	   document.pkc.bhp3.value=document.pkc.hp3.value;
   }	
   else        // 비우기
   {
	   document.pkc.bname.value="";
	   document.pkc.bzip.value="";
	   document.pkc.bjuso1.value="";
	   document.pkc.bjuso2.value="";
	   document.pkc.bp1.selectedIndex=0;
	   document.pkc.bp2.value="";
	   document.pkc.bp3.value="";
	   document.pkc.bhp1.selectedIndex=0;
	   document.pkc.bhp2.value="";
	   document.pkc.bhp3.value="";
   }	   
}

// pro_content.jsp
function comma(price)
{       
	   price=price+"";
	   price=price.replace(/\B(?=(\d{3})+(?!\d))/g,",");
	    
	   return price;
}
function page_wish()
 {
	 location="wish_view.jsp"; // 세션에 사용자값이 있다..
 }
 function not_wish()
 {
	 document.getElementById("wish_layer").style.display="none";
 }
 var wish=new XMLHttpRequest();  // cart테이블에 저장하는 ajax통해
 
 function move_wish(pid)   
 {    
	 url="wish_ok.jsp?pid="+pid;
	 wish.open("get",url);
	 wish.send();
 }
 wish.onreadystatechange=function()
 {
	 if(wish.readyState == 4)  
	 {    
	     if(wish.responseText.trim()=="ok") // cart_ok.jsp에서 out.print() 내용
	     {  // 레이어 보이기
	    	document.getElementById("wish_layer").style.display="block"; // 사용자에게 선택을 보여주기
	     }
	 }
 }


 function page_cart()
 {
	 location="../myshop/cart_list.jsp"; // 세션에 사용자값이 있다..
 }
 function not_cart()
 {
	 document.getElementById("cart_layer").style.display="none";
 }
 var cart=new XMLHttpRequest();  // cart테이블에 저장하는 ajax통해
 
 function move_cart(pid)   
 {    
	 // 수량과 사이즈값을 가져오기
	 var size=document.getElementById("psize").value;
	 var su=document.getElementById("su").value;
	 url="cart_ok.jsp?pid="+pid+"&psize="+size+"&su="+su;
	 cart.open("get",url);
	 cart.send();
 }
 cart.onreadystatechange=function()
 {
	 if(cart.readyState == 4)  
	 {    
	     if(cart.responseText.trim()=="ok") // cart_ok.jsp에서 out.print() 내용
	     {  // 레이어 보이기
	    	document.getElementById("cart_layer").style.display="block"; // 사용자에게 선택을 보여주기
	     }
	 }
 }

// pro_list.jsp
function move_content(id) // 상품상세 페이지 이동
{
    location="pro_content.jsp?id="+id;
}

function chg(n)
{
	document.getElementById("email").value="";
	document.getElementById("hphone").value="";
	if(n==0)
	{
		document.getElementsByClassName("aa")[0].innerText="》이메일로 찾기";
		document.getElementById("email").style.display="block";
		document.getElementById("hphone").style.display="none";
	}
	else
	{
		document.getElementsByClassName("aa")[0].innerText="》휴대폰번호 찾기";
		document.getElementById("email").style.display="none";
		document.getElementById("hphone").style.display="block";
	}
}
/*function chg(n)
{   
	if(n==0)
    {
		document.getElementsByClassName("ee")[0].style.display="block";
		document.getElementById("email").disabled=false;
		document.getElementsByClassName("hh")[0].style.display="none";
		document.getElementById("hphone").disabled=true;
		document.getElementsByClassName("aa")[0].innerText="》이메일로 찾기 ";
    }
	else
    {
		document.getElementsByClassName("hh")[0].style.display="block";
		document.getElementById("hphone").disabled=false;
		document.getElementsByClassName("ee")[0].style.display="none";
		document.getElementById("email").disabled=true;
		document.getElementsByClassName("aa")[0].innerText="》휴대폰번호 찾기 ";
    }
}*/

function main_check() // 4개의 체크중에 하나라도 체크가 해제되면 => 메인체크를 해제
{
   // 4개가 전부 체크되었는지 , 하나라도 체크가 해제되었는지 판단!!	
   var ck=0;
   var memchk=document.getElementsByClassName("chk");
   for(i=0;i<=3;i++)
	  if(memchk[i].checked==false)
		  ck=1;
   
   if(ck == 0)
	document.getElementById("chk_main").checked=true;
   else
	document.getElementById("chk_main").checked=false;
	
}
function check_onoff(pp)
{ // check가 되면 4개의 checkbox를 true , check가 해제되면 4개의 checkbox false 
	
	var memchk=document.getElementsByClassName("chk");
	if(pp.checked) // true or false
	{
	  for(i=0;i<=3;i++)
		memchk[i].checked=true;  // 4개를 check시킨다
	}
	else
	{
	 for(i=0;i<=3;i++)
		memchk[i].checked=false; // 4개를 해제
	}
	/*memchk[0].checked=true;
	memchk[1].checked=true;
	memchk[2].checked=true;
	memchk[3].checked=true;*/
}
function email_chg(pp) // member.jsp
{
	 document.pkc.email2.value=pp.value;
}
function check_equal() // 비밀번호의 값이 같은지 여부 확인
{ // 두개의 값을 다 가져와야 된다..
	// form에 입력된 값 => document.폼이름.입력양식이름.value
	//               => id,class로 가져오는 방법
	var p1=document.pkc.pwd.value;
	var p2=document.pkc.pwd2.value;
	if(p1 != p2) // 다르다면
	{
		alert("비밀번호가 틀립니다");
		document.pkc.pwd.value="";
		document.pkc.pwd2.value="";
		//document.pkc.pwd1.focus(); // focus는 적절히 사용!!
	}
}
function check_len(pp) // 비밀번호의 길이가 4~16자인지 확인
{
	var len=pp.value.length; //비밀번호의 길이
	if(len>=4 && len<=16)
		pp.style.color="blue";
	else
	{
		alert("비밀번호의 길이가 적절하지 않습니다");
		pp.value="";
		//pp.focus();
	}
}
function check_userid(pp) // 아이디의 길이가 4~16자인지 확인
{  // form에 입력된 값 => document.폼이름.입력양식이름.value
   // 1개의 양식을 처리할때는 this하는게 편하다.
 
	var len=pp.value.length;
	if(len>=4 && len<=16)
		pp.style.color="blue";  // 글자색을 파랗게
	else
    {
		alert("아이디의 길이가 적절하지 않습니다");
		pp.value="";  // 비운다
		//pp.focus();   // 커서를 위치
    }
}
function view(n,pp,hei) // nav.jsp에서의 메뉴클릭
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
	document.getElementsByClassName("menu")[n].style.display="block";
	pp.style.height=hei+"px"; // 주메뉴가 있는 li태그
}