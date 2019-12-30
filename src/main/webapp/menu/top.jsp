<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <DIV class='top_menu_label'>
      <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/member/login.jsp' >로그인</A> | 
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose>
      <A class='menu_link'  href='${root}/member/sign_up.jsp'>회원가입</A> | 
      <A class='menu_link'  href='${root}/mypage/orderlist.jsp'>장바구니</A> | 
      <A class='menu_link'  href='${root}/mypage/mypage_main.jsp?memno=1'>마이페이지</A> | 
      <A class='menu_link'  href='${root}/service/service_center.jsp'>고객센터</A>
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
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
  <%-- <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/myimage.png' style='width: 100%;'>
      <div style='margin-top: 5px;'>
        <img src='${root}/menu/images/myface.png'>가나다
      </div>
       <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <c:import url="../categrp/list_index_left.do" /> 
    </DIV> --%>
      
<DIV class='content' >