<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  <!-- bae_view.jsp --> 
<html>         <!-- nav, bae_list.jsp, footer 포함된 문서 -->
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../etc/main.css">
<script src="../etc/main.js"></script>
</head>
<body>
  <jsp:include page="../nav.jsp" flush="false" />
  <div id=right>
    <section class=bae_view_section> 
      <jsp:include page="../product/bae_list.jsp" flush="false">
        <jsp:param name="bb" value="1"/>
      </jsp:include>
    </section>
    <jsp:include page="../footer.jsp" flush="false" />
  </div>  
</body>
</html>