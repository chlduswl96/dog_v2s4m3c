<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/menu/mypage_top.jsp" flush='false' />

    <div style='width: 100%;'>
      <div id='mname' >
        <a href='../mypage/mypage_main.jsp' >
          <span style='font-size: 1.3em;'>마이페이지</span>
        </a>
      </div>
      <div id='main' style='width: 100%; margin-top: 10px; margin-bottom: 15px;'>  <!-- 마이페이지 메인 -->
        <div style='height: 2px; margin-bottom: 20px; background-color: #dedede;'></div>
        <!-- <div id='main_cart' style='width: 100%; height: 100px; background-color: #dedede;'>포인트</div> 
        <div style='height:2px; margin-top: 20px; margin-bottom: 20px; background-color: #dedede;'></div>-->
        <div id='main_cart' style='width: 45%; height: 200px; background-color: #dedede; float: left;'>장바구니</div>
        <div style='float: left; margin-left: 41.4px; width: 2px; height: 200px; background-color: #dedede;'></div>
        <div id='main_dilivery' style='width: 45%; height: 200px; background-color: #dedede; float: right;'>배송조회</div>
        <div style='clear: both; margin-bottom: 10px;'></div>
        <div style='height:2px; margin-top: 20px; margin-bottom: 20px; background-color: #dedede;'></div>
        <div id='main_inquiry' style='width: 100%;  margin: 0px auto; background-color: #dedede;'>
          <%-- <jsp:include page="/mypage/main_post/rec_inq.do" flush='false'>
            <jsp:param value="${param.memno }" name="memno" />
            <jsp:param value="5" name="cnt"/>
          </jsp:include> --%>
          <c:import url="/mypage/main_post/rec_inq.do" charEncoding="UTF-8">
           <c:param name="memno" value="1"></c:param>
           <c:param name="cnt" value="5"></c:param>
         </c:import>
        </div>
      </div>
    </div>
  </div> 
</DIV>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>