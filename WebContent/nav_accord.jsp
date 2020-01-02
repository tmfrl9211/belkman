<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="http://code.jquery.com/jquery-latest.js"></script>
  <!-- 파일을 서버로 다운받은후 사용하는 방법 -->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script> 
<script>       // nav_accord.jsp
 $(function()
 {
   $("#accord_menu").accordion(
   {
	 heightStyle:"content"   
	   
   });
 });
</script>
<style>
 li {list-style:none}
</style>
   <nav>
    <div id=logo> CHANNY </div>
    <div id=accord_menu style="margin-left:40px;">  <!-- li태그를 클릭하면 해당되는 하위메뉴의 ul태그를 보여라 -->
      <div> SUITS </div>
      <div> 
        <ul class=menu>    <!-- 하위메뉴의 이름은 class=menu -->
          <li> 싱글수트 </li>
          <li> 스트라이프수트 </li>
          <li> 비즈니스수트 </li>
          <li> 더블수트 </li>
          <li> 체크수트 </li> 
          <li> 드레스슈즈 </li>
          <li> 수트악세사리</li>
        </ul>
      </div> 
      <div> TOP </div>
      <div>
        <ul class=menu>
          <li> 긴팔티셔츠 </li>
          <li> 반팔티셔츠 </li>
          <li> 헨리넥 </li>
          <li> 니트 </li>
        </ul>
      </div>
      <div> SHIRTS </div>
      <div>
        <ul class=menu>
          <li> 스트라이프셔츠 </li>
          <li> 오픈카라셔츠 </li>
          <li> 솔리드셔츠 </li>
          <li> 체크셔츠 </li>
          <li> Etc </li>
        </ul>
      </div>
      <div> PANTS </div>
      <div> 
        <ul class=menu>
          <li> 슬랙스 </li>
          <li> 면바지 </li>
          <li> 청바지 </li>
          <li> 반바지 </li>
          <li> 조거팬츠 </li>
          <li> Etc </li>
        </ul>
      </div>
      <div> OUTER </div>
      <div>
        <ul class=menu>
          <li> 코트 </li>
          <li> 자켓/블레이저 </li>
          <li> 가디건 </li>
          <li> 베스트 </li>
          <li> 점퍼 </li>
        </ul>  
      </div>
      <div> SHOES  </div>
      <div>
        <ul class=menu>
          <li> 드레스슈즈 </li>
          <li> 스니커즈 </li>
          <li> 벨크만슈즈 </li>
          <li> 부츠/워커 </li>
          <li> Etc </li>
        </ul>
      </div>
      <div> ACCESSORY </div>
      <div>
        <ul class=menu>
          <li> 타이/행거치프 </li>
          <li> 머플러/스카프 </li>
          <li> 목걸이/팔찌 </li>
          <li> 벨트/서스펜더 </li>
          <li> 아이웨어 </li>
          <li> 모자 </li>
          <li> 가방 </li>
          <li> 타이핀/부토니에 </li>
          <li> 양말 </li>
          <li> 시계 </li>
          <li> 벨크만악세사리 </li>
          <li> 방향제 </li>
          <li> Etc</li>
        </ul>
      </div>
     </div>
 
    
    <ul>
      <li> BEST </li>
      <li> NEW </li>
      <li> &nbsp; </li>
      <li> 돋보기 </li>
    </ul>
    
    <ul>
      <li> LOGIN </li>
      <li> MY ACCOUNT </li>
      <li> CART </li>
      <li> Q&A / REVIEW </li>
    </ul>
  </nav>
 