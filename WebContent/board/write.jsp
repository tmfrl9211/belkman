<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <form method=post action=write_ok.jsp>
   이름 <input type=text name=name> <p>
   제목 <input type=text name=title> <p>
   내용 <textarea cols=40 rows=5 name=content></textarea> <p>
   <input type=submit value=저장>
  </form>
</body>
</html>