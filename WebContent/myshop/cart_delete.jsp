<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="belkman.jdbc.Connect" %> 
<%
   Connection conn=Connect.connection2();
   Statement stmt=conn.createStatement();
   String[] del_num=request.getParameter("del_num").split(",");   // ,숫자,숫자.....
 
   // out.print(del_num.length); // 넘어온 값이 길이체크 
   
   // ex)   5,6,  =>  0번방  5, 1번방에 6
   /*    
   delete from wish where id=0번방
   delete from wish where id=1번방 */
   
   for(int i=0;i<del_num.length;i++)
   {
     String sql="delete from cart where id="+del_num[i];
     stmt.executeUpdate(sql);
   }
   
   response.sendRedirect("cart_list.jsp");
%>