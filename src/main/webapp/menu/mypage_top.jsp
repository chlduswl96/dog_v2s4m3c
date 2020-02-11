<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <DIV class='top_menu_label'>
      <c:choose>
        <c:when test="${sessionScope.id eq null}">
          <A class='menu_link'  href='${root}/member/login.jsp' >로그인</A> | 
          <A class='menu_link'  href='${root}/member/sign_up.jsp'>회원가입</A> |
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/mem/logout.do' >Logout</A> <span class='top_menu1'> | </span>
          <A class='menu_link'  href='${root}/mypage/orderlist.jsp'>장바구니</A> <span class='top_menu1'> | </span> 
          <A class='menu_link'  href='${root}/mypage/mypage_main.jsp?memno=1'>마이페이지</A> <span class='top_menu1'> | </span>
          <A class='menu_link'  href='${root}/service/service_center.jsp'>고객센터</A>
        </c:otherwise>
      </c:choose>
      <%-- <A class='menu_link'  href='${root}/member/list.do'>회원목록</A> --%>
    </DIV>
    <DIV class='top_menu_banner'>
      <a href='${root}/index.jsp'><img src='${root}/css/images/top_banner.jpg' style='width: 20%;'></a>
    </DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
        <A class='menu_link menu_pd'  href='${root}/index.jsp' >전체</A> <span class='top_menu1'> | </span>
  <%--     <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/member/login.do' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose> --%>
      
        <A class='menu_link menu_pd'  href='${root}/categrp/list.do'>사료</A> <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/categrp/list.do'>간식</A> <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/cate/list.do'>장난감</A> <span class='top_menu1'> | </span>
        <A class='menu_link menu_pd'  href='${root}/cate/list.do'>훈련 용품</A> <span class='top_menu1'> | </span>
        <A class='menu_link menu_pd'  href='${root}/contents/list_all.do'>목욕/미용</A> <%-- <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/member/list.do'>회원목록</A> <span class='top_menu1'> | </span>   --%>
    </NAV>
  </DIV>
  
<DIV class='content' >

<div style='width: 70%; margin: 0px auto;'>

<DIV class="col-md-12 cont" style='margin-top: 30px;'>  <!-- 내용 출력 컬럼 -->  

  <div class='col-md-2' style='border: solid 1px #aaaaaa;'>  <!-- 좌측메뉴 -->
    <div style='width: 100%; '>
      <div style='background-color: #dedede; width: 100%; height: 250px; margin: 15px auto;'>
        <div style='width: 100%; height: 60%; border: solid 1px #000000; margin-bottom: 10px;'>회원사진</div>
        <span style='font-size: 0.8em;'>회원아이디</span><br>
        <span style='font-size: 0.8em;'> 포인트 </span><br>
        <span style='font-size: 0.8em;'>???</span>
      </div>
      <div style='margin-bottom: 10px;'>
        <span style='margin-left: 10px; font-size: 0.9em; font-weight: bold;'> 회원 정보</span>
        <hr style='margin: 5px 5px;'>
        <ul>
          <li class='mypg_li_none' style='font-size: 0.8em;'>회원 정보 수정</li>
          <li class='mypg_li_none' style='font-size: 0.8em;'>비밀번호 변경</li>
        </ul>
        <a href="${root }/mypage/orderlist.jsp?memno=1">
          <span style='margin-left: 10px; font-size: 0.9em; font-weight: bold;'> 장바구니 </span>
        </a><br>
        <span style='margin-left: 10px; font-size: 0.9em; font-weight: bold;'> 주문조회</span><br>
        <span style='margin-left: 10px; font-size: 0.9em; font-weight: bold;'> 배송조회</span><br> 
        <!-- <a href="javascript:; onclick=inquiry_list()"> -->
        <a href="${root}/oneinquiry/oneinquiry_list.do?memno=1">
          <span style='margin-left: 10px; font-size: 0.9em; font-weight: bold;'> 1:1 문의</span>
        </a>
      </div>
      </div>
  </div>  <!-- 좌측메뉴 end -->
  
   <div class='col-md-10' >
     <div>      <!-- content -->  