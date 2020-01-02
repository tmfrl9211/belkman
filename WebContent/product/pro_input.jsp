<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
  function chg_jung(pp) // pp => 01~07까지의 값
  {
	 switch(pp)
	 {
	  case "01":
	  // SUITS
	   document.pkc.jung.options.length=7;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[5].value="06";
	   document.pkc.jung.options[6].value="07";
	   document.pkc.jung.options[0].text="싱글수트";
	   document.pkc.jung.options[1].text="스트라이프수트";
	   document.pkc.jung.options[2].text="비즈니스니트";
	   document.pkc.jung.options[3].text="더블수트";
	   document.pkc.jung.options[4].text="체크수트";
	   document.pkc.jung.options[5].text="드레스슈즈";
	   document.pkc.jung.options[6].text="수트악세사리";
	   break;
	  // TOP
	  case "02":
	   document.pkc.jung.options.length=4;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[0].text="긴팔티셔츠";
	   document.pkc.jung.options[1].text="반팔티셔츠";
	   document.pkc.jung.options[2].text="헨리넥";
	   document.pkc.jung.options[3].text="니트";
	   break;
	 // SHIRTS
	  case "03":
	   document.pkc.jung.options.length=5;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[0].text="스트라이프 셔츠";
	   document.pkc.jung.options[1].text="오픈카라 셔츠";
	   document.pkc.jung.options[2].text="솔리드 셔츠";
	   document.pkc.jung.options[3].text="체크 셔츠";
	   document.pkc.jung.options[4].text="Etc";
	   break;
	 // PANTS
	  case "04":
	   document.pkc.jung.options.length=6;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[5].value="06";
	   document.pkc.jung.options[0].text="슬랙스";
	   document.pkc.jung.options[1].text="면바지";
	   document.pkc.jung.options[2].text="청바지";
	   document.pkc.jung.options[3].text="반바지";
	   document.pkc.jung.options[4].text="조거팬츠";
	   document.pkc.jung.options[5].text="Etc";
	   break;
	 // OUTER
	  case "05":
	   document.pkc.jung.options.length=5;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[0].text="코트";
	   document.pkc.jung.options[1].text="자켓/블레이저";
	   document.pkc.jung.options[2].text="가디건";
	   document.pkc.jung.options[3].text="베스트";
	   document.pkc.jung.options[4].text="점퍼";
	   break;
	 // SHOES
	  case "06":
	   document.pkc.jung.options.length=5;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[0].text="드레스슈즈";
	   document.pkc.jung.options[1].text="스니커즈";
	   document.pkc.jung.options[2].text="벨크만슈즈";
	   document.pkc.jung.options[3].text="부츠/워커";
	   document.pkc.jung.options[4].text="Etc";
	   break;
	 // ACCESSORY
	  case "07":
	   document.pkc.jung.options.length=13;
	   document.pkc.jung.options[0].value="01";
	   document.pkc.jung.options[1].value="02";
	   document.pkc.jung.options[2].value="03";
	   document.pkc.jung.options[3].value="04";
	   document.pkc.jung.options[4].value="05";
	   document.pkc.jung.options[5].value="06";
	   document.pkc.jung.options[6].value="07";
	   document.pkc.jung.options[7].value="08";
	   document.pkc.jung.options[8].value="09";
	   document.pkc.jung.options[9].value="10";
	   document.pkc.jung.options[10].value="11";
	   document.pkc.jung.options[11].value="12";
	   document.pkc.jung.options[12].value="13";
	   document.pkc.jung.options[0].text="타이/행거치프";
	   document.pkc.jung.options[1].text="머플러/스카프";
	   document.pkc.jung.options[2].text="목걸이/팔찌";
	   document.pkc.jung.options[3].text="벨트/서스펜더";
	   document.pkc.jung.options[4].text="아이웨어";
	   document.pkc.jung.options[5].text="모자";
	   document.pkc.jung.options[6].text="가방";
	   document.pkc.jung.options[7].text="타이핀/부토니에";
	   document.pkc.jung.options[8].text="양말";
	   document.pkc.jung.options[9].text="시계";
	   document.pkc.jung.options[10].text="벨크만악세사리";
	   document.pkc.jung.options[11].text="방향제";
	   document.pkc.jung.options[12].text="Etc";
	   break;
	 }
  }
  function code_gen()
  {
	  var d=document.pkc.dae.value;
	  var j=document.pkc.jung.value;
	  var n=document.pkc.nara.value;
	  var m=document.pkc.made.value;
	  
	  document.pkc.pcode.value="p"+d+j+n+m;
	  return true;
  }
 </script>
</head>
<body>
 <form name=pkc onsubmit="return code_gen()" method=post action=pro_input_ok.jsp enctype=multipart/form-data>
  <input type=hidden name=pcode>
  대분류 <select name=dae onchange="chg_jung(this.value)">
          <option value="01"> suits </option>
          <option value="02"> top </option>
          <option value="03"> shirts </option>
          <option value="04"> pants </option>
          <option value="05"> outer </option>
          <option value="06"> shoes </option>
          <option value="07"> accessory </option>
       </select>
 중분류 <select name=jung>
          <option value="01"> 싱글수트 </option>
          <option value="02"> 스트라이프수트 </option>
          <option value="03"> 비즈니스수트 </option>
          <option value="04"> 더블수트 </option>
          <option value="05"> 체크수트 </option>
          <option value="06"> 드레스슈즈 </option>
          <option value="07"> 수트악세사리 </option>
       </select>
제조국 <select name=nara>
          <option value="01"> 모름 </option>
          <option value="02"> 대한민국 </option>
          <option value="03"> 미국 </option>
          <option value="04"> 중국 </option>
          <option value="05"> 일본 </option>
      </select>
제조회사 <select name=made>
          <option value="01"> 모름 </option>
          <option value="02"> LG </option>
          <option value="03"> 코오롱 </option>
          <option value="04"> 동대문 </option>
          <option value="05"> 제일모직 </option>
      </select>  <p>
        
상품이름 <input type=text name=pname> <p>
상품가격 <input type=text name=price> <p>
세탁정보 <select name=pwash>
          <option value=0> 물세탁 </option>
          <option value=1> 손세탁 </option>
          <option value=2> 드라이크리닝 </option>
          <option value=3> 울세탁 </option>
        </select> <p>
생산일자 <select name=yy>
          <option value=2019> 2019년 </option>
          <option value=2018> 2018년 </option>
          <option value=2017> 2017년 </option>
        </select>
        <select name=mm>
          <%
            for(int i=1;i<=12;i++)
            {
          %>
             <option value=<%=i%>> <%=i%>월
          <%  	
            }
          %>
        </select>
        <select name=dd>
          <%
            for(int i=1;i<=31;i++)
            {
          %>
             <option value=<%=i%>> <%=i%>일
          <%  	
            }
          %>
        </select> <p>
상품입고수량 <input type=text name=pinput> <p>
상품그림(list) <input type=file name=plist> <p>
상품그림(메인) <input type=file name=pmain> <p>
상품상세정보 <input type=file name=pdt_img> <p>
<input type=submit value=상품저장>        
    </form>
</body>
</html>












