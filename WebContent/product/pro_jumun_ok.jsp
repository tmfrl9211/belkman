<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="belkman.jdbc.Connect" %>
<%@ page import="java.sql.*" %>    
<%
   Connection conn=Connect.connection2();
   //pro_jumun_ok.jsp

   // request값 가져오기
   request.setCharacterEncoding("utf-8");
   // 1개 이상의 상품을 구매
   String[] pcode=request.getParameterValues("pcode");
   String[] psize=request.getParameterValues("psize");
   String[] su=request.getParameterValues("su");
   String[] halin=request.getParameterValues("halin");
   String[] buga=request.getParameterValues("buga");
   String[] point=request.getParameterValues("point");
   String[] mem_point=request.getParameterValues("mem_point");
   String[] cou_point=request.getParameterValues("cou_point");
   String[] cart_id=request.getParameterValues("cart_id");
   if(cart_id==null)
	   out.print("dd");
   String bae_msg=request.getParameter("bae_msg");
   String pay_sudan;  // 체크가 된것과 안된것 2가지중 하나
   if(request.getParameter("pay_sudan")==null)
	   pay_sudan="0";
   else
	   pay_sudan="1";
	   
   String pay_method=request.getParameter("pay_method");
   String ipgum=request.getParameter("ipgum");
   String ipbank=request.getParameter("ipbank");
   
   // bae_step 만들기 : 카드결제,휴대폰결제(1), 무통장,에스크로(0)
   String bae_step="";
   switch(request.getParameter("pay_method"))
   {
     case "0": bae_step="0"; break;
     case "1": bae_step="1"; break;
     case "2": bae_step="0"; break;
     case "3": bae_step="1";
   }
   // 배송주소록에 레코드가 없을때 (pro_jumun.jsp에서 bid값이 없을때)
   String bid;
   if(request.getParameter("bid").equals(""))  
   { 
	   String sql;
	   Statement stmt;
	   ResultSet rs;
	   PreparedStatement pstmt;
	   // bid가 없고 새로운 배송지
	   if(false)
	   {
		   // 새로운 배송지를 request받아서 baesong테이블에 저장
	   }
	   else
	   {
	   // bid가 없다는것은 주문자 정보와 동일한 주소
	   // 현재주소가 baesong테이블에 있는지 확인
	   // juso1
	   // select * from baesong where juso1=request
	   // member테이블에 있는 레코드를 불러와야
	   sql="select * from member where userid='"+session.getAttribute("userid")+"'";
	   stmt=conn.createStatement();
	   rs=stmt.executeQuery(sql);
	   rs.next();
	   // 주소정보를 baesong테이블에 저장
	   sql="insert into baesong(userid,bname,name,zip,juso1,juso2";
	   sql=sql+",phone,hphone,gibon,writeday)";
	   sql=sql+" values(?,?,?,?,?,?,?,?,0,now())";
	   pstmt=conn.prepareStatement(sql);
	   pstmt.setString(1, session.getAttribute("userid").toString());
	   pstmt.setString(2, rs.getString("name"));
	   pstmt.setString(3, rs.getString("name"));
	   pstmt.setString(4, rs.getString("zip"));
	   pstmt.setString(5, rs.getString("juso1"));
	   pstmt.setString(6, rs.getString("juso2"));
	   pstmt.setString(7, rs.getString("phone"));
	   pstmt.setString(8, rs.getString("hphone"));
	   pstmt.executeUpdate();  // 현재 배송주소가 baesong테이블에 등록
	   // 지금 구입하는 물건의 배송지인 bid값은 baesong id
	   }
	   sql="select max(id) as bid from baesong where userid='"+session.getAttribute("userid")+"'";
	   rs=stmt.executeQuery(sql);
	   rs.next();
	   bid=rs.getString("bid");
 
	   stmt.close();
	   pstmt.close();
	   rs.close();
	   //out.print(bid);
	   //out.print(sql);
   }
   else  // pro_jumun.jsp에서 주소록에 선택
   {
	   bid=request.getParameter("bid");
	   //out.print("bid가 있을경우");
	  //out.print(bid);
   }
   
   String sql="select max(id) as id from porder where userid='"+session.getAttribute("userid")+"'";
   Statement stmt=conn.createStatement();
   ResultSet rs=stmt.executeQuery(sql);
   rs.next();
   String num=rs.getString("id"); //  현재 구입하기 이전값중 가장 최근의 값
   if(num==null)
	   num="0";
   // 쿼리 작성 => porder 테이블에 저장 => 1개 이상
   for(int i=0;i<pcode.length;i++)
   {
     sql="insert into porder(pcode,psize,su,userid";
     sql=sql+",bid,halin,buga,point,mem_point,cou_point";
     sql=sql+",pay_sudan,pay_method,ipgum,ipbank,writeday";
     sql=sql+",bae_step,bae_msg) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,now(),?,?)";
     PreparedStatement pstmt=conn.prepareStatement(sql);
     pstmt.setString(1,pcode[i]);
     pstmt.setString(2,psize[i]);
     pstmt.setString(3,su[i]);
     pstmt.setString(4,session.getAttribute("userid").toString());
     pstmt.setString(5,bid);
     pstmt.setString(6,halin[i]);
     pstmt.setString(7,buga[i]);
     pstmt.setString(8,point[i]);
     pstmt.setString(9,mem_point[i]);
     pstmt.setString(10,cou_point[i]);
     pstmt.setString(11,pay_sudan);
     pstmt.setString(12,pay_method);
     pstmt.setString(13,ipgum);
     pstmt.setString(14,ipbank);
     pstmt.setString(15,bae_step);
     pstmt.setString(16,bae_msg);
     pstmt.executeUpdate();
    //out.print(pstmt+"<p>");
    // porder에 저장
     
   }
   // num의 값은 현재 주문 이전의 가장높은 id값 
   // 현재 주문한 내용을 보여주는 
   // jumun_view.jsp에서는 num값 보다 큰 레코드만 보여주기
   
   // cart테이블에 있는 레코드는 porder에 정상적으로 저장된 후에 삭제
   // String[] cart_id에 있다..
     for(int i=0;i<cart_id.length;i++)
   {
	   sql="delete from cart where id="+cart_id[i];
	   stmt.executeUpdate(sql);
   }  
   
   stmt.close();
   conn.close();
   response.sendRedirect("jumun_view.jsp?num="+num); 
%>