<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team6</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<DIV class='title_line'>알림</DIV>
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${count == 1 }">
          <LI class='li_msg_success'>회원 가입 성공</LI>
          <LI class='li_none'>
            <button type='button' onclick="location.href='./create.do'"></button>
            <c:if test="${sessionScope.memgradeno eq 0 }">
              <button type='button' onclick="location.href='./list_all.do'">목록</button>
            </c:if>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_msg_fail'>새로운 카테고리 그룹등록에 실패했습니다.</LI>
          <LI class='li_msg_fail'>다시 시도해주세요.</LI>
          <button type='button' onclick="history.go(-1)">다시시도</button>
        </c:otherwise>
      </c:choose>
    </UL>
  </fieldset>

</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>