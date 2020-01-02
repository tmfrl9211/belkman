<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="http://code.jquery.com/jquery-latest.js"></script>

<script>
  
  function chk()
  {
	  //$(window).scrollTop(0);
	 document.documentElement.scrollTop=0;
  }
  function move()
  {
	 setTimeout(function()
	 {
	  var chu=document.documentElement.scrollTop;
	  document.getElementById("bbb").style.top=(500+chu)+"px";
	 },1000);
  }
  window.onscroll=move; // 브라우저가 스크롤 될때 move함수를 실행
</script>
<style>
#bbb{
 position:absolute;
 left:900px;
 top:500px;
 }
 #ccc {
  position:fixed;
  left:900px;
  top:550px;
 }
</style>
</head>
<body>
제일위!!
asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

<input id=bbb type=button onclick=chk() value=top1>
<input id=ccc type=button onclick=chk() value=top2>


asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>
asdfasdfadsfasdfa<p>

</body>
</html>