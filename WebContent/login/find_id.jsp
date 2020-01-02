<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="belkman.Dto.Dto" %>   
<%@page import="belkman.jdbc.Connect" %>
<%
   request.setCharacterEncoding("utf-8");

/*
   Connect connect=new Connect();
   Connection conn = connect.connection(); */
   
   Connection conn=Connect.connection2();
   
%>
<jsp:useBean id="dto" class="belkman.Dto.Dto">
  <jsp:setProperty name="dto" property="*"/>
</jsp:useBean>

<script>
function hp_in(pp)
{
	  pp.hphone.value=pp.hp1.value+"-"+pp.hp2.value+"-"+pp.hp3.value;
}
</script>
<body>
<form method=post action=find_id_ok.jsp  onsubmit="return hp_in(this)" name=id_chk>
<table>
<caption>가입시 입력한 정보를 입력해주세요. <p></caption>
<tr>
<td> 이름 : </td>
<td><input type=text name=name></td>
</tr>
<tr>
        <td class=td1> 휴대전화* </td>
        <td> 
            <select name=hp1>
              <option value=010> 010 </option>
              <option value=011> 011 </option>
              <option value=016> 016 </option>
              <option value=017> 017 </option>
            </select>
            <input type=text name=hp2 class=in2>
            <input type=text name=hp3 class=in2>
        </td>
       </tr> 
</table>
<input type=submit value=확인>
</form>
</body>