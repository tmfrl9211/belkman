<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %> 
<%@ page import="belkman.jdbc.Connect" %> 
<%
    Connection conn=Connect.connection2();
    Statement stmt=conn.createStatement();
    
    String id=request.getParameter("id");
    String sql="select * from baesong where id="+id;
    ResultSet rs=stmt.executeQuery(sql);
    rs.next();
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script>
   window.onload=function()
   {
	   var phone="<%=rs.getString("phone")%>";
	   var hphone="<%=rs.getString("hphone")%>";
	   var pho=phone.split("-");
	   var hpho=hphone.split("-");
	   document.pkc.p1.value=pho[0];
	   document.pkc.p2.value=pho[1];
	   document.pkc.p3.value=pho[2];
	   document.pkc.hp1.value=hpho[0];
	   document.pkc.hp2.value=hpho[1];
	   document.pkc.hp3.value=hpho[2];
   }
 </script>
</head>
<body>
 <form method=post action=bae_update_ok.jsp name=pkc>
   <input type=hidden name=id value=<%=id%>>
    <table>
      <tr>
        <td> 배송지명 </td>
        <td> <input type=text name=bname value="<%=rs.getString("bname")%>"> </td>
      </tr>
      <tr>
        <td> 성명 </td>
        <td> <input type=text name=name value="<%=rs.getString("name")%>"> </td>
      </tr>
      <tr>
        <td rowspan=3> 주소 </td>
        <td> 
             <input type=text name=zip value="<%=rs.getString("zip")%>"> 
             <input type=button value=우편번호 onclick=juso_search()>
        </td>
      </tr>
      <tr>
        <td> <input type=text name=juso1 value="<%=rs.getString("juso1")%>"> 기본주소
      </tr>
      <tr>
        <td> <input type=text name=juso2 value="<%=rs.getString("juso2")%>"> 나머지주소
      </tr> 
      <tr>
       <td> 일반전화 * </td>
       <td> 
         <select name=p1 id=p1>
           <option value=02> 02 </option>
           <option value=031> 031 </option>
           <option value=032> 032 </option>
           <option value=033> 032 </option>
         </select>
         <input type=text name=p2>
         <input type=text name=p3>
       </td>
     </tr> 
     <tr>
       <td> 휴대전화  </td>
       <td> 
         <select name=hp1 id=hp1>
           <option value=010> 010 </option>
           <option value=011> 011 </option>
           <option value=016> 016 </option>
           <option value=017> 017 </option>
         </select>
         <input type=text name=hp2>
         <input type=text name=hp3>
       </td>
     </tr> 
     <tr>
       <td colspan=2>
          <%
             String gib="";
             if(rs.getInt("gibon")==1)
            	 gib="checked";
          %>
          <input type=checkbox <%=gib%> name=gibon value=1>기본주소로 저장
       </td>
     </tr>
    </table>
    <div>
     <input type=submit value=수정>
     <input type=button value=취소 onclick="history.back()"> 
    </div>
    </form>
</body>
</html>