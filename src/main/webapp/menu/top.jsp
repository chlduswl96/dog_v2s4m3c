<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

<DIV class='container' style='width: 100%;'> 
  <!-- 화면 상단 메뉴 -->
  <DIV class='top_menu'>
    <DIV class='top_menu_label'>
      <c:if test="${sessionScope.id_admin ne null }">
      <NAV class='top_menu_list'>
        <span style='padding-left: 0.5%; color: #353355;'>
          관리자 기능 
        </span> 
        <span style='padding-left: 0.5%;'></span>
        <A class='menu_link'  href='${root}/memgrade/list.do'>회원 등급관리</A><span class='top_menu1'> | </span>   
        <A class='menu_link'  href='${root}/categrp/list.do'>강아지 카테고리 등록</A> <span class='top_menu1'> | </span>  
        <A class='menu_link'  href='${root}/repository/create.do'>재고 등록</A> <span class='top_menu1'> | </span>
      </NAV>
      </c:if>
      <%-- <c:choose>
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
      <A class='menu_link'  href='${root}/service/service_center.jsp'>고객센터</A> --%>
      <%-- <A class='menu_link'  href='${root}/member/list.do'>회원목록</A> --%>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${root }">Home</a></li>
        <c:if test="${sessionScope.id eq null }">
          <li>
            <A class="dropdown-toggle" data-toggle="dropdown" href=''>상품 카테고리<span class="caret"></span></a>
            <c:import url="/categrp/categrp_list.do" />
          </li>
          <li>
            <A class='menu_link'  href="${root }/mem/login.do">
              <span class="glyphicon glyphicon-user"></span>로그인
            </A>
          </li>
          <%-- <li>
            <A class='menu_link'  href="${root }/admin/login.do">
              <span class="glyphicon glyphicon-user"></span>관리자 로그인
            </A>
          </li> --%>
          <li style='margin-right: 20px;'>
            <A class='menu_link'  href='${root}/mem/create_agr.do'>
              <span class="glyphicon glyphicon-log-in"></span>회원가입
            </A>
          </li>
        </c:if>
        <c:if test="${sessionScope.id ne null }">
          <li>
            <A class='menu_link'  href='${root}/mypage/mypage_main.do'>
              <span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>마이페이지
            </A>
          </li>
          <li>
            <A class='menu_link'  href='${root}/showppingbasket/list.do'>
              <span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>장바구니
            </A>
          </li>
          <li>
            <A class='menu_link'  href='${root}/notice/list.do'>
              <span class="glyphicon glyphicon-list-alt" style="margin-right: 5px;"></span>고객센터
            </A>
          </li>
          <li style='margin-right: 20px;'>
            <A class='menu_link'  href='${root}/mem/logout.do'>
              <span class="glyphicon glyphicon-user" ></span>logout
            </A>
           </li>
        </c:if>
      </ul>
    </DIV> 
    <!-- <nav class="navbar navbar-default"  data-offset-top="197"> -->
    <!-- </nav> -->
    
    <DIV class='top_menu_banner'>
      <a href='${root}/index.do'><img src='${root}/css/images/top_banner.jpg' style='width: 20%;'></a>
    </DIV>
    <NAV class='top_menu_list'>
      <span style='padding-left: 0.5%;'></span>
        <%-- <A class='menu_link menu_pd'  href='${root}/index.jsp' > --%>
        <A class="dropdown-toggle" data-toggle="dropdown" href=''>전체<span class="caret"></span></A> <span class='top_menu1'> | </span>
        <c:import url="/categrp/categrp_list.do" />
  <%--     <c:choose>
        <c:when test="${sessionScope.id == null}">
          <A class='menu_link'  href='${root}/member/login.do' >Login</A> <span class='top_menu1'> | </span>
        </c:when>
        <c:otherwise>
          ${sessionScope.id } <A class='menu_link'  href='${root}/member/logout.do' >Logout</A> <span class='top_menu1'> | </span>
        </c:otherwise>
      </c:choose> --%>
      
        <A class='menu_link menu_pd'  href='${root}/contents/list.do?categrpno=1'>사료</A> <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/categrp/list.do'>간식</A> <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/cate/list.do'>장난감</A> <span class='top_menu1'> | </span>
        <A class='menu_link menu_pd'  href='${root}/cate/list.do'>훈련 용품</A> <span class='top_menu1'> | </span>
        <A class='menu_link menu_pd'  href='${root}/contents/list_all.do'>목욕/미용</A> <%-- <span class='top_menu1'> | </span>    
        <A class='menu_link menu_pd'  href='${root}/member/list.do'>회원목록</A> <span class='top_menu1'> | </span>   --%>
    </NAV>
  </DIV>
  
  <!-- 화면을 2개로 분할하여 좌측은 메뉴, 우측은 내용으로 구성 -->  
 <%--  <DIV class="row" style='margin-top: 2px;'>
    <DIV class="col-md-2"> <!-- 메뉴 출력 컬럼 -->
      <img src='${root}/menu/images/dog.jpg' style='width: 100%; margin-top: 15px;'>
      <!-- Spring 출력 카테고리 그룹 / 카테고리 -->
      <c:import url="/categrp/list_index_left.do" /> 
      <div>
        <c:import url="/memgrade/list_index_left.do" /> 
      </div>
    </div> --%>
    <DIV class="col-md-12 cont">  <!-- 내용 출력 컬럼 -->  
   
<DIV class='content'>

<div style='width: 70%; margin: 0px auto;'>