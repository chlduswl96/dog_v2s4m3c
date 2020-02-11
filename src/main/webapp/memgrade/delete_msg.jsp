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

<DIV class='title_line'>알림 ${count }</DIV>
<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${count == 1 }">
          <LI class='li_msg_success'>${gname }등급을 삭제했습니다.</LI>
          <LI class='li_none'>
            <button type='button' onclick="opener.location.reload(); window.close();">닫기</button>
          </LI>
        </c:when>
        <c:otherwise>
          <LI class='li_msg_fail'>${gname }등급을 삭제에 실패했습니다.</LI>
          <LI class='li_msg_fail'>다시 시도해주세요.</LI>
          <button type='button' onclick="history.go(-1)">다시시도</button>
        </c:otherwise>
      </c:choose>
    </UL>
  </fieldset>

</DIV>

</body>
</html>