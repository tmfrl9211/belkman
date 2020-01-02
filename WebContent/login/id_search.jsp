<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css?after">
<script src="../etc/main.js"></script>
</head>
<body id=aaa>
  <button onclick="alert(sub[4].innerHTML)"></button>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=id_search_section>
     <form name=pkc method=post action=id_search_ok.jsp>
      <div id=first> 아이디 찾기 </div>
      
      <div id=search_main align=center>
        <div id=sub> 아이디 찾기 </div>
        <div id=sub>
            <div id=aa> 》회원유형 </div>
            <div id=bb> 
               <select name=gubun class=inp>
                 <option value=1> 개인회원 </option>
                 <option value=2> 개인사업자 회원 </option>
                 <option value=3> 법인사업자 회원 </option>
                 <option value=4> 외국인회원 </option>
               </select>
            </div>
        </div>
        <div id=sub>
            <div id=aa> </div>
            <div id=bb> 
              <input type=radio name=chk checked onclick=chg(0)>이메일
              <input type=radio name=chk onclick=chg(1)>휴대폰번호
            </div>
        </div>
        <div id=sub>
            <div id=aa> 》이름 </div>
            <div id=bb> <input type=text name=name class=inp> </div>
        </div>
        <div id=sub>
            <div id=aa class=aa> 》이메일로 찾기 </div>
            <div id=bb class=ee> 
              <input type=text name=email class=inp id=email placeholder="이메일">  
              <input type=text name=hphone class=inp id=hphone style="display:none" placeholder="휴대폰"> 
            </div>
        </div>
        <div id=sub>
            <input type=submit value=확인 class=inp2>
        </div>
      </div>
     </form>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div> 
</body>
</html>